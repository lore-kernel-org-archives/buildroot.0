From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 14:50:10 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] file: explicitly disable
 libseccomp support for host
Message-ID: <20181021124840.CA7D888202@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26109e34c35377590dc7956df2665c7354f814d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes:
http://autobuild.buildroot.net/results/8a2/8a2ea2e4426416447705492237f526fc84b595d7/
http://autobuild.buildroot.net/results/a1f/a1f2369d31c2387efdec908877e0bcaa728b5aeb/

file-5.33 added optional seccomp support, but the filters did not cover all
needed syscalls, leading to errors when the freshly built host-file is
executed as part of the build on distributions with seccomp support (E.G.
Arch Linux):

checking for seccomp_init in -lseccomp... yes
..
../src/file -C -m magic
make[3]: *** [Makefile:764: magic.mgc] Bad system call

This has been fixed in file-5.34, but it anyway makes sense to explicitly
disable libseccomp support for consistency as we do not need it for the host
build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a609f83296a27f7677ba53ba40d60c9da21237a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 422e29b1ce..1f04dad688 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -12,6 +12,7 @@ FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
+HOST_FILE_CONF_OPTS = --disable-libseccomp
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 FILE_CONF_OPTS += --enable-libseccomp
