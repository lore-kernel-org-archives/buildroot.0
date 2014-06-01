From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:50 +0200
Subject: [Buildroot] [PATCH 26/26] [WIP] package/weston: add support for the
	RDP compositor
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <b9520f0ec1d88f5206efc7c34545108c1e396482.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Using the RDP compositor, one can run a headless machine to serve remote
clients, using the RDP protocol.

Add an option to enable the rdp-backend.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: this is mostly in an WIP state. The backend builds and does
not crash. But the best I was able to get when connecting to this
RDP server, is an empty, completely black client window, in which
I could do nothing, not even run a weston-terminal or whatever,
even by explicitly asking to run it via the RDP 'shell' command...
But it works, as it does not crash. Oh, wait...

Although WIP, sending it to show off what weston is (supposed to be)
capable of.
---
 package/weston/Config.in | 5 +++++
 package/weston/weston.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 96ebdf1..267571a 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -45,6 +45,11 @@ config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
 
+config BR2_PACKAGE_WESTON_RDP
+	bool "RDP compositor"
+	select BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
+
 comment "RPi compositor needs a toolchain w/ C++, largefile, threads"
 	depends on BR2_arm
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 325cfc7..6189601 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -39,6 +39,13 @@ else
 WESTON_CONF_OPT += --disable-libinput-backend
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
+WESTON_DEPENDENCIES += freerdp
+WESTON_CONF_OPT += --enable-rdp-compositor
+else
+WESTON_CONF_OPT += --disable-rdp-compositor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
-- 
1.8.3.2
