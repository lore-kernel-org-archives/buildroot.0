From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 14:38:09 +0200
Subject: [Buildroot] [PATCH 2/3] autotools: introduce
	$(PKG_NAME)_AUTORECONF_ENV/$(PKG_NAME)_AUTORECONF_OPT variables
In-Reply-To: <1284813490-32442-1-git-send-email-llandwerlin@gmail.com>
References: <1284813490-32442-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284813490-32442-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Rather than defining the AUTORECONF variable containing the path to
the autoreconf tool + all its arguments, we split the variable in two.
There is now :
      - AUTORECONF which contains the path to the autoreconf tool,
      - $(PKG_NAME)_AUTORECONF_OPT which contains the autoreconf arguments,

      - and we add $(PKG_NAME)_AUTORECONF_ENV which contains the autoreconf
        environment variables.

This allow us to define a specific setup to run autoreconf for both
target and host as well as per package if needed.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 docs/buildroot.html           |   18 ++++++++++++++++++
 package/Makefile.autotools.in |   19 ++++++++++++++++++-
 package/autoconf/autoconf.mk  |    2 +-
 package/automake/automake.mk  |    5 +++--
 4 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 6d4f17c..0f0efba 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1329,6 +1329,24 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
       options passed to the <i>autoreconf</i> program
       if <code>LIBFOO_AUTORECONF=YES</code>. By default, empty.</li>
 
+      <li><code>LIBFOO_AUTORECONF_ENV</code>, to specify environment
+      variables to pass to <i>autoreconf</i> program if
+      <code>LIBFOO_AUTORECONF=YES</code>. By default, it depends
+      whether we're building a package for the host or target, but it
+      should always define the following variables :
+      <ul>
+        <li>ACLOCAL</li>
+        <li>AUTOCONF</li>
+        <li>AUTOHEADER</li>
+        <li>AUTOMAKE</li>
+        <li>LIBTOOLIZE</li>
+      </ul></li>
+
+      <li><code>LIBFOO_AUTORECONF_OPT</code>, to specify options
+      passed to the <i>autoreconf</i> program if
+      <code>LIBFOO_AUTORECONF=YES</code>. By default, <code>-f -i -I
+      "$(ACLOCAL_DIR)"</code>.</li>
+
       <li><code>LIBFOO_LIBTOOL_PATCH</code> tells whether the
       Buildroot patch to fix libtool cross-compilation issues should
       be applied or not. Valid values are <code>YES</code>
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index bc813e3..6d4f604 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -62,8 +62,25 @@ $(2)_CONF_OPT			?=
 $(2)_MAKE			?= $(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
+ifeq ($(5),host)
 $(2)_AUTORECONF			?= NO
-$(2)_AUTORECONF_OPT		?=
+$(2)_AUTORECONF_OPT		?= -f -i -I "$$(ACLOCAL_HOST_DIR)"
+$(2)_AUTORECONF_ENV		?= $$(HOST_CONFIGURE_OPTS) \
+				ACLOCAL="$$(ACLOCAL)" \
+				AUTOCONF="$$(AUTOCONF)" \
+				AUTOHEADER="$$(AUTOHEADER)" \
+				AUTOMAKE="$$(AUTOMAKE)" \
+				LIBTOOLIZE="$$(LIBTOOLIZE)"
+else
+$(2)_AUTORECONF			?= YES
+$(2)_AUTORECONF_OPT		?= -f -i -I "$$(ACLOCAL_STAGING_DIR)"
+$(2)_AUTORECONF_ENV		?= $$(TARGET_CONFIGURE_OPTS) \
+				ACLOCAL="$$(ACLOCAL)" \
+				AUTOCONF="$$(AUTOCONF)" \
+				AUTOHEADER="$$(AUTOHEADER)" \
+				AUTOMAKE="$$(AUTOMAKE)" \
+				LIBTOOLIZE="$$(LIBTOOLIZE)"
+endif
 $(2)_USE_CONFIG_CACHE           ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 ifeq ($(BR2_ENABLE_DEBUG),y)
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index a21192f..4b58986 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(call AUTOTARGETS,package,autoconf,host))
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
 AUTOHEADER:=$(HOST_DIR)/usr/bin/autoheader
-AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)"
+AUTORECONF=$(HOST_DIR)/usr/bin/autoreconf
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index e2ff9b2..565bd42 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -22,5 +22,6 @@ $(eval $(call AUTOTARGETS,package,automake,host))
 
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
-ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
-ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
+ACLOCAL_STAGING_DIR = $(STAGING_DIR)/usr/share/aclocal
+ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
+ACLOCAL = $(HOST_DIR)/usr/bin/aclocal
-- 
1.7.1
