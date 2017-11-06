From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Mon, 6 Nov 2017 10:43:25 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <20171105084630.GF2996@scaer>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be> <20171105084630.GF2996@scaer>
Message-ID: <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 November 2017 at 09:46, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Arnout, All,
>
> On 2017-11-04 20:53 +0100, Arnout Vandecappelle spake thusly:
>> On 03-11-17 21:15, Peter Korsgaard wrote:
>> >>>>>> "Einar" == Einar J?n Gunnarsson <tolvupostur@gmail.com> writes:
>> >
>> >  > Hello all.
>> >  > I've been using BR2_REPRODUCIBLE, and it mostly works.
>> >
>> >  > But when it is using a git repo, I have the following issues with creating
>> >  > SOURCE_DATE_EPOCH:
>> >  > 1) It uses $(GIT), but the GIT variable is only defined in line 487:
>> >  > "include package/Makefile.in".
>> >  > Note that this is done around line 250 in $(TOPDIR)/Makefile, so sometimes
>> >  > $(GIT) is unset then getting BR2_VERSION_GIT_EPOCH
>> >
>> > What make version (and buildroot version) are you using? It works here:
>> >
>> > strace -s 100 -f -e execve make BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH 2>&1 | grep log
>> > [pid  9504] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git git log -1 --format=%at"], [/* 46 vars */]) = 0
>> > [pid  9504] execve("/usr/bin/git", ["git", "log", "-1", "--format=%at"], [/* 47 vars */]) = 0
>> > [pid  9505] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git git log -1 --format=%at"], [/* 46 vars */]) = 0
>> > [pid  9505] execve("/usr/bin/git", ["git", "log", "-1", "--format=%at"], [/* 47 vars */]) = 0
>> >
>> > It uses the BR2_GIT setting, E.G.:
>> >
>> > strace -s 100 -f -e execve make BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH BR2_GIT=foot 2>&1 | grep log
>> > [pid  9880] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git foot log -1 --format=%at"], [/* 46 vars */]) = 0
>> > [pid  9881] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git foot log -1 --format=%at"], [/* 46 vars */]) = 0
>> >
>> > This is with current master and make 4.1.
>>
>>  But not when there is no .config file:
>>
>> $ make O=/tmp/brtest BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH
>> /bin/sh: log: command not found
>> SOURCE_DATE_EPOCH=
>> /bin/sh: log: command not found
>
> Uh? Why you want to do that?

It's a symptom - it's not the only way to get that result.

It seems easier to reproduce with an out-of-tree build, but that is
surely not the only trigger.
I have a hard time reproducing it on master, but in my production
Buildroot 2017.02, I get this:

