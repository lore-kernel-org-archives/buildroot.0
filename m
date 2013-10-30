From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:59:30 +0100
Subject: [Buildroot] [git commit] ebtables: build fix for 64-bit kernel with
	32-bit userland
Message-ID: <20131104211054.921ED9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e06fac395b2adc5b3062e92fd29b1902dacc200c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #6602.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ebtables/ebtables.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index edb5d42..612cf83 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -10,10 +10,11 @@ EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtab
 EBTABLES_LICENSE = GPLv2+
 EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_STATIC = $(if $(BR2_PREFER_STATIC_LIB),static)
+EBTABLES_K64U32 = $(if $(BR2_KERNEL_64_USERLAND_32),CFLAGS+="-DKERNEL_64_USERSPACE_32")
 
 define EBTABLES_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBDIR=/lib/ebtables $(EBTABLES_STATIC) \
-		-C $(@D)
+		$(EBTABLES_K64U32) -C $(@D)
 endef
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
