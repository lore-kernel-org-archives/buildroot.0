From: Victor Huesca <victor.huesca@bootlin.com>
Date: Wed, 12 Jun 2019 08:42:07 +0200
Subject: [Buildroot] [PATCH 2/4] package: remove 'v' prefix from
 tarball-fetched packages
In-Reply-To: <20190612064209.23619-1-victor.huesca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
Message-ID: <20190612064209.23619-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Github, a large number of projects name their tag vXYZ (i.e v3.0,
v0.1, etc.). In some packages we do:

 <pkg>_VERSION = v0.3
 <pkg>_SITE = https://github.com/foo/bar/archive

And in some other packages we do:

 <pkg>_VERSION = 0.3
 <pkg>_SITE = https://github.com/foo/bar/archive
 <pkg>_SOURCE = v$(FOOBAR_VERSION).tar.gz

I.e in one case we consider the version to be v0.3, in the other case
we consider 0.3 to be the version.

The problem with v0.3 is that when used in conjunction with
release-monitoring.org, it doesn't work very well, because
release-monitoring.org has the concept of "version prefix" and using
that they drop the "v" prefix for the version.

Therefore, a number of packages in Buildroot have a version that
doesn't match with release-monitoring.org because Buildroot has 'v0.3'
and release-monitoring.org has '0.3'.

Since really the version number of 0.3, is makes sense to update our
packages to drop this 'v'.

This commit only addresses the case of tarball packages where
the prefix is simply 'v'. Other cases will be handled by separate
commits.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 package/dt/dt.mk                                            | 4 ++--
 package/flannel/flannel.mk                                  | 6 +++---
 package/fwts/fwts.mk                                        | 3 ++-
 .../gst1-plugins-bayer2rgb-neon.mk                          | 4 ++--
 package/kompexsqlite/kompexsqlite.mk                        | 4 ++--
 package/luvi/luvi.mk                                        | 4 ++--
 package/openpowerlink/openpowerlink.mk                      | 4 ++--
 package/perl-class-std-fast/perl-class-std-fast.mk          | 4 ++--
 package/perl-net-snmp/perl-net-snmp.mk                      | 4 ++--
 package/portaudio/portaudio.mk                              | 4 ++--
 package/pru-software-support/pru-software-support.hash      | 2 +-
 package/pru-software-support/pru-software-support.mk        | 4 ++--
 package/spidev_test/spidev_test.mk                          | 6 +++---
 package/sslh/sslh.mk                                        | 3 ++-
 14 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/package/dt/dt.mk b/package/dt/dt.mk
index 8ec7788883..1963a7ecc5 100644
--- a/package/dt/dt.mk
+++ b/package/dt/dt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DT_VERSION = v18.32
+DT_VERSION = 18.32
 DT_SITE = http://pkgs.fedoraproject.org/repo/pkgs/dt/$(DT_SOURCE)/3054aeaaba047a1dbe90c2132a382ee2
-DT_SOURCE = dt-source-$(DT_VERSION).tar.gz
+DT_SOURCE = dt-source-v$(DT_VERSION).tar.gz
 DT_STRIP_COMPONENTS = 2
 DT_LICENSE = ISC-like
 DT_LICENSE_FILES = LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index d00d2df92c..e944012358 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = v0.5.5
+FLANNEL_VERSION = 0.5.5
 FLANNEL_SITE = https://github.com/coreos/flannel/archive
-FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
+FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
 
-FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
+FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=v$(FLANNEL_VERSION)
 
 # Install flannel to its well known location.
 define FLANNEL_INSTALL_TARGET_CMDS
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index b29de2cf25..b8ab2373a7 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-FWTS_VERSION = V18.09.00
+FWTS_VERSION = 18.09.00
 FWTS_SITE = http://fwts.ubuntu.com/release
+FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_STRIP_COMPONENTS = 0
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
index e430865e31..d6c3c36272 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAYER2RGB_NEON_VERSION = v0.3
-GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
+GST1_PLUGINS_BAYER2RGB_NEON_VERSION = 0.3
+GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-v$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
 GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://git.phytec.de/gst-bayer2rgb-neon/snapshot
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
diff --git a/package/kompexsqlite/kompexsqlite.mk b/package/kompexsqlite/kompexsqlite.mk
index 51b80aa86b..92a4ddc22a 100644
--- a/package/kompexsqlite/kompexsqlite.mk
+++ b/package/kompexsqlite/kompexsqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KOMPEXSQLITE_VERSION = v1.10.12-1
-KOMPEXSQLITE_SOURCE = $(KOMPEXSQLITE_VERSION).tar.gz
+KOMPEXSQLITE_VERSION = 1.10.12-1
+KOMPEXSQLITE_SOURCE = v$(KOMPEXSQLITE_VERSION).tar.gz
 KOMPEXSQLITE_SITE = https://github.com/Aethelflaed/kompex-sqlite-wrapper/archive
 KOMPEXSQLITE_INSTALL_STAGING = YES
 KOMPEXSQLITE_LICENSE = LGPL-3.0+ (wrapper), Public Domain (bundled sqlite)
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index ea296d2d7b..ab20158db4 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.9.3
-LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
+LUVI_VERSION = 2.9.3
+LUVI_SOURCE = luvi-src-v$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index f869780822..be7c492683 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.7.1
+OPENPOWERLINK_VERSION = 2.7.1
 OPENPOWERLINK_SITE = https://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
-OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
+OPENPOWERLINK_SOURCE = openPOWERLINK_V$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
 OPENPOWERLINK_LICENSE_FILES = license.md
 
diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
index 57e57b1954..b5d32398a5 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.mk
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERL_CLASS_STD_FAST_VERSION = v0.0.8
-PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-$(PERL_CLASS_STD_FAST_VERSION).tar.gz
+PERL_CLASS_STD_FAST_VERSION = 0.0.8
+PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-v$(PERL_CLASS_STD_FAST_VERSION).tar.gz
 PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
 PERL_CLASS_STD_FAST_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
diff --git a/package/perl-net-snmp/perl-net-snmp.mk b/package/perl-net-snmp/perl-net-snmp.mk
index ae8607e406..36b50d6358 100644
--- a/package/perl-net-snmp/perl-net-snmp.mk
+++ b/package/perl-net-snmp/perl-net-snmp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERL_NET_SNMP_VERSION = v6.0.1
-PERL_NET_SNMP_SOURCE = Net-SNMP-$(PERL_NET_SNMP_VERSION).tar.gz
+PERL_NET_SNMP_VERSION = 6.0.1
+PERL_NET_SNMP_SOURCE = Net-SNMP-v$(PERL_NET_SNMP_VERSION).tar.gz
 PERL_NET_SNMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DT/DTOWN
 PERL_NET_SNMP_DEPENDENCIES = host-perl-module-build
 PERL_NET_SNMP_LICENSE = Artistic or GPL-1.0+
diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index 0cf754c7d5..167f96ac4c 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PORTAUDIO_VERSION = v190600_20161030
+PORTAUDIO_VERSION = 190600_20161030
 PORTAUDIO_SITE = http://www.portaudio.com/archives
-PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
+PORTAUDIO_SOURCE = pa_stable_v$(PORTAUDIO_VERSION).tgz
 PORTAUDIO_INSTALL_STAGING = YES
 PORTAUDIO_MAKE = $(MAKE1)
 PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)
diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index f4ce8e466e..3a0733f45d 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,2 +1,2 @@
 # Locally-calculated hash
-sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	pru-software-support-v5.1.0.tar.gz
+sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	pru-software-support-5.1.0.tar.gz
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index f30ff6b5e3..cb266b87bb 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
-PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)?
+PRU_SOFTWARE_SUPPORT_VERSION = 5.1.0
+PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)
 PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, GPL-2.0, Public Domain
 PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index bf8170cd2c..80998f3400 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -11,15 +11,15 @@
 # Note that the location of spidev_test.c changes from v4.5 onwards.
 
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
-SPIDEV_TEST_VERSION = v4.10
+SPIDEV_TEST_VERSION = 4.10
 SPIDEV_TEST_PATH = tools/spi
 else
-SPIDEV_TEST_VERSION = v3.0
+SPIDEV_TEST_VERSION = 3.0
 SPIDEV_TEST_PATH = Documentation/spi
 endif
 
 SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/$(SPIDEV_TEST_PATH)
-SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
+SPIDEV_TEST_SOURCE = spidev_test.c?id=v$(SPIDEV_TEST_VERSION)
 SPIDEV_TEST_LICENSE = GPL-2.0
 
 # musl libc requires linux/ioctl.h for _IOC_SIZEBITS. Do a sed patch to keep
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 6e29a99189..85e984628c 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SSLH_VERSION = v1.20
+SSLH_VERSION = 1.20
 SSLH_SITE = http://www.rutschle.net/tech/sslh
+SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
 
-- 
2.21.0
