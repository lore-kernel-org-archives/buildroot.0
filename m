From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 Jan 2020 20:50:26 +0100
Subject: [Buildroot] [PATCH v1] boot/barebox: fix target bareboxenv command
 compile
Message-ID: <20200107195026.25413-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The buildroot custom bareboxenv compile command
needs the additional include path 'scripts/include'
to gain access to the local copy of the kernel header
files.

Fixes (with BR2_TARGET_BAREBOX_BAREBOXENV enabled):

  build/barebox-2019.12.0/scripts/bareboxenv.c:100:10: fatal error: linux/list.h: No such file or directory

Reported-by: Frederick Gotham <cauldwell.thomas@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 boot/barebox/barebox.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 52178d89c8..67fd125578 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -82,7 +82,8 @@ $(1)_KCONFIG_DEPENDENCIES = \
 
 ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
 define $(1)_BUILD_BAREBOXENV_CMDS
-	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
+	$$(TARGET_CC) $$(TARGET_CFLAGS) -I$$(@D)/scripts/include \
+		$$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
 		$$(@D)/scripts/bareboxenv.c
 endef
 endif
-- 
2.24.1
