From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri,  2 May 2014 16:59:24 +0200
Subject: [Buildroot] [PATCH] lsof: fix "'TCP_*' undeclared" build errors
In-Reply-To: <1399042764-22388-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1399042764-22388-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <1399042764-22388-2-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With some configurations, cross-building lsof results in the following errors:
  .../host/usr/bin/ccache .../host/usr/bin/arm-926ej_s_soft_float-linux-gnueabi-gcc  -DLINUXV=311010 -DHASIPv6 -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAS_STRFTIME -DLSOF_VSTR=\"3.11.10\" -I.../host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include   -pipe -O2  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64    -c -o dsock.o dsock.c
  dsock.c: In function 'build_IPstates':
  dsock.c:243:49: error: 'TCP_ESTABLISHED' undeclared (first use in this function)
  dsock.c:243:49: note: each undeclared identifier is reported only once for each function it appears in
  dsock.c:244:46: error: 'TCP_SYN_SENT' undeclared (first use in this function)
  dsock.c:245:46: error: 'TCP_SYN_RECV' undeclared (first use in this function)
  dsock.c:246:47: error: 'TCP_FIN_WAIT1' undeclared (first use in this function)
  dsock.c:247:47: error: 'TCP_FIN_WAIT2' undeclared (first use in this function)
  dsock.c:248:47: error: 'TCP_TIME_WAIT' undeclared (first use in this function)
  dsock.c:249:43: error: 'TCP_CLOSE' undeclared (first use in this function)
  dsock.c:250:48: error: 'TCP_CLOSE_WAIT' undeclared (first use in this function)
  dsock.c:251:46: error: 'TCP_LAST_ACK' undeclared (first use in this function)
  dsock.c:252:44: error: 'TCP_LISTEN' undeclared (first use in this function)
  dsock.c:253:45: error: 'TCP_CLOSING' undeclared (first use in this function)

These errors are caused by the glibc not being detected at configure time:
  Testing C library type with cc ... done
  Cannot determine C library type; assuming it is not glibc.

Changing the Configure file in order not to hide the output of the build of this
configure test shows that this is a build error:
  In file included from /usr/include/stdc-predef.h:30:0,
                   from <command-line>:0:
  .../host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/bits/predefs.h:20:3: error: #error "Never use <bits/predefs.h> directly; include <features.h> instead."
   # error "Never use <bits/predefs.h> directly; include <features.h> instead."
     ^

This is a conflict between the header files of the native toolchain on the build
machine and the header files of the cross-toolchain. lsof uses the native
toolchain by default to perform configure tests, even if cross-building. Since
this specific configure test only looks at the definitions in the header files
of the cross-toolchain, forcing the sysroot of the native toolchain to the one
of the cross-toolchain does the trick in order to avoid mixing header files. Of
course, not using the native toolchain for those configure tests would be the
best, but this simple change seems to be sufficient in the meantime.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 package/lsof/lsof.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index aa101e4..66d2133 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -47,7 +47,8 @@ endef
 define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" \
-		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 ./Configure linux)
+		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
+		LSOF_CC="cc --sysroot $(STAGING_DIR)" ./Configure linux)
 	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
 	$(LSOF_CONFIGURE_LOCALE_FIXUPS)
 endef
-- 
1.8.3.2
