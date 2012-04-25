From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 12:07:36 +0200
Subject: [Buildroot] [git commit] audiofile: new package
Message-ID: <20120425101023.D67C396BAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1c9bdd64393078f38f054a6aa6f7c7a84dbc483
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/audiofile/Config.in    |   11 +++++++++++
 package/multimedia/audiofile/audiofile.mk |   19 +++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index a05d1d9..effec38 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -1,6 +1,7 @@
 menu "Audio and video libraries and applications"
 source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
+source "package/multimedia/audiofile/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
diff --git a/package/multimedia/audiofile/Config.in b/package/multimedia/audiofile/Config.in
new file mode 100644
index 0000000..4f9952c
--- /dev/null
+++ b/package/multimedia/audiofile/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_AUDIOFILE
+	bool "audiofile"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The Audio File Library handles reading and writing audio files
+	  in many common formats.
+
+	  http://www.68k.org/~michael/audiofile/
+
+comment "audiofile requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/multimedia/audiofile/audiofile.mk b/package/multimedia/audiofile/audiofile.mk
new file mode 100644
index 0000000..a49cc3e
--- /dev/null
+++ b/package/multimedia/audiofile/audiofile.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# audiofile
+#
+#############################################################
+
+AUDIOFILE_VERSION = 0.3.3
+AUDIOFILE_SITE = http://audiofile.68k.org
+AUDIOFILE_INSTALL_STAGING = YES
+AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+
+# Useless and needs alsa-lib
+define AUDIOFILE_DISABLE_EXAMPLES
+	$(SED) 's/examples//' $(@D)/Makefile.in
+endef
+
+AUDIOFILE_POST_PATCH_HOOKS += AUDIOFILE_DISABLE_EXAMPLES
+
+$(eval $(call AUTOTARGETS))
