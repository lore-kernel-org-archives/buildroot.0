From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jul 2014 21:58:05 +0200
Subject: [Buildroot] [PATCH 4 of 6 v2] uclibc: only add targets if uclibc is
	enabled
In-Reply-To: <patchbomb.1406750281@localhost>
References: <patchbomb.1406750281@localhost>
Message-ID: <540167f28c2d41530ceb.1406750285@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In analogy of linux.mk, only enable its targets (in particular the kconfig
targets (menuconfig, update-config, ...) when the uclibc package is actually
enabled.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: rebase after making kconfig-package a full infra

Note: now that kconfig-package is a full package infra (inheriting from
generic-package) this may seem a bit odd, as other packages do not do this.
Nevertheless, it does not hurt and will slightly improve the parsing of the
Makefiles when the package is not selected.

 package/uclibc/uclibc.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff -r 083076145a2b -r 540167f28c2d package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Tue Jul 22 20:35:36 2014 +0200
+++ b/package/uclibc/uclibc.mk	Wed Jul 23 20:12:32 2014 +0200
@@ -539,7 +539,9 @@
 	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC),y)
 $(eval $(kconfig-package))
+endif
 
 # Before uClibc is built, we must have the second stage cross-compiler
 $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
