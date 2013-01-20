From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Jan 2013 11:31:15 +0100
Subject: [Buildroot] [PATCH 2/2] xapp_xinit depends on mcookie,
	not xserver_xorg-server
In-Reply-To: <1358677875-29889-1-git-send-email-arnout@mind.be>
References: <1358677875-29889-1-git-send-email-arnout@mind.be>
Message-ID: <1358677875-29889-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

mcookie is not actually used by the Xorg server; it is used by xinit to
generate a xauth cookie before starting the server.

Verified with 'ack-grep -a mcookie build/x*' in an output directory with all
packages selected. The only other package that matches is x11vnc: it does a
runtime check for mcookie and falls back on /dev/random if it's missing.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xinit/Config.in          |    2 ++
 package/x11r7/xserver_xorg-server/Config.in |    1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
index 30981c3..aede5d9 100644
--- a/package/x11r7/xapp_xinit/Config.in
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_XAPP_XINIT
 	bool "xinit"
 	# Runtime dependency: can't start an X server unless there is one
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	# Runtime dependency; mcookie is also in util-linux
+	select BR2_PACKAGE_MCOOKIE if !BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_XAPP_XAUTH
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 5b60398..21b0700 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
-	select BR2_PACKAGE_MCOOKIE
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
-- 
1.7.10.4
