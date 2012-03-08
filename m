From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Mar 2012 22:53:29 +0100
Subject: [Buildroot] [git commit] ccache: Force ccache to use its internal
	zlib
Message-ID: <20120308215736.A9F3090D08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ea11dafff37c5403432f691cf3c46d1d5566e46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Thanks to Ra??l S??nchez Siles <rsanchezs@infoglobal.es> for reporting
the bug and testing the proposed solution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
