From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:50 +0200
Subject: [Buildroot] [git commit] libselinux: rework host installation
Message-ID: <20170705141337.C1B2881D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b8257e7d366a3c0306e1b3c0119193777555b0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux has a pretty peculiar interpretation of DESTDIR and PREFIX.
PREFIX is not consistently used: some installation paths are forced to
$(DESTDIR)/usr/... . In other cases, PREFIX is indeed used. PREFIX
defaults to $(DESTDIR)/usr.

Try to be a little bit more correct by passing both DESTDIR and PREFIX,
both set to $(HOST_DIR). This is not a complete fix: man pages are
still installed in $(HOST_DIR)/usr - but we don't care about that.

Also simplify the symlink creation, like how it's done in libsepol.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libselinux/libselinux.mk | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 1698947..f23eea4 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -85,32 +85,31 @@ HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
+# DESTDIR is needed during the compile to compute library and header paths.
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
+	DESTDIR=$(HOST_DIR) \
+	PREFIX=$(HOST_DIR) \
 	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
 	PYINC="$(HOST_LIBSELINUX_PYINC)" \
 	PYSITEDIR="$(HOST_DIR)/lib/$(HOST_LIBSELINUX_PYLIBVER)/site-packages" \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
 define HOST_LIBSELINUX_BUILD_CMDS
-	# DESTDIR is needed during the compile to compute library and
-	# header paths.
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
-		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
-		SHLIBDIR=$(HOST_DIR)/lib all
+		$(HOST_LIBSELINUX_MAKE_OPTS) all
 	# Generate python interface wrapper
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
-		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
+		$(HOST_LIBSELINUX_MAKE_OPTS) swigify pywrap
 endef
 
 define HOST_LIBSELINUX_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
-		SHLIBDIR=$(HOST_DIR)/lib SBINDIR=$(HOST_DIR)/sbin install
-	(cd $(HOST_DIR)/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
+		$(HOST_LIBSELINUX_MAKE_OPTS) install
+	ln -sf libselinux.so.1 $(HOST_DIR)/lib/libselinux.so
 	# Install python interface wrapper
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
+		$(HOST_LIBSELINUX_MAKE_OPTS) install-pywrap
 endef
 
 $(eval $(generic-package))
