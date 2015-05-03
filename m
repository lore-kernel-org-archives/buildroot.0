From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 16:33:46 +0200
Subject: [Buildroot] [git commit] poppler: help finding libtiff in static
	linking scenarios
Message-ID: <20150503143419.2DEA37FBE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2d3e1de84fa4a6f9af997d064fa1bcbdddc3ff2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In static linking scenarios, poppler doesn't find libtiff because it
doesn't use pkg-config, so it doesn't know which additional libraries
it should link with to test the availability of libtiff. We help
poppler in this work by passing a LIBTIFF_LIBS variable, resulting for
a pkg-config invocation.

Also, since poppler uses pkg-config, we make this dependency explicit
in this patch, even though it was already carried by the fontconfig
dependency.

Fixes:

  http://autobuild.buildroot.org/results/be7/be78957dd852233c81bd364ddf664564ce8f0208/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index d35da54..f8b684b 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -7,7 +7,7 @@
 POPPLER_VERSION = 0.32.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
-POPPLER_DEPENDENCIES = fontconfig
+POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
@@ -22,6 +22,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 POPPLER_CONF_OPTS += --enable-libtiff
+# Help poppler to find libtiff in static linking scenarios
+POPPLER_CONF_ENV += \
+	LIBTIFF_LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs libtiff-4)"
 POPPLER_DEPENDENCIES += tiff
 else
 POPPLER_CONF_OPTS += --disable-libtiff
