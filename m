From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Mar 2018 09:46:38 +0200
Subject: [Buildroot] [git commit] xerces: add upstream security fix
Message-ID: <20180327075508.6690581055@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=142c8cc8d525f687ce199cc0163d48892e8a81f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2017-12627: dereference of a NULL pointer while processing the path
to the DTD.

xerces 3.2.1 includes this patch. But this version also added
AC_RUN_IFELSE to its configure script, making cross compilation harder.

Switching to cmake is also problematic since the minimum required cmake
version is 3.2.0. The host dependencies check currently allows minimum
cmake version 3.1.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xerces/0001-fix-CVE-2017-12627.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/xerces/0001-fix-CVE-2017-12627.patch b/package/xerces/0001-fix-CVE-2017-12627.patch
new file mode 100644
index 0000000000..010be7e3d5
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
