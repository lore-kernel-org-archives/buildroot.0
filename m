From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 4 Mar 2014 15:14:34 +0000
Subject: [Buildroot] [PATCH] dnsmasq: fix static linking
Message-ID: <1393946074-32602-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Append -pthread to LIBS to fix a static linking error like this one:

/home/test/test/2/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libdbus-1.a(libdbus_1_la-dbus-sysdeps-pthread.o):
In function `_dbus_platform_cmutex_new':
dbus-sysdeps-pthread.c:(.text+0x30): undefined reference to
`pthread_mutex_init'

Fixes:
   http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/

Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/dnsmasq/dnsmasq.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9bf9b84..a7e6958 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -61,6 +61,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	DNSMASQ_DEPENDENCIES += host-pkgconf dbus
+	DNSMASQ_LIBS += $(if $(BR2_PREFER_STATIC_LIB),-pthread)
 endif
 
 define DNSMASQ_FIX_PKGCONFIG
@@ -85,7 +86,7 @@ define DNSMASQ_BUILD_CMDS
 	$(DNSMASQ_ENABLE_DBUS)
 	$(DNSMASQ_ENABLE_LUA)
 	$(DNSMASQ_ENABLE_CONNTRACK)
-	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPT) all$(DNSMASQ_I18N)
+	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPT) LIBS+="$(DNSMASQ_LIBS)" all$(DNSMASQ_I18N)
 endef
 
 define DNSMASQ_INSTALL_TARGET_CMDS
-- 
1.7.1
