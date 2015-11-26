From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 12:00:20 +0100
Subject: [Buildroot] [git commit] guile: use libltdl,
	needs dynamic libraries
In-Reply-To: <20151126093555.5459974e@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 26 Nov 2015 09:35:55 +0100")
References: <20151125222250.4B3B07FC4C@busybox.osuosl.org>
 <20151126093555.5459974e@free-electrons.com>
Message-ID: <87k2p5vxdn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Peter,
 > On Wed, 25 Nov 2015 23:10:40 +0100, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=f1ad7a74587843925b85adb2cfb6d35bfb3247f9
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/8d0/8d0e8ab0e7a83fda9ee65f973b5b749b246f1c1a/
 >> http://autobuild.buildroot.net/results/381/38137ccf29023f38c540483a6655c4b8d6778abd/
 >> http://autobuild.buildroot.net/results/1d8/1d864588f71b8c13a67781cf91ad058c74eb7abc/
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Then you should remove:

 > ifeq ($(BR2_STATIC_LIBS),y)
 > GUILE_CFLAGS += -DGC_NO_DLOPEN
 > endif

Ahh yes.

 > from guile.mk. But it is weird, because I remember adding those three
 > lines in guile.mk in commit 49593aba5a56c9c297c31c12fc4dc3de5679e7b1,
 > and at the time, I tested a static build of guile and it worked fine.
 > But maybe it was a static build with a dynamic capable toolchain, so I
 > didn't see all the problems.

The problem is really about toolchains with dynamic library support but
used in a static buildroot configuration. The libtool configure script
detects that the system supports dlopen/dlsym and builds libltdl with
that backend, but then later the guile configure script fails to link a
test program with libltdl as it doesn't link with -ldl.

As far as I can see libltdl with a toolchain not supporting shared
libraries doesn't do anything sensible. Perhaps libtool itself should
depend on !BR2_STATIC_LIBS?

With that said, I am not sure if guile works at runtime without shared
libraries so I went with the safe approach of disallowing it for
2015.11.

What do you suggest?

 > In any case, it is not good to have the package depends
 > on !BR2_STATIC_LIBS and have code in the package to support the
 > BR2_STATIC_LIBS case.

Agreed.

-- 
Venlig hilsen,
Peter Korsgaard 
