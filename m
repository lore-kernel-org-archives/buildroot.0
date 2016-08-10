From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 00:02:03 +0200
Subject: [Buildroot] [git commit] libxml2: fix m68k uclinux compile
Message-ID: <20160810220208.2458A80166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ed1eda5dbe2130cd938d7a3c1a8a30aa26fa9db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GCC manual suggest when getting:
relocation truncated to fit: R_68K_GOT16O foobar
to use -mxgot.

Fixes:
  http://autobuild.buildroot.net/results/8a4e26bb1c0c64759e3914eced0a36baa0967f0b/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index ed6f9af..2a7153a 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -11,6 +11,11 @@ LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
+# relocation truncated to fit: R_68K_GOT16O
+ifeq ($(BR2_m68k_cf),y)
+LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
+endif
+
 LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
