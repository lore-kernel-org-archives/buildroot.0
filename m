From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:42:43 +0100
Subject: [Buildroot] [git commit] package/zsh: add optional support for
	libcap
Message-ID: <20160221114251.B526780506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fc55da0e8479fc6103af80c3a08334fbaacc5cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libcap was compiled before, zsh will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/bin/zsh | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libgdbm.so.4]
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zsh/zsh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index c3af034..9f4a582 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -19,6 +19,13 @@ else
 ZSH_CONF_OPTS += --disable-gdbm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+ZSH_CONF_OPTS += --enable-cap
+ZSH_DEPENDENCIES += libcap
+else
+ZSH_CONF_OPTS += --disable-cap
+endif
+
 # Remove versioned zsh-x.y.z binary taking up space
 define ZSH_TARGET_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
