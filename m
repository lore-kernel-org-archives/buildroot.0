From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 16:56:49 +0100
Subject: [Buildroot] [git commit] package/pkgconf: bump to 1.5.3,
 change upstream
Message-ID: <20181209155304.86B7F86D66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e423669399ad8389edd81761ea5c9cc26bf312d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pkgconf project now has a website at pkgconf.org, and hosts its
tarballs at https://distfiles.dereferenced.org/pkgconf/, so this
commit updates the upstream location, and uses the xz-compressed
tarball as well.

pkgconf is bumped to 1.5.3. What prompted this update is the fact that
GStreamer uses the --define-prefix option when calling pkg-config, and
this option didn't exist in pkgconf 0.9.2.

The patch 0001-Fix-all-variables-sysroot-prefix-problem.patch is
dropped, because pkgconf now behaves properly, by prefixing all paths
with the sysroot. This has been verified by testing libdir and
includedir in zlib.pc, and adding some dummy pkgdatadir, mapdir and
sdkdir variables:

$ cat staging/usr/lib/pkgconfig/zlib.pc
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
sharedlibdir=${libdir}
includedir=${prefix}/include
pkgdatadir=${prefix}/pouet
mapdir=${prefix}/this/is/map/dir
sdkdir=${prefix}/this/is/sdk/dir
[...]

$ ./host/bin/pkg-config --variable=libdir zlib
./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
$ ./host/bin/pkg-config --variable=includedir zlib
./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
$ ./host/bin/pkg-config --variable=mapdir zlib
./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/this/is/map/dir
$ ./host/bin/pkg-config --variable=sdkdir zlib
./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/this/is/sdk/dir
$ ./host/bin/pkg-config --variable=pkgdatadir zlib
./host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/pouet

So, the 0001-Fix-all-variables-sysroot-prefix-problem patch is no
longer necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Fix-all-variables-sysroot-prefix-problem.patch | 64 ----------------------
 package/pkgconf/Config.in                          |  2 +-
 package/pkgconf/pkgconf.hash                       |  2 +-
 package/pkgconf/pkgconf.mk                         |  6 +-
 4 files changed, 5 insertions(+), 69 deletions(-)

diff --git a/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
deleted file mode 100644
index bc2b5273cd..0000000000
--- a/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From aa6bbc09e68426592faf722630fe92b6ede75bc8 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 2 Nov 2015 18:38:00 -0300
-Subject: [PATCH] Fix all-variables sysroot prefix problem
-
-According to the pkg-config specifications (or rather documentation)
-only the -L/-I directory entries should be sysroot-prefixed.
-
-We also need to prefix the mapdir/sdkdir variables since they're used by
-xorg and expected that way.
-
-Also allow prefixing for includedir and libdir since in some silly cases
-the directories may be requested barebones via pkg-config
---variable=includedir libfool for example.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-Added pkgdatadir to the list of to-be-prefixed variables.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- main.c | 19 ++++++++++++++-----
- 1 file changed, 14 insertions(+), 5 deletions(-)
-
-diff --git a/main.c b/main.c
-index 6947126..ce5e18f 100644
---- a/main.c
-+++ b/main.c
-@@ -313,9 +313,13 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
- 			memset(req->buf, 0, sizeof(req->buf));
- 
- 			if (*var == '/' && (flags & PKGF_MUNGE_SYSROOT_PREFIX) &&
--			    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))))
--				strlcat(req->buf, sysroot_dir, sizeof(req->buf));
--
-+			    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))) &&
-+			    	(!strcmp(req->variable, "includedir") || \
-+				    !strcmp(req->variable, "libdir") || \
-+				    !strcmp(req->variable, "mapdir") || \
-+				    !strcmp(req->variable, "pkgdatadir") || \
-+				    !strcmp(req->variable, "sdkdir")))
-+					strlcat(req->buf, sysroot_dir, sizeof(req->buf));
- 			strlcat(req->buf, var, sizeof(req->buf));
- 			return;
- 		}
-@@ -323,8 +327,13 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
- 		strlcat(req->buf, " ", sizeof(req->buf));
- 
- 		if (*var == '/' && (flags & PKGF_MUNGE_SYSROOT_PREFIX) &&
--		    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))))
--			strlcat(req->buf, sysroot_dir, sizeof(req->buf));
-+		    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))) &&
-+		    	(!strcmp(req->variable, "includedir") || \
-+			    !strcmp(req->variable, "libdir") || \
-+			    !strcmp(req->variable, "mapdir") || \
-+			    !strcmp(req->variable, "pkgdatadir") || \
-+			    !strcmp(req->variable, "sdkdir")))
-+				strlcat(req->buf, sysroot_dir, sizeof(req->buf));
- 
- 		strlcat(req->buf, var, sizeof(req->buf));
- 	}
--- 
-2.4.10
-
diff --git a/package/pkgconf/Config.in b/package/pkgconf/Config.in
index 76fa394c94..a9c5658da9 100644
--- a/package/pkgconf/Config.in
+++ b/package/pkgconf/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_PKGCONF
 	  2011 to replace pkg-config, which now needs itself to build
 	  itself
 
-	  https://github.com/pkgconf/pkgconf
+	  http://pkgconf.org/
diff --git a/package/pkgconf/pkgconf.hash b/package/pkgconf/pkgconf.hash
index 79191bc94e..7ea7ff57a8 100644
--- a/package/pkgconf/pkgconf.hash
+++ b/package/pkgconf/pkgconf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7ec8b516e655e247f4ba976837cee808134785819ab8f538f652fe919cc6c09f	pkgconf-0.9.12.tar.bz2
+sha256	d3468308553c94389dadfd10c4d1067269052b5364276a9d24a643c88485f715	pkgconf-1.5.3.tar.xz
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 00b2d017ee..5352f5c962 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PKGCONF_VERSION = 0.9.12
-PKGCONF_SITE = https://github.com/pkgconf/pkgconf/releases/download/pkgconf-$(PKGCONF_VERSION)
-PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
+PKGCONF_VERSION = 1.5.3
+PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf/
+PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 
