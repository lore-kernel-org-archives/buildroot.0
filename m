From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2020 23:49:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/p7zip: fix
 CVE-2016-9296
Message-ID: <20200429213633.C8D5090B57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45797d142fe2108f117123453286b9dd2eeaf0a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f2047e3d0000675c51288d16335b94481da63802)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/p7zip/0001-CVE-2016-9296.patch | 25 +++++++++++++++++++++++++
 package/p7zip/p7zip.mk                 |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/package/p7zip/0001-CVE-2016-9296.patch b/package/p7zip/0001-CVE-2016-9296.patch
new file mode 100644
index 0000000000..6e6fc9f58f
--- /dev/null
+++ b/package/p7zip/0001-CVE-2016-9296.patch
@@ -0,0 +1,25 @@
+From: Robert Luberda <robert@debian.org>
+Date: Sat, 19 Nov 2016 08:48:08 +0100
+Subject: Fix nullptr dereference (CVE-2016-9296)
+
+Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
+
+Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
+---
+ CPP/7zip/Archive/7z/7zIn.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CPP/7zip/Archive/7z/7zIn.cpp b/CPP/7zip/Archive/7z/7zIn.cpp
+index b0c6b98..7c6dde2 100644
+--- a/CPP/7zip/Archive/7z/7zIn.cpp
++++ b/CPP/7zip/Archive/7z/7zIn.cpp
+@@ -1097,7 +1097,8 @@ HRESULT CInArchive::ReadAndDecodePackedStreams(
+       if (CrcCalc(data, unpackSize) != folders.FolderCRCs.Vals[i])
+         ThrowIncorrect();
+   }
+-  HeadersSize += folders.PackPositions[folders.NumPackStreams];
++  if (folders.PackPositions)
++      HeadersSize += folders.PackPositions[folders.NumPackStreams];
+   return S_OK;
+ }
+ 
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index ff0dd01e02..66d3198c17 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -10,6 +10,9 @@ P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSIO
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
 
+# 0001-CVE-2016-9296.patch
+P7ZIP_IGNORE_CVES += CVE-2016-9296
+
 # p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
 # CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
 # and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.
