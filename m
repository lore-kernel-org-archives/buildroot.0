From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 28 Oct 2018 10:39:57 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix uclibc c99 support detection
Message-ID: <20181028093957.20543-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  checking for /home/peko/autobuild/instance-0/output/host/bin/powerpc-linux-gcc option to accept ISO C99... unsupported
  configure: error: Valgrind relies on a C compiler supporting C99

with the following in the valgrind-3.14.0/config.log:

  configure:5517: checking for .../host/bin/powerpc-linux-gcc option to accept ISO C99
  configure:5666: .../host/bin/powerpc-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-stack-protector -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
  conftest.c:55:9: error: unknown type name 'wchar_t'
     const wchar_t *name;
           ^~~~~~~

[1] http://autobuild.buildroot.net/results/b25013f785a11f07e8da3735741b96036712f42a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/valgrind/valgrind.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index f097c7be1f..459de4907e 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -36,6 +36,9 @@ endif
 
 VALGRIND_CONF_ENV = CFLAGS="$(VALGRIND_CFLAGS)"
 
+# fix uclibc configure c99 support detection
+VALGRIND_CONF_ENV += ac_cv_prog_cc_c99='-std=gnu99'
+
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
 # host tuple to determine whether it's being built for ARMv7 or
 # not. Therefore, we adjust the host tuple to specify we're on
-- 
2.19.1
