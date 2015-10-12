From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:55:44 +0200
Subject: [Buildroot] [git commit] make: disable guile support
Message-ID: <20151012215719.45A3981801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ad2c05a51e37a4a672a90b29ee97e392647ccc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building in a static only configuration with guile package
enabled, the following error happens:

 gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or
 directory
   #   include <dlfcn.h>

The file gc_pthread_redirects.h comes from bdwgc, which gets built
before make in the autobuild test case indicated below. This header
file is known to incorrectly include <dlfcn.h>, unless GC_NO_DLOPEN is
specified.

IF GC_NO_DLOPEN is defined, another issue arises due to libguile and
libintl both defining locale_charset.

We could have kept the guile support enabled only on dynamic library
configurations, and disable it only for static library
configurations. However, the need for guile support in make on the
target seems highly unlikely, so we'd better simply disabling guile
support, which this commit does.

Fixes:

  http://autobuild.buildroot.net/results/814/8143ae0afac139845e5016058d85c800dc8527ad

[Thomas: tweak commit log.]

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/make/make.mk |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index ebfa2f0..20702dc 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -11,16 +11,11 @@ MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 MAKE_LICENSE = GPLv3+
 MAKE_LICENSE_FILES = COPYING
 
+MAKE_CONF_OPTS = --without-guile
+
 # Disable the 'load' operation for static builds since it needs dlopen
 ifeq ($(BR2_STATIC_LIBS),y)
 MAKE_CONF_OPTS += --disable-load
 endif
 
-ifeq ($(BR2_PACKAGE_GUILE),y)
-MAKE_DEPENDENCIES += guile
-MAKE_CONF_OPTS += --with-guile
-else
-MAKE_CONF_OPTS += --without-guile
-endif
-
 $(eval $(autotools-package))
