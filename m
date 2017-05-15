From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:55:23 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] strongswan: fix crypt()
	redefinition
Message-ID: <20170515125327.71F0482901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a360e132b457d49722ea7bfc63306f787da3178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Add patch from upstream pending pull request (#72) to fix crypt() definition
conflict.

Fixes:
http://autobuild.buildroot.net/results/612/6120add5ad6e7f5d575fc2a2442cd7fe5302eb46/
http://autobuild.buildroot.net/results/ba1/ba1298e71ef28857654ae8d4593d09e4fe8cdda0/
http://autobuild.buildroot.net/results/6b9/6b928e2a6a35bfb21c792fca083bc4cbdaef9304/

Cc: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit dd24d95a76d19378b50e1d8a26ff0a00860671c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-af_alg-fix-crypt-definition-conflict.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/strongswan/0001-af_alg-fix-crypt-definition-conflict.patch b/package/strongswan/0001-af_alg-fix-crypt-definition-conflict.patch
new file mode 100644
index 0000000..442e53e
--- /dev/null
+++ b/package/strongswan/0001-af_alg-fix-crypt-definition-conflict.patch
@@ -0,0 +1,55 @@
+From 0b906cb025a506be1b73e5b485179585d1a90be2 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 11 May 2017 14:04:47 +0300
+Subject: [PATCH] af_alg: fix crypt() definition conflict
+
+Rename the crypt() method to avoid conflict with POSIX crypt(). Fixes the
+following build failure with musl libc:
+
+In file included from ../../../../src/libstrongswan/utils/utils.h:53:0,
+                 from ../../../../src/libstrongswan/library.h:101,
+                 from af_alg_ops.h:24,
+                 from af_alg_ops.c:16:
+af_alg_ops.c:110:22: error: conflicting types for 'crypt'
+ METHOD(af_alg_ops_t, crypt, bool,
+                      ^
+../../../../src/libstrongswan/utils/utils/object.h:99:13: note: in definition of macro 'METHOD'
+  static ret name(union {iface *_public; this;} \
+             ^
+In file included from af_alg_ops.c:18:0:
+.../host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/unistd.h:144:7: note: previous declaration of 'crypt' was here
+ char *crypt(const char *, const char *);
+       ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/strongswan/strongswan/pull/72
+
+ src/libstrongswan/plugins/af_alg/af_alg_ops.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/af_alg/af_alg_ops.c b/src/libstrongswan/plugins/af_alg/af_alg_ops.c
+index 331d1e8010aa..452cd1ac30c9 100644
+--- a/src/libstrongswan/plugins/af_alg/af_alg_ops.c
++++ b/src/libstrongswan/plugins/af_alg/af_alg_ops.c
+@@ -107,7 +107,7 @@ METHOD(af_alg_ops_t, hash, bool,
+ 	return TRUE;
+ }
+ 
+-METHOD(af_alg_ops_t, crypt, bool,
++METHOD(af_alg_ops_t, crypt_, bool,
+ 	private_af_alg_ops_t *this, u_int32_t type, chunk_t iv, chunk_t data,
+ 	char *out)
+ {
+@@ -224,7 +224,7 @@ af_alg_ops_t *af_alg_ops_create(char *type, char *alg)
+ 		.public = {
+ 			.hash = _hash,
+ 			.reset = _reset,
+-			.crypt = _crypt,
++			.crypt = _crypt_,
+ 			.set_key = _set_key,
+ 			.destroy = _destroy,
+ 		},
+-- 
+2.11.0
+
