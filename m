From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 22:47:51 +0100
Subject: [Buildroot] [git commit] package: install bash-completion files
	only with bash
Message-ID: <20150126215420.96621805EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10e6284b70b6246dcccf9bff756c5f2f934ec5ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/systemd, package/kmod, package/util-linux: don't install
bash-completion files if bash is not selected to be installed.
Otherwise, install bash-completion files.

package/systemd: don't install zsh-completion files is zsh is not
selected to be installed. Otherwise, install zsh-completion files.

package/util-linux: don't install empty
/usr/share/bash-completion/completions directory if bash is not going to
be installed, and install bash-completion files if bash is selected to
be installed.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/kmod.mk             |    4 ++++
 package/systemd/systemd.mk       |    8 ++++++++
 package/util-linux/util-linux.mk |    7 ++++++-
 3 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index cc185c8..ff07c78 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -64,6 +64,10 @@ else
 KMOD_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_BASH),)
+KMOD_CONF_OPTS += --with-bashcompletiondir=
+endif
+
 # We only install depmod, since that's the only tool used for the
 # host.
 define HOST_KMOD_INSTALL_TOOLS
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index dbfce71..92f99c2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -133,6 +133,14 @@ else
 SYSTEMD_CONF_OPTS += --disable-smack
 endif
 
+ifeq ($(BR2_PACKAGE_BASH),)
+SYSTEMD_CONF_OPTS += --with-bashcompletiondir=
+endif
+
+ifeq ($(BR2_PACKAGE_ZSH),)
+SYSTEMD_CONF_OPTS += --with-zshcompletiondir=
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPTS += LIBS=-lrt
 SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a530596..c8fb77c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -21,9 +21,14 @@ UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown \
-	--disable-bash-completion \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_BASH),)
+UTIL_LINUX_CONF_OPTS += \
+	--disable-bash-completion \
+	--with-bashcompletiondir=
+endif
+
 # We don't want the host-busybox dependency to be added automatically
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
