From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Tue, 28 Feb 2012 20:54:01 -0300
Subject: [Buildroot] [PATCH] Makefile.package.in: GIT: add support to
 fetch git submodules
In-Reply-To: <201202282232.28362.arnout@mind.be>
References: <1330435519-21011-1-git-send-email-aletes.xgr@gmail.com>
 <201202282232.28362.arnout@mind.be>
Message-ID: <CAAAP30GkyENCJYs8NrrfME0=eaOOMBR1qeMi8MsRAegXx8gV9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ?I'm a bit concerned with the impact this will have on performance, e.g.
> when cloning a linux git. ?Could you evaluate that?
>
> ?Regards,
> ?Arnout

Arnout,

I just saw a problem in this first implementation. I am storing not
only the checkout but the git repository as well. I will exclude those
files and resend the patch.

I did some tests, with the optimization that I will implement. Here
are the figures comparing the time needed to checkout a git repository
versus the time to just archive it, excluding any network overhead:
rm -rf -- *; rm -f ../linux.tar.gz; time (git checkout -f master &&
tar czf ../linux.tar.gz --exclude-vcs . && git submodule init && git
submodule update); rm -f ../linux.tar.gz; time git archive -o
../linux.tar.gz master
Checking out files: 100% (37083/37083), done.
Already on 'master'

real	1m24.828s
user	1m9.588s
sys	0m13.233s

real	1m0.601s
user	1m7.676s
sys	0m1.904s

So, there is a 24s overhead or 40% more time needed to checkout the copy.

We could avoid this extra delay if we check for the presence of any
git submodule. If this kind of delay in the download phase is
important I can go in that direction.

Regards
