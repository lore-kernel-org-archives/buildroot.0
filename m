From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 31 Mar 2021 10:15:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/bash: remove development files and
 modules on the target.
Message-ID: <20210331081559.29619-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bash installs /lib/pkgconfig/bash.pc on the target, which buildroot does
not remove because it is not in the usual /usr/lib/pkgconfig.

It also install makefiles and example builtins in /lib/bash that are not
required.

The Makefiles and .pc encode the build path and create reproducibility
issues.  Remove them.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/bash/bash.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index efe7cbbe59..6af31f182d 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -41,7 +41,8 @@ endif
 define BASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
-	rm -f $(TARGET_DIR)/bin/bashbug
+	rm -f $(TARGET_DIR)/bin/bashbug $(TARGET_DIR)/lib/pkgconfig/bash.pc
+	rm -rf $(TARGET_DIR)/lib/bash
 endef
 
 # Add /bin/bash to /etc/shells otherwise some login tools like dropbear
-- 
2.31.0
