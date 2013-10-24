From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Fri, 25 Oct 2013 01:42:23 +0200
Subject: [Buildroot] [PATCH 1/1] Added jack2 as a package. Due to alignment
	errors on ARM platform, git sources are used.
Message-ID: <1382658143-3850-1-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/Config.in       |  1 +
 package/jack2/Config.in | 13 +++++++++++++
 package/jack2/jack2.mk  | 31 +++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/jack2/Config.in
 create mode 100644 package/jack2/jack2.mk

diff --git a/package/Config.in b/package/Config.in
index 0e6f86c..a74ba5f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -423,6 +423,7 @@ source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
 source "package/celt051/Config.in"
 source "package/fdk-aac/Config.in"
+source "package/jack2/Config.in"
 source "package/libao/Config.in"
 source "package/libcdaudio/Config.in"
 source "package/libcue/Config.in"
diff --git a/package/jack2/Config.in b/package/jack2/Config.in
new file mode 100644
index 0000000..c82bc15
--- /dev/null
+++ b/package/jack2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_JACK2
+	bool "jack2"
+	select BR2_PACKAGE_LIBSAMPLERATE
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+         JACK Audio Connection Kit (server and example clients)
+         http://jackaudio.org/
+	  
+	 JACK is a low-latency sound server, allowing multiple applications to
+	 connect to one audio device, and to share audio between themselves.
+ 
+  	 This package contains the daemon jackd as well as some example clients.
+
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
new file mode 100644
index 0000000..785df16
--- /dev/null
+++ b/package/jack2/jack2.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# jack2
+#
+################################################################################
+
+JACK2_VERSION = 37976441044d69b91d61d8f6278949a39cf1b7b7
+JACK2_SITE = git://github.com/jackaudio/jack2
+JACK2_LICENSE = LGPLv2.1+
+JACK2_DEPENDENCIES = \
+      libsamplerate \
+      libsndfile
+
+define JACK2_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS)	\
+		./waf configure			\
+		--prefix=/usr			\
+                --alsa				\
+       )
+endef
+
+define JACK2_BUILD_CMDS
+       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
+endef
+
+define JACK2_INSTALL_TARGET_CMDS
+       (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
+endef
+
+$(eval $(generic-package))
-- 
1.8.4.rc3
