From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:47:46 +0200
Subject: [Buildroot] [git commit] thrift: fix m68k uclinux compile
Message-ID: <20160808214823.AF1C67FC1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bb83105d2a2915bd59455831fed081eb80c8dda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GCC manual suggest when getting:
relocation truncated to fit: R_68K_GOT16O foobar
to use -mxgot.

The failures happens after gnuplot compiles.

Fixes:
  http://autobuild.buildroot.net/results/d1e030c42f43f49575f36ecc82e9dd9018ca4f73/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/thrift/thrift.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index a40ddad..185e1ec 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -25,6 +25,11 @@ THRIFT_AUTORECONF_OPTS = -I $(HOST_DIR)/usr/share/autoconf-archive
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
 
+# relocation truncated to fit: R_68K_GOT16O
+ifeq ($(BR2_m68k_cf),y)
+THRIFT_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mxgot"
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 THRIFT_CONF_ENV += LIBS=-lz
