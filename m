From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Tue, 18 Nov 2008 20:46:04 +0100
Subject: [Buildroot] [PATCH] small patches (was: skeleton patch)
In-Reply-To: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
References: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
Message-ID: <e4c675870811181146g39352c46tcaaa832bde6cf4c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 I do not think libpng12-config could be useful in the target system
if it does not a developing system itself

--- package/libpng/libpng.mk	(revision 24038)
+++ package/libpng/libpng.mk	(working copy)
@@ -28,5 +28,8 @@
 		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng12\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/bin/libpng12-config
+ifneq ($(strip $(CONFIG_BR2_HAVE_DEVFILES)),y)
+	rm -f $(TARGET_DIR)/usr/bin/libpng12-config
+endif
 	touch $@


 I think variable BR2_HAVE_DEVFILES should be renamed
BR2_HAVE_DEVEL_FILES because DEV sounds like /dev
 If you like this change all these files should be sedded with
"s,BR2_HAVE_DEVFILES,BR2_HAVE_DEVEL_FILES,g":

roberto at rafbook:~/gles/buildroot$ (for i in toolchain package target;
do grep -rn BR2_HAVE_DEVFILES $i/*; done; grep -n BR2_HAVE_DEVFILES *)
2>/dev/null | grep -v .svn | cut -d\: -f1

package/libpng/libpng.mk
package/openssl/openssl.mk
target/device/valka/v100sc2_defconfig
target/device/x86/i386/i686_defconfig
target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
target/device/Atmel/atngw100/atngw100_defconfig
target/device/Atmel/atngw100-base/atngw100-base_defconfig
target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
target/device/Atmel/atstk100x/atstk100x_defconfig
target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
target/device/KwikByte/kb9202/kb9202_defconfig
Config.in
Makefile



-- 
/roberto
