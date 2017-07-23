From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 23 Jul 2017 10:16:02 +0200
Subject: [Buildroot] [PATCH 1/1] s6-networking: enable SSL if libressl is
	selected
Message-ID: <20170723081602.10562-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If LibreSSL is selected, enable the associated backend to build the
s6-tls* tools.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6-networking/s6-networking.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index ffaf8bc..6463f5d 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -23,6 +23,11 @@ S6_NETWORKING_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+S6_NETWORKING_CONF_OPTS += --enable-ssl=libressl
+S6_NETWORKING_DEPENDENCIES = libressl
+endif
+
 define S6_NETWORKING_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_NETWORKING_CONF_OPTS))
 endef
-- 
2.9.4
