From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:09:58 +0200
Subject: [Buildroot] [git commit] package/libcec: fix missing libraries from
	rpi-userland
Message-ID: <20140608131255.21EB29CE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a19bb4b873a9592b3cc16ad992e473f7d56a0b35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When rpi-userland libraries are built as shared-objects, not all needed
libraries are passed in the LD_FLAGS, leading to failure at linkage.

To avoid this issue, set the LIBS variable content in accordance with
INCLUDES variable value.

This is needed because libcec does not use pkg-config to look for the
ldflags needed for -lbcm_host, even though bcm_host provides a .pc
file (even a correct one!)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcec/libcec.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 0aabb06..ad919fc 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -26,6 +26,7 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBCEC_CONF_OPT = --enable-rpi \
    --with-rpi-include-path=$(STAGING_DIR)/usr/include
 LIBCEC_DEPENDENCIES += rpi-userland
+LIBCEC_CONF_ENV += LIBS="-lvcos -lvchostif"
 else
 LIBCEC_CONF_OPT = --disable-rpi
 endif
