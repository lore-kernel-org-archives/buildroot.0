From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Feb 2014 22:42:40 +0100
Subject: [Buildroot] [PATCH] libv4l: fix build on AArch64
Message-ID: <1392932560-26817-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AArch64 does not implement the SYS_open system call, but only the
SYS_openat system call, as should be done for all modern architectures
merged into the Linux kernel. This causes problems when building
libv4l 0.8.9, which are fixed by integrating an upstream patch,
available in a more recent version of libv4l. Backporting the patch is
preferred over bumping libv4l, as libv4l has a fairly large number of
reverse dependencies, and we don't want to break anything that close
to the release.

Note that this commit also renames the existing libv4l-largefile.patch
to libv4l-01-largefile.patch in order to comply with the Buildroot
patch naming scheme, and guarantee the order in which patches are
applied.

Fixes:

  http://autobuild.buildroot.org/results/ed6/ed66792e332ee0256a17f98cbe21dfcfe6e8743b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...l-largefile.patch => libv4l-01-largefile.patch} |  0
 .../libv4l-02-use-openat-when-available.patch      | 34 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 rename package/libv4l/{libv4l-largefile.patch => libv4l-01-largefile.patch} (100%)
 create mode 100644 package/libv4l/libv4l-02-use-openat-when-available.patch

diff --git a/package/libv4l/libv4l-largefile.patch b/package/libv4l/libv4l-01-largefile.patch
similarity index 100%
rename from package/libv4l/libv4l-largefile.patch
rename to package/libv4l/libv4l-01-largefile.patch
diff --git a/package/libv4l/libv4l-02-use-openat-when-available.patch b/package/libv4l/libv4l-02-use-openat-when-available.patch
new file mode 100644
index 0000000..756733e
--- /dev/null
+++ b/package/libv4l/libv4l-02-use-openat-when-available.patch
@@ -0,0 +1,34 @@
+From: Riku Voipio <riku.voipio@linaro.org>
+Date: Tue, 22 Jan 2013 15:37:22 +0000 (-0300)
+Subject: v4l-utils: use openat when available
+X-Git-Tag: v4l-utils-0.9.4~61
+X-Git-Url: http://git.linuxtv.org
+
+v4l-utils: use openat when available
+
+New architectures such as 64-Bit arm build kernels without legacy
+system calls - Such as the the no-at system calls. Thus, use
+SYS_openat whenever it is available.
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+---
+
+diff --git a/lib/libv4lconvert/libv4lsyscall-priv.h b/lib/libv4lconvert/libv4lsyscall-priv.h
+index 2dac49a..cdd38bc 100644
+--- a/lib/libv4lconvert/libv4lsyscall-priv.h
++++ b/lib/libv4lconvert/libv4lsyscall-priv.h
+@@ -72,8 +72,13 @@ typedef off_t __off_t;
+ 
+ #ifndef CONFIG_SYS_WRAPPER
+ 
++#ifdef SYS_openat
++#define SYS_OPEN(file, oflag, mode) \
++	syscall(SYS_openat, AT_FDCWD, (const char *)(file), (int)(oflag), (mode_t)(mode))
++#else
+ #define SYS_OPEN(file, oflag, mode) \
+ 	syscall(SYS_open, (const char *)(file), (int)(oflag), (mode_t)(mode))
++#endif
+ #define SYS_CLOSE(fd) \
+ 	syscall(SYS_close, (int)(fd))
+ #define SYS_IOCTL(fd, cmd, arg) \
-- 
1.8.3.2
