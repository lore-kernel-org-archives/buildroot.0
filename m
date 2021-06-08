From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Jun 2021 15:06:43 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain: mark sysroot as 'safe' path for
 gdb auto-load
In-Reply-To: <20210608130644.10909-1-patrickdepinguin@gmail.com>
References: <20210608130644.10909-1-patrickdepinguin@gmail.com>
Message-ID: <20210608130644.10909-4-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

gdb can automatically load certain files as described in [1]. Such files
could install pretty-printers for complex data structures.

libstdcxx (C++ standard library) provided by gcc, is one example of a
library for which such auto-load file is available. But there are other
examples too, like libglib2.

However, gdb will only auto-load files if the file is located in one of the
locations treated as 'safe'. The Buildroot sysroot is not by default in that
list.

Provide a better debugging experience by adding the sysroot to the 'safe'
list, via the gdbinit file prepared by Buildroot.

[1] https://sourceware.org/gdb/onlinedocs/gdb/objfile_002dgdbdotext-file.html

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 toolchain/helpers.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 17bc159f3e..dfb2581ed5 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -483,7 +483,8 @@ check_toolchain_ssp = \
 #
 gen_gdbinit_file = \
 	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
-	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
+	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
+	echo "add-auto-load-safe-path $(STAGING_DIR)" >> $(STAGING_DIR)/usr/share/buildroot/gdbinit
 
 # Given a path, determine the relative prefix (../) needed to return to the
 # root level. Note that the last component is treated as a file component; use a
-- 
2.26.3
