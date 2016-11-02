From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Nov 2016 20:48:59 +0100
Subject: [Buildroot] [PATCH] core/download: remove support for special
 git refs
In-Reply-To: <2007136107.3100904.1477526517392.JavaMail.zimbra@datacom.ind.br>
References: <1477512489-14710-1-git-send-email-yann.morin.1998@free.fr>
 <2007136107.3100904.1477526517392.JavaMail.zimbra@datacom.ind.br>
Message-ID: <309f1ad4-8e84-a2ac-d813-12d5fe3d0d59@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-10-16 02:01, Carlos Santos wrote:
>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> To: buildroot at buildroot.org
>> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Ricardo Martincoski"
>> <ricardo.martincoski@datacom.ind.br>, "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Sent: Wednesday, October 26, 2016 6:08:09 PM
>> Subject: [Buildroot] [PATCH] core/download: remove support for special git	refs
> 
>> f8b8251a (support/download: fetch all refs on full git clone) added
>> support for fetching so-called special refs, to retrieve changesets from
>> code-review tools like Gerrit or Github PRs.
>>
>> However, the use-case for using those special refs is not entirely
>> clear, and is getting more and more complex (with still-pending patches
>> about that).
> 
> The use case is pretty clear, and you told it: retrieve changesets from
> code-review tools like Gerrit or Github PRs. 

 But you have to admit that such a use case seems weird and complicated. So you
push a change in a package to Gerrit, then you modify your br2_external to refer
to that change, commit it and I suppose also push it to Gerrit, and finally you
go and tell CI to fetch that stuff.

 To me, it would make a lot more sense if your br2_external packages are kept
together in a repository using git submodules, so you can simply do a
commit/review of the integration repository whenever you updated the
subrepositories.

 In fact, I like to keep the buildroot infra inside the package repos
themselves, so the integration repository doubles as a br2_external repository.


> We (DATACOM) have been
> doing this for months and I can assure you that it improved our development
> process *a lot*. The fact that there are still pending patches only means
> that the feature needs improvements and that different people have been
> trying to make it better.

 Well, the problem is that the git download helper is becoming so complicated
that we don't understand it anymore, and that any change we make might break one
of the use cases we purportedly support. So the idea is to actively *not*
support some use cases, which allows us to break them.

 Actually, I would say that what we need to support is: any ref that works with
'git fetch <site> <ref>'.


>> Those special refs are from code-review tools. As such, they are very
>> volatile in nature: re-pushing a rebased branch to github would change
>> the content fetched with such a ref (Gerrit seems to be more
>> conservative, but still). So, they cannot be used for reproducible
>> builds:
>>  - they can't be used in a .mk file (normal packages)
> 
> Yes, they do. They may not be so useful for buildroot official packages
> but for packages maintained in-house and/or by distributed development
> teams such feature is extremely handy.

 Even for in-house development unstables refs are not a good idea. But as
already mentioned several times, gerrit's refs/changes/xx/xxx/N refs are pretty
stable.

> 
>>  - they can't be used in a .config file (linux, bootloader...)
> 
> Yes they do. I'm currently working on a change that upgrades both linux
> and u-boot for a half-dozen boards.
> 
>> So, going back to the black board, two main use-cases have been
>> identified:
>>  - a developper that wants to manually test a PR
> 
> A developer who needs to share work in progress with colleagues so they
> can test it. One of my colleagues is currently working on a change that
> affects around twenty modules used on four different products. He shares
> his work by mens of a change in our br2_external repository in which the
> package versions in the .mk files are replaced by the current SHA-1 in
> the corresponding changes in the modules.

 Which IMHO would be dramatically less work with submodules (simply 'git commit'
rather than first updating 20 files and then doing 'git commit').

 But here really we come to the crux of the problem: you want to use sha1 refs
for things which are not in a normal 'clone'. In other words, you want to do
something which would be really hard to do if you did it manually. No wonder a
lot of special magic is needed in the git download helper to make that work.

> 
>>  - an automated build farm that automatically builds a known
>>    configuration against PRs
> 
> This is a particular case of the previous one, with the restriction that
> it is necessary to automate the retrieval of WIP code my means of some
> custom <FOO>_VERSION variables.
> 
>> In either case, there is a better solution that we've been advertising
>> all along: the override-srcdir mechanism.
> 
> The override-srcdir mechanism suffices when you work alone on a few
> packages. It becomes much harder when you work on many modules and need
> to share intermediary results with other developers.
> 
>> Whether by a build farm or a developper, it looks like it would be much
>> easier to do the clone (or a fetch from an existing repo), write a
>> local.mk with an override-srcdir, and kick off the build, rather than do
>> the various tweaking (in .mk and/or .config).
> 
> We tried this approach and it became a nightmare. Sooner or later some
> developer forgets to update the local copy of one of the modules and
> his/her build breaks. Using a build farm for WIP was impossible because
> required tricks to fetch custom versions of the source code of some packages.
> 
>> (note: a developper that wants to test a PR is probably already active
>> on that project, so will already have a local clone, so the fetch would
>> only grab very few blobs, wo will be very fast).
> 
> This might work for lone developers or small teams, not for dozens of
> programmers coding fiercely for a multi-site organization, using a DVCS
> like Gerrit. Read this, please:
> 
> http://lists.busybox.net/pipermail/buildroot/2015-October/143248.html

 Well, that mail doesn't mention the need for handling special refs, and it
actually predates the patch that made special refs work, so I guess that it
wasn't needed back then?



 Regards,
 Arnout

> 
>> So, just remove the support for such special refs altogether.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
>> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>> Cc: Henrique Marks <henrique.marks@datacom.ind.br>
>> ---
>> support/download/git | 11 -----------
>> 1 file changed, 11 deletions(-)
>>
>> diff --git a/support/download/git b/support/download/git
>> index 7921411..c46422d 100755
>> --- a/support/download/git
>> +++ b/support/download/git
>> @@ -61,17 +61,6 @@ fi
>>
>> pushd "${basename}" >/dev/null
>>
>> -# Try to get the special refs exposed by some forges (pull-requests for
>> -# github, changes for gerrit...). There is no easy way to know whether
>> -# the cset the user passed us is such a special ref or a tag or a sha1
>> -# or whatever else. We'll eventually fail at checking out that cset,
>> -# below, if there is an issue anyway. Since most of the cset we're gonna
>> -# have to clone are not such special refs, consign the output to oblivion
>> -# so as not to alarm unsuspecting users, but still trace it as a warning.
>> -if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
>> -    printf "Could not fetch special ref '%s'; assuming it is not special.\n"
>> "${cset}"
>> -fi
>> -
>> # Checkout the required changeset, so that we can update the required
>> # submodules.
>> _git checkout -q "'${cset}'"
>> --
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
> Carlos Santos (Casantos)
> DATACOM, P&D
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
