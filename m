From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 31 Aug 2017 11:53:52 -0400
Subject: [Buildroot] [PATCH 2/2] gst1-mm: new package
Message-ID: <20170831155352.4644-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gstreamermm provides C++ bindings for gstreamer.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gstreamer1/Config.in                       |   1 +
 ...ock-auto-generate-some-audioclock-methods.patch |  68 +++++++++++++
 .../gst1-mm/0002-fix-iterator-build.patch          | 108 +++++++++++++++++++++
 .../0003-remove-gstreamer-check-dependency.patch   |  29 ++++++
 package/gstreamer1/gst1-mm/Config.in               |  18 ++++
 package/gstreamer1/gst1-mm/gst1-mm.hash            |   2 +
 package/gstreamer1/gst1-mm/gst1-mm.mk              |  23 +++++
 7 files changed, 249 insertions(+)
 create mode 100644 package/gstreamer1/gst1-mm/0001-gst-audioclock-auto-generate-some-audioclock-methods.patch
 create mode 100644 package/gstreamer1/gst1-mm/0002-fix-iterator-build.patch
 create mode 100644 package/gstreamer1/gst1-mm/0003-remove-gstreamer-check-dependency.patch
 create mode 100644 package/gstreamer1/gst1-mm/Config.in
 create mode 100644 package/gstreamer1/gst1-mm/gst1-mm.hash
 create mode 100644 package/gstreamer1/gst1-mm/gst1-mm.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index aef75b55b..0713946a3 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -8,6 +8,7 @@ source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
