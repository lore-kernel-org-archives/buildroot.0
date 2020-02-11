From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:28:26 +0100
Subject: [Buildroot] [git commit] package/gqrx: bump to version 2.12.1
Message-ID: <20200211223133.9E2788DB62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f76fe70434361dc175238c64ed8da631aa47d3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop all patches (already in version)
- Update indentation in hash file (two spaces)
- This bump also fix a build failure with BR2_ENABLE_DEBUG thanks to
  https://github.com/csete/gqrx/commit/d5f8e008253d63b71f5b2cf41651214f9a78e83c

Fixes:
 - http://autobuild.buildroot.org/results/17e564fc6465e6e83742c421f2a48b8a0a4923bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gqrx/0001-add_includes_for_GR38.patch      | 195 ---------------------
 .../0002-build_with_cmake_for_both_versions.patch  |  60 -------
 .../0003-pass_GNU_Radio_version_as_macro.patch     | 162 -----------------
 .../gqrx/0004-link_against_gr-audio_library.patch  |  22 ---
 .../0005-support_37_and_38_builds_with_qmake.patch |  54 ------
 ...pport_shells_without_here-string_operator.patch |  27 ---
 package/gqrx/gqrx.hash                             |   6 +-
 package/gqrx/gqrx.mk                               |   2 +-
 8 files changed, 4 insertions(+), 524 deletions(-)

