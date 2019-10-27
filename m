From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 22:14:41 +0100
Subject: [Buildroot] [git commit] package/python3: add option to build on
 the host
Message-ID: <20191027210813.6EF428A698@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1407c4967458037057e2e4bfb8deb74a9f81d75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some python scripts may be ran in the custom scripts a user can define
in the config. Allow the user to enable host-python3 explicitly.

If any of those require ssl, they will fail with no possible fix.
Add an option to enable openssl as well. This is made optional because
openssl significantly increases the build time.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in.host         |  1 +
 package/python3/Config.in.host | 16 ++++++++++++++++
 package/python3/python3.mk     |  9 +++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 9eeb5c91a9..3253f9f361 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -56,6 +56,7 @@ menu "Host utilities"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
+	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
new file mode 100644
index 0000000000..70b5dacdde
--- /dev/null
+++ b/package/python3/Config.in.host
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_HOST_PYTHON3
+	bool "host python3"
+	help
+	  The python language interpreter. Host package.
+
+	  http://www.python.org/
+
+if BR2_PACKAGE_HOST_PYTHON3
+
+config BR2_PACKAGE_HOST_PYTHON3_SSL
+	bool "ssl"
+	select BR2_PACKAGE_HOST_OPENSSL
+	help
+	  _ssl module for host Python3.
+
+endif
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 060f9061ff..d6fda5c274 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -26,8 +26,7 @@ HOST_PYTHON3_CONF_OPTS += \
 	--enable-unicodedata \
 	--disable-test-modules \
 	--disable-idle3 \
-	--disable-ossaudiodev \
-	--disable-openssl
+	--disable-ossaudiodev
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
@@ -42,6 +41,12 @@ PYTHON3_DEPENDENCIES = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
+HOST_PYTHON3_DEPENDENCIES += host-openssl
+else
+HOST_PYTHON3_CONF_OPTS += --disable-openssl
+endif
+
 PYTHON3_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
