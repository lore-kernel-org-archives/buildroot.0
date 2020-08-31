From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 22:19:19 +0200
Subject: [Buildroot] [git commit] package/trousers: fix build with gcc 10
Message-ID: <20200831201229.6C832815D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f00f7499e2c3fc0784ee408fa400843628367328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/701e82a8f63e8b78c2db12bdeff9086d6e121b36

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-trousers-resolve-build-failure.patch      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/trousers/0004-trousers-resolve-build-failure.patch b/package/trousers/0004-trousers-resolve-build-failure.patch
new file mode 100644
index 0000000000..ea054ab2c5
--- /dev/null
+++ b/package/trousers/0004-trousers-resolve-build-failure.patch
@@ -0,0 +1,41 @@
+From c9b8c4434f3b11bae4f7e72c3aec5b4f3459eecc Mon Sep 17 00:00:00 2001
+From: Jerry Snitselaar <jsnitsel@redhat.com>
+Date: Wed, 18 Mar 2020 14:10:35 -0700
+Subject: [PATCH] trousers: resolve build failure
+
+The global variables tcsd_sa_chld and tcsd_sa_int in tcsd.h are
+causing build failures in latest Fedora release:
+
+/usr/bin/ld: ../../src/tcs/libtcs.a(libtcs_a-tcsi_changeauth.o):/builddir/build/BUILD/trousers-0.3.13/src/tcs/../include/tcsd.h:169: multiple definition of `tcsd_sa_chld'; tcsd-svrside.o:/builddir/build/BUILD/trousers-0.3.13/src/tcsd/../../src/include/tcsd.h:169: first defined here
+/usr/bin/ld: ../../src/tcs/libtcs.a(libtcs_a-tcsi_changeauth.o):/builddir/build/BUILD/trousers-0.3.13/src/tcs/../include/tcsd.h:168: multiple definition of `tcsd_sa_int'; tcsd-svrside.o:/builddir/build/BUILD/trousers-0.3.13/src/tcsd/../../src/include/tcsd.h:168: first defined here
+
+They are no longer used since 9b40e581470b ("Improved daemon's signal
+handling") so just remove them.
+
+Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
+Signed-off-by: Debora Velarde Babb <debora@linux.ibm.com>
+[Retrieved from:
+https://sourceforge.net/p/trousers/trousers/ci/c9b8c4434f3b11bae4f7e72c3aec5b4f3459eecc]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/include/tcsd.h | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/src/include/tcsd.h b/src/include/tcsd.h
+index 5b9462b..f5c286e 100644
+--- a/src/include/tcsd.h
++++ b/src/include/tcsd.h
+@@ -164,10 +164,4 @@ TSS_RESULT tcsd_thread_create(int, char *);
+ void	   *tcsd_thread_run(void *);
+ void	   thread_signal_init();
+ 
+-/* signal handling */
+-#ifndef __APPLE__
+-struct sigaction tcsd_sa_int;
+-struct sigaction tcsd_sa_chld;
+-#endif
+-
+ #endif
+-- 
+2.28.0
+
