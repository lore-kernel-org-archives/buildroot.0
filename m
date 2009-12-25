From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 25 Dec 2009 12:47:18 +0000
Subject: [Buildroot] [PATCH 1/1] Fix reconfiguration of bash during build
In-Reply-To: <cover.1261745233.git.nkukard@lbsd.net>
References: <cover.1261745233.git.nkukard@lbsd.net>
Message-ID: <1da5eb91018f457872604b2fd3de1fb974001256.1261745233.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reconfiguration should be disabled during build.

Problem: http://lists.busybox.net/pipermail/buildroot/2009-September/029039.html

This occurs during cross-compile when job control cannot be tested as it
requires building of an executable during configure even though the config
env is forced.

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 .../bash/bash32-no-reconfig-for-distribution.patch |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 package/bash/bash32-no-reconfig-for-distribution.patch

diff --git a/package/bash/bash32-no-reconfig-for-distribution.patch b/package/bash/bash32-no-reconfig-for-distribution.patch
new file mode 100644
index 0000000..632606b
--- /dev/null
+++ b/package/bash/bash32-no-reconfig-for-distribution.patch
@@ -0,0 +1,14 @@
+diff -ru bash-3.2_vanilla/Makefile.in bash-3.2_no-reconfig-for-distribution/Makefile.in
+--- bash-3.2_vanilla/Makefile.in	2006-08-17 18:03:35.000000000 +0000
++++ bash-3.2_no-reconfig-for-distribution/Makefile.in	2009-12-25 10:55:53.000000000 +0000
+@@ -686,8 +686,8 @@
+ 	$(SHELL) ./config.status --recheck
+ 
+ # comment out for distribution
+-$(srcdir)/configure:	$(srcdir)/configure.in $(srcdir)/aclocal.m4 $(srcdir)/config.h.in
+-	cd $(srcdir) && autoconf
++#$(srcdir)/configure:	$(srcdir)/configure.in $(srcdir)/aclocal.m4 $(srcdir)/config.h.in
++#	cd $(srcdir) && autoconf
+ 
+ # for chet
+ reconfig: force
-- 
1.6.4
