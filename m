From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Feb 2020 17:40:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix build with expat
Message-ID: <20200214164036.2901160-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with expat fails since January 14th (for an unknown reason as
commit cd16e18584066d2817d3acb3822e173f9f23455e does not seem to be the
culprit even if this is the more suspicious commit around that time) on:

/usr/bin/gcc -L/home/buildroot/autobuild/instance-0/output-1/host/lib -Wl,-rpath,/home/buildroot/autobuild/instance-0/output-1/host/lib -Wl,-export-dynamic -o tbl2hex tbl2hex.build.o program.build.o pgmpath_none.build.o pid.build.o options.build.o params_none.build.o log.build.o log_history.build.o addresses.build.o file.build.o device.build.o parse.build.o variables.build.o datafile.build.o unicode.build.o charset.build.o charset_none.build.o timing.build.o async_handle.build.o async_data.build.o async_wait.build.o async_alarm.build.o async_task.build.o async_io.build.o async_event.build.o async_signal.build.o thread.build.o queue.build.o lock.build.o dynld_none.build.o ports_none.build.o system_linux.build.o hostcmd.build.o hostcmd_none.build.o dataarea.build.o ttb_compile.build.o ttb_native.build.o atb_compile.build.o ctb_compile.build.o cldr.build.o -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lexpat    -lp
 thread
/usr/bin/ld: skipping incompatible /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.so when searching for -lc
/usr/bin/ld: skipping incompatible /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a when searching for -lc
async_signal.build.o: In function `setSignalMask':
async_signal.c:(.text+0xa5): undefined reference to `pthread_sigmask'

This is due to EXPAT_LIBS_FOR_BUILD being retrieved by pkg-config and
set to
-L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lexpat
which is obviously wrong for a host program
As there is no easy way to fix the pkg-config call, just set
EXPAT_LIBS_FOR_BUILD to -lexpat

An other option would be to replace pkgconfig_flags_libs="--libs" by
pkgconfig_flags_libs="--libs-only-l" in configure.ac

Fixes:
 - http://autobuild.buildroot.org/results/7b89404dd84a337906d2fd4b22d7564fecf4fbf8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brltty/brltty.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 11b8c0d35f..001f4cbb9f 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -53,6 +53,9 @@ endif
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 # host-expat is needed by tbl2hex's host program
 BRLTTY_DEPENDENCIES += host-expat expat
+# Set EXPAT_LIBS_FOR_BUILD otherwise -L$(STAGING_DIR)/usr/lib -lexpat will be
+# retrieved which is incorrect for a host program and will raise a build failure
+BRLTTY_MAKE_OPTS += EXPAT_LIBS_FOR_BUILD=-lexpat
 BRLTTY_CONF_OPTS += --enable-expat
 else
 BRLTTY_CONF_OPTS += --disable-expat
-- 
2.24.1
