From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 20:53:27 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <87y3nn3yq6.fsf@dell.be.48ers.dk>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
Message-ID: <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 21:15, Peter Korsgaard wrote:
>>>>>> "Einar" == Einar J?n Gunnarsson <tolvupostur@gmail.com> writes:
> 
>  > Hello all.
>  > I've been using BR2_REPRODUCIBLE, and it mostly works.
> 
>  > But when it is using a git repo, I have the following issues with creating
>  > SOURCE_DATE_EPOCH:
>  > 1) It uses $(GIT), but the GIT variable is only defined in line 487:
>  > "include package/Makefile.in".
>  > Note that this is done around line 250 in $(TOPDIR)/Makefile, so sometimes
>  > $(GIT) is unset then getting BR2_VERSION_GIT_EPOCH
> 
> What make version (and buildroot version) are you using? It works here:
> 
> strace -s 100 -f -e execve make BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH 2>&1 | grep log
> [pid  9504] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git git log -1 --format=%at"], [/* 46 vars */]) = 0
> [pid  9504] execve("/usr/bin/git", ["git", "log", "-1", "--format=%at"], [/* 47 vars */]) = 0
> [pid  9505] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git git log -1 --format=%at"], [/* 46 vars */]) = 0
> [pid  9505] execve("/usr/bin/git", ["git", "log", "-1", "--format=%at"], [/* 47 vars */]) = 0
> 
> It uses the BR2_GIT setting, E.G.:
> 
> strace -s 100 -f -e execve make BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH BR2_GIT=foot 2>&1 | grep log
> [pid  9880] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git foot log -1 --format=%at"], [/* 46 vars */]) = 0
> [pid  9881] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git foot log -1 --format=%at"], [/* 46 vars */]) = 0
> 
> This is with current master and make 4.1.

 But not when there is no .config file:

$ make O=/tmp/brtest BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH
/bin/sh: log: command not found
SOURCE_DATE_EPOCH=
/bin/sh: log: command not found

$ make O=/tmp/brtest BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH GIT=git
SOURCE_DATE_EPOCH=1509720578


 Solution: move the GIT definition to top-level Makefile.


>> 2) It always uses the last git commit to calculate the date. So any commit
>  > changes the timestamp, while the non-git timestamp stays the same.
>  > This makes the whole thing almost useless.
>  > If the git log command could take a parameter, you could make reproducible
>  > builds based on e.g. tag 2017.08, which would be much more useful.
> 
> Well, SOURCE_DATE_EPOCH is meant to refer to the date of the last source
> code change rather than the build time (E.G. so repeated builds of the
> same sources would give the same results, but builds of changed sources
> would return a newer timestamp).
>
> So I don't really agree that it useless. What we could perhaps do is to
> only export our value for SOURCE_DATE_EPOCH if not already set in the
> enviroment, so you can set it outside Buildroot if you want a different
> behaviour.

 Well, the proposed solution of using a config variable sounds OK. Only, I think
it would make more sense to have a config variable with a date, rather than a
commit ID.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
