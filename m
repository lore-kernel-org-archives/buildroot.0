From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Nov 2017 22:34:11 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be> <20171105084630.GF2996@scaer>
 <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
Message-ID: <73877e9b-d049-3184-2c16-76094987c787@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-17 10:43, Einar J?n wrote:
> On 5 November 2017 at 09:46, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

[snip]
> It seems easier to reproduce with an out-of-tree build, but that is
> surely not the only trigger.
> I have a hard time reproducing it on master, but in my production
> Buildroot 2017.02, I get this:
> 
> $ strace -s 100 -f make  O=output_armxl 2>&1 | grep git.*logstrace -s
> 100 -f make  O=output_armxl  2>&1 | grep -e git.*log
> [pid 27208] execve("/bin/bash", ["/bin/bash", "-c",
> "GIT_DIR=/home/jenkinslinux/jenkins/workspace/SWx_buildroot_for_armxl/armxl-buildroot/.git
>  log -1 --"...], [/* 86 vars */] <unfinished ...>

 I guess that must be due to some local hacks then, otherwise BR2_REPRODUCIBLE
can only be set to y if .config is parsed, and if .config is parsed then the
definition of GIT is included as well.

> [pid 27208] stat("/home/ejg/git/Platform3/Build/bin/log",
> 0x7ffd410c57d0) = -1 ENOENT (No such file or directory)
> [pid 27314] execve("/bin/bash", ["/bin/bash", "-c",
> "GIT_DIR=/home/jenkinslinux/jenkins/workspace/SWx_buildroot_for_armxl/armxl-buildroot/.git
> git log -1"...], [/* 86 vars */] <unfinished ...>
> [pid 27314] execve("/usr/bin/git", ["git", "log", "-1",
> "--format=%at", "1.0.0.22"], [/* 87 vars */]) = 0
> [pid 27385] execve("/bin/bash", ["/bin/bash", "-c",
> "GIT_DIR=/home/jenkinslinux/jenkins/workspace/SWx_buildroot_for_armxl/armxl-buildroot/.git
> git log -1"...], [/* 86 vars */] <unfinished ...>
> [pid 27385] execve("/usr/bin/git", ["git", "log", "-1",
> "--format=%at", "1.0.0.22"], [/* 87 vars */]) = 0
> [pid 27386] execve("/bin/bash", ["/bin/bash", "-c",
> "GIT_DIR=/home/jenkinslinux/jenkins/workspace/SWx_buildroot_for_armxl/armxl-buildroot/.git
> git log -1"...], [/* 86 vars */] <unfinished ...>
> [pid 27386] execve("/usr/bin/git", ["git", "log", "-1",
> "--format=%at", "1.0.0.22"], [/* 87 vars */]) = 0
> 
> $ strace -s 100 -f make  O=output_armxl GIT=git 2>&1 | grep git.*log
> [pid 23959] execve("/bin/bash", ["/bin/bash", "-c",
> "GIT_DIR=/home/jenkinslinux/jenkins/workspace/buildroot_for_armxl/armxl-buildroot/.git
> git log -1"...], [/* 87 vars */] <unfinished ...>
> [pid 23959] execve("/usr/bin/git", ["git", "log", "-1",
> "--format=%at", "1.0.0.22"], [/* 88 vars */]) = 0
> etc...
> 
> Note that the first run fails. I had a error check that would stop the
> whole make in that case,which triggered on that. even if the build
> works on the second run onwards, I can call this a non-issue,
> 
> 
> 
>>
>>> $ make O=/tmp/brtest BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH GIT=git
>>> SOURCE_DATE_EPOCH=1509720578
>>
>> If anything, SOURCE_DATE_EPOCH should come from the environment, as
>> specified in the spec (see below).
>>
>>>  Solution: move the GIT definition to top-level Makefile.
>>
>> That would not solve anything, because it is still defined from BR2_GIT
>> that comes... from .config .

 Well, yes, indeed, it would need a default value as well.

[snip]
> But supplying the SOURCE_DATE_EPOCH from Jenkins is fine by me. So the
> fix is great.

 So, will you make a patch that fixes it?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
