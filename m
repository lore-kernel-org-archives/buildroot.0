From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jul 2013 09:52:11 -0300
Subject: [Buildroot] [PATCH 5/9] uclibc: use builtin startfiles target
In-Reply-To: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374324735-2286-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we've dropped 0.9.31.x we can use the startfiles /
install_startfiles targets instead of building and installing them by
hand.
Fixes internal blackfin toolchain build errors regarding crtreloc.o

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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
-- 
1.8.1.5
