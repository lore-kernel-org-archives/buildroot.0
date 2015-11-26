From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Nov 2015 09:35:55 +0100
Subject: [Buildroot] [git commit] guile: use libltdl,
 needs dynamic libraries
In-Reply-To: <20151125222250.4B3B07FC4C@busybox.osuosl.org>
References: <20151125222250.4B3B07FC4C@busybox.osuosl.org>
Message-ID: <20151126093555.5459974e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, 25 Nov 2015 23:10:40 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f1ad7a74587843925b85adb2cfb6d35bfb3247f9
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes:
> http://autobuild.buildroot.net/results/8d0/8d0e8ab0e7a83fda9ee65f973b5b749b246f1c1a/
> http://autobuild.buildroot.net/results/381/38137ccf29023f38c540483a6655c4b8d6778abd/
> http://autobuild.buildroot.net/results/1d8/1d864588f71b8c13a67781cf91ad058c74eb7abc/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Then you should remove:

ifeq ($(BR2_STATIC_LIBS),y)
GUILE_CFLAGS += -DGC_NO_DLOPEN
endif

from guile.mk. But it is weird, because I remember adding those three
lines in guile.mk in commit 49593aba5a56c9c297c31c12fc4dc3de5679e7b1,
and at the time, I tested a static build of guile and it worked fine.
But maybe it was a static build with a dynamic capable toolchain, so I
didn't see all the problems.

In any case, it is not good to have the package depends
on !BR2_STATIC_LIBS and have code in the package to support the
BR2_STATIC_LIBS case.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
