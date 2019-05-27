From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 May 2019 10:54:05 +0200
Subject: [Buildroot] [git commit] package/tpm2-totp: fix error due to
 variable used uninitialized
Message-ID: <20190527084839.EE52D815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e58679c7b66956a71b9795065443ce918c3da23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some inline declarations of strtok_r (specifically in Sourcery CodeBench
Lite 2016.11-19) contain code where an '__s' local variable can be used
uninitialized.

When GCC expands that declaration in tpm2-totp, __s becomes an alias to
a variable which fact is not initialized, but this is not relevant since
the execution path leading to the uninitialized use is never followed.

Anyway, apply a patch already submitted upstream to fix the compilation
error.

Upstream bug report:
  https://github.com/tpm2-software/tpm2-totp/issues/32

Fixes:
  http://autobuild.buildroot.net/results/5693a35e4d6bc76a1f46fe0e217abc49f7188aad/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pilation-failure-due-to-variable-may-be-u.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/tpm2-totp/0002-src-fix-compilation-failure-due-to-variable-may-be-u.patch b/package/tpm2-totp/0002-src-fix-compilation-failure-due-to-variable-may-be-u.patch
new file mode 100644
index 0000000000..a650ab49f4
--- /dev/null
+++ b/package/tpm2-totp/0002-src-fix-compilation-failure-due-to-variable-may-be-u.patch
@@ -0,0 +1,42 @@
+From 194f41635367452a7a3c9a75ebbada531bf4c58d Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Sun, 26 May 2019 13:39:44 -0300
+Subject: [PATCH] src: fix compilation failure due to "variable may be used
+ uninitialized"
+
+Some inline declarations of strtok_r (specifically in Sourcery CodeBench
+Lite 2016.11-19) contain code where an '__s' local variable can be used
+uninitialized.
+
+When GCC expands that declaration in 'parse_pcrs', __s becomes an alias
+to the local variable 'saveptr', which in fact is not initialized, but
+this is not relevant, since the 'str' argument is knowingly not NULL
+when passed to strtok_r because it comes from 'optarg' in parse_opts.
+
+Anyway, initialize saveptr to NULL to prevent the compilation error.
+
+Fixes:
+  http://autobuild.buildroot.net/results/5693a35e4d6bc76a1f46fe0e217abc49f7188aad/
+
+Change-Id: I03ad3731774c56744f18154ec161c92ba002903d
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ src/tpm2-totp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tpm2-totp.c b/src/tpm2-totp.c
+index 3f60b4a..f28a4d6 100644
+--- a/src/tpm2-totp.c
++++ b/src/tpm2-totp.c
+@@ -93,7 +93,7 @@ int
+ parse_pcrs(char *str, int *pcrs)
+ {
+     char *token;
+-    char *saveptr;
++    char *saveptr = NULL;
+     char *endptr;
+     long pcr;
+ 
+-- 
+2.20.1
+
