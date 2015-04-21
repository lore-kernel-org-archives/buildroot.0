From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 20 Apr 2015 19:04:13 -0700
Subject: [Buildroot] [PATCH v2] heimdal: explicitly set -lpthread
Message-ID: <1429581853-24749-1-git-send-email-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes the following build error:

output/build/host-heimdal-1.5.3/lib/sqlite/.libs/libheimsqlite.a(sqlite3.o): In function `pthreadMutexTry':
sqlite3.c:(.text+0x5795): undefined reference to `pthread_mutex_trylock'
output/build/host-heimdal-1.5.3/lib/sqlite/.libs/libheimsqlite.a(sqlite3.o): In function `pthreadMutexAlloc':
sqlite3.c:(.text+0xbf84): undefined reference to `pthread_mutexattr_init'
sqlite3.c:(.text+0xbf91): undefined reference to `pthread_mutexattr_settype'
sqlite3.c:(.text+0xbfa4): undefined reference to `pthread_mutexattr_destroy'
output/build/host-heimdal-1.5.3/base/.libs/libheimbase.a(heimbase.o): In function `init_ar_tls':
heimbase.c:(.text+0x4f): undefined reference to `pthread_key_create'
output/build/host-heimdal-1.5.3/base/.libs/libheimbase.a(heimbase.o): In function `autorel_tls':
heimbase.c:(.text+0x263): undefined reference to `pthread_getspecific'
heimbase.c:(.text+0x291): undefined reference to `pthread_setspecific'
collect2: error: ld returned 1 exit status
make[3]: *** [verify_krb5_conf] Error 1
make[3]: Leaving directory `output/build/host-heimdal-1.5.3/lib/krb5'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `output/build/host-heimdal-1.5.3/lib'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `output/build/host-heimdal-1.5.3'
make: *** [output/build/host-heimdal-1.5.3/.stamp_built] Error 2

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

---
Changes v1 -> v2:
  - add description about build failure
  - remove host-flex addition
---
 package/heimdal/heimdal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 972f15c..fef4174 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -10,7 +10,7 @@ HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = --with-x=no --disable-shared --enable-static
-HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
+HOST_HEIMDAL_CONF_ENV = MAKEINFO=true LIBS="-lpthread"
 HEIMDAL_MAKE = $(MAKE1)
 # For heimdal-0004-compile_et.patch
 HEIMDAL_AUTORECONF = YES
-- 
2.3.5
