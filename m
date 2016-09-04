From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Sep 2016 15:38:59 +0200
Subject: [Buildroot] [git commit] package/cryptodev: properly declare
	providers
Message-ID: <20160904133955.7CF4F82103@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66c767aeed40b631e0e8b9a7a770a24662b3f3ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cryptodev-linux and ocf-linux are providers of the cryptodev virtual
package, so they must declare themselves as such.

We do not have any problem for now, as the only consumer (openssl) of
both cryptodev-linux and ocf-linux did not depend on the virtual package
but on each provider. The other consumer is gnutls, but has only a
dependency on cryptodev-linux.

However, openssl can be turned into a proper consumer of the virtual
package, which would trigger the bug.

For the sake of correctness, make both cryptodev-linux and ocf-linux
declare themselves as providers for the cryptodev virtual package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptodev-linux/cryptodev-linux.mk | 2 ++
 package/ocf-linux/ocf-linux.mk             | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index c3f5355..d23b647 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -10,6 +10,8 @@ CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPLv2+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
 
+CRYPTODEV_LINUX_PROVIDES = cryptodev
+
 define CRYPTODEV_LINUX_MODULE_GEN_VERSION_H
 	$(MAKE) -C $(@D) version.h
 endef
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index 35968d5..01854fa 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -8,6 +8,8 @@ OCF_LINUX_VERSION = 20120127
 OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
 OCF_LINUX_INSTALL_STAGING = YES
 
+OCF_LINUX_PROVIDES = cryptodev
+
 OCF_LINUX_MODULE_SUBDIRS = ocf
 OCF_LINUX_MODULE_MAKE_OPTS = \
 	CONFIG_OCF_OCF=m \
