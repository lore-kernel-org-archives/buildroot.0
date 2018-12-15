From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 11:33:29 +0100
Subject: [Buildroot] [git commit] system cfg: remove mkpasswd MD5 format
 option
Message-ID: <20181215103019.307A6814CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf3626002fbdf9802372b0127195b4824faf1337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As SHA256 is now default, removing weak MD5 option.  C libraries now
all support the SHA methods.
    glibc 2.7+
    uclibc (bdd8362a88 package/uclibc: defconfig: enable sha-256...)
    musl 1.1.14+

One issue this would prevent, is a host tool issue with a FIPS enabled
system where weak ciphers/methods are disabled. It seems the crypt(3)
call is impacted by /proc/sys/crypto/fips_enabled (per crypt(3) man
page). It results in mkpasswd returning "(EPERM) crypt failed."
Rather then create a Buildroot host dependency check, this patch
removes the potential corner case from being selected.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |  8 ++++++++
 system/Config.in | 10 ----------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 37119d7e58..8cab6a23af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,7 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+
 comment "Legacy options removed in 2019.02"
 
 config BR2_PACKAGE_LUA_5_2
@@ -152,6 +153,13 @@ config BR2_PACKAGE_LUA_5_2
 	help
 	  The Lua 5.2.x version was removed.
 
+config BR2_TARGET_GENERIC_PASSWD_MD5
+	bool "target passwd md5 format support has been removed"
+	select BR2_LEGACY
+	help
+	  The default has been moved to SHA256 and all C libraries
+	  now support that method by default
+
 comment "Legacy options removed in 2018.11"
 
 config BR2_TARGET_XLOADER
diff --git a/system/Config.in b/system/Config.in
index 65c92a8409..0f77b9b672 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -68,16 +68,6 @@ choice
 
 	  Note: this is used at build-time, and *not* at runtime.
 
-config BR2_TARGET_GENERIC_PASSWD_MD5
-	bool "md5"
-	help
-	  Use MD5 to encode passwords.
-
-	  The default. Wildly available, and pretty good.
-	  Although pretty strong, MD5 is now an old hash function, and
-	  suffers from some weaknesses, which makes it susceptible to
-	  brute-force attacks.
-
 config BR2_TARGET_GENERIC_PASSWD_SHA256
 	bool "sha-256"
 	help
