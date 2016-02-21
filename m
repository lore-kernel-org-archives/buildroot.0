From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:12 +0100
Subject: [Buildroot] [PATCH 08/14] package/zsh: add optional support for pcre
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When pcre was compiled before, zsh will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/bin/zsh | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libgdbm.so.4]
 0x0000000000000001 (NEEDED)             Shared library: [libpcre.so.1]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zsh/zsh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 9f4a582..8659fc4 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -26,6 +26,13 @@ else
 ZSH_CONF_OPTS += --disable-cap
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+ZSH_CONF_OPTS += --enable-pcre
+ZSH_DEPENDENCIES += pcre
+else
+ZSH_CONF_OPTS += --disable-pcre
+endif
+
 # Remove versioned zsh-x.y.z binary taking up space
 define ZSH_TARGET_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
-- 
2.7.0
