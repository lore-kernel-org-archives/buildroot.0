From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:25:58 +0100
Subject: [Buildroot] [git commit] package/gnutls: give library a default
 trust location
Message-ID: <20181203202302.D49378A586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=379306e8f2394d6f75ac138673dbf6be9ae9155a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gnutls is building with no default location to look for CA certs.  Since
there are buildroot packages to provide these, configure it to use them
by default.

Configure gnutls to find them using the bundle file which contains all
certs, rather than looking in the cert directory.  When gnutls is told
to use the directory, it loads *every* file in it.  This means it loads
the bundle with all certs, then loads each cert a second time using the
individual pem files, and then loads them all the third time via the
hash symlinks to the pem files.

When p11-kit is enabled, use its trust module instead of the bundle
file.  p11-kit can be configured to use the bundle (the default), but it
can do other things too, such as integrate with the "trust" command for
adding and removing trust anchors.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/gnutls.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 18af684376..7492254e8c 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -95,4 +95,11 @@ else
 GNUTLS_CONF_OPTS += --without-zlib
 endif
 
+# Provide a default CA cert location
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+GNUTLS_CONF_OPTS += --with-default-trust-store-pkcs11=pkcs11:model=p11-kit-trust
+else ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
+GNUTLS_CONF_OPTS += --with-default-trust-store-file=/etc/ssl/certs/ca-certificates.crt
+endif
+
 $(eval $(autotools-package))
