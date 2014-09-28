From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 12:02:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/leafnode2: New package
In-Reply-To: <1411898532-15625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411898532-15625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1411898532-15625-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |    1 +
 package/leafnode2/Config.in                        |    9 ++++++
 .../leafnode2/leafnode2-0001-cross_makefile.patch  |   15 +++++++++
 package/leafnode2/leafnode2.mk                     |   33 ++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/leafnode2/Config.in
 create mode 100644 package/leafnode2/leafnode2-0001-cross_makefile.patch
 create mode 100644 package/leafnode2/leafnode2.mk

diff --git a/package/Config.in b/package/Config.in
index f609cbe..db06310 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1000,6 +1000,7 @@ endif
 	source "package/iw/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
+	source "package/leafnode2/Config.in"
 	source "package/lftp/Config.in"
 	source "package/lighttpd/Config.in"
 	source "package/linknx/Config.in"
diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
new file mode 100644
index 0000000..a4adc99
--- /dev/null
+++ b/package/leafnode2/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LEAFNODE2
+	bool "leafnode2"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_PCRE
+	help
+	  Leafnode-2 is a store-and-forward NNTP (or Usenet) proxy server designed
+	  for small sites with just a few active newsgroups.
+
+	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/
diff --git a/package/leafnode2/leafnode2-0001-cross_makefile.patch b/package/leafnode2/leafnode2-0001-cross_makefile.patch
new file mode 100644
index 0000000..1dab211
--- /dev/null
+++ b/package/leafnode2/leafnode2-0001-cross_makefile.patch
@@ -0,0 +1,15 @@
+During target package compilation the host version of b_sortnl is needed.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/Makefile.in.orig	2012-11-01 15:23:21.000000000 +0100
++++ b/Makefile.in	2012-11-13 20:54:42.000000000 +0100
+@@ -1834,7 +1834,7 @@
+ 
+ configparam_data.c: $(srcdir)/config.table b_sortnl$(EXEEXT) genconfigparam_data.awk
+ 	rm -f config.table.sorted
+-	./b_sortnl$(EXEEXT) <$(srcdir)/config.table >config.table.sorted
++	./b_sortnl_host$(EXEEXT) <$(srcdir)/config.table >config.table.sorted
+ 	$(AWK) -f $(srcdir)/genconfigparam_data.awk <config.table.sorted >$@ \
+ 	|| { rm -f $@ ; false ; }
+ 
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
new file mode 100644
index 0000000..3089b8d
--- /dev/null
+++ b/package/leafnode2/leafnode2.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# leafnode2
+#
+################################################################################
+
+LEAFNODE2_VERSION = 2.0.0.alpha20140727b
+LEAFNODE2_SOURCE = leafnode-$(LEAFNODE2_VERSION).tar.bz2
+LEAFNODE2_SITE = http://home.pages.de/~mandree/leafnode/beta
+LEAFNODE2_LICENSE = LGPLv2.1+
+LEAFNODE2_LICENSE_FILES = COPYING.LGPL
+LEAFNODE2_DEPENDENCIES = host-pcre pcre
+
+LEAFNODE2_CONF_ENV = \
+	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
+
+LEAFNODE2_CONF_OPT = \
+	--sysconfdir=/etc/leafnode2 \
+	--enable-spooldir=/var/spool/news
+
+# Leafnode2 needs the host version of b_sortnl during compilation. Instead of
+# creating a seperate host package and installing b_sortnl to $(HOST_DIR) this
+# binary is compiled on-the-fly, host-pcre is needed for this
+define LEAFNODE2_BUILD_CMDS
+	cd $(@D); \
+	$(HOST_CONFIGURE_OPTS) $(CC) -o b_sortnl_host \
+		arc4random.c mergesort.c b_sortnl.c critmem_malloc.c \
+		critmem_realloc.c -DHAVE_CONFIG_H -I$(HOST_DIR)/usr/include \
+		-L $(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib -lpcre
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+$(eval $(autotools-package))
-- 
1.7.10.4
