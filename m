From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 13:37:51 +0200
Subject: [Buildroot] [git commit] package/p7zip: fix CVE-2017-17969
Message-ID: <20200412113302.C430A8E657@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0c0c7b75d14369e5ac152851e496cb1dc08edfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/p7zip/0002-CVE-2017-17969.patch | 37 +++++++++++++++++++++++++++++++++
 package/p7zip/p7zip.mk                  |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/package/p7zip/0002-CVE-2017-17969.patch b/package/p7zip/0002-CVE-2017-17969.patch
new file mode 100644
index 0000000000..9198127cb9
--- /dev/null
+++ b/package/p7zip/0002-CVE-2017-17969.patch
@@ -0,0 +1,37 @@
+From: =?utf-8?q?Antoine_Beaupr=C3=A9?= <anarcat@debian.org>
+Date: Fri, 2 Feb 2018 11:11:41 +0100
+Subject: Heap-based buffer overflow in 7zip/Compress/ShrinkDecoder.cpp
+
+Origin: vendor, https://sourceforge.net/p/p7zip/bugs/_discuss/thread/0920f369/27d7/attachment/CVE-2017-17969.patch
+Forwarded: https://sourceforge.net/p/p7zip/bugs/_discuss/thread/0920f369/#27d7
+Bug: https://sourceforge.net/p/p7zip/bugs/204/
+Bug-Debian: https://bugs.debian.org/888297
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2017-17969
+Reviewed-by: Salvatore Bonaccorso <carnil@debian.org>
+Last-Update: 2018-02-01
+Applied-Upstream: 18.00-beta
+
+Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
+---
+ CPP/7zip/Compress/ShrinkDecoder.cpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/CPP/7zip/Compress/ShrinkDecoder.cpp b/CPP/7zip/Compress/ShrinkDecoder.cpp
+index 80b7e67..ca37764 100644
+--- a/CPP/7zip/Compress/ShrinkDecoder.cpp
++++ b/CPP/7zip/Compress/ShrinkDecoder.cpp
+@@ -121,8 +121,13 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
+     {
+       _stack[i++] = _suffixes[cur];
+       cur = _parents[cur];
++      if (cur >= kNumItems || i >= kNumItems)
++        break;
+     }
+-    
++
++    if (cur >= kNumItems || i >= kNumItems)
++      break;
++
+     _stack[i++] = (Byte)cur;
+     lastChar2 = (Byte)cur;
+ 
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 66d3198c17..be95995bab 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -12,6 +12,8 @@ P7ZIP_LICENSE_FILES = DOC/License.txt
 
 # 0001-CVE-2016-9296.patch
 P7ZIP_IGNORE_CVES += CVE-2016-9296
+# 0002-CVE-2017-17969.patch
+P7ZIP_IGNORE_CVES += CVE-2017-17969
 
 # p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
 # CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
