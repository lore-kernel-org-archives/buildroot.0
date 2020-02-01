From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Feb 2020 23:45:33 +0100
Subject: [Buildroot] [git commit] package/libva: bump version to 2.6.1
Message-ID: <20200201223444.30DF1880F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8663e6ff1e88261b45f4477c4213c94b9ed54d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream:
https://github.com/intel/libva/commit/69b4230c36d977d4198d74a5f1fc7529715fd5ab

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...just-call-sequence-to-ensure-authenticate.patch | 68 ----------------------
 package/libva/libva.hash                           |  6 +-
 package/libva/libva.mk                             |  2 +-
 3 files changed, 4 insertions(+), 72 deletions(-)

diff --git a/package/libva/0001-adjust-call-sequence-to-ensure-authenticate.patch b/package/libva/0001-adjust-call-sequence-to-ensure-authenticate.patch
deleted file mode 100644
index 09c766424b..0000000000
--- a/package/libva/0001-adjust-call-sequence-to-ensure-authenticate.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From a80d2fe3bcc2c14c6e1434615d1be38924b668ea Mon Sep 17 00:00:00 2001
-From: Carl Zhang <carl.zhang@intel.com>
-Date: Mon, 30 Dec 2019 04:38:43 -0500
-Subject: [PATCH] adjust call sequence to ensure authenticate operation is
- executed
-
-fixes #355
-
-Downloaded from upstream PR: https://github.com/intel/libva/pull/356
-
-Signed-off-by: Carl Zhang <carl.zhang@intel.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- va/va.c | 25 ++++++++++++++++---------
- 1 file changed, 16 insertions(+), 9 deletions(-)
-
-diff --git a/va/va.c b/va/va.c
-index cfcabff..7f014a1 100644
---- a/va/va.c
-+++ b/va/va.c
-@@ -367,11 +367,23 @@ static VAStatus va_getDriverNameByIndex(VADisplay dpy, char **driver_name, int c
-     VADisplayContextP pDisplayContext = (VADisplayContextP)dpy;
-     const char *driver_name_env = NULL;
-     VADriverContextP ctx;
-+    VAStatus status = VA_STATUS_SUCCESS;
- 
-     ctx = CTX(dpy);
-+    if (pDisplayContext->vaGetDriverNameByIndex) {
-+        /*if vaGetDriverNameByIndex is implemented*/
-+        status = pDisplayContext->vaGetDriverNameByIndex(pDisplayContext, driver_name, candidate_index);
-+    } else {
-+        if (candidate_index == 0)
-+            status = pDisplayContext->vaGetDriverName(pDisplayContext, driver_name);
-+        else
-+            status = VA_STATUS_ERROR_INVALID_PARAMETER;
-+    }    
-     driver_name_env = getenv("LIBVA_DRIVER_NAME");
-     /*if user set driver name by vaSetDriverName */
-     if (ctx->override_driver_name){
-+        if(*driver_name)
-+            free(*driver_name);
-         *driver_name = strdup(ctx->override_driver_name);
-         if (!(*driver_name)) {
-               va_errorMessage(dpy, "va_getDriverNameByIndex  failed with %s, out of memory\n",vaErrorStr(VA_STATUS_ERROR_ALLOCATION_FAILED));
-@@ -380,19 +392,14 @@ static VAStatus va_getDriverNameByIndex(VADisplay dpy, char **driver_name, int c
-         va_infoMessage(dpy, "User requested driver '%s'\n", *driver_name);
-         return VA_STATUS_SUCCESS;
-     } else if (driver_name_env && (geteuid() == getuid())) {
-+        if(*driver_name)
-+            free(*driver_name);
-         /*if user set driver name by environment variable*/
-         *driver_name = strdup(driver_name_env);
-         va_infoMessage(dpy, "User environment variable requested driver '%s'\n", *driver_name);
-         return VA_STATUS_SUCCESS;
--    } else if (pDisplayContext->vaGetDriverNameByIndex) {
--        /*if vaGetDriverNameByIndex is implemented*/
--        return pDisplayContext->vaGetDriverNameByIndex(pDisplayContext, driver_name, candidate_index);
--    } else {
--        if (candidate_index == 0)
--            return pDisplayContext->vaGetDriverName(pDisplayContext, driver_name);
--        else
--            return VA_STATUS_ERROR_INVALID_PARAMETER;
--    }
-+    } 
-+    return status;
- }
- 
- static char *va_getDriverPath(const char *driver_dir, const char *driver_name)
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index d3a4f51ff6..8edacf1289 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.6.0/libva-2.6.0.tar.bz2.sha1sum
-sha1 9d3b55d2a01e45612c03b2e7718599e760c3bf7e  libva-2.6.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.6.1/libva-2.6.1.tar.bz2.sha1sum
+sha1 6b218e5622174a37fd0cfd8777b10717c95bd20e  libva-2.6.1.tar.bz2
 # Locally computed
-sha256 486bb6b5761db6e5a9f4475bd187e0bfa7309944cfc9734d496d41930353d6c5  libva-2.6.0.tar.bz2
+sha256 6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5  libva-2.6.1.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 0516cd0ab9..5e9bedbbd5 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.6.0
+LIBVA_VERSION = 2.6.1
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
