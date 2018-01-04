From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Jan 2018 19:36:59 +0100
Subject: [Buildroot] [PATCH 1/1] daq: libpcap is optional not mandatory
Message-ID: <20180104183659.4169-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

daq can be compiled without libpcap thanks to --enable-pcap-module and
 --disable-pcap-module options.
libpcap is just a mandadory dependency of snort.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/daq/Config.in |  1 -
 package/daq/daq.mk    | 10 +++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/daq/Config.in b/package/daq/Config.in
index 7800061642..1d24c6d11a 100644
--- a/package/daq/Config.in
+++ b/package/daq/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_DAQ
 	bool "daq"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBDNET
 	help
 	  DAQ is a Data Acquisition library for packet I/O from the
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index c4b4c881f1..a3bf3ac2d6 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -10,16 +10,24 @@ DAQ_SOURCE = daq-$(DAQ_VERSION).tar.gz
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
-DAQ_DEPENDENCIES = libpcap libdnet
+DAQ_DEPENDENCIES = libdnet
 
 # package does not build in parallel due to improper make rules
 # related to the generation of the tokdefs.h header file
 DAQ_MAKE = $(MAKE1)
 
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+DAQ_DEPENDENCIES += libpcap
+
 # assume these flags are available to prevent configure from running
 # test programs while cross compiling
 DAQ_CONF_ENV = \
 	ac_cv_lib_pcap_pcap_lib_version=yes \
 	daq_cv_libpcap_version_1x=yes
 
+DAQ_CONF_OPTS += --enable-pcap-module
+else
+DAQ_CONF_OPTS += --disable-pcap-module
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
