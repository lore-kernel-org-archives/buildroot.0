From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 22 Feb 2015 22:25:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/thrift: fix build failure on bfin
Message-ID: <1424640307-26144-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtool append the sysroot path (lt_sysroot) with the libdir value found in
the libstdc++.la file only with bfin toolchain.

Path/to/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so

Set lt_cv_aix_libpath__CXX to /usr/lib allow to overwrite the libdir value
from libstdc++.la.

Fixes:
http://autobuild.buildroot.net/results/ae2/ae274693b953dd569c3ff63c532e2fc9553b5002/

And many more

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/thrift/thrift.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 559bd28..1215aed 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -26,6 +26,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 THRIFT_CONF_ENV += LIBS=-lz
 endif
 
+# Libtool append the sysroot path (lt_sysroot) with the libdir value found in
+# the libstdc++.la file only on certain toolchain.
+THRIFT_CONF_OPTS = lt_cv_aix_libpath__CXX="/usr/lib"
+
 # Language selection
 # The generator (host tool) works with all of them regardless
 # This is just for the libraries / bindings
-- 
1.9.3
