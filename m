From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 00:08:55 +0200
Subject: [Buildroot] [git commit] openldap: correct openssl handling
Message-ID: <20171021220649.3BEB580FF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa3ddf7f10c42ff49db0978c7b4419700e860937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ffc/ffc9c10c55c2838ab7002c5ec35244e9bfe46189/

Commit dfa1817d31a (openldap: supports only the real OpenSSL, not LibreSSL)
tried to ensure openldap would only use openssl, but changed the wrong
variable. OPENLDAP_TLS is passed to configure, so it shouldn't be changed:

./configure --target=aarch64-buildroot-linux-gnu .. --with-tls=libopenssl ..
Configuring OpenLDAP 2.4.45-Release ...
checking build system type... x86_64-pc-linux-gnu
checking host system type... aarch64-buildroot-linux-gnu
checking target system type... aarch64-buildroot-linux-gnu
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for aarch64-buildroot-linux-gnu-strip... /usr/lfs/v0/rc-buildroot-test/scripts/instance-0/output/host/bin/aarch64-linux-gnu-strip
checking configure arguments... configure: error: bad value libopenssl for --with-tls

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openldap/openldap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 56066f9..2bf6fc3 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -13,8 +13,8 @@ OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-OPENLDAP_TLS = libopenssl
-OPENLDAP_DEPENDENCIES += openssl
+OPENLDAP_TLS = openssl
+OPENLDAP_DEPENDENCIES += libopenssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 OPENLDAP_TLS = gnutls
 OPENLDAP_DEPENDENCIES += gnutls
