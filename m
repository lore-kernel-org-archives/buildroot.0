From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 13:22:46 +0200
Subject: [Buildroot] [git commit] bandwidthd: Version bump to handle
	indirect deps properly
Message-ID: <20141019112323.8F848AF2B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa500a49526a0d7e78fa8331b8bfaa4bac68e707
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Romain Naour, Baruch Siach and Thomas Petazzoni, I've
solved the build issues in certain cases for bandwidthd.

The issue was that libpcap and libpng would depend on other libraries
and upon testing for pcap/libpng the tests would fail due to not
being able to find the other libraries.

Bandwidthd's configure script now uses pkg-config for libpng
and pcap-config for libpcap. pcap-config's path is specified
in configure's arguments.

Some other tweaks have been made including the layout and flow
of configure.ac is a bit more logical, and the handling of postgres
and sqlite has been tweaked. Finally, the test for X.Org has been
removed.

[Thomas: re-add Nathaniel SoB line, which was misplaced in the commit
log, and therefore dropped when applying the patch.]

Fixes: http://autobuild.buildroot.org/results/eb4/eb48acec37a7fd1714b267b105816bf0053d40e9/build-end.log
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bandwidthd/bandwidthd.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index 7a2975f..ca991f9 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-BANDWIDTHD_VERSION = v2.0.1-auto-r08
+BANDWIDTHD_VERSION = v2.0.1-auto-r11
 BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
 
 # Specified as "any version of the GPL that is current as of your
 # download" by upstream.
 BANDWIDTHD_LICENSE = GPL
 
-BANDWIDTHD_DEPENDENCIES = gd libpng libpcap
+BANDWIDTHD_DEPENDENCIES = gd libpng libpcap host-pkgconf
 
 BANDWIDTHD_AUTORECONF = YES
 
-BANDWIDTHD_CONF_OPTS += --without-x
+BANDWIDTHD_CONF_OPTS += --with-pcap-config=$(STAGING_DIR)/usr/bin/pcap-config
 
 ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
 BANDWIDTHD_DEPENDENCIES += postgresql
