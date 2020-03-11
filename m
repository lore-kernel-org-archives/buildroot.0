From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 18:20:07 +0100
Subject: [Buildroot] [git commit] package/openrc: bump to version 0.42.1
Message-ID: <20200311170751.3F9928E27E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bcf91b81dbbbe0ff30966fd6d9170253af135a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to prevent starting agetty on tty[1-6]. Buildroot starts a
single getty, according to the system configuration. Also tty[1-6] may
not even exist (e.g. embedded devices with serial consoles only).

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...o-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch | 34 ++++++++++++++++++++++
 package/openrc/openrc.hash                         |  2 +-
 package/openrc/openrc.mk                           |  2 +-
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
new file mode 100644
index 0000000000..733506ada9
--- /dev/null
+++ b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
@@ -0,0 +1,34 @@
+From 014dc43447fa553e875984ac4a528e5916cc9e06 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Sat, 29 Feb 2020 22:41:30 -0300
+Subject: [PATCH] runlevels: do not add agetty.tty[1-6] if MKSYSVINIT=yes
+
+Buildroot starts a single getty, according to the system configuration.
+Also tty[1-6] may not exist (e.g. embedded devices with serial consoles
+only).
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ runlevels/Makefile | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/runlevels/Makefile b/runlevels/Makefile
+index 73843d8b..dbfb59ca 100644
+--- a/runlevels/Makefile
++++ b/runlevels/Makefile
+@@ -90,12 +90,6 @@ install:
+ 			fi; \
+ 			ln -snf ${INITDIR}/"$$x" ${SHUTDOWNDIR}/"$$x" || exit $$?; done \
+ 	fi
+-	if test "${MKSYSVINIT}" = yes && test "${OS}" = Linux; then \
+-		for x in tty1 tty2 tty3 tty4 tty5 tty6; do \
+-			ln -snf ${INITDIR}/agetty ${DESTDIR}/${INITDIR}/"agetty.$$x" || exit $$?; \
+-			ln -snf ${INITDIR}/agetty.$$x ${DEFAULTDIR}/"agetty.$$x" || exit $$?; \
+-		done; \
+-	fi
+ 
+ check test::
+ 
+-- 
+2.18.2
+
diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index 7d58e254c4..bb5880806d 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	c99488ca54f2b795328d07bbd456ade49b571136bba7501f7eaaeb1ca9f9ecc4	openrc-0.41.2.tar.gz
+sha256	91a01ca6d930a0688fb91338209985de57cac7aa2d37feddacb78fd3d95308e2	openrc-0.42.1.tar.gz
 sha256	96862463f4e77e2508e4fc2c83773fd24807cb699368b63fd93a5e2b466dd624	LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index ce0b05e965..6057451bfe 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.41.2
+OPENRC_VERSION = 0.42.1
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
