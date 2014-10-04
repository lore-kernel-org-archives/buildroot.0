From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 19:34:34 +0200
Subject: [Buildroot] [git commit] package/leafnode2: New package
Message-ID: <20141004173528.4DE5A9D824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f6b9b2b71db3e9ff3a6d57c92a5c9bd52cba206
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Rewrap help text in Config.in
  - Improve cross-compilation patch to not call the 'amiroot' program
    on the host, while it is compiled for the target.
  - Use CONF_OPTS instead of CONF_OPT.
  - Use a pre-build hook rather than re-implementing the BUILD_CMDS
    entirely.
  - Also include COPYING file in license files.
  - License is LGPLv2.1, not LGPLv2.1+: only one file is LGPLv2.1+,
    the rest doesn't have any "or later" specification, so we assume
    it's only LGPLv2.1.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/leafnode2/Config.in                        |   10 +++++
 .../leafnode2/leafnode2-0001-cross_makefile.patch  |   39 ++++++++++++++++++++
 package/leafnode2/leafnode2.mk                     |   35 ++++++++++++++++++
 4 files changed, 85 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7f8faff..ea94a2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1002,6 +1002,7 @@ endif
 	source "package/iw/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
+	source "package/leafnode2/Config.in"
 	source "package/lftp/Config.in"
 	source "package/lighttpd/Config.in"
 	source "package/linknx/Config.in"
diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
new file mode 100644
index 0000000..30a02c8
--- /dev/null
+++ b/package/leafnode2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LEAFNODE2
+	bool "leafnode2"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_PCRE
+	help
+	  Leafnode-2 is a store-and-forward NNTP (or Usenet) proxy
+	  server designed for small sites with just a few active
+	  newsgroups.
+
+	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/
diff --git a/package/leafnode2/leafnode2-0001-cross_makefile.patch b/package/leafnode2/leafnode2-0001-cross_makefile.patch
new file mode 100644
index 0000000..b61a8ef
--- /dev/null
+++ b/package/leafnode2/leafnode2-0001-cross_makefile.patch
@@ -0,0 +1,39 @@
+Fix cross-compilation issues
+
+ - During target package compilation the host version of b_sortnl is
+   needed.
+
+ - Do not call a 'amiroot' program built for the target when
+   cross-compiling. We're anyway not root, so simply remove the
+   chown/chgrp dance.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.in
+===================================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -1853,7 +1853,7 @@
+ 
+ configparam_data.c: $(srcdir)/config.table b_sortnl$(EXEEXT) genconfigparam_data.awk
+ 	rm -f config.table.sorted
+-	./b_sortnl$(EXEEXT) <$(srcdir)/config.table >config.table.sorted
++	./b_sortnl_host$(EXEEXT) <$(srcdir)/config.table >config.table.sorted
+ 	$(AWK) -f $(srcdir)/genconfigparam_data.awk <config.table.sorted >$@ \
+ 	|| { rm -f $@ ; false ; }
+ 
+@@ -1868,13 +1868,7 @@
+ install-data-hook:
+ 	$(INSTALL) -d -m 02770 $(DESTDIR)$(SPOOLDIR)
+ 	$(INSTALL) -d -m 02770 $(DESTDIR)$(SPOOLDIR)/leaf.node
+-	-./amiroot && chown $(RUNAS_USER) $(DESTDIR)$(SPOOLDIR)
+-	-./amiroot && chown $(RUNAS_USER) $(DESTDIR)$(SPOOLDIR)/leaf.node
+-	-./amiroot && chgrp $(RUNAS_GROUP) $(DESTDIR)$(SPOOLDIR)
+-	-./amiroot && chgrp $(RUNAS_GROUP) $(DESTDIR)$(SPOOLDIR)/leaf.node
+ 	rm -f $(DESTDIR)$(sbindir)/leafnode-version # now in $(bindir)
+-	./amiroot && p=$(DESTDIR)$(bindir)/newsq && chown 0 $$p \
+-		&& chgrp $(RUNAS_GROUP) $$p && chmod 2111 $$p  ; true
+ 	@echo
+ 	@echo "### If upgrading from leafnode before 1.6,"
+ 	@echo "### run:  make update"
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
new file mode 100644
index 0000000..3e6bd0b
--- /dev/null
+++ b/package/leafnode2/leafnode2.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# leafnode2
+#
+################################################################################
+
+LEAFNODE2_VERSION = 2.0.0.alpha20140727b
+LEAFNODE2_SOURCE = leafnode-$(LEAFNODE2_VERSION).tar.bz2
+LEAFNODE2_SITE = http://home.pages.de/~mandree/leafnode/beta
+LEAFNODE2_LICENSE = LGPLv2.1
+LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
+LEAFNODE2_DEPENDENCIES = host-pcre pcre
+
+LEAFNODE2_CONF_ENV = \
+	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
+
+LEAFNODE2_CONF_OPTS = \
+	--sysconfdir=/etc/leafnode2 \
+	--enable-spooldir=/var/spool/news
+
+# Leafnode2 needs the host version of b_sortnl during
+# compilation. Instead of creating a seperate host package and
+# installing b_sortnl to $(HOST_DIR) this binary is compiled
+# on-the-fly, host-pcre is needed for this
+define LEAFNODE2_BUILD_SORTNL_TOOL
+	cd $(@D); \
+	$(HOSTCC) $(HOST_CFLAGS) -o b_sortnl_host \
+		arc4random.c mergesort.c b_sortnl.c critmem_malloc.c \
+		critmem_realloc.c -DHAVE_CONFIG_H -I$(HOST_DIR)/usr/include \
+		-L $(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib -lpcre
+endef
+
+LEAFNODE2_PRE_BUILD_HOOKS += LEAFNODE2_BUILD_SORTNL_TOOL
+
+$(eval $(autotools-package))
