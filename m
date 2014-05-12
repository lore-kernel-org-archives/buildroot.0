From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:49:16 +0200
Subject: [Buildroot] [git commit] ebtables: fix passing CFLAGS to configure
Message-ID: <20140512205829.7BC429CBAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10fa142d1ec3f0a6163fb1903003d5fb78f843f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

EBTABLES_K64U32 is a string passed directly to the configure script,
'+=' operator doesn't have any special meaningi inside it, so
CFLAGS+=-DKERNEL_64_USERSPACE_32 is passed to shell, overwriting previous
CFLAGS value.

Replace CFLAGS+="-DKERNEL_64_USERSPACE_32" with -DKERNEL_64_USERSPACE_32
and pass CFLAGS="$(TARGET_CFLAGS) $(EBTABLES_K64U32)".

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ebtables/ebtables.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 66a47a2..578c3ae 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -10,11 +10,11 @@ EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtab
 EBTABLES_LICENSE = GPLv2+
 EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_STATIC = $(if $(BR2_PREFER_STATIC_LIB),static)
-EBTABLES_K64U32 = $(if $(BR2_KERNEL_64_USERLAND_32),CFLAGS+="-DKERNEL_64_USERSPACE_32")
+EBTABLES_K64U32 = $(if $(BR2_KERNEL_64_USERLAND_32),-DKERNEL_64_USERSPACE_32)
 
 define EBTABLES_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBDIR=/lib/ebtables $(EBTABLES_STATIC) \
-		$(EBTABLES_K64U32) -C $(@D)
+		CFLAGS="$(TARGET_CFLAGS) $(EBTABLES_K64U32)" -C $(@D)
 endef
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
