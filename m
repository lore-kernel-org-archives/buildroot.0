From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:26:49 +0100
Subject: [Buildroot] [PATCH 1/2] ccache: Force ccache to use its internal
	zlib.
In-Reply-To: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
Message-ID: <17bf5a67401f522c5a6d704c60713087106a4c29.1331148403.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem is that without this, ccache would link against the zlib
of the build system, but we might build and install a different
version of zlib in $(O)/host afterwards, which ccache will pick
up. This might break if there is a version mismatch. A solution would
be to add host-zlib has a dependency of ccache, but it would require
tuning the zlib .mk file to use HOSTCC_NOCCACHE as the
compiler. Instead, we take the easy path: tell ccache to use its
internal copy of zlib, so that ccache has zero dependency besides the
C library.

Fixes bug #4808.

Thanks to Ra?l S?nchez Siles <rsanchezs@infoglobal.es> for reporting
the bug and testing the proposed solution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/ccache.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 9155441..393989f 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -14,6 +14,17 @@ CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
 HOST_CCACHE_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)"
 
+# Force ccache to use its internal zlib. The problem is that without
+# this, ccache would link against the zlib of the build system, but we
+# might build and install a different version of zlib in $(O)/host
+# afterwards, which ccache will pick up. This might break if there is
+# a version mismatch. A solution would be to add host-zlib has a
+# dependency of ccache, but it would require tuning the zlib .mk file
+# to use HOSTCC_NOCCACHE as the compiler. Instead, we take the easy
+# path: tell ccache to use its internal copy of zlib, so that ccache
+# has zero dependency besides the C library.
+HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
+
 # We directly hardcode the cache location into the binary, as it is
 # much easier to handle than passing an environment variable.
 define HOST_CCACHE_FIX_CCACHE_DIR
-- 
1.7.4.1
