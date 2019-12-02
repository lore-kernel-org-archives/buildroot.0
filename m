From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 Dec 2019 09:40:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk: modify site from
 mirror to official repos
In-Reply-To: <3c9e68edd0b8700b3914ff63ff773ed0@tudorholton.com>
References: <20191127053945.3897-1-tudor@tudorholton.com>
 <fa31990d-0f91-0eec-4b63-9d0f235daab2@mind.be>
 <3c9e68edd0b8700b3914ff63ff773ed0@tudorholton.com>
Message-ID: <fe8ac537-6327-e553-c4aa-f8fce8070aac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/12/2019 07:09, Tudor Holton wrote:
> On 2019-12-02 01:18, Arnout Vandecappelle wrote:
>> On 27/11/2019 06:39, Tudor Holton wrote:
>>> From: Tudor Holton <buildroot@tudorholton.com>
>>>
>>> Since Java 11 (and possibly earlier), OpenJDK now has its own official
>>> repository
>>> at hg.openjdk.java.net which is referenced in all OpenJDK documentation.
>>> This patch brings buildroot into line with that source and allows consistent
>>> patching both across projects and for patches specific to buildroot
>>> environments.
>>
>> ?I guess by switching to a different source repository, we're also loosing some
>> modifications that were done by AdoptOpenJDK, right? So could you enumerate
>> these changes (and possibly explain why they're not relevant/wanted
>> for Buildroot)?
> 
> Thanks for looking at this. :-)
> 
> Well, it depends on who you believe and how good your crystal ball is.? The
> current AdoptOpenJDK repos says "Mirror of
> http://hg.openjdk.java.net/jdk-updates/jdk12u/", but the hashes don't match.?
> Although, that could be something to do with the filename being ever-so-slightly
> different which obviously depends on how the hash is calculated.

 In that case, can you do a 'diff -ru' between the two extracted tarballs and
report in the commit message that this shows no differences?


> Either way, changing to the upstream source removes the potential for a code
> injection between the upstream source and buildroot

 Absolutely, and this is the main reason to make this change IIUC.

> which, in our case, is
> essential to some buildroot-specific integrations in the pipeline (namely new
> Java 9+ module management, removal of Xorg dependency, and uClibC integration)
> which would be painful to apply upstream, and could have the potential to break
> buildroot patches in the middle, leading to patch wars (speaking from experience).
>>
>>
>>>
>>> Signed-off-by: Tudor Holton <buildroot@tudorholton.com>
>>> ---
>>> ?DEVELOPERS?????????????????? | 3 +++
>>> ?package/openjdk/openjdk.hash | 2 +-
>>> ?package/openjdk/openjdk.mk?? | 8 ++++----
>>> ?3 files changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>> index 991be89849..7c9cebfb2f 100644
>>> --- a/DEVELOPERS
>>> +++ b/DEVELOPERS
>>> @@ -2365,6 +2365,9 @@ F:??? package/redis/
>>> ?N:??? Trent Piepho <tpiepho@impinj.com>
>>> ?F:??? package/libp11/
>>>
>>> +N:??? Tudor Holton <buildroot@tudorholton.com>
>>> +F:??? package/openjdk/
>>> +
>>> ?N:??? Tzu-Jung Lee <roylee17@gmail.com>
>>> ?F:??? package/dropwatch/
>>> ?F:??? package/tstools/
>>> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
>>> index 00d080aa3f..beed7a34a2 100644
>>> --- a/package/openjdk/openjdk.hash
>>> +++ b/package/openjdk/openjdk.hash
>>> @@ -1,3 +1,3 @@
>>> ?# Locally computed
>>> -sha256 5f73d86ed516173965b27754f1bb21374ccb1194a17c2d89d8018280ce5ffa78?
>>> openjdk-12.0.2+10.tar.gz
>>> +sha256 b2bcad35656b00928683416f3480ad00363b00993eb711c3e1886e4fe77eefeb?
>>> jdk-12.0.2+10.tar.gz
>>> ?sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726?
>>> LICENSE
>>> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
>>> index ea2555edcc..3081c2f895 100644
>>> --- a/package/openjdk/openjdk.mk
>>> +++ b/package/openjdk/openjdk.mk
>>> @@ -7,7 +7,10 @@
>>> ?OPENJDK_VERSION_MAJOR = 12.0.2
>>> ?OPENJDK_VERSION_MINOR = 10
>>> ?OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
>>> -OPENJDK_SITE = $(call
>>> github,AdoptOpenJDK,openjdk-jdk12u,jdk-$(OPENJDK_VERSION))
>>> +OPENJDK_PROJECT = jdk-updates
>>> +OPENJDK_RELEASE = jdk12u
>>
>> ?Is it relevant to create variables for these? Just use them directly in the
>> _SITE, like we do for most other packages.
>>
>>
> 
> This was inspired by a few other buildroot openjdk packages that have been
> floating around the internet.

 Stuff floating around on the internet is generally not a good source of coding
style :-)

> 
> It's more a style choice, but also an understanding of the upstream repos layout:
> 
> Since OpenJDK has multiple streams this may become needed later on.? Things like
> aarch32 aren't in jdk-updates (yet).? Config.in may eventually be able to select
> the project and release, but I was trying to keep this all as close to the
> current version as possible.? Don't forget, also, that OpenJDK now has LTS
> releases, which I think would be preferable, but there will always be a demand
> for newer releases also.

 We prefer not to introduce things that only exist for the sake of some
theoretical future feature.

 Using the project and release strings directly in the _SITE URL makes it much
easier to understand what exactly is being downloaded. And even if there would
be several different tarballs to download in the future, we'd probably prefer
full _SITE strings even then.

> 
> I can concur to a simpler form if you prefer.
> 
>>> +OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
>>> +OPENJDK_SITE =
>>> https://hg.openjdk.java.net/$(OPENJDK_PROJECT)/$(OPENJDK_RELEASE)/archive
>>
>> ?I suspect this is an autogenerated archive, right? Do you know how reliable it
>> is w.r.t. changes in the hash? Long ago, we've had problems with github a couple
>> of times, where suddenly the generated tarball would be slightly different and
>> the existing hash would break.
>>
>> ?I realize that it's hard to know for sure if the tarball is consistent. But at
>> least please check if there's nothing stupid like a download date
>> embedded in it.
> 
> I can say for sure that we have now been using these archives for just over a
> year internally, since OpenJDK 11, and we haven't seen an archive hash change in
> that entire time.? This was a vast improvement on the previous Mercurial
> forest.? /archive is exactly as is sounds.? It's an archive that doesn't change,
> which is why it effectively negates the need for a "downstream" mirror.

 Excellent. Can you add something like this to the commit message? In the
unlikely case that this does break in the future, it's good to know what our
understanding was.

 Regards,
 Arnout

> 
> Regards,
> Tudor Holton
