From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Mar 2019 22:36:07 +0100
Subject: [Buildroot] [git commit] Revert "package/libsoxr: add avutil to
 soxr.pc"
Message-ID: <20190304213419.404F5837F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb271e9d188b336c2238421061e97003dcc98665
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit d81870ae8129389a62df80c9c8c9165d334b6921.

The patch attempts to fix static linking with libsoxr when it build with
avutils. The `Libs.private` field should not contain the full absolute path to
the static library, but only the link flags for private libraries, e.g
`-lm`.

Buildroots pkg-config prepends the sysroot to the value found in `Libs.private`
resulting in a malformed linker flag if libavutil is found:

```
-L/home/test/autobuild/run/instance-3/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lsoxr
/home/test/autobuild/run/instance-3/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/home/test/autobuild/run/instance-3/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libavutil.a
```

.. or if libavutils is not found:

```
-L/home/test/autobuild/run/instance-1/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lsoxr AVUTIL_LIBRARIES-NOTFOUND
```

Revert this commit and replace the patch by a follow-up patch which only
adds `-lavutil` to `Libs.private` in case it is found and used by
libsoxr.

Fixes:
http://autobuild.buildroot.net/results/6eb4e2c9bd3884ab0152ddf873c20e62f0941181/
http://autobuild.buildroot.net/results/07207b0a58a08bf7c2cb78345a58244b5e6aab0e/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-soxr.pc.in-add-avutil-libraries.patch     | 33 ----------------------
 1 file changed, 33 deletions(-)

diff --git a/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch b/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch
deleted file mode 100644
index c36988a77e..0000000000
--- a/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8c1edfc22f8b714062b149e3d80ab4357a1a4e49 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 22 Nov 2018 19:10:03 +0100
-Subject: [PATCH] soxr.pc.in: add avutil libraries
-
-Add ${AVUTIL_LIBRARIES} to soxr.pc.in so applications such as
-shairport-sync will know that they must link with -lavutil when
-building statically
-
-Fixes:
- - http://autobuild.buildroot.org/results/839c0ce6475accc1de7e8a180d4358edb6750c64
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://sourceforge.net/p/soxr/code/merge-requests/2]
-[Thomas: move to Libs.private.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/soxr.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/soxr.pc.in b/src/soxr.pc.in
-index 69d225b..ed212a8 100644
---- a/src/soxr.pc.in
-+++ b/src/soxr.pc.in
-@@ -2,4 +2,5 @@ Name: ${PROJECT_NAME}
- Description: ${DESCRIPTION_SUMMARY}
- Version: ${PROJECT_VERSION}
- Libs: -L${LIB_INSTALL_DIR} -l${PROJECT_NAME}
-+Libs.private: ${AVUTIL_LIBRARIES}
- Cflags: -I${INCLUDE_INSTALL_DIR}
--- 
-2.19.1
-
