From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] Make uClibc gen_wc8bit shows an
	error when no locale support available
Message-ID: <20100825153143.2E8C489016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9088b71f451260e1e94a242a3b92141ab853275f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When no UTF-8 locale is available on the host system, uClibc can't
generate some stuff it needs to compile a C library with locale
support. Unfortunately, as gen_wc8bit message is shown on stdout and
the stdout of gen_wc8bit is redirected to a file, the user don't see
anything, as reported at
http://lists.busybox.net/pipermail/buildroot/2010-May/034177.html.

Those two patches fix the problem for uClibc 0.9.31 and 0.9.30.3. It
has been submitted upstream:
 http://lists.uclibc.org/pipermail/uclibc/2010-August/044256.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../uClibc-0.9.30.3-fix-error-locale-utf-8.patch   |   17 +++++++++++++++++
 .../uClibc-0.9.31-fix-error-locale-utf-8.patch     |   17 +++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-fix-error-locale-utf-8.patch

diff --git a/toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch b/toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch
new file mode 100644
index 0000000..2fe6c50
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch
@@ -0,0 +1,17 @@
+---
+ extra/locale/gen_wc8bit.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: uClibc-0.9.30.3/extra/locale/gen_wc8bit.c
+===================================================================
+--- uClibc-0.9.30.3.orig/extra/locale/gen_wc8bit.c
++++ uClibc-0.9.30.3/extra/locale/gen_wc8bit.c
+@@ -119,7 +119,7 @@
+ 		}
+ 
+  locale_failure:
+-		printf("could not find a UTF8 locale ... please enable en_US.UTF-8\n");
++		fprintf(stderr, "could not find a UTF8 locale ... please enable en_US.UTF-8\n");
+ 		return EXIT_FAILURE;
+  locale_success:
+ 		pclose(fp);
diff --git a/toolchain/uClibc/uClibc-0.9.31-fix-error-locale-utf-8.patch b/toolchain/uClibc/uClibc-0.9.31-fix-error-locale-utf-8.patch
new file mode 100644
index 0000000..1305add
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-fix-error-locale-utf-8.patch
@@ -0,0 +1,17 @@
+---
+ extra/locale/gen_wc8bit.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: uClibc-0.9.31/extra/locale/gen_wc8bit.c
+===================================================================
+--- uClibc-0.9.31.orig/extra/locale/gen_wc8bit.c
++++ uClibc-0.9.31/extra/locale/gen_wc8bit.c
+@@ -120,7 +120,7 @@
+ 		}
+ 
+  locale_failure:
+-		printf("could not find a UTF8 locale ... please enable en_US.UTF-8\n");
++		fprintf(stderr, "could not find a UTF8 locale ... please enable en_US.UTF-8\n");
+ 		return EXIT_FAILURE;
+  locale_success:
+ 		pclose(fp);
-- 
1.7.1
