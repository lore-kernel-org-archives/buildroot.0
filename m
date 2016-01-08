From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  8 Jan 2016 12:30:19 +0100
Subject: [Buildroot] [PATCH] linux: provide symlink dtc->linux-dtc is there
	is no dtc yet
Message-ID: <1452252619-13802-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Commit ab74e09eb4e28dab8bed8d783c5f0464d39a32e7 renamed the dtc host tool
provided by linux to linux-dtc to avoid clashes with the dtc host tool
provided by host-dtc.

However, external scripting may well rely on the existence of a device tree
compiler as $(HOST_DIR)/usr/bin/dtc, regardless of its source. Changing
these external scripts to use linux-dtc means that the scripts need to be
aware of the buildroot release they are working with, which is not very
nice.

Add a symlink dtc->linux-dtc when no $(HOST_DIR)/usr/bin/dtc is present.
When host-dtc is not enabled, the end result will be dtc and
linux-dtc representing the same thing.
When host-dtc is enabled, either it is build before linux and no symlink
is created at any time, or it is build after linux, and the 'install'
command in host-dtc will overwrite the symlink with a proper dtc. In both
cases, the end result will be dtc and linux-dtc representing a different
thing.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 045294b..f5c629c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -339,6 +339,9 @@ define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
 		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/linux-dtc ;	\
+		if [ ! -e $(HOST_DIR)/usr/bin/dtc ]; then	\
+			ln -sf linux-dtc $(HOST_DIR)/usr/bin/dtc ;	\
+		fi	\
 	fi
 endef
 
-- 
1.9.5
