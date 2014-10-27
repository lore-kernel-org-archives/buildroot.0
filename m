From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:53:24 +0100
Subject: [Buildroot] [git commit] package/mpd: enable support for libnfs
Message-ID: <20141027220850.AF5C1B1AB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c83e790655a3409ea76588ef07ce73f93b83d21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add missing comment for the toolchain dependency.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |   10 ++++++++++
 package/mpd/mpd.mk    |    7 +++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 09df556..289b197 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -182,6 +182,16 @@ config BR2_PACKAGE_MPD_CURL
 	help
 	  Enable curl streaming (http) support.
 
+config BR2_PACKAGE_MPD_LIBNFS
+	bool "nfs"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBNFS
+	help
+	  Enable Network File System (NFS) support.
+
+comment "nfs support needs a toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
 config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	bool "samba"
 	depends on !BR2_nios2 # samba
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ecd2a77..ef89f3d 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -90,6 +90,13 @@ else
 MPD_CONF_OPTS += --disable-lame-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
+MPD_DEPENDENCIES += libnfs
+MPD_CONF_OPTS += --enable-nfs
+else
+MPD_CONF_OPTS += --disable-nfs
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LIBSMBCLIENT),y)
 MPD_DEPENDENCIES += samba
 MPD_CONF_OPTS += --enable-smbclient
