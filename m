From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:13:30 +0100
Subject: [Buildroot] [git commit] i2c-tools: fix missing runtime library
Message-ID: <20171231161440.925A68393A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7bf37b65245059232a3e6c6c2ad37aab9c6962d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building with dynamic library support, i2c-tools utilities are
linked against the libi2c.so library. Current i2c-tools install commands
don't take this into account, which leads to the following run-time
error:

eeprog: error while loading shared libraries: libi2c.so.0: cannot open shared object file: No such file or directory

Use the native install target to fix that.

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/i2c-tools.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 0f71fd4..9ddaa72 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -61,11 +61,8 @@ define I2C_TOOLS_BUILD_CMDS
 endef
 
 define I2C_TOOLS_INSTALL_TARGET_CMDS
-	for i in i2cdump i2cget i2cset i2cdetect i2ctransfer; \
-	do \
-		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/sbin/$$i; \
-	done
-	$(INSTALL) -m 755 -D $(@D)/eeprog/eeprog $(TARGET_DIR)/usr/bin/eeprog;
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) install
 	$(I2C_TOOLS_INSTALL_PYSMBUS)
 endef
 
