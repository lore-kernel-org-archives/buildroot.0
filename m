From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 23:59:38 +0200
Subject: [Buildroot] [git commit] package/hidapi: depends on NPTL threads
Message-ID: <20160806220034.D7FA9819B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=023bba7797132713c9e656cd45846596a2b16bf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hidapi use NPTL threads functions like pthread_barrier_wait() and
pthread_barrier_destroy(). So the dependency on threads support
doesn't come from libusb package but by hidapi itself.

Fixes:
[microblaze]
http://autobuild.buildroot.net/results/f7e/f7e778562aa1a65ba46f3b2f705d13ace8870805
[m68k]
http://autobuild.buildroot.net/results/2ec/2ecd240ccb15de76017942a8960faac6b3f973b4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hidapi/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 5119aac..f6a31ba 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HIDAPI
 	bool "hidapi"
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -12,5 +12,5 @@ config BR2_PACKAGE_HIDAPI
 
 	  http://www.signal11.us/oss/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
+comment "hidapi needs udev /dev management and a toolchain w/ NPTL threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
