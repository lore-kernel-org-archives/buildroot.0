From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 16 Feb 2017 21:41:15 +0100
Subject: [Buildroot] [PATCH 1/2] wavpack: needs wchar support
Message-ID: <20170216204116.2212-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building wavpack using a toolchain without wchar support fails:

```
import_id3.c:37:34: error: unknown type name 'wchar_t'
```

Fixes:
http://autobuild.buildroot.net/results/9a6/9a693f5b798571917f36cfb7661e2f2638aac550/
http://autobuild.buildroot.net/results/44c/44c8227043045baf4f043da44b8129e43dfff687/
http://autobuild.buildroot.net/results/a80/a80221dcc0860046ebdf0bbf454e056b1e20df83/
.. and more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/wavpack/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wavpack/Config.in b/package/wavpack/Config.in
index 1ef3e420d..5a27b2e15 100644
--- a/package/wavpack/Config.in
+++ b/package/wavpack/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_WAVPACK
 	bool "wavpack"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  WavPack is a completely open audio compression format providing
 	  lossless, high-quality lossy, and a unique hybrid compression mode.
 
 	  http://www.wavpack.com/
+
+comment "wavpack needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
-- 
2.11.1
