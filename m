From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 10:06:25 -0300
Subject: [Buildroot] [PATCH 2/3] opusfile: new package
In-Reply-To: <1424869586-9033-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424869586-9033-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424869586-9033-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in              |  1 +
 package/opusfile/Config.in     | 13 +++++++++++++
 package/opusfile/opusfile.hash |  2 ++
 package/opusfile/opusfile.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/opusfile/Config.in
 create mode 100644 package/opusfile/opusfile.hash
 create mode 100644 package/opusfile/opusfile.mk

diff --git a/package/Config.in b/package/Config.in
index 2894379..4aed649 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -614,6 +614,7 @@ menu "Audio/Sound"
 	source "package/mp4v2/Config.in"
 	source "package/opencore-amr/Config.in"
 	source "package/opus/Config.in"
+	source "package/opusfile/Config.in"
 	source "package/portaudio/Config.in"
 	source "package/speex/Config.in"
 	source "package/taglib/Config.in"
diff --git a/package/opusfile/Config.in b/package/opusfile/Config.in
new file mode 100644
index 0000000..f9271c4
--- /dev/null
+++ b/package/opusfile/Config.in
@@ -0,0 +1,13 @@
+comment "opusfile needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
+
+config BR2_PACKAGE_OPUSFILE
+	bool "opusfile"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_OPUS
+	help
+	  A convenient high-level API for decoding and basic manipulation
+	  of all Ogg Opus audio streams.
+
+	  http://opus-codec.org
diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
new file mode 100644
index 0000000..1833950
--- /dev/null
+++ b/package/opusfile/opusfile.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
+sha256	2428717b356e139f18ed2fdb5ad990b5654a238907a0058200b39c46a7d03ea6	opusfile-0.6.tar.gz
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
new file mode 100644
index 0000000..918041d
--- /dev/null
+++ b/package/opusfile/opusfile.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# opusfile
+#
+################################################################################
+
+OPUSFILE_VERSION = 0.6
+OPUSFILE_SITE = http://downloads.xiph.org/releases/opus
+OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
+OPUSFILE_LICENSE = BSD-3c
+OPUSFILE_LICENSE_FILES = COPYING
+OPUSFILE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPUSFILE_DEPENDENCIES += openssl
+else
+OPUSFILE_CONF_OPTS += --disable-http
+endif
+
+# Use the same as opus package since it's a dep and we can't mix
+ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
+OPUSFILE_CONF_OPTS += --enable-fixed-point
+endif
+
+$(eval $(autotools-package))
-- 
2.0.5
