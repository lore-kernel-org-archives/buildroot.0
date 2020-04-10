From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Fri, 10 Apr 2020 19:31:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/p7zip: fix CVE-2016-9296
Message-ID: <20200410173118.21538-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/p7zip/0001-CVE-2016-9296.patch | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/p7zip/0001-CVE-2016-9296.patch

diff --git a/package/p7zip/0001-CVE-2016-9296.patch b/package/p7zip/0001-CVE-2016-9296.patch
new file mode 100644
index 0000000000..42245c92c0
--- /dev/null
+++ b/package/p7zip/0001-CVE-2016-9296.patch
@@ -0,0 +1,23 @@
+From: Robert Luberda <robert@debian.org>
+Date: Sat, 19 Nov 2016 08:48:08 +0100
+Subject: Fix nullptr dereference (CVE-2016-9296)
+
+Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
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
-- 
2.17.1
