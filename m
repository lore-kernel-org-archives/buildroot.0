From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Nov 2017 21:15:45 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <1509720041684-0.post@n4.nabble.com> ("Einar =?utf-8?Q?J?=
 =?utf-8?Q?=C3=B3n?= Gunnarsson"'s
 message of "Fri, 3 Nov 2017 07:40:41 -0700 (MST)")
References: <1509720041684-0.post@n4.nabble.com>
Message-ID: <87y3nn3yq6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Einar" == Einar J?n Gunnarsson <tolvupostur@gmail.com> writes:

 > Hello all.
 > I've been using BR2_REPRODUCIBLE, and it mostly works.

 > But when it is using a git repo, I have the following issues with creating
 > SOURCE_DATE_EPOCH:
 > 1) It uses $(GIT), but the GIT variable is only defined in line 487:
 > "include package/Makefile.in".
 > Note that this is done around line 250 in $(TOPDIR)/Makefile, so sometimes
 > $(GIT) is unset then getting BR2_VERSION_GIT_EPOCH

What make version (and buildroot version) are you using? It works here:

strace -s 100 -f -e execve make BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH 2>&1 | grep log
[pid  9504] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git git log -1 --format=%at"], [/* 46 vars */]) = 0
[pid  9504] execve("/usr/bin/git", ["git", "log", "-1", "--format=%at"], [/* 47 vars */]) = 0
[pid  9505] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git git log -1 --format=%at"], [/* 46 vars */]) = 0
[pid  9505] execve("/usr/bin/git", ["git", "log", "-1", "--format=%at"], [/* 47 vars */]) = 0

It uses the BR2_GIT setting, E.G.:

strace -s 100 -f -e execve make BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH BR2_GIT=foot 2>&1 | grep log
[pid  9880] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git foot log -1 --format=%at"], [/* 46 vars */]) = 0
[pid  9881] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git foot log -1 --format=%at"], [/* 46 vars */]) = 0

This is with current master and make 4.1.


> 2) It always uses the last git commit to calculate the date. So any commit
 > changes the timestamp, while the non-git timestamp stays the same.
 > This makes the whole thing almost useless.
 > If the git log command could take a parameter, you could make reproducible
 > builds based on e.g. tag 2017.08, which would be much more useful.

Well, SOURCE_DATE_EPOCH is meant to refer to the date of the last source
code change rather than the build time (E.G. so repeated builds of the
same sources would give the same results, but builds of changed sources
would return a newer timestamp).

So I don't really agree that it useless. What we could perhaps do is to
only export our value for SOURCE_DATE_EPOCH if not already set in the
enviroment, so you can set it outside Buildroot if you want a different
behaviour.

-- 
Bye, Peter Korsgaard
