From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:41 +0200
Subject: [Buildroot] [git commit] uclibc: use builtin startfiles target
Message-ID: <20130727141206.606679AC10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7c246f64d96b257ec21efe0825235c2cd3e4937
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we've dropped 0.9.31.x we can use the startfiles /
install_startfiles targets instead of building and installing them by
hand.
Fixes internal blackfin toolchain build errors regarding crtreloc.o

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 4a37fa0..efe00a6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -409,13 +409,12 @@ define UCLIBC_CONFIGURE_CMDS
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(STAGING_DIR) \
-		headers lib/crt1.o lib/crti.o lib/crtn.o \
-		install_headers
+		headers startfiles \
+		install_headers install_startfiles
 	$(TARGET_CROSS)gcc -nostdlib \
 		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
 	$(TARGET_CROSS)gcc -nostdlib \
 		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so
-	cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(STAGING_DIR)/usr/lib/
 endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
