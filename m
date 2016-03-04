From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Mar 2016 00:00:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/luajit: build host variant
	dynamically
Message-ID: <1457132443-15973-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While building libevas.so for the host-efl with luajit support, the link fail
when libluajit is build statically:

/usr/bin/ld: output/host/usr/lib/libluajit-5.1.a(ljamalg.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
output/host/usr/lib/libluajit-5.1.a: error adding symbols: Bad value
collect2: error: ld returned 1 exit status

Build luajit dynamically in order to build host-efl with luajit support.

Also we need to provide a rpath to HOST_DIR otherwise we hit the rpath sanity
check:

***
*** ERROR: package host-luajit installs executables without proper RPATH:
***   output/host/usr/bin/luajit

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/luajit/luajit.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index d45598e..791ef37 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -64,8 +64,11 @@ define LUAJIT_INSTALL_SYMLINK
 endef
 LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 
+# host-efl package needs host-luajit to be linked dynamically.
 define HOST_LUAJIT_BUILD_CMDS
-	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
+	$(MAKE) PREFIX="/usr" BUILDMODE=dynamic \
+		TARGET_LDFLAGS="$(HOST_LDFLAGS) -Wl,-rpath,$(HOST_DIR)/usr/lib/" \
+		-C $(@D) amalg
 endef
 
 define HOST_LUAJIT_INSTALL_CMDS
-- 
2.5.0
