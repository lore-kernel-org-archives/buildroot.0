From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 22:42:58 +0200
Subject: [Buildroot] [git commit] package/snappy: remove pthread handling
	for static builds
Message-ID: <20170809210702.717137FBEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e6208ea794262e4e629efb7c1bbb601d1fa2abc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0e2ee0e6e8076 (package.snappy: fix static builds with threads)
added LIBS=-pthread to configure options to fix static build with
threads on some architectures. This works for autotools packages. Then,
commit d26282b3aa14cb (package/snappy: bump version, switch to cmake)
switched to cmake that does not understand the 'LIBS' parameter.

As pointed out by Thomas[1] the special handling of libpthread for
static builds is not needed anymore: it was needed only to build the
tests, and these are no longer built. Note that packages that link
statically with snappy will still need to link with -pthread. Only
two in-tree packages currently depend on snappy: lua-csnappy depends
on !BR2_STATIC_LIBS and leveldb adds -pthread from its build system.

Tested with the following musl & uclibc defconfigs which also fix build
errors:
http://autobuild.buildroot.net/results/39f/39f9fc4300ddca19e8a533765b46838003752000/
http://autobuild.buildroot.net/results/886/8860b9259f7a3aecb2ddbfa787be048072bd347b/

[1] http://lists.busybox.net/pipermail/buildroot/2017-July/199549.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Baruch: improved commit message]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[Arnout: improved commit message more, based on Yann's input]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/snappy/snappy.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index f5df6bf..a537ade 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -11,13 +11,4 @@ SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_INSTALL_STAGING = YES
 SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_TESTS=OFF
 
-# libsnappy links with libstdc++. Some libstdc++/arch variants use
-# pthread symbols for internal locking if built with thread
-# support. libstdc++ does not have a .pc file, and its .la file does
-# not mention -pthread.  So, static linkig to libstdc++ will fail if
-# -pthread is not explicity linked to. Only do that for static builds.
-ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
-SNAPPY_CONF_OPTS += LIBS=-pthread
-endif
-
 $(eval $(cmake-package))
