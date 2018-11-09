From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  9 Nov 2018 22:57:30 +0100
Subject: [Buildroot] [PATCH] libsemanage: define installation location of
 semanage.conf for host
Message-ID: <20181109215730.30795-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When /etc/selinux/semanage.conf does not exist, libsemanage tries to
overwrite it. For the target package, it works fine because $(DESTDIR)
is taken into account.

However, for the host package, $(DESTDIR) is empty, and the location
used for /etc/selinux/semanage.conf is not affected by $(PREFIX). This
causes host-libsemanage to try to install /etc/selinux/semanage.conf,
which obviously fails with:

  test -f /etc/selinux/semanage.conf || install -m 644 -D semanage.conf /etc/selinux/semanage.conf
  install: cannot create directory '/etc/selinux': Permission denied

To fix this, this commit passes DEFAULT_SEMANAGE_CONF_LOCATION in the
make options when building/installing host-libsemanage, providing a
path to semanage.conf that Buildroot can write to.

Fixes:

  http://autobuild.buildroot.net/results/cd27e3c66274622d0c3dd5a601a36efb1bc45011/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsemanage/libsemanage.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index d554a33356..bbde50f49f 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -31,7 +31,8 @@ HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libseli
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
-	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
+	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/" \
+	DEFAULT_SEMANAGE_CONF_LOCATION=$(HOST_DIR)/etc/selinux/semanage.conf
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
-- 
2.14.5
