From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:42:47 +0100
Subject: [Buildroot] [git commit] package/zsh: add optional support for pcre
Message-ID: <20160221114251.C0ADF80506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7bfa231072412531c6c31c5f76fbd294ef55910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When pcre was compiled before, zsh will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/bin/zsh | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libgdbm.so.4]
 0x0000000000000001 (NEEDED)             Shared library: [libpcre.so.1]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
