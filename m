From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Aug 2015 20:30:39 +0200
Subject: [Buildroot] [git commit] package/libcgroup: allow to build
	cgroup-tools
Message-ID: <20150901083107.8A355801E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e90e781d61b250876290f9f08b5b1d26f11737ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new config option that allows to build cgroup-tools - a set of
command-line utils for managing cgroups.

[Thomas: slightly change the prompt of the new Config.in option.]

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgroup/Config.in    |    9 +++++++++
 package/libcgroup/libcgroup.mk |    7 ++++++-
 2 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index b7a84e0..d02c282 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -9,5 +9,14 @@ config BR2_PACKAGE_LIBCGROUP
 
 	  http://libcg.sourceforge.net/
 
+if BR2_PACKAGE_LIBCGROUP
+
+config BR2_PACKAGE_LIBCGROUP_TOOLS
+	bool "install tools"
+	help
+	  Include a set of command-line tools for managing cgroups.
+
+endif
+
 comment "libcgroup needs an (e)glibc toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index ace2744..a4c3084 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -20,10 +20,15 @@ LIBCGROUP_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS"
 
 LIBCGROUP_CONF_OPTS = \
-	--disable-tools \
 	--disable-daemon \
 	--disable-initscript-install
 
+ifeq ($(BR2_PACKAGE_LIBCGROUP_TOOLS),y)
+LIBCGROUP_CONF_OPTS += --enable-tools
+else
+LIBCGROUP_CONF_OPTS += --disable-tools
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 LIBCGROUP_DEPENDENCIES += linux-pam
 LIBCGROUP_CONF_OPTS += --enable-pam
