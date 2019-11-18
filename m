From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:12:21 +0100
Subject: [Buildroot] [git commit] package/lsof: fix static build
Message-ID: <20191118210516.6946C8F20E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed8bfed70f009bdea8c3be4dc8c651e88343eb12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TARGET_LDFLAGS which contains -static is not passed so build fails on:

/home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o lsof dfile.o dmnt.o dnode.o dproc.o dsock.o dstore.o arg.o main.o misc.o node.o print.o proc.o store.o usage.o util.o -L./lib -llsof  -ltirpc
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_registered_FDE':
/home/buildroot/autobuild/instance-1/output-1/build/host-gcc-final-8.3.0/build/xtensa-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde.c:1040: undefined reference to `dl_iterate_phdr'
collect2: error: ld returned 1 exit status

Pass TARGET_LDFLAGS thanks to LSOF_CFGL

Fixes:
 - http://autobuild.buildroot.org/results/0c228e0d3ea1ff2d728ddc906e242d40ed973222

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsof/lsof.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 939df9dd8d..6aa829c2c0 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -33,7 +33,8 @@ define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" \
 		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
-		LINUX_CLIB=-DGLIBCV=2 ./Configure linux)
+		LINUX_CLIB=-DGLIBCV=2 LSOF_CFGL="$(TARGET_LDFLAGS)" \
+		./Configure linux)
 	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
 	$(LSOF_CONFIGURE_LOCALE_FIXUPS)
 endef
