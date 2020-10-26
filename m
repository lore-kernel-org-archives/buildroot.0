From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:34:13 +0100
Subject: [Buildroot] [git commit] package/ltrace: bump ltrace using a more
 recent git repo
Message-ID: <20201026212209.51071817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b5a5692e6e3672bf2dba10d036c1cf26b3dab59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The official repo pointed by https://ltrace.org/ hasn't seen any
updates in 5 years, so this commit switches to
https://github.com/dkogan/ltrace from Dima Kogan that includes some
bug fixes, in particular the following commit to avoid a crash:

  192e0a6 void struct members are now ignored

The previous ltrace version gave a crash on a ARMv7 device, showing
this error:

  "Assertion `field_info->type != ARGTYPE_VOID' failed."

Using this commit ltrace shows a '<void>' return value in such cases,
but at least avoids the crash.

Signed-off-by: Mauro Meneghin <mauro.meneghin@youview.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ltrace/ltrace.hash |  2 +-
 package/ltrace/ltrace.mk   | 14 +++++---------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/ltrace/ltrace.hash b/package/ltrace/ltrace.hash
index f795f53bfb..a677ed3511 100644
--- a/package/ltrace/ltrace.hash
+++ b/package/ltrace/ltrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  894333bb7d347066c4e398d9f4a202af5f2faf80754905dd0e6a2259695baba0  ltrace-c22d359433b333937ee3d803450dc41998115685.tar.gz
+sha256  4aecf69e4a33331aed1e50ce4907e73a98cbccc4835febc3473863474304d547  ltrace-82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 2eb60fe450..b3bd90daaa 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-LTRACE_VERSION = c22d359433b333937ee3d803450dc41998115685
-#LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
-
-# Upstream is dead: the git reporistory for ltrace did not follow during the
-# migration from alioth to gitlab, and there is no longer any official
-# upstream repository with the expected sha1, except for the tarball cached on
-# s.b.o., so we go fetch it there.
-LTRACE_SITE = http://sources.buildroot.org/ltrace
-
+# This github version has some extra fixes on top of https://ltrace.org/
+# in particular the following commit to avoid a crash:
+#   192e0a6 void struct members are now ignored
+LTRACE_VERSION = 82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4
+LTRACE_SITE = $(call github,dkogan,ltrace,$(LTRACE_VERSION))
 LTRACE_DEPENDENCIES = elfutils
 LTRACE_CONF_OPTS = --disable-werror
 LTRACE_LICENSE = GPL-2.0
