From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:36:36 +0200
Subject: [Buildroot] [git commit] package/glibc: allow to specify host-make
Message-ID: <20180908213619.64C2083774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d1964b9221990d088a9ff2f225834ccba34e47f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use host-make package if GNU make from the host machine is too old.

Use the newly introduced BR2_MAKE_HOST_DEPENDENCY and BR2_MAKE to
provide respectively, host-make dependency and the path to the GNU
make binary to use for building glibc.

Fixes:
http://autobuild.buildroot.net/results/576/5760ea2635d9aecc9c789494a8b2cc73a1af1ceb
http://autobuild.buildroot.net/results/583/58347b94884eee2db28740486eda280e8c08e22f
http://autobuild.buildroot.net/results/dc7/dc7c8cd548409864ab0055e196c0280457a5fb5f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 399cf395ce..a2eb8714b1 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,7 +28,12 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # Before glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
-GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk
+GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
+	$(BR2_MAKE_HOST_DEPENDENCY)
+
+# glibc requires make >= 4.0 since 2.28 release.
+# https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
+GLIBC_MAKE = $(BR2_MAKE)
 
 GLIBC_SUBDIR = build
 
