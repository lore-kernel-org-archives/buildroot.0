From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 19 Feb 2017 16:00:12 +0100
Subject: [Buildroot] [PATCH 1/2] wavpack: fetch upstream patch to remove
	wchar dependency
Message-ID: <20170219150013.11728-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent bump to version 5.1.0 added a dependency on wchar:

```
import_id3.c:37:34: error: unknown type name 'wchar_t'
```

This issue has been reported upstream [1] and a fix was commited by
upstream to remove the wchar dependency [2].

Fixes:
http://autobuild.buildroot.net/results/9a6/9a693f5b798571917f36cfb7661e2f2638aac550/
http://autobuild.buildroot.net/results/44c/44c8227043045baf4f043da44b8129e43dfff687/
http://autobuild.buildroot.net/results/a80/a80221dcc0860046ebdf0bbf454e056b1e20df83/
.. and more.

The build was successfully tested with the 'br-arm-basic-2017.02-rc1-2-g133c5ac'
toolchain.

[1] https://github.com/dbry/WavPack/issues/19
[2] https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c5252f5f31abd1f

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/wavpack/wavpack.hash | 1 +
 package/wavpack/wavpack.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 56ba7d839..16ff08cc6 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,2 +1,3 @@
 # locally computed hash
 sha256  1939627d5358d1da62bc6158d63f7ed12905552f3a799c799ee90296a7612944  wavpack-5.1.0.tar.bz2
+sha256  3890ab081dc6f8ee02161ace180381327031cc24cc6c3d71668367b7e5f6e4be  876fc3f3907e871d0938ac6c8c5252f5f31abd1f.patch
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index daa0888df..a61350623 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -12,6 +12,9 @@ WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 WAVPACK_LICENSE = BSD-3c
 WAVPACK_LICENSE_FILES = COPYING
 
+# Fetch patch from upstream to remove wchar dependency
+WAVPACK_PATCH = https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c5252f5f31abd1f.patch
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
 endif
-- 
2.11.1
