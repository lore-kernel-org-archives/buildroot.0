From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 09:41:05 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/binutils: install
 libopcodes to target/
Message-ID: <20200522073222.8F1BE91C25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d2a3c95ddab512dd9a7f0bac1120f20a9da156b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

libopcodes was installed in staging/ in commit 6a508d93610 (binutils:
Also install libopcodes in staging), but was not installed in target/

Starting with linux-5.6, perf (linux-tools) will link to libopcodes when
it is present. Since it is available in staging, the build succeeds.
However, libopcodes missing in target, perf fails at runtime:

    perf: ...libopcodes-2.33.1.so: cannot open shared object file

Install libopcodes to target as well.

Signed-off-by: Lecopzer Chen <lecopzer@gmail.com>
[yann.morin.1998 at free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit afceb76e43c3d573ebbaceda791ce970d536bebf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 876c9c59f8..81308e2e81 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -112,6 +112,7 @@ endef
 ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 endif
