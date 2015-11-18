From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 18 Nov 2015 15:37:00 +0100
Subject: [Buildroot] [PATCH 1/2] help: add a way to document targets
	declared in local.mk/external.mk
Message-ID: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is handy to use local.mk or external.mk to add specific targets
for current project. However, until now, it not possible to add help
message these targets.
This patch add LOCAL_HELP variable. This variable is aimed to be assigned
from any .mk files. Its content is displayed with 'make help'.

For exemple:
  LOCAL_HELP += "flash                  - Flash target"
  LOCAL_HELP += "chroot                 - Chroot into target/"
  LOCAL_HELP += "qemu                   - Run image with qemu"
  LOCAL_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
  LOCAL_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
  LOCAL_HELP += "Please contact support at company.com in case of problem."

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 80c264f..4322da9 100644
--- a/Makefile
+++ b/Makefile
@@ -901,6 +901,11 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
 	@echo '  barebox-menuconfig     - Run barebox menuconfig'
 	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
 endif
+ifneq ($(LOCAL_HELP),)
+	@echo
+	@echo 'Local targets:'
+	@for i in $(LOCAL_HELP); do echo "  $$i"; done
+endif
 	@echo
 	@echo 'Documentation:'
 	@echo '  manual                 - build manual in all formats'
-- 
2.1.4
