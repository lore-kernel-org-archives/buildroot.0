From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 22:03:47 +0200
Subject: [Buildroot] [git commit] kvazaar: new package
Message-ID: <20170618200317.B084A81813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e0a3101de17f9c33c529064add85ba6154e862c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kvazaar is an open-source HEVC encoder licensed under LGPLv2.1.
This provides tools to encode raw video into HEVC stream.

website: http://ultravideo.cs.tut.fi/

Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
[Thomas: add --without-cryptopp to explicitly disable support for this
optional dependency, use SPDX license code, fix Config.in]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/kvazaar/Config.in    |  6 ++++++
 package/kvazaar/kvazaar.hash |  2 ++
 package/kvazaar/kvazaar.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ade852..f86a5dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -64,6 +64,9 @@ F:	package/liblog4c-localtime/
 N:	Alexandre Belloni <alexandre.belloni@free-electrons.com>
 F:	package/tz/
 
+N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
+F:	package/kvazaar/
+
 N:	Alistair Francis <alistair.francis@xilinx.com>
 F:	package/xen/
 
diff --git a/package/Config.in b/package/Config.in
index c997e2a..aeb7430 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1219,6 +1219,7 @@ endmenu
 
 menu "Multimedia"
 	source "package/bitstream/Config.in"
+	source "package/kvazaar/Config.in"
 	source "package/libaacs/Config.in"
 	source "package/libamcodec/Config.in"
 	source "package/libass/Config.in"
diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
new file mode 100644
index 0000000..3377145
--- /dev/null
+++ b/package/kvazaar/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KVAZAAR
+	bool "kvazaar"
+	help
+	  An open-source HEVC encoder licensed under LGPLv2.1
+
+	  https://github.com/ultravideo/kvazaar
diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
new file mode 100644
index 0000000..80f480b
--- /dev/null
+++ b/package/kvazaar/kvazaar.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8e382738a51004bfcfca4c832e8b41fe6a17f889f3c39151dc1c1a37261a3a6d  kvazaar-v1.1.0.tar.gz
diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
new file mode 100644
index 0000000..30b8bda
--- /dev/null
+++ b/package/kvazaar/kvazaar.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# kvazaar
+#
+################################################################################
+
+KVAZAAR_VERSION = v1.1.0
+KVAZAAR_SITE = $(call github,ultravideo,kvazaar,$(KVAZAAR_VERSION))
+KVAZAAR_LICENSE = LGPL-2.1+
+KVAZAAR_LICENSE_FILES = COPYING
+KVAZAAR_AUTORECONF = YES
+KVAZAAR_INSTALL_STAGING = YES
+KVAZAAR_CONF_OPTS = --without-cryptopp
+
+$(eval $(autotools-package))
