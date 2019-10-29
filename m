From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 17:25:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/leveldb: link with libatomic when
 needed
Message-ID: <20191029162527.20828-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: libleveldb.so.1.22.0: undefined reference to `__atomic_fetch_sub_4'

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.net/results/257a820bb87a874ce0e2152d2752845be972fabe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leveldb/leveldb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 8aabc7e7a7..5baf56c718 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -11,4 +11,8 @@ LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
 LEVELDB_DEPENDENCIES = snappy
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LEVELDB_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
-- 
2.23.0
