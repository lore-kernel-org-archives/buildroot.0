From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:49 +0200
Subject: [Buildroot] [git commit] libsemanage: rework host installation
Message-ID: <20170705141337.ADA4A81D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46d770e7edff51c1e639fb39272b0a2c45b055ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsemanage has a pretty peculiar interpretation of DESTDIR and PREFIX.
PREFIX is not consistently used: some installation paths are forced to
$(DESTDIR)/usr/... . In other cases, PREFIX is indeed used. PREFIX
defaults to $(DESTDIR)/usr

Try to be a little bit more correct by passing both DESTDIR and PREFIX,
both set to $(HOST_DIR). This is not a complete fix: man pages are
still installed in $(HOST_DIR)/usr - but we don't care about that.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsemanage/libsemanage.mk | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 5ef2d57..2964c56 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -29,7 +29,12 @@ endef
 
 HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
 				host-ustr host-bzip2 host-swig
-HOST_LIBSEMANAGE_MAKE_OPTS += $(HOST_CONFIGURE_OPTS) \
+
+# DESTDIR is needed during the compile to compute library and header paths.
+HOST_LIBSEMANAGE_MAKE_OPTS += \
+	$(HOST_CONFIGURE_OPTS) \
+	DESTDIR=$(HOST_DIR) \
+	PREFIX=$(HOST_DIR) \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
@@ -47,15 +52,13 @@ HOST_LIBSEMANAGE_MAKE_OPTS += \
 endif
 
 define HOST_LIBSEMANAGE_BUILD_CMDS
-	# DESTDIR is needed during the compile to compute library and
-	# header paths.
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) all
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) all
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) swigify pywrap
 endef
 
 define HOST_LIBSEMANAGE_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) install
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) install-pywrap
 endef
 
 $(eval $(generic-package))
