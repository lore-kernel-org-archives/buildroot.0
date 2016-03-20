From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:26:30 +0100
Subject: [Buildroot] [git commit] package/luajit: build host variant
	dynamically
Message-ID: <20160320213438.BF85E817FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ba8d1cce4ab00307827083bae234d87b37fb967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While building libevas.so for the host-efl with luajit support, the link fail
when libluajit is build statically:

/usr/bin/ld: output/host/usr/lib/libluajit-5.1.a(ljamalg.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
output/host/usr/lib/libluajit-5.1.a: error adding symbols: Bad value
collect2: error: ld returned 1 exit status

Build luajit dynamically in order to build host-efl with luajit support.

Also, passing HOST_LDFLAGS is needed so that a proper rpath is added
to the resulting binaries. Note that it is expected to have
HOST_LDFLAGS assigned to TARGET_LDFLAGS, it's just that luajit has a
somewhat non-conventional naming of variables. This is needed to avoid
the following error from the rpath sanity check:

***
*** ERROR: package host-luajit installs executables without proper RPATH:
***   output/host/usr/bin/luajit

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/luajit.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index d45598e..322d203 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -64,8 +64,11 @@ define LUAJIT_INSTALL_SYMLINK
 endef
 LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 
+# host-efl package needs host-luajit to be linked dynamically.
 define HOST_LUAJIT_BUILD_CMDS
-	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
+	$(MAKE) PREFIX="/usr" BUILDMODE=dynamic \
+		TARGET_LDFLAGS="$(HOST_LDFLAGS)" \
+		-C $(@D) amalg
 endef
 
 define HOST_LUAJIT_INSTALL_CMDS
