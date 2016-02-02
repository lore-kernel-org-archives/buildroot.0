From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Feb 2016 16:31:22 +0100
Subject: [Buildroot] [PATCH v3 04/18] json-c: needs
	__sync_val_compare_and_swap_4
In-Reply-To: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1454427096-20967-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While json-c itself builds fine on platforms that don't provide the
__sync atomic built-ins, it does use them. json-c doesn't fail to
build because only a library is built, so such function calls are left
unresolved. But as soon as it gets used in another package linked in a
program, linking will fail due to the missing
__sync_val_compare_and_swap_4() function.

To fix this, we make json-c depend on BR2_TOOLCHAIN_HAS_SYNC_4, and
propagate to the reverse dependencies:

 - json-c
   - fastd
   - pulseaudio
     - efl
     - espeak
     - gst-plugins-good
     - gst1-plugins-good
     - mpd
   - rsyslog
   - ubus

Note that pulseaudio already had a BR2_ARCH_HAS_ATOMICS dependency,
which we are keeping for the moment, and will clean-up in a subsequent
commit.

This commit will also fix packages that could optionally use json-c,
and therefore fixes build failures like:

  http://autobuild.buildroot.org/results/4fe/4feaa9089ee9a183c5086b791bea35c0156945af/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/efl/Config.in                          | 1 +
 package/espeak/Config.in                       | 1 +
 package/fastd/Config.in                        | 1 +
 package/gstreamer/gst-plugins-good/Config.in   | 2 ++
 package/gstreamer1/gst1-plugins-good/Config.in | 2 ++
 package/json-c/Config.in                       | 2 ++
 package/mpd/Config.in                          | 2 ++
 package/pulseaudio/Config.in                   | 2 ++
 package/rsyslog/Config.in                      | 2 ++
 package/ubus/Config.in                         | 2 ++
 10 files changed, 17 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 85e46b1..21cbf5f 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -82,6 +82,7 @@ config BR2_PACKAGE_EFL_LIBSNDFILE
 config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	default y
 	help
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index 94e2816..eebaf6f 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 
 endchoice
diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index f753ce4..55bdbd6 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_FASTD_STATUS_SOCKET
 	bool "status socket support"
 	default y
 	select BR2_PACKAGE_JSON_C
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	help
 	  Enable support for a socket to get fastd's status.
 
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 0544b7c..f169435 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -206,12 +206,14 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_USE_MMU # pulseaudio
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index a8cdde2..6855c4b 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -313,6 +313,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_USE_MMU # pulseaudio
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 	help
@@ -321,6 +322,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
diff --git a/package/json-c/Config.in b/package/json-c/Config.in
index 67348fb..4df44a9 100644
--- a/package/json-c/Config.in
+++ b/package/json-c/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_JSON_C
 	bool "json-c"
+	# uses __sync_val_compare_and_swap_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  JSON-C - A JSON implementation in C
 
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index be0843f..4455795 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -248,11 +248,13 @@ config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
 
 comment "pulseaudio support needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
 
 comment "Miscellaneous plugins"
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 63c8ca4..4583d22 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
@@ -34,4 +35,5 @@ endif
 comment "pulseaudio needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index d66132f..3599207 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_RSYSLOG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # modules
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
@@ -14,4 +15,5 @@ config BR2_PACKAGE_RSYSLOG
 
 comment "rsyslog needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index 8567321..391fc8d 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -1,10 +1,12 @@
 comment "ubus needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
         depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_UBUS
 	bool "ubus"
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_JSON_C
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on !BR2_STATIC_LIBS # libubox
 	help
 	  IPC/RPC bus that allows communication between processes.
-- 
2.6.4
