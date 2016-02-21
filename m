From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:46:39 +0100
Subject: [Buildroot] [git commit] package/dvdauthor: add optional support
	for libfribidi
Message-ID: <20160221135332.D2DDB7FDC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be0dbb51ffe9c0beba31b9865aec4c078f98a18d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libfribidi was compiled before, dvdauthor will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/spumux | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libexpat.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libfontconfig.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libfreetype.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libfribidi.so.0]
[...]

The build system offers no option to en-/disable libfribidi support:
https://github.com/ldo/dvdauthor/blob/master/configure.ac#L83

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvdauthor/dvdauthor.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dvdauthor/dvdauthor.mk b/package/dvdauthor/dvdauthor.mk
index be006f1..6b90c43 100644
--- a/package/dvdauthor/dvdauthor.mk
+++ b/package/dvdauthor/dvdauthor.mk
@@ -34,6 +34,10 @@ ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 DVDAUTHOR_DEPENDENCIES += fontconfig
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+DVDAUTHOR_DEPENDENCIES += libfribidi
+endif
+
 ifeq ($(BR2_PACKAGE_DVDAUTHOR_DVDUNAUTHOR),y)
 DVDAUTHOR_DEPENDENCIES += libdvdread
 DVDAUTHOR_CONF_OPTS += --enable-dvdunauthor
