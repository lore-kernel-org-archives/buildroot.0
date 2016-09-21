From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 21 Sep 2016 21:48:28 +0530
Subject: [Buildroot] [PATCH] circus, python-psutil: fix syntax in Config.in
Message-ID: <1474474708-4848-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After commit ab930190d775 ("python-psutil: not available on musl")
we are getting following error when we set defconfig

package/python-psutil/Config.in:14: syntax error
package/python-psutil/Config.in:13: invalid option
package/circus/Config.in:21: syntax error
package/circus/Config.in:20: invalid option

Fixes: ab930190d775 ("python-psutil: not available on musl")
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/circus/Config.in        | 2 +-
 package/python-psutil/Config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index 3df41f5..94c59a4 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_CIRCUS
 
 comment "circus needs Python and a uClibc or glibc toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL || \
 		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
diff --git a/package/python-psutil/Config.in b/package/python-psutil/Config.in
index 0b1333c..1aec35d 100644
--- a/package/python-psutil/Config.in
+++ b/package/python-psutil/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_PSUTIL
 	  https://pypi.python.org/pypi/psutil
 
 comment "python-psutil needs a uClibc or glibc toolchain"
-	depends BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.6.2
