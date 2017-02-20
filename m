From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:18:23 +0100
Subject: [Buildroot] [git commit] bctoolbox: add patch to fix static linking
Message-ID: <20170220212444.EDF368006A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec52c7427f1a122250a883996c2377e311864542
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static linking with bctoolbox fails when using pkg-config as the
generated bctoolbox.pc file only consists of an '-L' string without any
search path or libraries flags:

```
libtool: link: need path for `-L' option
```

That's because of an typo in mbedtls_library_path. However,
mbedtls_library_path contains a string of the mbedtls libraries
concatenated by an ';' which cannot be parsed by pkg-config.

Therefore, use MBEDTLS_LIBRARY instead of MBEDTLS_LIBRARIES to get
the library path.

Furthermore, add the three mbedtls libraries mbedtls, mbedcrypto, and
mbedx509 to LIBS_PRIVATE so these libraries are added to the
Libs.private field of bctoolbox.pc.

Fixes:
http://autobuild.buildroot.net/results/37d5625df4be11ccdc063871e9f6e13d5f59fb52
http://autobuild.buildroot.net/results/1999c841fae41f860f00747a362327cb2857e687
.. and many more.

Upstream status: Pending
https://github.com/BelledonneCommunications/bctoolbox/pull/4

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-Libs.private-flags-for-mbedtls.patch  | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch b/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
new file mode 100644
index 0000000..a70c7c6
--- /dev/null
+++ b/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
@@ -0,0 +1,49 @@
+From c0b3dbb43aa3a38c47311556c85eadc6072e2d68 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 14 Feb 2017 22:02:26 +0100
+Subject: [PATCH] Fix Libs.private flags for mbedtls
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Static linking with bctoolbox fails when using pkg-config as the
+generated bctoolbox.pc file only consists of an '-L' string without any
+search path or libraries flags.
+
+That's because of an typo in `mbedtls_library_path`. However,
+`mbedtls_library_path` contains a string of the mbedtls libraries
+concatenated by an ';' which cannot be parsed by pkg-config.
+
+Therefore, use `MBEDTLS_LIBRARY` instead of `MBEDTLS_LIBRARIES` to get
+the library path.
+
+Furthermore, add the three mbedtls libraries *mbedtls*, *mbedcrypto*, and
+*mbedx509* to `LIBS_PRIVATE` so these libraries are added to the
+`Libs.private` field of bctoolbox.pc.
+
+Upstream status: Pending
+https://github.com/BelledonneCommunications/bctoolbox/pull/4
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ed7aa00..4127f0e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -103,8 +103,8 @@ else()
+ endif()
+ 
+ if(MBEDTLS_FOUND)
+-	get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARIES}" PATH)
+-	set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedlts_library_path}")
++	get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARY}" PATH)
++	set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedtls_library_path} -lmbedtls -lmbedcrypto -lmbedx509")
+ endif()
+ if(POLARSSL_FOUND)
+ 	get_filename_component(polarssl_library_path "${POLARSSL_LIBRARIES}" PATH)
+-- 
+2.11.1
+
