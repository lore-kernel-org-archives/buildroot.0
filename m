From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 09:27:13 +0200
Subject: [Buildroot] [git commit] package/bash: use --bindir instead of
 exec_prefix=
Message-ID: <20210424072119.40CBC84355@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73aed53c82793269f22383bbeaa3d78ff2660ba5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want bash to be installed as /bin/bash. For ages, Buildroot has
been doing this by overriding exec_prefix at install time. First of
all, it would be preferred to do this at configure time. But also,
overriding exec_prefix not only changes where "bash" goes, but also
where the pkgconfig file goes. Due to this, bash.pc goes into
/lib/pkgconfig/, and doesn't get removed by target-finalize.

Since all we want is to have 'bash' as /bin/bash, simply pass
--bindir=/bin at configure time. This allows to use the default target
installation logic for autotools-package. We keep a post-install
target hook to remove /bin/bashbug.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bash/bash.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index efe7cbbe59..996c6a6097 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -7,11 +7,16 @@
 BASH_VERSION = 5.1
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
-BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
 BASH_LICENSE = GPL-3.0+
 BASH_LICENSE_FILES = COPYING
 BASH_CPE_ID_VENDOR = gnu
 
+# We want the bash binary in /bin
+BASH_CONF_OPTS = \
+	--bindir=/bin \
+	--with-installed-readline \
+	--without-bash-malloc
+
 BASH_CONF_ENV += \
 	ac_cv_rl_prefix="$(STAGING_DIR)" \
 	ac_cv_rl_version="$(READLINE_VERSION)" \
@@ -38,11 +43,10 @@ BASH_CONF_ENV += bash_cv_getenv_redef=yes
 endif
 endif
 
-define BASH_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
+define BASH_REMOVE_UNUSED_FILES
 	rm -f $(TARGET_DIR)/bin/bashbug
 endef
+BASH_POST_INSTALL_TARGET_HOOKS += BASH_REMOVE_UNUSED_FILES
 
 # Add /bin/bash to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
