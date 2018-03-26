From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Mar 2018 23:23:02 +0300
Subject: [Buildroot] [PATCH] xerces: add upstream security fix
Message-ID: <a3df0ee99de9a5f3595e657e19b48f004eea13ae.1522095782.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2017-12627: dereference of a NULL pointer while processing the path
to the DTD.

xerces 3.2.1 includes this patch. But this version also added
AC_RUN_IFELSE to its configure script, making cross compilation harder.

Switching to cmake is also problematic since the minimum required cmake
version is 3.2.0. The host dependencies check currently allows minimum
cmake version 3.1.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/xerces/0001-fix-CVE-2017-12627.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/xerces/0001-fix-CVE-2017-12627.patch

diff --git a/package/xerces/0001-fix-CVE-2017-12627.patch b/package/xerces/0001-fix-CVE-2017-12627.patch
new file mode 100644
index 000000000000..010be7e3d5ad
--- /dev/null
+++ b/package/xerces/0001-fix-CVE-2017-12627.patch
@@ -0,0 +1,22 @@
+XMLString: Don't call catString if relativePath is null
+
+https://xerces.apache.org/xerces-c/secadv/CVE-2017-12627.txt
+
+Upstream status: svn revision 1819998
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+--- trunk/src/xercesc/util/PlatformUtils.cpp	2018/01/03 18:58:30	1819997
++++ trunk/src/xercesc/util/PlatformUtils.cpp	2018/01/03 18:59:30	1819998
+@@ -920,7 +920,10 @@
+ 
+     XMLString::subString(tmpBuf, basePath, 0, (basePtr - basePath + 1), manager);
+     tmpBuf[basePtr - basePath + 1] = 0;
+-    XMLString::catString(tmpBuf, relativePath);
++    if (relativePath)
++    {
++        XMLString::catString(tmpBuf, relativePath);
++    }
+ 
+     removeDotSlash(tmpBuf, manager);
+ 
-- 
2.16.2
