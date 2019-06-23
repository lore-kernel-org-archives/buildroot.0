From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 18:04:14 +0200
Subject: [Buildroot] [git commit] package/rauc: allow use of host-libp11 for
 crypto hardware support in host-rauc
Message-ID: <20190623160320.0EF077FC35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d95b3210cac9264e3368d559c7c33cb7c7efe03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To use a private key stored on a hardware crypto module, such as an HSM
or smart card, rauc needs OpenSSL to have support for pkcs11 modules.
OpenSSL achieves this through the libp11 library.

The libp11 engine for OpenSSL is a dynamic module, so the dependency is
at rauc's runtime, rather than openssl's or rauc's build time.  However,
it still needs to be added as a dependency, so that anything that uses
host-rauc when building can be assured that host-rauc is fully
functional.

As this is a runtime dependency, there's no need for a target
dependency.  And it's only used for signing updates, which isn't done on
the target anyway.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 47ce242ca1..88a1006bc0 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -30,7 +30,12 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_DEPENDENCIES += systemd
 endif
 
-HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs
+HOST_RAUC_DEPENDENCIES = \
+	host-pkgconf \
+	host-openssl \
+	host-libglib2 \
+	host-squashfs \
+	$(if $(BR2_PACKAGE_HOST_LIBP11),host-libp11)
 HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
 
 $(eval $(autotools-package))