diff --git a/package/gqrx/0001-add_includes_for_GR38.patch b/package/gqrx/0001-add_includes_for_GR38.patch
deleted file mode 100644
index a7e1d682d1..0000000000
--- a/package/gqrx/0001-add_includes_for_GR38.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-From 5d3a1947447c873b04720668a874b1895975fdef Mon Sep 17 00:00:00 2001
-From: Alexander Fasching <fasching.a91@gmail.com>
-Date: Mon, 7 Oct 2019 00:31:31 +0200
-Subject: [PATCH] Add includes for GR 3.8
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- src/applications/gqrx/receiver.cpp |  3 +++
- src/applications/gqrx/receiver.h   |  9 ++++++++-
- src/dsp/correct_iq_cc.h            |  5 +++++
- src/dsp/filter/fir_decim.cpp       |  3 +++
- src/dsp/filter/fir_decim.h         |  5 +++++
- src/dsp/lpf.h                      |  5 +++++
- src/dsp/rx_filter.h                |  6 ++++++
- src/dsp/rx_rds.h                   |  7 +++++++
- src/dsp/stereo_demod.h             | 13 +++++++++++--
- 9 files changed, 53 insertions(+), 3 deletions(-)
-
-diff --git a/src/applications/gqrx/receiver.cpp b/src/applications/gqrx/receiver.cpp
-index 361be52c..a62fb080 100644
---- a/src/applications/gqrx/receiver.cpp
-+++ b/src/applications/gqrx/receiver.cpp
-@@ -28,7 +28,10 @@
- 
- #include <iostream>
- 
-+#ifdef GNURADIO_37
- #include <gnuradio/blocks/multiply_const_ff.h>
-+#endif
-+
- #include <gnuradio/prefs.h>
- #include <gnuradio/top_block.h>
- #include <osmosdr/source.h>
-diff --git a/src/applications/gqrx/receiver.h b/src/applications/gqrx/receiver.h
-index f86d741d..1109240d 100644
---- a/src/applications/gqrx/receiver.h
-+++ b/src/applications/gqrx/receiver.h
-@@ -23,10 +23,17 @@
- #ifndef RECEIVER_H
- #define RECEIVER_H
- 
-+#ifdef GNURADIO_37
- #include <gnuradio/analog/sig_source_c.h>
--#include <gnuradio/blocks/file_sink.h>
- #include <gnuradio/blocks/multiply_const_ff.h>
- #include <gnuradio/blocks/multiply_cc.h>
-+#else
-+#include <gnuradio/analog/sig_source.h>
-+#include <gnuradio/blocks/multiply_const.h>
-+#include <gnuradio/blocks/multiply.h>
-+#endif
-+
-+#include <gnuradio/blocks/file_sink.h>
- #include <gnuradio/blocks/null_sink.h>
- #include <gnuradio/blocks/wavfile_sink.h>
- #include <gnuradio/blocks/wavfile_source.h>
-diff --git a/src/dsp/correct_iq_cc.h b/src/dsp/correct_iq_cc.h
-index cb033782..410af766 100644
---- a/src/dsp/correct_iq_cc.h
-+++ b/src/dsp/correct_iq_cc.h
-@@ -28,7 +28,12 @@
- #include <gnuradio/blocks/float_to_complex.h>
- #include <gnuradio/hier_block2.h>
- #include <gnuradio/filter/single_pole_iir_filter_cc.h>
-+
-+#ifdef GNURADIO_37
- #include <gnuradio/blocks/sub_cc.h>
-+#else
-+#include <gnuradio/blocks/sub.h>
-+#endif
- 
- class dc_corr_cc;
- class iq_swap_cc;
-diff --git a/src/dsp/filter/fir_decim.cpp b/src/dsp/filter/fir_decim.cpp
-index af2ebda7..7c7fc32f 100644
---- a/src/dsp/filter/fir_decim.cpp
-+++ b/src/dsp/filter/fir_decim.cpp
-@@ -24,7 +24,10 @@
- #include <cstdio>
- #include <vector>
- 
-+#ifdef GNURADIO_37
- #include <gnuradio/filter/fir_filter_ccf.h>
-+#endif
-+
- #include <gnuradio/hier_block2.h>
- #include <gnuradio/io_signature.h>
- 
-diff --git a/src/dsp/filter/fir_decim.h b/src/dsp/filter/fir_decim.h
-index 9c026f48..ed40b021 100644
---- a/src/dsp/filter/fir_decim.h
-+++ b/src/dsp/filter/fir_decim.h
-@@ -22,7 +22,12 @@
-  */
- #pragma once
- 
-+#ifdef GNURADIO_37
- #include <gnuradio/filter/fir_filter_ccf.h>
-+#else
-+#include <gnuradio/filter/fir_filter_blk.h>
-+#endif
-+
- #include <gnuradio/hier_block2.h>
- 
- class fir_decim_cc;
-diff --git a/src/dsp/lpf.h b/src/dsp/lpf.h
-index 049b3a9c..953716a3 100644
---- a/src/dsp/lpf.h
-+++ b/src/dsp/lpf.h
-@@ -25,7 +25,12 @@
- 
- #include <gnuradio/hier_block2.h>
- #include <gnuradio/filter/firdes.h>
-+
-+#ifdef GNURADIO_37
- #include <gnuradio/filter/fir_filter_fff.h>
-+#else
-+#include <gnuradio/filter/fir_filter_blk.h>
-+#endif
- 
- 
- class lpf_ff;
-diff --git a/src/dsp/rx_filter.h b/src/dsp/rx_filter.h
-index 8723be32..82c32a1e 100644
---- a/src/dsp/rx_filter.h
-+++ b/src/dsp/rx_filter.h
-@@ -24,8 +24,14 @@
- #define RX_FILTER_H
- 
- #include <gnuradio/hier_block2.h>
-+
-+#ifdef GNURADIO_37
- #include <gnuradio/filter/fir_filter_ccc.h>
- #include <gnuradio/filter/freq_xlating_fir_filter_ccc.h>
-+#else
-+#include <gnuradio/filter/fir_filter_blk.h>
-+#include <gnuradio/filter/freq_xlating_fir_filter.h>
-+#endif
- 
- 
- #define RX_FILTER_MIN_WIDTH 100  /*! Minimum width of filter */
-diff --git a/src/dsp/rx_rds.h b/src/dsp/rx_rds.h
-index 17e406ae..f975ec11 100644
---- a/src/dsp/rx_rds.h
-+++ b/src/dsp/rx_rds.h
-@@ -24,11 +24,18 @@
- #define RX_RDS_H
- 
- #include <gnuradio/hier_block2.h>
-+
-+#ifdef GNURADIO_37
- #include <gnuradio/filter/fir_filter_ccc.h>
- #include <gnuradio/filter/fir_filter_ccf.h>
- #include <gnuradio/filter/fir_filter_fff.h>
- #include <gnuradio/filter/freq_xlating_fir_filter_fcf.h>
- #include <gnuradio/filter/freq_xlating_fir_filter_ccf.h>
-+#else
-+#include <gnuradio/filter/fir_filter_blk.h>
-+#include <gnuradio/filter/freq_xlating_fir_filter.h>
-+#endif
-+
- #include <gnuradio/digital/constellation_receiver_cb.h>
- #include <gnuradio/blocks/keep_one_in_n.h>
- #include <gnuradio/digital/diff_decoder_bb.h>
-diff --git a/src/dsp/stereo_demod.h b/src/dsp/stereo_demod.h
-index 28be5c0c..35069615 100644
---- a/src/dsp/stereo_demod.h
-+++ b/src/dsp/stereo_demod.h
-@@ -26,14 +26,23 @@
- 
- #include <gnuradio/hier_block2.h>
- #include <gnuradio/filter/firdes.h>
-+
-+#ifdef GNURADIO_37
- #include <gnuradio/filter/fir_filter_fcc.h>
- #include <gnuradio/filter/fir_filter_fff.h>
--#include <gnuradio/analog/pll_refout_cc.h>
- #include <gnuradio/blocks/multiply_cc.h>
- #include <gnuradio/blocks/multiply_ff.h>
- #include <gnuradio/blocks/multiply_const_ff.h>
--#include <gnuradio/blocks/complex_to_imag.h>
- #include <gnuradio/blocks/add_ff.h>
-+#else
-+#include <gnuradio/filter/fir_filter_blk.h>
-+#include <gnuradio/blocks/multiply.h>
-+#include <gnuradio/blocks/multiply_const.h>
-+#include <gnuradio/blocks/add_blk.h>
-+#endif
-+
-+#include <gnuradio/analog/pll_refout_cc.h>
-+#include <gnuradio/blocks/complex_to_imag.h>
- #include <vector>
- #include "dsp/lpf.h"
- #include "dsp/resampler_xx.h"
-
diff --git a/package/gqrx/0002-build_with_cmake_for_both_versions.patch b/package/gqrx/0002-build_with_cmake_for_both_versions.patch
deleted file mode 100644
index 0de342c512..0000000000
--- a/package/gqrx/0002-build_with_cmake_for_both_versions.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From a0fea7550dabcf04d3201f868657d836a0bb5f69 Mon Sep 17 00:00:00 2001
-From: Alexander Fasching <fasching.a91@gmail.com>
-Date: Mon, 7 Oct 2019 01:05:15 +0200
-Subject: [PATCH] Build with cmake for both versions
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- CMakeLists.txt     | 12 ++++++++----
- src/CMakeLists.txt |  9 +++++++++
- 2 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c197f152..4bff6f08 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -99,15 +99,20 @@ endfunction(add_source_files)
- 
- # 3rd Party Dependency Stuff
- find_package(Qt5 COMPONENTS Core Network Widgets Svg REQUIRED)
--find_package(Boost COMPONENTS system program_options REQUIRED)
--set(GR_REQUIRED_COMPONENTS RUNTIME ANALOG AUDIO BLOCKS DIGITAL FILTER FFT PMT)
--find_package(Gnuradio REQUIRED)
- find_package(Gnuradio-osmosdr REQUIRED)
- 
--if(NOT GNURADIO_RUNTIME_FOUND)
-+set(GR_REQUIRED_COMPONENTS RUNTIME ANALOG AUDIO BLOCKS DIGITAL FILTER FFT PMT)
-+find_package(Gnuradio REQUIRED COMPONENTS analog audio blocks digital filter fft)
-+
-+if(NOT Gnuradio_FOUND)
-     message(FATAL_ERROR "GnuRadio Runtime required to compile gqrx")
- endif()
- 
-+if(Gnuradio_VERSION VERSION_LESS "3.8")
-+    add_definitions(-DGNURADIO_37)
-+    find_package(Boost COMPONENTS system program_options REQUIRED)
-+endif()
-+
- if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
-     if(NOT LINUX_AUDIO_BACKEND)
-         set(LINUX_AUDIO_BACKEND Pulseaudio CACHE STRING "Choose the audio backend, options are: Pulseaudio, Portaudio, Gr-audio" FORCE)
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 2598f223..88c54046 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -70,6 +70,15 @@ target_link_libraries(${PROJECT_NAME}
-     ${PORTAUDIO_LIBRARIES}
- )
- 
-+if(NOT Gnuradio_VERSION VERSION_LESS "3.8")
-+    target_link_libraries(${PROJECT_NAME}
-+        gnuradio::gnuradio-analog
-+        gnuradio::gnuradio-blocks
-+        gnuradio::gnuradio-digital
-+        gnuradio::gnuradio-filter
-+    )
-+endif()
-+
- #build a win32 app, not a console app
- if (WIN32)
-     set(CMAKE_EXE_LINKER_FLAGS "/entry:mainCRTStartup ${CMAKE_EXE_LINKER_FLAGS}")
diff --git a/package/gqrx/0003-pass_GNU_Radio_version_as_macro.patch b/package/gqrx/0003-pass_GNU_Radio_version_as_macro.patch
deleted file mode 100644
index 3beb0d000e..0000000000
--- a/package/gqrx/0003-pass_GNU_Radio_version_as_macro.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 1f1064802791c20585c552796d2b759d41c8f295 Mon Sep 17 00:00:00 2001
-From: Alexander Fasching <fasching.a91@gmail.com>
-Date: Mon, 7 Oct 2019 02:38:49 +0200
-Subject: [PATCH] Pass GNU Radio version as macro
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- CMakeLists.txt                     | 14 +++++++++++++-
- src/applications/gqrx/receiver.cpp |  2 +-
- src/applications/gqrx/receiver.h   |  2 +-
- src/dsp/correct_iq_cc.h            |  2 +-
- src/dsp/filter/fir_decim.cpp       |  2 +-
- src/dsp/filter/fir_decim.h         |  2 +-
- src/dsp/lpf.h                      |  2 +-
- src/dsp/rx_filter.h                |  2 +-
- src/dsp/rx_rds.h                   |  2 +-
- src/dsp/stereo_demod.h             |  2 +-
- 10 files changed, 22 insertions(+), 10 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4bff6f08..8b4b8e56 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -108,8 +108,20 @@ if(NOT Gnuradio_FOUND)
-     message(FATAL_ERROR "GnuRadio Runtime required to compile gqrx")
- endif()
- 
-+
-+# Pass the GNU Radio version as 0xMMNNPP BCD.
-+math(EXPR GNURADIO_BCD_VERSION
-+    "(${Gnuradio_VERSION_MAJOR} / 10) << 20 |
-+     (${Gnuradio_VERSION_MAJOR} % 10) << 16 |
-+     (${Gnuradio_VERSION_MINOR} / 10) << 12 |
-+     (${Gnuradio_VERSION_MINOR} % 10) <<  8 |
-+     (${Gnuradio_VERSION_PATCH} / 10) <<  4 |
-+     (${Gnuradio_VERSION_PATCH} % 10) <<  0
-+    "
-+)
-+add_definitions(-DGNURADIO_VERSION=${GNURADIO_BCD_VERSION})
-+
- if(Gnuradio_VERSION VERSION_LESS "3.8")
--    add_definitions(-DGNURADIO_37)
-     find_package(Boost COMPONENTS system program_options REQUIRED)
- endif()
- 
-diff --git a/src/applications/gqrx/receiver.cpp b/src/applications/gqrx/receiver.cpp
-index a62fb080..40e376f6 100644
---- a/src/applications/gqrx/receiver.cpp
-+++ b/src/applications/gqrx/receiver.cpp
-@@ -28,7 +28,7 @@
- 
- #include <iostream>
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/blocks/multiply_const_ff.h>
- #endif
- 
-diff --git a/src/applications/gqrx/receiver.h b/src/applications/gqrx/receiver.h
-index 1109240d..5fcd50a8 100644
---- a/src/applications/gqrx/receiver.h
-+++ b/src/applications/gqrx/receiver.h
-@@ -23,7 +23,7 @@
- #ifndef RECEIVER_H
- #define RECEIVER_H
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/analog/sig_source_c.h>
- #include <gnuradio/blocks/multiply_const_ff.h>
- #include <gnuradio/blocks/multiply_cc.h>
-diff --git a/src/dsp/correct_iq_cc.h b/src/dsp/correct_iq_cc.h
-index 410af766..fcb19829 100644
---- a/src/dsp/correct_iq_cc.h
-+++ b/src/dsp/correct_iq_cc.h
-@@ -29,7 +29,7 @@
- #include <gnuradio/hier_block2.h>
- #include <gnuradio/filter/single_pole_iir_filter_cc.h>
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/blocks/sub_cc.h>
- #else
- #include <gnuradio/blocks/sub.h>
-diff --git a/src/dsp/filter/fir_decim.cpp b/src/dsp/filter/fir_decim.cpp
-index 7c7fc32f..82d852d5 100644
---- a/src/dsp/filter/fir_decim.cpp
-+++ b/src/dsp/filter/fir_decim.cpp
-@@ -24,7 +24,7 @@
- #include <cstdio>
- #include <vector>
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/filter/fir_filter_ccf.h>
- #endif
- 
-diff --git a/src/dsp/filter/fir_decim.h b/src/dsp/filter/fir_decim.h
-index ed40b021..c8edb10b 100644
---- a/src/dsp/filter/fir_decim.h
-+++ b/src/dsp/filter/fir_decim.h
-@@ -22,7 +22,7 @@
-  */
- #pragma once
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/filter/fir_filter_ccf.h>
- #else
- #include <gnuradio/filter/fir_filter_blk.h>
-diff --git a/src/dsp/lpf.h b/src/dsp/lpf.h
-index 953716a3..416e831c 100644
---- a/src/dsp/lpf.h
-+++ b/src/dsp/lpf.h
-@@ -26,7 +26,7 @@
- #include <gnuradio/hier_block2.h>
- #include <gnuradio/filter/firdes.h>
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/filter/fir_filter_fff.h>
- #else
- #include <gnuradio/filter/fir_filter_blk.h>
-diff --git a/src/dsp/rx_filter.h b/src/dsp/rx_filter.h
-index 82c32a1e..0b09a386 100644
---- a/src/dsp/rx_filter.h
-+++ b/src/dsp/rx_filter.h
-@@ -25,7 +25,7 @@
- 
- #include <gnuradio/hier_block2.h>
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/filter/fir_filter_ccc.h>
- #include <gnuradio/filter/freq_xlating_fir_filter_ccc.h>
- #else
-diff --git a/src/dsp/rx_rds.h b/src/dsp/rx_rds.h
-index f975ec11..cce90fb7 100644
---- a/src/dsp/rx_rds.h
-+++ b/src/dsp/rx_rds.h
-@@ -25,7 +25,7 @@
- 
- #include <gnuradio/hier_block2.h>
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/filter/fir_filter_ccc.h>
- #include <gnuradio/filter/fir_filter_ccf.h>
- #include <gnuradio/filter/fir_filter_fff.h>
-diff --git a/src/dsp/stereo_demod.h b/src/dsp/stereo_demod.h
-index 35069615..3ebdca49 100644
---- a/src/dsp/stereo_demod.h
-+++ b/src/dsp/stereo_demod.h
-@@ -27,7 +27,7 @@
- #include <gnuradio/hier_block2.h>
- #include <gnuradio/filter/firdes.h>
- 
--#ifdef GNURADIO_37
-+#if GNURADIO_VERSION < 0x030800
- #include <gnuradio/filter/fir_filter_fcc.h>
- #include <gnuradio/filter/fir_filter_fff.h>
- #include <gnuradio/blocks/multiply_cc.h>
diff --git a/package/gqrx/0004-link_against_gr-audio_library.patch b/package/gqrx/0004-link_against_gr-audio_library.patch
deleted file mode 100644
index 4a15d288c9..0000000000
--- a/package/gqrx/0004-link_against_gr-audio_library.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 89a6ce21aaa2c05e906100d7e5efc70ca41e880b Mon Sep 17 00:00:00 2001
-From: Alexander Fasching <fasching.a91@gmail.com>
-Date: Mon, 28 Oct 2019 09:40:25 +0100
-Subject: [PATCH] Link against gr-audio library
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- src/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 88c54046..7d73f742 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -76,6 +76,7 @@ if(NOT Gnuradio_VERSION VERSION_LESS "3.
-         gnuradio::gnuradio-blocks
-         gnuradio::gnuradio-digital
-         gnuradio::gnuradio-filter
-+        gnuradio::gnuradio-audio
-     )
- endif()
- 
diff --git a/package/gqrx/0005-support_37_and_38_builds_with_qmake.patch b/package/gqrx/0005-support_37_and_38_builds_with_qmake.patch
deleted file mode 100644
index f6a86219bb..0000000000
--- a/package/gqrx/0005-support_37_and_38_builds_with_qmake.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c9e37484f3aaf367136aea33c1729e3b7a739182 Mon Sep 17 00:00:00 2001
-From: Alexander Fasching <fasching.a91@gmail.com>
-Date: Mon, 28 Oct 2019 11:25:37 +0100
-Subject: [PATCH] Support 3.7 and 3.8 builds with qmake
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gqrx.pro | 25 ++++++++++++++++++++++++-
- 1 file changed, 24 insertions(+), 1 deletion(-)
-
-diff --git a/gqrx.pro b/gqrx.pro
-index 87b5bba9..ea187798 100644
---- a/gqrx.pro
-+++ b/gqrx.pro
-@@ -62,7 +62,7 @@ isEmpty(PREFIX) {
- }
- 
- target.path  = $$PREFIX/bin
--INSTALLS    += target 
-+INSTALLS    += target
- 
- #CONFIG += debug
- 
-@@ -263,6 +263,29 @@ PKGCONFIG += gnuradio-analog \
-              gnuradio-runtime \
-              gnuradio-osmosdr
- 
-+# Detect GNU Radio version and link against log4cpp for 3.8
-+GNURADIO_VERSION = $$system(pkg-config --modversion gnuradio-runtime)
-+
-+GNURADIO_VERSION_MAJOR = $$system(cut -d '.' -f1 <<< $$GNURADIO_VERSION)
-+GNURADIO_VERSION_MINOR = $$system(cut -d '.' -f2 <<< $$GNURADIO_VERSION)
-+GNURADIO_VERSION_PATCH = $$system(cut -d '.' -f3 <<< $$GNURADIO_VERSION)
-+
-+GNURADIO_HEX_VERSION = $$system(            \
-+  "echo $((                                 \
-+    ($$GNURADIO_VERSION_MAJOR / 10) << 20 | \
-+    ($$GNURADIO_VERSION_MAJOR % 10) << 16 | \
-+    ($$GNURADIO_VERSION_MINOR / 10) << 12 | \
-+    ($$GNURADIO_VERSION_MINOR % 10) <<  8 | \
-+    ($$GNURADIO_VERSION_PATCH / 10) <<  4 | \
-+    ($$GNURADIO_VERSION_PATCH % 10) <<  0   \
-+  ))"                                       \
-+)
-+DEFINES += GNURADIO_VERSION=$$GNURADIO_HEX_VERSION
-+
-+greaterThan(GNURADIO_VERSION_MINOR, 7) {
-+    PKGCONFIG += log4cpp
-+}
-+
- INCPATH += src/
- 
- unix:!macx {
-
diff --git a/package/gqrx/0006-support_shells_without_here-string_operator.patch b/package/gqrx/0006-support_shells_without_here-string_operator.patch
deleted file mode 100644
index e802f94752..0000000000
--- a/package/gqrx/0006-support_shells_without_here-string_operator.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3203dd9d0e852b1c5c79f410f9de65fb89eef76b Mon Sep 17 00:00:00 2001
-From: Alexander Fasching <fasching.a91@gmail.com>
-Date: Mon, 28 Oct 2019 12:19:22 +0100
-Subject: [PATCH] Support shells without here-string operator
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gqrx.pro | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/gqrx.pro b/gqrx.pro
-index ea187798..f40b98a2 100644
---- a/gqrx.pro
-+++ b/gqrx.pro
-@@ -266,9 +266,9 @@ PKGCONFIG += gnuradio-analog \
- # Detect GNU Radio version and link against log4cpp for 3.8
- GNURADIO_VERSION = $$system(pkg-config --modversion gnuradio-runtime)
- 
--GNURADIO_VERSION_MAJOR = $$system(cut -d '.' -f1 <<< $$GNURADIO_VERSION)
--GNURADIO_VERSION_MINOR = $$system(cut -d '.' -f2 <<< $$GNURADIO_VERSION)
--GNURADIO_VERSION_PATCH = $$system(cut -d '.' -f3 <<< $$GNURADIO_VERSION)
-+GNURADIO_VERSION_MAJOR = $$system(echo $$GNURADIO_VERSION | cut -d '.' -f1 -)
-+GNURADIO_VERSION_MINOR = $$system(echo $$GNURADIO_VERSION | cut -d '.' -f2 -)
-+GNURADIO_VERSION_PATCH = $$system(echo $$GNURADIO_VERSION | cut -d '.' -f3 -)
- 
- GNURADIO_HEX_VERSION = $$system(            \
-   "echo $((                                 \
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 77c34a8811..8f5f2ca433 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256 5a15d8eb863f68a8590d27ebb2f50e735e814b1651de86952a7e425a68476d9d  gqrx-2.11.5.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256 7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
+sha256  7c626db9f22c3edbe30299a08f7f549b4f30dd83c883595468029a27c3e8fda9  gqrx-2.12.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index c217aa7f18..b3438ac1fd 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GQRX_VERSION = 2.11.5
+GQRX_VERSION = 2.12.1
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
