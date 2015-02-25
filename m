From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Feb 2015 17:27:03 +0100
Subject: [Buildroot] [git commit] opusfile: new package
Message-ID: <20150302222723.816DD8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b579027ef36735374967c056dbb384c233ae0ae6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/opusfile/Config.in     |   13 +++++++++++++
 package/opusfile/opusfile.hash |    2 ++
 package/opusfile/opusfile.mk   |   25 +++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ceabce1..1d8ec1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -621,6 +621,7 @@ menu "Audio/Sound"
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
