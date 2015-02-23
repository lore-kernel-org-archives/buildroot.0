From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:26:11 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: needs wchar
Message-ID: <20150223112616.DD68B803FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6caeaf029142c4eed313e0f507eecaa17b29dafd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add reverse dependency for Weston.

Fix build error:
make[3]: Entering directory '/home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d'
In file included from /home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/include/winpr/winsock.h:24:0,
                 from /home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/libwinpr/winsock/winsock.c:24:
/home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/include/winpr/wtypes.h:132:1: error: unknown type name ???wchar_t???
 typedef wchar_t UNICODE;

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/Config.in |    4 ++++
 package/weston/Config.in  |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 1c203c7..ea36e0e 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -37,3 +38,6 @@ comment "freerdp server and client need X.Org"
 	depends on !BR2_PACKAGE_XORG7
 
 endif
+
+comment "freerdp needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 8983460..dec3583 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_WESTON_FBDEV
 
 config BR2_PACKAGE_WESTON_RDP
 	bool "RDP compositor"
+	depends on BR2_USE_WCHAR # freerdp
 	select BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	help
@@ -56,6 +57,9 @@ config BR2_PACKAGE_WESTON_RDP
 	  so you may want to change them in a post-build script or a rootfs
 	  overlay.
 
+comment "RDP compositor needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 # rpi-userland is an EGL/GLES provider, so we can't select it
 config BR2_PACKAGE_WESTON_RPI
 	bool "RPi compositor"
