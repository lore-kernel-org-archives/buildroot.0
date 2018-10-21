From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2018 16:42:50 +0100
Subject: [Buildroot] [git commit] python3: add optional dependency on
 bluez5_utils-headers
Message-ID: <20181021154147.B2F7E88385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd30ed51b46edff512d84cc5ae038a55c7129860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When python3 depends on bluez5_utils-headers,
python3 is build with bluetooth support.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Arnout: select bluez5_utils-headers is bluez5_utils is enabled]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python3/Config.in  | 1 +
 package/python3/python3.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 0701d56a6c..6d77396380 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  The python language interpreter.
 
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5e94e8e726..efb44c0454 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -255,6 +255,11 @@ endif
 # Provided to other packages
 PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
 
+# Support for socket.AF_BLUETOOTH
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),y)
+PYTHON3_DEPENDENCIES += bluez5_utils-headers
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
