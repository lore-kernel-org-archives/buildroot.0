From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 12:18:00 +0200
Subject: [Buildroot] [git commit] util-linux: fix host build when ncurses is
	not installed
Message-ID: <20161026102005.1E7E681E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=679e133bfd6ec062659bb8cfe09b593e8081fef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lib/colors.c uses HAVE_LIBTINFO to decide whether term.h and ncurses.h
should be included. However, the configure.ac check is bogus: it
checks for tinfo using pkg-config, and then if it fails, checks with
AC_CHECK_LIB(). So, if you have tinfo installed, but not the
corresponding development package, the pkg-config test will fail, but
the AC_CHECK_LIB test will succeed, even though the headers are not
available.

To address this, we explicitly tell host-util-linux that tinfo is not
available, like we're already doing for ncurses.

Fixes:

  http://autobuild.buildroot.net/results/3c447e601a7b728860e78cabf2191ab206e6480d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index bd6508c..cf03fd4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -133,7 +133,8 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--enable-libblkid \
 	--enable-libmount \
 	--enable-libuuid \
-	--without-ncurses
+	--without-ncurses \
+	--without-tinfo
 
 ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
 HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
