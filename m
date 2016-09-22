From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 22 Sep 2016 22:48:20 +0300
Subject: [Buildroot] [PATCH] qt5: Disable pkg-config usage for cross-building
Message-ID: <1474573700-22730-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some Qt sub-projects use pkg-config to recover compiler and linker
flags. Among other things include paths will be pulled in CFLAGS.

What's interesting Qt tries to play smart and convert include
paths from simple "-I" to "-isystem" if they match ones returned by [1]
---------------------------->8---------------------------
XXX/output/host/usr/bin/yyy-buildroot-linux-g++
--sysroot=XXX/output/host/usr/yyy-buildroot-linux/sysroot
-pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Os  -xc++ -E -v - < /dev/null
---------------------------->8---------------------------

Most probably that [2] was done to mute tons of warnings generated for
"system" headers. But commit message gives no hint here :(

So Qt's subprojects [and 3-rd party apps written on Qt] may end-up
having "-system ZZZ" in their Makefile. That's all right until an
application wants to use an STL header that includes for example
"stdlib.h" with gcc 6.x, see what happens then [3].

That fixes building of Qt5Webkit on ARM with gcc 6.x, see [4].

[1] http://code.qt.io/cgit/qt/qtbase.git/tree/configure?h=5.6.1#n3660
[2] http://code.qt.io/cgit/qt/qtbase.git/commit?id=0b144bc76a368ecc6c5c1121a1b51e888a0621ac
[3] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129
[4] http://lists.busybox.net/pipermail/buildroot/2016-September/172666.html

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qt5/qt5base/qt5base.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bf541b0..2c52e2c 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -26,6 +26,7 @@ QT5BASE_CONFIGURE_OPTS += \
 	-system-zlib \
 	-system-pcre \
 	-no-pch \
+	-no-pkg-config \
 	-shared
 
 # Uses libgbm from mesa3d
-- 
2.7.4
