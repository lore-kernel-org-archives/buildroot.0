From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Feb 2017 07:37:45 +0200
Subject: [Buildroot] [PATCH next] usb_modeswitch_data: install packed
	database
Message-ID: <fbab82af999db5392fe2ae2f671531ff91f801b9.1488260265.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The packed databased is significantly smaller than the unpacked. The unpacked
database is made of hundreds of small files. So the benefit is larger
filesystems that allocate a minimum of block per file. Database packing adds
some overhead to every invocation of usb_modeswitch. This added overhead
should not be noticeable in practice since usb_modeswitch normally runs only
once per USB device insert event.

Before:

  du -h output/target/usr/share/usb_modeswitch/
  1.9M	output/target/usr/share/usb_modeswitch/

After:

  du -h output/target/usr/share/usb_modeswitch/
  20K	output/target/usr/share/usb_modeswitch/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/usb_modeswitch_data/usb_modeswitch_data.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 6d75b3198310..8373b6e2ca20 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -14,7 +14,7 @@ USB_MODESWITCH_DATA_LICENSE_FILES = COPYING
 # Nothing to build, it is a pure data package
 
 define USB_MODESWITCH_DATA_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-packed
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
