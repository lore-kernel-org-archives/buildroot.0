From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Nov 2017 20:15:41 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/samba4: enable musl support
Message-ID: <20171127191541.8149-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/0002-musl-getpwent_r.patch      | 79 ++++++++++++++++++++++++++
 package/samba4/0003-musl-netdb-defines.patch   | 26 +++++++++
 package/samba4/0004-musl-pthread_mutex_t.patch | 26 +++++++++
 package/samba4/Config.in                       |  7 +--
 4 files changed, 134 insertions(+), 4 deletions(-)
 create mode 100644 package/samba4/0002-musl-getpwent_r.patch
 create mode 100644 package/samba4/0003-musl-netdb-defines.patch
 create mode 100644 package/samba4/0004-musl-pthread_mutex_t.patch

diff --git a/package/samba4/0002-musl-getpwent_r.patch b/package/samba4/0002-musl-getpwent_r.patch
new file mode 100644
index 0000000000..e3cc734388
--- /dev/null
+++ b/package/samba4/0002-musl-getpwent_r.patch
@@ -0,0 +1,79 @@
+Musl fix for getpwent_r
+
+Downloaded from
+https://git.alpinelinux.org/cgit/aports/tree/main/samba/getpwent_r.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/source4/torture/local/nss_tests.c b/source4/torture/local/nss_tests.c
+index 2cd6122..04f13c6 100644
+--- a/source4/torture/local/nss_tests.c
++++ b/source4/torture/local/nss_tests.c
+@@ -333,6 +332,7 @@ static bool test_enum_passwd(struct torture_context *tctx,
+ 	return true;
+ }
+ 
++#if HAVE_GETPWENT_R
+ static bool test_enum_r_passwd(struct torture_context *tctx,
+ 			       struct passwd **pwd_array_p,
+ 			       size_t *num_pwd_p)
+@@ -381,6 +381,7 @@ static bool test_enum_r_passwd(struct torture_context *tctx,
+ 
+ 	return true;
+ }
++#endif
+ 
+ static bool torture_assert_passwd_equal(struct torture_context *tctx,
+ 					const struct passwd *p1,
+@@ -432,7 +433,7 @@ static bool test_passwd_r(struct torture_context *tctx)
+ 	struct passwd *pwd, pwd1, pwd2;
+ 	size_t num_pwd;
+ 
+-	torture_assert(tctx, test_enum_r_passwd(tctx, &pwd, &num_pwd),
++	torture_assert(tctx, test_enum_passwd(tctx, &pwd, &num_pwd),
+ 						"failed to enumerate passwd");
+ 
+ 	for (i=0; i < num_pwd; i++) {
+@@ -460,7 +461,7 @@ static bool test_passwd_r_cross(struct torture_context *tctx)
+ 	struct passwd *pwd, pwd1, pwd2, pwd3, pwd4;
+ 	size_t num_pwd;
+ 
+-	torture_assert(tctx, test_enum_r_passwd(tctx, &pwd, &num_pwd),
++	torture_assert(tctx, test_enum_passwd(tctx, &pwd, &num_pwd),
+ 						"failed to enumerate passwd");
+ 
+ 	for (i=0; i < num_pwd; i++) {
+@@ -531,6 +532,7 @@ static bool test_enum_group(struct torture_context *tctx,
+ 	return true;
+ }
+ 
++#if HAVE_GETGRENT_R
+ static bool test_enum_r_group(struct torture_context *tctx,
+ 			      struct group **grp_array_p,
+ 			      size_t *num_grp_p)
+@@ -579,6 +581,7 @@ static bool test_enum_r_group(struct torture_context *tctx,
+ 
+ 	return true;
+ }
++#endif
+ 
+ static bool torture_assert_group_equal(struct torture_context *tctx,
+ 				       const struct group *g1,
+@@ -635,7 +638,7 @@ static bool test_group_r(struct torture_context *tctx)
+ 	struct group *grp, grp1, grp2;
+ 	size_t num_grp;
+ 
+-	torture_assert(tctx, test_enum_r_group(tctx, &grp, &num_grp),
++	torture_assert(tctx, test_enum_group(tctx, &grp, &num_grp),
+ 					       "failed to enumerate group");
+ 
+ 	for (i=0; i < num_grp; i++) {
+@@ -663,7 +666,7 @@ static bool test_group_r_cross(struct torture_context *tctx)
+ 	struct group *grp, grp1, grp2, grp3, grp4;
+ 	size_t num_grp;
+ 
+-	torture_assert(tctx, test_enum_r_group(tctx, &grp, &num_grp),
++	torture_assert(tctx, test_enum_group(tctx, &grp, &num_grp),
+ 					       "failed to enumerate group");
+ 
+ 	for (i=0; i < num_grp; i++) {
diff --git a/package/samba4/0003-musl-netdb-defines.patch b/package/samba4/0003-musl-netdb-defines.patch
new file mode 100644
index 0000000000..ec2003504f
--- /dev/null
+++ b/package/samba4/0003-musl-netdb-defines.patch
@@ -0,0 +1,26 @@
+Musl fix for missing netdb defines
+
+Downloaded from
+https://git.alpinelinux.org/cgit/aports/tree/main/samba/netdb-defines.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/nsswitch/wins.c b/nsswitch/wins.c
+index dccb6dd..bb24acb 100644
+--- a/nsswitch/wins.c
++++ b/nsswitch/wins.c
+@@ -39,6 +39,14 @@ static pthread_mutex_t wins_nss_mutex = PTHREAD_MUTEX_INITIALIZER;
+ #define INADDRSZ 4
+ #endif
+ 
++#ifndef NETDB_INTERNAL
++#define NETDB_INTERNAL -1
++#endif
++
++#ifndef NETDB_SUCCESS
++#define NETDB_SUCCESS 0
++#endif
++
+ NSS_STATUS _nss_wins_gethostbyname_r(const char *hostname,
+ 				     struct hostent *he,
+ 				     char *buffer,
diff --git a/package/samba4/0004-musl-pthread_mutex_t.patch b/package/samba4/0004-musl-pthread_mutex_t.patch
new file mode 100644
index 0000000000..eba05aac2a
--- /dev/null
+++ b/package/samba4/0004-musl-pthread_mutex_t.patch
@@ -0,0 +1,26 @@
+Fixes musl build error
+
+../ctdb/tests/src/test_mutex_raw.c: In function 'main':
+../ctdb/tests/src/test_mutex_raw.c:170:28: error: 'pthread_mutex_t {aka struct <anonymous>}' has no member named '__data'
+    printf("pid=%u\n", mutex->__data.__owner);
+
+Downloaded from
+https://github.com/openembedded/meta-openembedded/blob/master/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
+===================================================================
+--- samba-4.6.2.orig/ctdb/tests/src/test_mutex_raw.c
++++ samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
+@@ -166,8 +166,10 @@ int main(int argc, const char **argv)
+ 			if (ret == 0) {
+ 				pthread_mutex_unlock(mutex);
+ 			}
++#ifdef __GLIBC__
+ 		} else if (ret == EBUSY) {
+ 			printf("pid=%u\n", mutex->__data.__owner);
++#endif
+ 		} else if (ret == 0) {
+ 			pthread_mutex_unlock(mutex);
+ 		}
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 298fdc6608..2b5a928f03 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,7 +1,7 @@
-comment "samba4 needs a uClibc or glibc toolchain w/ wchar, dynamic library, NPTL"
+comment "samba4 needs a toolchain w/ wchar, dynamic library, NPTL"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_SAMBA4
@@ -12,7 +12,6 @@ config BR2_PACKAGE_SAMBA4
 	depends on !BR2_STATIC_LIBS # python, gnutls
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
-- 
2.11.0
