From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 23:58:03 +0200
Subject: [Buildroot] [git commit] package/weston: mark the RDP backend as
	broken
Message-ID: <20150820215812.BAFD381ED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce3864a44b0458771477b4f5625ceaf404069396
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

weston needs FreeRDP from master, as it uses new settings only
introduced in there.

Since it is too late in the release cycle to bump FreeRDP, just mark the
weston RDP backend as broken.

Fixes:
    http://autobuild.buildroot.org/results/ef6/ef685a41a56e81dc93a40f23f8cd55860f44e055/
    http://autobuild.buildroot.org/results/c42/c42d72498e05364a718748caef74bba6c423d7d1/
    http://autobuild.buildroot.org/results/c78/c783695a5b1a18976361ea36627505b281b11781/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 07773f0..f530e22 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -41,8 +41,12 @@ config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
 
+# RDP backend needs FreeRDP master, while we only have stable-1.1
+comment "RDP backend is broken"
+
 config BR2_PACKAGE_WESTON_RDP
 	bool "RDP compositor"
+	depends on BROKEN # needs FreeRDP master
 	depends on BR2_USE_WCHAR # freerdp
 	select BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
@@ -60,6 +64,7 @@ config BR2_PACKAGE_WESTON_RDP
 	  overlay.
 
 comment "RDP compositor needs a toolchain w/ wchar"
+	depends on BROKEN # needs FreeRDP master
 	depends on !BR2_USE_WCHAR
 
 # rpi-userland is an EGL/GLES provider, so we can't select it
