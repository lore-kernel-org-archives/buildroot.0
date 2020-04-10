From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Fri, 10 Apr 2020 19:31:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/p7zip: fix CVE-2017-17969
In-Reply-To: <20200410173118.21538-1-nerv@dawncrow.de>
References: <20200410173118.21538-1-nerv@dawncrow.de>
Message-ID: <20200410173118.21538-2-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/p7zip/0002-CVE-2017-17969.patch | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/p7zip/0002-CVE-2017-17969.patch

diff --git a/package/p7zip/0002-CVE-2017-17969.patch b/package/p7zip/0002-CVE-2017-17969.patch
new file mode 100644
index 0000000000..a9787c4a90
--- /dev/null
+++ b/package/p7zip/0002-CVE-2017-17969.patch
@@ -0,0 +1,35 @@
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
-- 
2.17.1
