From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:50:32 +0100
Subject: [Buildroot] [git commit] daq: libdnet is optional not mandatory
Message-ID: <20180107145323.9C64383B3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fadd4a9f1c0b86a0c1a0bcbe70bed1b781a2af50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdnet is an optional dependency, it is only needed if nfq or ipq
module are enabled.

So, if libdnet and libnetfilter_queue are available, enable nfq module
and add a dependency to both packages otherwise disable nfq module.

Moreover, always disable ipq module as libipq is deprecated, it isn't
enable in iptables. Even if it was enabled, libipq.h can't be included
as it makes a reference to linux/netfilter_ipv4/ip_queue.h which is not
available anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/daq/Config.in |  1 -
 package/daq/daq.mk    | 11 ++++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/daq/Config.in b/package/daq/Config.in
index 1d24c6d..ad294ab 100644
--- a/package/daq/Config.in
+++ b/package/daq/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_DAQ
 	bool "daq"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_LIBDNET
 	help
 	  DAQ is a Data Acquisition library for packet I/O from the
 	  Snort project.
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index 4499fb4..33c8a1f 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -10,12 +10,21 @@ DAQ_SOURCE = daq-$(DAQ_VERSION).tar.gz
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
-DAQ_DEPENDENCIES = libdnet
 
 # package does not build in parallel due to improper make rules
 # related to the generation of the tokdefs.h header file
 DAQ_MAKE = $(MAKE1)
 
+# disable ipq module as libipq is deprecated
+DAQ_CONF_OPTS += --disable-ipq-module
+
+ifeq ($(BR2_PACKAGE_LIBDNET)$(BR2_PACKAGE_LIBNETFILTER_QUEUE),yy)
+DAQ_DEPENDENCIES += libdnet libnetfilter_queue
+DAQ_CONF_OPTS += --enable-nfq-module
+else
+DAQ_CONF_OPTS += --disable-nfq-module
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 DAQ_DEPENDENCIES += libpcap
 # assume these flags are available to prevent configure from running
