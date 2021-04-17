From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Apr 2021 08:58:42 +0200
Subject: [Buildroot] [git commit] package/libcgroup: bump to version 0.42.2
Message-ID: <20210417063245.2787083AE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d917e92c9b1d55e52122e2533704a5a7db097136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/libcgroup/libcgroup/releases/tag/v0.42.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-cgrulesengd-remove-umask-0.patch          | 33 ----------------------
 package/libcgroup/libcgroup.hash                   |  6 ++--
 package/libcgroup/libcgroup.mk                     |  7 ++---
 3 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/package/libcgroup/0001-cgrulesengd-remove-umask-0.patch b/package/libcgroup/0001-cgrulesengd-remove-umask-0.patch
deleted file mode 100644
index 1d9077a2d6..0000000000
--- a/package/libcgroup/0001-cgrulesengd-remove-umask-0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0d88b73d189ea3440ccaab00418d6469f76fa590 Mon Sep 17 00:00:00 2001
-From: Michal Hocko <mhocko@suse.com>
-Date: Wed, 18 Jul 2018 11:24:29 +0200
-Subject: [PATCH] cgrulesengd: remove umask(0)
-
-One of our partners has noticed that cgred daemon is creating a log file
-(/var/log/cgred) with too wide permissions (0666) and that is seen as
-a security bug because an untrusted user can write to otherwise
-restricted area. CVE-2018-14348 has been assigned to this issue.
-
-Signed-off-by: Michal Hocko <mhocko@suse.com>
-Acked-by: Balbir Singh <bsingharora@gmail.com>
-[Retrieved from:
-https://github.com/libcgroup/libcgroup/commit/0d88b73d189ea3440ccaab00418d6469f76fa590]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/daemon/cgrulesengd.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/daemon/cgrulesengd.c b/src/daemon/cgrulesengd.c
-index ea51f11..0d288f3 100644
---- a/src/daemon/cgrulesengd.c
-+++ b/src/daemon/cgrulesengd.c
-@@ -889,9 +889,6 @@ int cgre_start_daemon(const char *logp, const int logf,
- 		} else if (pid > 0) {
- 			exit(EXIT_SUCCESS);
- 		}
--
--		/* Change the file mode mask. */
--		umask(0);
- 	} else {
- 		flog(LOG_DEBUG, "Not using daemon mode\n");
- 		pid = getpid();
diff --git a/package/libcgroup/libcgroup.hash b/package/libcgroup/libcgroup.hash
index 11423e269f..70671212ef 100644
--- a/package/libcgroup/libcgroup.hash
+++ b/package/libcgroup/libcgroup.hash
@@ -1,3 +1,5 @@
-# Locally computed:
-sha256  e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51  libcgroup-0.41.tar.bz2
+# From https://github.com/libcgroup/libcgroup/releases/download/v0.42.2/libcgroup-0.42.2.tar.bz2.sha256
+sha256  18939381324d418e11be4f5fdca37b01652c18917bfaf1f6b0c505f157e18d07  libcgroup-0.42.2.tar.bz2
+
+# Hash for license file
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index a26d5f2ddf..ff0639946c 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-LIBCGROUP_VERSION = 0.41
+LIBCGROUP_VERSION = 0.42.2
 LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
-LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v$(LIBCGROUP_VERSION)
+LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
 LIBCGROUP_LICENSE = LGPL-2.1
 LIBCGROUP_LICENSE_FILES = COPYING
 LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
 
-# 0001-cgrulesengd-remove-umask-0.patch
-LIBCGROUP_IGNORE_CVES += CVE-2018-14348
-
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support. See https://bugzilla.redhat.com/show_bug.cgi?id=574992
 # for more information.
