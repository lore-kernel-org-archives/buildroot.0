From: Mauro Meneghin <mauro.meneghin@youview.com>
Date: Fri, 23 Oct 2020 14:43:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltrace: bump ltrace to more recent
 git repo with latest commit
Message-ID: <20201023134329.1810-1-mauro.meneghin@youview.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've updated LTRACE_SITE to point to https://github.com/dkogan/ltrace
of Dima Kogan that includes some bug fixes, in particular the following
commit to avoid a crash:
  192e0a6 void struct members are now ignored

The previous ltrace version gave me a crash on a ARMv7 device, showing
this error:
  "Assertion `field_info->type != ARGTYPE_VOID' failed."

Using this commit ltrace shows a '<void>' return value in such cases,
but at least avoids the crash.

Signed-off-by: Mauro Meneghin <mauro.meneghin@youview.com>
---
 package/ltrace/ltrace.hash |  2 +-
 package/ltrace/ltrace.mk   | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/ltrace/ltrace.hash b/package/ltrace/ltrace.hash
index f795f53bfb..823a2ac8fa 100644
--- a/package/ltrace/ltrace.hash
+++ b/package/ltrace/ltrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  894333bb7d347066c4e398d9f4a202af5f2faf80754905dd0e6a2259695baba0  ltrace-c22d359433b333937ee3d803450dc41998115685.tar.gz
+sha256  392555e4136cda1803f7197c1e54a29cf5c916f803f9b44cf741dc3324350946  ltrace-82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 2eb60fe450..351917bd9d 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LTRACE_VERSION = c22d359433b333937ee3d803450dc41998115685
-#LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
+# This github version has some extra fixes on top of https://ltrace.org/
+# in particular the following commit to avoid a crash:
+#   192e0a6 void struct members are now ignored
+LTRACE_VERSION = 82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4
+LTRACE_SITE = git://github.com/dkogan/ltrace.git
 
-# Upstream is dead: the git reporistory for ltrace did not follow during the
-# migration from alioth to gitlab, and there is no longer any official
-# upstream repository with the expected sha1, except for the tarball cached on
-# s.b.o., so we go fetch it there.
-LTRACE_SITE = http://sources.buildroot.org/ltrace
 
 LTRACE_DEPENDENCIES = elfutils
 LTRACE_CONF_OPTS = --disable-werror
-- 
2.17.1
