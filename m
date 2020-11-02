From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon,  2 Nov 2020 15:22:41 +0100
Subject: [Buildroot] [PATCH] package/gr-osmosdr: bump to version 0.2.2
Message-ID: <20201102142241.1756801-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Drop patch now applied.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 .../0001-fix-build-with-boost-1.7.3.patch     | 86 -------------------
 package/gr-osmosdr/gr-osmosdr.hash            |  4 +-
 package/gr-osmosdr/gr-osmosdr.mk              |  2 +-
 3 files changed, 3 insertions(+), 89 deletions(-)
 delete mode 100644 package/gr-osmosdr/0001-fix-build-with-boost-1.7.3.patch

diff --git a/package/gr-osmosdr/0001-fix-build-with-boost-1.7.3.patch b/package/gr-osmosdr/0001-fix-build-with-boost-1.7.3.patch
deleted file mode 100644
index fb10914531..0000000000
--- a/package/gr-osmosdr/0001-fix-build-with-boost-1.7.3.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 9d5a21f2900e3ffb07c1f163b6ba4e036f6c16a8 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Thu, 25 Jun 2020 16:46:34 +0200
-Subject: [PATCH] gr-osmosdr: fix build with boost > 1.73.0
-
-boost/detail/endian.hpp has been marked as deprecated since boost 1.69.0.
-This file and boost/predef/detail/endian_compat.h are no more available.
-
-This patch suppress this header in some file, where not needed and move
-to correct header and new constants. It's retrocompatible for at least all boost release > 1.69.0
-
-[Upstream status: http://lists.osmocom.org/pipermail/osmocom-sdr/2020-June/002080.html]
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- lib/airspy/airspy_source_c.cc     | 1 -
- lib/airspyhf/airspyhf_source_c.cc | 1 -
- lib/hackrf/hackrf_source_c.cc     | 6 +++---
- lib/rtl/rtl_source_c.cc           | 1 -
- 4 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/lib/airspy/airspy_source_c.cc b/lib/airspy/airspy_source_c.cc
-index 50150e5..f833588 100644
---- a/lib/airspy/airspy_source_c.cc
-+++ b/lib/airspy/airspy_source_c.cc
-@@ -33,7 +33,6 @@
- 
- #include <boost/assign.hpp>
- #include <boost/format.hpp>
--#include <boost/detail/endian.hpp>
- #include <boost/algorithm/string.hpp>
- #include <boost/thread/thread.hpp>
- 
-diff --git a/lib/airspyhf/airspyhf_source_c.cc b/lib/airspyhf/airspyhf_source_c.cc
-index 327fe19..b7494a8 100644
---- a/lib/airspyhf/airspyhf_source_c.cc
-+++ b/lib/airspyhf/airspyhf_source_c.cc
-@@ -33,7 +33,6 @@
- 
- #include <boost/assign.hpp>
- #include <boost/format.hpp>
--#include <boost/detail/endian.hpp>
- #include <boost/algorithm/string.hpp>
- #include <boost/thread/thread.hpp>
- 
-diff --git a/lib/hackrf/hackrf_source_c.cc b/lib/hackrf/hackrf_source_c.cc
-index eea5caa..fc48171 100644
---- a/lib/hackrf/hackrf_source_c.cc
-+++ b/lib/hackrf/hackrf_source_c.cc
-@@ -31,7 +31,7 @@
- #include <stdexcept>
- #include <iostream>
- 
--#include <boost/detail/endian.hpp>
-+#include <boost/predef/other/endian.h>
- 
- #include <gnuradio/io_signature.h>
- 
-@@ -90,10 +90,10 @@ hackrf_source_c::hackrf_source_c (const std::string &args)
- 
-   // create a lookup table for gr_complex values
-   for (unsigned int i = 0; i <= 0xffff; i++) {
--#ifdef BOOST_LITTLE_ENDIAN
-+#ifdef BOOST_ENDIAN_LITTLE_BYTE
-     _lut.push_back( gr_complex( (float(int8_t(i & 0xff))) * (1.0f/128.0f),
-                                 (float(int8_t(i >> 8))) * (1.0f/128.0f) ) );
--#else // BOOST_BIG_ENDIAN
-+#else // BOOST_ENDIAN_BIG_BYTE
-     _lut.push_back( gr_complex( (float(int8_t(i >> 8))) * (1.0f/128.0f),
-                                 (float(int8_t(i & 0xff))) * (1.0f/128.0f) ) );
- #endif
-diff --git a/lib/rtl/rtl_source_c.cc b/lib/rtl/rtl_source_c.cc
-index a371464..7f2e648 100644
---- a/lib/rtl/rtl_source_c.cc
-+++ b/lib/rtl/rtl_source_c.cc
-@@ -32,7 +32,6 @@
- 
- #include <boost/assign.hpp>
- #include <boost/format.hpp>
--#include <boost/detail/endian.hpp>
- #include <boost/algorithm/string.hpp>
- 
- #include <stdexcept>
--- 
-2.27.0
-
diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index 64959c8e74..2acd85f32b 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 9812429d97bc54f0a8917b880ca9e7e2421c66aeaac8ce5608161a8ae7007122 gr-osmosdr-0.2.0.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256  5a7ce7afee38a56191b5d16cb4a91c92476729ff16ed09cbba5a3851ac619713 gr-osmosdr-0.2.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index c5d6ddc2e2..919b43961a 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = 0.2.0
+GR_OSMOSDR_VERSION = 0.2.2
 GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,v$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPL-3.0+
 GR_OSMOSDR_LICENSE_FILES = COPYING
-- 
2.20.1
