From: Trent Piepho <tpiepho@impinj.com>
Date: Sat, 23 Feb 2019 02:23:51 +0000
Subject: [Buildroot] [PATCH] host-rauc: Allow use of host-libp11 for crypto
 hardware support
Message-ID: <20190223022338.5210-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
To work, this requires the patch to add libp11, 
https://patchwork.ozlabs.org/patch/1009607/

 package/rauc/rauc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 3848a010b3..92a5717544 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -30,6 +30,7 @@ RAUC_DEPENDENCIES += systemd
 endif
 
 HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs
+HOST_RAUC_DEPENDENCIES += $(if $(BR2_PACKAGE_HOST_LIBP11),host-libp11)
 HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
 
 $(eval $(autotools-package))
-- 
2.14.4
