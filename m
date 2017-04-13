From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:29:32 +0200
Subject: [Buildroot] [git commit] trinity: bump to version 1.7
Message-ID: <20170413193010.CF67E7F9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a81ec97cfd1d0f1d1c73ff206675a072a4ece6b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use upstream provided tarball.

Drop upstream patch.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/0001-mips-fix-prctl-s.patch | 39 -----------------------------
 package/trinity/trinity.hash                |  2 +-
 package/trinity/trinity.mk                  |  7 +++---
 3 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/package/trinity/0001-mips-fix-prctl-s.patch b/package/trinity/0001-mips-fix-prctl-s.patch
deleted file mode 100644
index aacd8d5..0000000
--- a/package/trinity/0001-mips-fix-prctl-s.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d61dd102b95b9791e45d6bbf1e34814b8c6c1731 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Mon, 14 Dec 2015 14:46:37 +0000
-Subject: [PATCH] mips: fix prctl's
-
-It looks like a typo in the syscalls/prctl.c file. It's lacking the PR_
-preffix, and due to that is causing build failures like this one:
-
-  CC	syscalls/prctl.o
-syscalls/prctl.c:37:2: error: 'GET_FP_MODE' undeclared here (not in a
-function)
-  GET_FP_MODE, SET_FP_MODE,
-  ^
-syscalls/prctl.c:37:15: error: 'SET_FP_MODE' undeclared here (not
-in a function)
-  GET_FP_MODE, SET_FP_MODE,
-               ^
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- syscalls/prctl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/syscalls/prctl.c b/syscalls/prctl.c
-index 523f03e..5a64fb3 100644
---- a/syscalls/prctl.c
-+++ b/syscalls/prctl.c
-@@ -34,7 +34,7 @@ static int prctl_opts[] = {
- 	PR_GET_NO_NEW_PRIVS, PR_GET_TID_ADDRESS, PR_SET_THP_DISABLE, PR_GET_THP_DISABLE,
- 	PR_MPX_ENABLE_MANAGEMENT, PR_MPX_DISABLE_MANAGEMENT,
- #ifdef __mips__
--	GET_FP_MODE, SET_FP_MODE,
-+	PR_GET_FP_MODE, PR_SET_FP_MODE,
- #endif
- 	PR_CAP_AMBIENT,
- };
--- 
-2.4.10
-
diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index 5bf9992..8d88301 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3ef7ae05dba14f8bb626121983a08bb09d1d51a19de38bd9a8e0f29b11d9e3c9  trinity-v1.6.tar.gz
+sha256 4cb2bd4049ce523fdf47490c4c18b8eb713c720d4b3b13d6ec2ae246aac908ad  trinity-1.7.tar.xz
 sha256 5601474b10973b99f6f4ecc67c8ac54000754d7110553cc81c7648bd7e73c810  b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index c9f09b1..3880aec 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-TRINITY_VERSION = v1.6
-TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
+TRINITY_VERSION = 1.7
+TRINITY_SITE = http://codemonkey.org.uk/projects/trinity
+TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 
 TRINITY_PATCH = https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
 
 define TRINITY_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.sh)
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
 endef
 
 define TRINITY_BUILD_CMDS
