From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 07:47:55 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/shairport-sync:
 add upstream patch to fix build issue with soxr
Message-ID: <20180829055816.7E917815FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72f10180f5cbc6f4f3914e4a142d25e13c322f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Add upstream patch to fix build issue detected by the Buildroot autobuilder:

```
arm-buildroot-linux-uclibcgnueabi/sysroot/usr//lib/libsoxr.a(soxr.c.o): In function `soxr_create':
soxr.c:(.text+0xd4c): undefined reference to `av_get_cpu_flags'
collect2: error: ld returned 1 exit status
```

A quick look at the soxr source code shows that `soxr_create()` might use
`av_get_cpu_flags()` depending on the architecture.

For the sake of simplicity link with `-lavutil` if it is found when using soxr.

Even better, as soxr provides a pkg-config file, this should be prefered.

Upstream issue: https://github.com/mikebrady/shairport-sync/issues/733
Upstream status: 5101ab2d13e2b89ea3c1276df5fb7413634eeccd

Fixes:
http://autobuild.buildroot.net/results/53d/53d21686780aa2485745b59e812b6280dd39f1c5
http://autobuild.buildroot.net/results/605/60576363adfca404c3a7883d5d46e8a4a9ee8171
http://autobuild.buildroot.net/results/806/806867ab1c6f42ad1b34d44844efc57272d48235
http://autobuild.buildroot.net/results/840/840810601fbb8a7957ea9dae175b959a7f9b7491
.. and more.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e047dee241fe0660d92311a124757065c6c4c93d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...mes-libsoxr-is-built-to-rely-on-libavutil.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch b/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch
new file mode 100644
index 0000000000..32c52add33
--- /dev/null
+++ b/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch
@@ -0,0 +1,63 @@
+From 5101ab2d13e2b89ea3c1276df5fb7413634eeccd Mon Sep 17 00:00:00 2001
+From: Mike Brady <mikebrady@eircom.net>
+Date: Sat, 25 Aug 2018 13:08:37 +0100
+Subject: [PATCH] Sometimes libsoxr is built to rely on libavutil. If libavutil
+ is detected, link to it when building libsoxr. Add pgk_config support to soxr
+ selection.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The Buildroot autobuilder detected a build issue [0] when building
+shairport-sync statically:
+
+```
+arm-buildroot-linux-uclibcgnueabi/sysroot/usr//lib/libsoxr.a(soxr.c.o): In function `soxr_create':
+soxr.c:(.text+0xd4c): undefined reference to `av_get_cpu_flags'
+collect2: error: ld returned 1 exit status
+```
+
+A quick look at the soxr source code shows that `soxr_create()` might use
+`av_get_cpu_flags()` depending on the architecture.
+
+For the sake of simplicity link with `-lavutil` if it is found when using soxr.
+
+Even better, as soxr provides a pkg-config file, this should be prefered.
+
+[0] http://autobuild.buildroot.org/results/53d/53d21686780aa2485745b59e812b6280dd39f1c5
+
+Upstream status: 5101ab2d13e2b89ea3c1276df5fb7413634eeccd
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0c917a4..2b6fddb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -176,7 +176,20 @@ AC_ARG_WITH(ssl, [ choose --with-ssl=openssl, --with-ssl=mbedtls or --with-ssl=p
+ # Look for soxr flag
+ AC_ARG_WITH(soxr, [  --with-soxr = choose libsoxr for high-quality interpolation], [
+   AC_MSG_RESULT(>>Including support for soxr-based interpolation)
+-  AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!))], )
++  if  test "x${with_pkg_config}" = xyes ; then
++    PKG_CHECK_MODULES(
++        [SOXR], [soxr],
++        [LIBS="${SOXR_LIBS} ${LIBS}"])
++  else
++    AC_CHECK_LIB([avutil],[av_get_cpu_flags])
++    if  test "x${ac_cv_lib_avutil_av_get_cpu_flags}" = xyes ; then
++      # soxr may link against libavutil, depending on the architecture, but for the sake of simplicity link with it if it is found
++      AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!), [-lavutil])
++    else
++      AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!))
++    fi
++  fi
++], )
+ 
+ # Look for metadata flag -- set flag for conditional compilation
+ AC_ARG_WITH(metadata, [  --with-metadata = include support for a metadata feed], [
+-- 
+2.18.0
