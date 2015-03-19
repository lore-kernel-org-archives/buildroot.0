From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Mar 2015 22:29:48 +0100
Subject: [Buildroot] [PATCH v1] postgresql: fix xtensa pthread linking flags
Message-ID: <1426800588-28574-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following linker errror in case of xtensa tareget
with openssl packet enabled ([1], [2], [3]):

host/usr/bin/xtensa-linux-gcc -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals  -Os  pg_ctl.o  -L../../../src/common -lpgcommon -L../../../src/port -lpgport -L../../../src/interfaces/libpq -lpq -L../../../src/port -L../../../src/common  -Wl,-rpath,'/usr/lib',--enable-new-dtags  -lpgcommon -lpgport -lssl -lcrypto -lz -lreadline -lrt -lcrypt -ldl -lm  -o pg_ctl
host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.so: warning: gethostbyname is obsolescent, use getnameinfo() instead.
../../../src/interfaces/libpq/libpq.so: undefined reference to `pthread_sigmask'
collect2: error: ld returned 1 exit status
make[4]: *** [pg_ctl] Error 1
make[4]: Leaving directory `build/postgresql-9.4.1/src/bin/pg_ctl'

Caused by pthread flags autodetection failure while configure (from config.log):
configure:12436: checking whether pthreads work with -pthread
configure:12521: host/usr/bin/xtensa-linux-gcc -o conftest -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals  -Os   -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE    conftest.c   -lssl -lcrypto -lz -lrt -lcrypt -ldl -lm  >&5
conftest.c: In function 'main':
conftest.c:140:27: warning: 'th' is used uninitialized in this function [-Wuninitialized]
 pthread_t th; pthread_join(th, 0);
                           ^
host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.so: warning: gethostbyname is obsolescent, use getnameinfo() instead.
configure:12521: $? = 0
configure:12556: result: no

[1] http://autobuild.buildroot.net/results/745/745ad42bb99770e49a842ca812f798c350e9bf2e
[2] http://autobuild.buildroot.net/results/0b1/0b12a3aa4160aa5a60328050973eff56717aca59
[3] http://autobuild.buildroot.net/results/6f1/6f1cb7c377439fb4eb358d9fcb46db29bff2ab78

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7dc3f0b..30ff6b7 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -29,6 +29,10 @@ endif
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
+else
+	# xtensa build with openssl enabled needs extra pthread
+	# because autodetection failes
+	POSTGRESQL_CONF_OPTS += LIBS='-pthread'
 endif
 
 ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
-- 
2.1.4
