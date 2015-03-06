From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Mar 2015 09:50:30 -0300
Subject: [Buildroot] [PATCH 2/6] mpd: switch smb support to samba4
In-Reply-To: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425646234-22041-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

samba3 is deprecated upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpd/Config.in | 7 +++++--
 package/mpd/mpd.mk    | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 287ccf3..d077792 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -202,11 +202,14 @@ config BR2_PACKAGE_MPD_LIBNFS
 comment "nfs support needs a toolchain w/ RPC"
 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
+comment "samba support needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	bool "samba"
 	depends on !BR2_nios2 # samba
-	select BR2_PACKAGE_SAMBA
-	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support.
 
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 41f3564..b5adafd 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -114,7 +114,7 @@ MPD_CONF_OPTS += --disable-nfs
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSMBCLIENT),y)
-MPD_DEPENDENCIES += samba
+MPD_DEPENDENCIES += samba4
 MPD_CONF_OPTS += --enable-smbclient
 else
 MPD_CONF_OPTS += --disable-smbclient
-- 
2.0.5
