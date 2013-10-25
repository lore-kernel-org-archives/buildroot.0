From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 10:10:23 -0300
Subject: [Buildroot] [PATCH 2/2] ebtables: build fix for 64-bit kernel with
	32-bit userland
In-Reply-To: <1382706623-5593-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382706623-5593-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1382706623-5593-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #6602.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ebtables/ebtables.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.8.1.5
