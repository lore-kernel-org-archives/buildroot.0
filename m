From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 14 Feb 2021 17:54:04 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/dhcp: add host-gawk to
 dependencies and build environment
Message-ID: <20210214145404.2587820-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DHCP package may silently fail to install binaries to the target image.
The problem occurs when buildroot configuration and build host provide
different flavors of awk. For instance, mawk on build host and gawk in
buildroot output/host. In this case isc-dhcp configure script detects
gawk in output/host and generates Makefiles specifying gawk without
absolute path. During Buildroot installation phase, those Makefiles
are used to install dhcp binaries. They attempt to use gawk without
absolute path. However build host does not have gawk.

To resolve the issue add host-gawk to the list of dhcp dependencies
and explicitely specify absolute path to host-gawk.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---

Changes v1 -> v2 (after review and tests by Thomas Petazzoni):
 - suggested change is the same
 - root cause is figured out and commit message updated

The root cause is explained in commit message. Here are the steps
to reproduce the issue.

Buildroot Docker image at support/docker/Dockerfile provides a way to
reproduce the issue. This docker image includes mawk. Each of the
following cases starts from default qemu_x86_defconfig:

1. Keep using uclibc, enable isc-dhcp server and client
Buildroot does not have any awk flavor installed in output/host, so
mawk from build host is used. Build dhcp. The result is ok: both
dhclient and dhcpd are installed on the target.

2. Switch to glibc, enable isc-dhcp server and client
Note that glibc package has host-gawk among its dependencies. So in
this case build host awk (mawk) differs from buildroot host awk (gawk).
Build dhcp. The result is not ok: neither dhclient nor dhcpd are
installed to the target.

Regards,
Sergey

 package/dhcp/dhcp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 988c7792dc..4a9e98485c 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -10,6 +10,7 @@ DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
 DHCP_DEPENDENCIES = bind
+DHCP_DEPENDENCIES = bind host-gawk
 DHCP_CPE_ID_VENDOR = isc
 
 # use libtool-enabled configure.ac
@@ -22,6 +23,8 @@ DHCP_CONF_ENV = \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
 
+DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
+
 DHCP_CONF_OPTS = \
 	--with-libbind=$(STAGING_DIR)/usr \
 	--with-randomdev=/dev/random \
-- 
2.30.1
