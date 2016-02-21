From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:42:35 +0100
Subject: [Buildroot] [git commit] package/zsh: add optional support for gdbm
Message-ID: <20160221114251.A515180506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8692be657f59b1e11b8a61d9e75aac598e8b86a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When gdbm was compiled before, zsh will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/bin/zsh | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libgdbm.so.4]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zsh/zsh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 03456b8..c3af034 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -12,6 +12,13 @@ ZSH_CONF_OPTS = --bindir=/bin
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 
+ifeq ($(BR2_PACKAGE_GDBM),y)
+ZSH_CONF_OPTS += --enable-gdbm
+ZSH_DEPENDENCIES += gdbm
+else
+ZSH_CONF_OPTS += --disable-gdbm
+endif
+
 # Remove versioned zsh-x.y.z binary taking up space
 define ZSH_TARGET_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