$ strace -s 100 -f make  O=output_armxl 2>&1 | grep git.*logstrace -s
100 -f make  O=output_armxl  2>&1 | grep -e git.*log
[pid 27208] execve("/bin/bash", ["/bin/bash", "-c",
"GIT_DIR=/home/jenkinslinux/jenkins/workspace/SWx_buildroot_for_armxl/armxl-buildroot/.git
 log -1 --"...], [/* 86 vars */] <unfinished ...>
[pid 27208] stat("/home/ejg/git/Platform3/Build/bin/log",
0x7ffd410c57d0) = -1 ENOENT (No such file or directory)
[pid 27314] execve("/bin/bash", ["/bin/bash", "-c",
"GIT_DIR=/home/jenkinslinux/jenkins/workspace/SWx_buildroot_for_armxl/armxl-buildroot/.git
git log -1"...], [/* 86 vars */] <unfinished ...>
[pid 27314] execve("/usr/bin/git", ["git", "log", "-1",
"--format=%at", "1.0.0.22"], [/* 87 vars */]) = 0
[pid 27385] execve("/bin/bash", ["/bin/bash", "-c",
"GIT_DIR=/home/jenkinslinux/jenkins/workspace/SWx_buildroot_for_armxl/armxl-buildroot/.git
git log -1"...], [/* 86 vars */] <unfinished ...>
[pid 27385] execve("/usr/bin/git", ["git", "log", "-1",
"--format=%at", "1.0.0.22"], [/* 87 vars */]) = 0
[pid 27386] execve("/bin/bash", ["/bin/bash", "-c",
"GIT_DIR=/home/jenkinslinux/jenkins/workspace/SWx_buildroot_for_armxl/armxl-buildroot/.git
git log -1"...], [/* 86 vars */] <unfinished ...>
[pid 27386] execve("/usr/bin/git", ["git", "log", "-1",
"--format=%at", "1.0.0.22"], [/* 87 vars */]) = 0

$ strace -s 100 -f make  O=output_armxl GIT=git 2>&1 | grep git.*log
[pid 23959] execve("/bin/bash", ["/bin/bash", "-c",
"GIT_DIR=/home/jenkinslinux/jenkins/workspace/buildroot_for_armxl/armxl-buildroot/.git
git log -1"...], [/* 87 vars */] <unfinished ...>
[pid 23959] execve("/usr/bin/git", ["git", "log", "-1",
"--format=%at", "1.0.0.22"], [/* 88 vars */]) = 0
etc...

Note that the first run fails. I had a error check that would stop the
whole make in that case,which triggered on that. even if the build
works on the second run onwards, I can call this a non-issue,



>
>> $ make O=/tmp/brtest BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH GIT=git
>> SOURCE_DATE_EPOCH=1509720578
>
> If anything, SOURCE_DATE_EPOCH should come from the environment, as
> specified in the spec (see below).
>
>>  Solution: move the GIT definition to top-level Makefile.
>
> That would not solve anything, because it is still defined from BR2_GIT
> that comes... from .config .
>
>> >> 2) It always uses the last git commit to calculate the date. So any commit
>> >  > changes the timestamp, while the non-git timestamp stays the same.
>> >  > This makes the whole thing almost useless.
>> >  > If the git log command could take a parameter, you could make reproducible
>> >  > builds based on e.g. tag 2017.08, which would be much more useful.
>> >
>> > Well, SOURCE_DATE_EPOCH is meant to refer to the date of the last source
>> > code change rather than the build time (E.G. so repeated builds of the
>> > same sources would give the same results, but builds of changed sources
>> > would return a newer timestamp).
>> >
>> > So I don't really agree that it useless. What we could perhaps do is to
>> > only export our value for SOURCE_DATE_EPOCH if not already set in the
>> > enviroment, so you can set it outside Buildroot if you want a different
>> > behaviour.
>>
>>  Well, the proposed solution of using a config variable sounds OK. Only, I think
>> it would make more sense to have a config variable with a date, rather than a
>> commit ID.
>
> Or let the user define SOURCE_DATE_EPOCH in the environment, as this is
> what would be used and is how SOURCE_DATE_EPOCH is specified;
>     https://reproducible-builds.org/specs/source-date-epoch/
>
>     Build systems MUST NOT overwrite this variable for child processes
>     to consume if it is already present.
>
> I still fail to see what is wrong with the current situation...

The point is that you currently have close to 1900 packages. Most
commits only changes 1 package.
So you have 1899 packages with the exact same source code, but they
produce different binaries because someone changed the 1900th package.
Some people see that as an issue.

For example we have a setup where we want to update embedded devices
in the field.
The update should be as small as possible, so we take a diff of the
target/ for baseline commit (that BR2_REPRODUCIBLE_CUSTOM_REPO_VERSION
points to) and the new build.
To fix a bug in a single tiny file that results in a 7.5MB update
package if SOURCE_DATE_EPOCH keeps changing, but it can be below 4kb
if the SOURCE_DATE_EPOCH is the same.

But supplying the SOURCE_DATE_EPOCH from Jenkins is fine by me. So the
fix is great.

I'll shut up now.
Thanks

>
> Regards,
> Yann E. MORIN.
>
>>  Regards,
>>  Arnout
>>
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Regards
Einar J?n
+31 610 957234
