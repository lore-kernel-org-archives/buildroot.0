From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:31:05 +0200
Subject: [Buildroot] [git commit] mpd: switch smb support to samba4
Message-ID: <20150403123150.1914781995@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f83662bb7e54d97d9b8a49a65416597332864762
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba3 is deprecated upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    7 +++++--
 package/mpd/mpd.mk    |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5c25445..8ed1149 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -192,11 +192,14 @@ config BR2_PACKAGE_MPD_LIBNFS
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