+source "package/gstreamer1/gst1-mm/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst1-vaapi/Config.in"
diff --git a/package/gstreamer1/gst1-mm/0001-gst-audioclock-auto-generate-some-audioclock-methods.patch b/package/gstreamer1/gst1-mm/0001-gst-audioclock-auto-generate-some-audioclock-methods.patch
new file mode 100644
index 000000000..c2db2657a
--- /dev/null
+++ b/package/gstreamer1/gst1-mm/0001-gst-audioclock-auto-generate-some-audioclock-methods.patch
@@ -0,0 +1,68 @@
+From 631414d89ba50bb207ce1fb7e0324c0e91cdcf43 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Thu, 31 Aug 2017 11:40:37 -0400
+Subject: [PATCH] Gst::AudioClock: auto generate some audioclock methods
+
+Those methods used to have object of GstClock type  as a
+first argument, so had to be wrapped manually. It has been
+fixed in GStreamer (https://bugzilla.gnome.org/show_bug.cgi?id=756628)
+in version 1.12.0
+https://bugzilla.gnome.org/show_bug.cgi?id=783628
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Upstream commit: https://github.com/GNOME/gstreamermm/commit/167eeba7757027e5faf8cdb59030ca094af04763]
+---
+ gstreamer/gstreamermm/audioclock.cc | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/gstreamer/gstreamermm/audioclock.cc b/gstreamer/gstreamermm/audioclock.cc
+index 0bd4bc4..a2b18c4 100644
+--- a/gstreamer/gstreamermm/audioclock.cc
++++ b/gstreamer/gstreamermm/audioclock.cc
+@@ -74,21 +74,6 @@ AudioClock::AudioClock(const Glib::ustring& name, const SlotGetTime& time_slot)
+   gobj()->user_data = m_slot.get();
+ }
+ 
+-Gst::ClockTime AudioClock::adjust(Gst::ClockTime time)
+-{
+-  return static_cast<Gst::ClockTime>(gst_audio_clock_adjust(GST_CLOCK_CAST(gobj()), static_cast<GstClockTime>(time)));
+-}
+-
+-Gst::ClockTime AudioClock::get_time() const
+-{
+-  return static_cast<Gst::ClockTime>(gst_audio_clock_get_time(GST_CLOCK_CAST(gobj())));
+-}
+-
+-void AudioClock::invalidate()
+-{
+-  gst_audio_clock_invalidate(GST_CLOCK_CAST(gobj()));
+-}
+-
+ } //namespace Gst
+ 
+ namespace
+@@ -211,6 +196,21 @@ void AudioClock::reset(Gst::ClockTime time)
+   gst_audio_clock_reset(gobj(), ((GstClockTime)(time)));
+ }
+ 
++Gst::ClockTime AudioClock::adjust(Gst::ClockTime time)
++{
++  return ((Gst::ClockTime)(gst_audio_clock_adjust(gobj(), ((GstClockTime)(time)))));
++}
++
++Gst::ClockTime AudioClock::get_time() const
++{
++  return ((Gst::ClockTime)(gst_audio_clock_get_time(const_cast<GstAudioClock*>(gobj()))));
++}
++
++void AudioClock::invalidate()
++{
++  gst_audio_clock_invalidate(gobj());
++}
++
+ 
+ } // namespace Gst
+ 
+-- 
+2.13.5
+
diff --git a/package/gstreamer1/gst1-mm/0002-fix-iterator-build.patch b/package/gstreamer1/gst1-mm/0002-fix-iterator-build.patch
new file mode 100644
index 000000000..c45c02fa0
--- /dev/null
+++ b/package/gstreamer1/gst1-mm/0002-fix-iterator-build.patch
@@ -0,0 +1,108 @@
+From e13bb3dbe0288d11edf2633668fbfc11dcd52645 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Thu, 31 Aug 2017 11:41:48 -0400
+Subject: [PATCH] fix iterator build
+
+https://bugzilla.gnome.org/show_bug.cgi?id=783678
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Upstream commit: https://github.com/GNOME/gstreamermm/commit/2a195b23bda7fef980a2dd00aedd9f1decab7a89]
+---
+ gstreamer/gstreamermm/iterator.h | 60 +++++++++++++++++++++-------------------
+ 1 file changed, 31 insertions(+), 29 deletions(-)
+
+diff --git a/gstreamer/gstreamermm/iterator.h b/gstreamer/gstreamermm/iterator.h
+index 1ec7e0c..a197285 100644
+--- a/gstreamer/gstreamermm/iterator.h
++++ b/gstreamer/gstreamermm/iterator.h
+@@ -338,18 +338,25 @@ template<class CppType>
+ IteratorBase<CppType>::IteratorBase()
+ : current(G_VALUE_INIT),
+   current_result(Gst::ITERATOR_OK),
+-  cobject_(0),
++  cobject_(nullptr),
+   take_ownership(true)
+ {
+ }
+ 
+ template<class CppType>
+ IteratorBase<CppType>::IteratorBase(const IteratorBase<CppType>& other)
+-  : current(other.current),
++  : current(G_VALUE_INIT),
+     current_result(other.current_result),
+-    cobject_(const_cast<GstIterator*>(other.cobj())),
+-    take_ownership((other.cobj()) ? false : true)
+-{}
++    take_ownership(other.take_ownership)
++{
++  cobject_ = other.take_ownership ? gst_iterator_copy(other.cobject_) : other.cobject_;
++
++  if (G_IS_VALUE (&other.current))
++  {
++    g_value_init(&current, G_VALUE_TYPE(&other.current));
++    g_value_copy(&other.current, &current);
++  }
++}
+ 
+ template<class CppType>
+ IteratorBase<CppType>::IteratorBase(GstIterator* castitem, bool take_ownership)
+@@ -362,8 +369,25 @@ IteratorBase<CppType>::IteratorBase(GstIterator* castitem, bool take_ownership)
+ template<class CppType>
+ IteratorBase<CppType>& IteratorBase<CppType>::operator=(const IteratorBase<CppType>& other)
+ {
+-  IteratorBase temp(other);
+-  swap(temp);
++  if (cobject_ && take_ownership)
++  {
++    gst_iterator_free(cobject_);
++  }
++
++  if (G_IS_VALUE(&current))
++  {
++    g_value_unset(&current);
++  }
++
++  current_result = other.current_result;
++  cobject_ = other.take_ownership ? gst_iterator_copy(other.cobject_) : other.cobject_;
++
++  if (G_IS_VALUE (&other.current))
++  {
++    g_value_init(&current, G_VALUE_TYPE(&other.current));
++    g_value_copy(&other.current, &current);
++  }
++
+   return *this;
+ }
+ 
+@@ -410,28 +434,6 @@ IteratorBase<CppType>::operator bool() const
+   return (! G_VALUE_HOLDS_OBJECT(&current));
+ }
+ 
+-template<class CppType>
+-void IteratorBase<CppType>::swap(IteratorBase<CppType>& other)
+-{
+-  GstIterator *const temp_obj = cobject_;
+-  cobject_ = other.cobject_;
+-  other.cobject_ = temp_obj;
+-
+-  const bool temp_take_ownership = take_ownership;
+-  take_ownership = other.take_ownership;
+-  other.take_ownership = temp_take_ownership;
+-
+-  GValue temp_current = G_VALUE_INIT;
+-  g_value_init(&temp_current, G_VALUE_TYPE(current));
+-  g_value_copy(&current, &temp_current);
+-  g_value_copy(other.current, &current);
+-  g_value_copy(&temp_current, other.current);
+-
+-  const IteratorResult temp_result = current_result;
+-  current_result = other.current_result;
+-  other.current_result = temp_result;
+-}
+-
+ //virtual
+ template<class CppType>
+ IteratorBase<CppType>::~IteratorBase()
+-- 
+2.13.5
+
diff --git a/package/gstreamer1/gst1-mm/0003-remove-gstreamer-check-dependency.patch b/package/gstreamer1/gst1-mm/0003-remove-gstreamer-check-dependency.patch
new file mode 100644
index 000000000..70a05a6cd
--- /dev/null
+++ b/package/gstreamer1/gst1-mm/0003-remove-gstreamer-check-dependency.patch
@@ -0,0 +1,29 @@
+From f65960a21c76bcd1371a9d0d3b008731d02a0e5d Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Thu, 31 Aug 2017 11:42:40 -0400
+Subject: [PATCH] remove gstreamer-check dependency
+
+gstreamer-check is disabled by default in buildroot and itsn't required to
+build gstreamermm. Remove the requirement from configure.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index de43442..c30bc4c 100755
+--- a/configure
++++ b/configure
+@@ -16685,7 +16685,7 @@ fi
+ # The format below is used so that the requirements appear nicely in the .pc
+ # file.
+ 
+-GSTREAMERMM_MODULES='giomm-2.4 >= 2.47.6 gstreamer-1.0 >= 1.8.0 gstreamer-base-1.0 >= 1.8.0 gstreamer-check-1.0 >= 1.8.0 gstreamer-controller-1.0 >= 1.8.0 gstreamer-net-1.0 >= 1.8.0 gstreamer-allocators-1.0 >= 1.8.0 gstreamer-app-1.0 >= 1.8.0 gstreamer-audio-1.0 >= 1.8.0 gstreamer-fft-1.0 >= 1.8.0 gstreamer-pbutils-1.0 >= 1.8.0 gstreamer-plugins-base-1.0 >= 1.8.0 gstreamer-riff-1.0 >= 1.8.0 gstreamer-rtp-1.0 >= 1.8.0 gstreamer-rtsp-1.0 >= 1.8.0 gstreamer-sdp-1.0 >= 1.8.0 gstreamer-tag-1.0 >= 1.8.0 gstreamer-video-1.0 >= 1.8.0'
++GSTREAMERMM_MODULES='giomm-2.4 >= 2.47.6 gstreamer-1.0 >= 1.8.0 gstreamer-base-1.0 >= 1.8.0 gstreamer-controller-1.0 >= 1.8.0 gstreamer-net-1.0 >= 1.8.0 gstreamer-allocators-1.0 >= 1.8.0 gstreamer-app-1.0 >= 1.8.0 gstreamer-audio-1.0 >= 1.8.0 gstreamer-fft-1.0 >= 1.8.0 gstreamer-pbutils-1.0 >= 1.8.0 gstreamer-plugins-base-1.0 >= 1.8.0 gstreamer-riff-1.0 >= 1.8.0 gstreamer-rtp-1.0 >= 1.8.0 gstreamer-rtsp-1.0 >= 1.8.0 gstreamer-sdp-1.0 >= 1.8.0 gstreamer-tag-1.0 >= 1.8.0 gstreamer-video-1.0 >= 1.8.0'
+ 
+ 
+ 
+-- 
+2.13.5
+
diff --git a/package/gstreamer1/gst1-mm/Config.in b/package/gstreamer1/gst1-mm/Config.in
new file mode 100644
index 000000000..bbddbbd0c
--- /dev/null
+++ b/package/gstreamer1/gst1-mm/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_GST1_MM
+	bool "Gstreamer C++ bindings"
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GLIBMM
+	help
+	  gstreamermm provides C++ bindings for the GStreamer streaming
+	  multimedia library (http://gstreamer.freedesktop.org). With
+	  gstreamermm it is possible to	develop applications that work
+	  with multimedia in C++.
+
+	  gstreamermm is developed over glibmm, libsigc++ and libxml++
+	  and the functionalities they provide. This means that, among
+	  other things, referencing and unreferencing of GObjects is
+	  handled automatically via glibmm's automatic pointer class,
+	  Glib::RefPtr, and libsigc++'s slots are used for callbacks and
+	  signals.
+
+	  https://gstreamer.freedesktop.org/bindings/cplusplus.html
diff --git a/package/gstreamer1/gst1-mm/gst1-mm.hash b/package/gstreamer1/gst1-mm/gst1-mm.hash
new file mode 100644
index 000000000..d10e00215
--- /dev/null
+++ b/package/gstreamer1/gst1-mm/gst1-mm.hash
@@ -0,0 +1,2 @@
+#From http://ftp.gnome.org/pub/gnome/sources/gstreamermm/1.8/gstreamermm-1.8.0.sha256sum
+sha256 3ee3c1457ea2c32c1e17b784faa828f414ba27a9731532bf26d137a2ad999a44 gstreamermm-1.8.0.tar.xz
diff --git a/package/gstreamer1/gst1-mm/gst1-mm.mk b/package/gstreamer1/gst1-mm/gst1-mm.mk
new file mode 100644
index 000000000..d54a4d6b3
--- /dev/null
+++ b/package/gstreamer1/gst1-mm/gst1-mm.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# gst1-mm
+#
+################################################################################
+
+GST1_MM_VERSION_MAJOR = 1.8
+GST1_MM_VERSION = $(GST1_MM_VERSION_MAJOR).0
+GST1_MM_SITE = http://ftp.gnome.org/pub/gnome/sources/gstreamermm/$(GST1_MM_VERSION_MAJOR)
+GST1_MM_SOURCE = gstreamermm-$(GST1_MM_VERSION).tar.xz
+GST1_MM_LICENSE = LGPL-2.1+
+GST1_MM_LICENSE_FILES = COPYING.LIB
+GST1_MM_INSTALL_STAGING = YES
+GST1_MM_DEPENDENCIES += \
+	glibmm \
+	gstreamer1 \
+	gst1-plugins-base
+
+GST1_MM_CONF_OPTS += \
+	--disable-gl \
+	--disable-plugins-bad
+
+$(eval $(autotools-package))
-- 
2.13.5
