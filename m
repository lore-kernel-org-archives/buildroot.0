From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  8 Mar 2016 22:48:12 +0100
Subject: [Buildroot] [PATCH v2 1/2] help: add a way to document targets
	declared in local.mk/external.mk
Message-ID: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is handy to use local.mk or external.mk to add specific targets
for current project. However, until now, it not possible to add help
message these targets.
This patch add EXTRA_HELP variable. This variable is aimed to be assigned
from any .mk files. Its content is displayed with 'make help'.

For exemple:
  EXTRA_HELP += "flash                  - Flash target"
  EXTRA_HELP += "chroot                 - Chroot into target/"
  EXTRA_HELP += "qemu                   - Run image with qemu"
  EXTRA_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
  EXTRA_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
  EXTRA_HELP += "Please contact support at company.com in case of problem."

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
v2:
  - Rename LOCAL_HELP to EXTRA_HELP
  - Remove introduction lines (so, 'ifneq ($(LOCAL_HELP),)' is no more needed)

 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index f2822a2..1c9f63c 100644
--- a/Makefile
+++ b/Makefile
@@ -948,6 +948,7 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
 	@echo '  barebox-menuconfig     - Run barebox menuconfig'
 	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
 endif
+	@for i in $(EXTRA_HELP); do echo "  $$i"; done
 	@echo
 	@echo 'Documentation:'
 	@echo '  manual                 - build manual in all formats'
-- 
2.7.0
