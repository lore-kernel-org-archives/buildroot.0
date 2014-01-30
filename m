From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 30 Jan 2014 23:14:58 +0100
Subject: [Buildroot] [PATCH 1/3] infozip: fix $(AS) behavior
Message-ID: <1391120098-8325-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

infozip's Makefile expect $(AS) to output by default to <basename>.o
but when called from Buildroot, the value for $(AS) is set
to to invoke the toolchain's $(AS) directly, and the output of it
goes to a.out.

So, define $(AS) with $(CC -c)

Reported-by: ?????? ??????? <lucenko_kirill@mail.ru>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/infozip/infozip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index d73edd4..cc2bd34 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -11,7 +11,7 @@ INFOZIP_LICENSE = Info-ZIP
 INFOZIP_LICENSE_FILES = LICENSE
 
 define INFOZIP_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile generic
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) AS="$(TARGET_CC) -c" -f unix/Makefile generic
 endef
 
 define INFOZIP_INSTALL_TARGET_CMDS
-- 
1.8.5.3
