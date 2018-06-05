From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jun 2018 21:36:05 +0200
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <20180605032619.gdm4zzkantbsywfy@tarshish>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
 <20180604154433.GA3700@scaer>
 <CAESO2EJ7pwkrsrmarwBkpS7SswumuepmCYo01x2j0xpMmhGUCg@mail.gmail.com>
 <20180604165210.GA23325@g751.home>
 <37ce9be2-db77-c8e4-08a3-b70b4fc895c4@mind.be>
 <20180605032619.gdm4zzkantbsywfy@tarshish>
Message-ID: <42fc50b0-2441-db8e-d954-4146b6a0289e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-06-18 05:26, Baruch Siach wrote:
> Hi Arnout,
> 
> On Tue, Jun 05, 2018 at 12:19:41AM +0200, Arnout Vandecappelle wrote:
>> On 04-06-18 18:52, Gary Bisson wrote:
>>> On Mon, Jun 04, 2018 at 05:32:41PM +0100, Bob Beckett wrote:
>>>> Thanks for the more in depth explanation.
>>>>
>>>> I agree with all of the reasons outlined for the purpose of being purely a
>>>> reproducible build manager, which buildroot only ever aimed to be.
>>>>
>>>> However, people do use it during development, and with a reasonably large
>>>> number of custom packages all in development at the same time, using the
>>>> _OVERRIDE_SRCDIR method to test latest versions of multiple packages
>>>> becomes very unwieldy.
>>>> My solution so far has been to point the version at the branch that active
>>>> development is taking place on, and removing the build directories and
>>>> packages for the specific projects each time.
>>>> When I am not the one doing the development on each package's source, but
>>>> am developing the rootfs, this means I dont have to manually keep updating
>>>> my local git repositories for each project.
>>>> Once each package has hit their first release version, they do get tagged
>>>> and the release branch for the project's BR2_EXTERNAL directory gets
>>>> updated with those versions, and each version thereafter, but the
>>>> development branch for the external directory persistently stays on the
>>>> development branch head for each package.
>>>>
>>>> Regarding not knowing the sha before a checkout, would git ls-remote not
>>>> suffice for this? e.g.
>>>>
>>>> $ git ls-remote git at gitlab.com:adhlinux/buildroot/buildroot.git master
>>>> 407fb2fe202aaeb273e4986dc88c30596a7fe8db    refs/heads/master
>>>> 407fb2fe202aaeb273e4986dc88c30596a7fe8db    refs/remotes/upstream/master
>>>
>>> Yes 'ls-remote' is actually a good option. 
>>
>>  It's a bit racy though. By the time you do the actual fetch, the remote branch
>> may already have been updated by someone else.
> 
> Someone might update the branch while you are fetching as well. As long as you 
> fetch a valid commit ID that is known to have been at the branch tip at some 
> point in the recent past, it should be fine from the user perspective.

 Indeed, I was too quick, I hadn't understood that the idea was to use the
ls-remote result to set the version to check out.

> 
> baruch
> 
>> You could have the following
>>> package version during development:
>>> FOO_VERSION = $(shell git ls-remote URL branch | awk '{ print $$1 }')

 This might actually work pretty well... Better than my _OVERRIDE_SRCDIR
extension idea. So maybe something like

ifneq ($$($(2)_OVERRIDE_GIT_REPO),)
$(2)_VERSION = $$($(2)_OVERRIDE_GIT_REF)
$(2)_SITE = $$($(2)_OVERRIDE_GIT_REPO)
$(2)_SITE_METHOD = git
endif

and of course defaulting OVERRIDE_GIT_REF to master and defaulting
$(2)_OVERRIDE_GIT_REPO to $(3)_OVERRIDE_GIT_REPO.

 Regards,
 Arnout

>>>
>>> Then it would pick up any change automatically until you finish your dev
>>> and change the FOO_VERSION to a proper ID.
>>>
>>>> It would allow you to check for changes in sha without doing a new fetch.
>>>>
>>>> Oh well, not to worry. Ill keep it as a local patch, as I suspect I am
>>>> treading old ground of "buildroot is not a development platform" (Ive seen
>>>> this discussion come up multiple times before).
>>>
>>> Yes that will most likely not be included inside BR infrastructure but that
>>> should be a perfectly fine option for your custom package.
>>>
>>> Regards,
>>> Gary
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
