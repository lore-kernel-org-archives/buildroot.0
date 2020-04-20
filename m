From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 09:55:48 +0200
Subject: [Buildroot] [git commit] package/apparmor: add option to install
 generic profiles
Message-ID: <20200420075435.ACA1D8F448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12b76b077aa95ef5130c7c477aa984a80d1306a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The apparmor packages comes with a set of profiles for a class of usual,
mostly server-class programs and daemons.

Even though an embedded device will mostly require custom profiles, the
generic ones may come handy, as they also provide "abstractions", that
can serve as templates for custom profiles.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr: split off into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apparmor/Config.in   | 6 ++++++
 package/apparmor/apparmor.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
index d02838f800..3cb5349cac 100644
--- a/package/apparmor/Config.in
+++ b/package/apparmor/Config.in
@@ -60,6 +60,12 @@ config BR2_PACKAGE_APPARMOR_UTILS_EXTRA
 
 endif # BR2_PACKAGE_APPARMOR_UTILS
 
+config BR2_PACKAGE_APPARMOR_PROFILES
+	bool "profiles"
+	help
+	  Installs server-class profiles for a wide range of
+	  usual programs and daemons.
+
 endif # BR2_PACKAGE_APPARMOR
 
 comment "apparmor needs a toolchain w/ headers >= 3.16, threads, C++"
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index ab0b7778d6..b1a47c080c 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -35,6 +35,10 @@ endif # BR2_PACKAGE_APPARMOR_UTILS_EXTRA
 
 endif # BR2_PACKAGE_APPARMOR_UTILS
 
+ifeq ($(BR2_PACKAGE_APPARMOR_PROFILES),y)
+APPARMOR_TOOLS += profiles
+endif
+
 define APPARMOR_BUILD_CMDS
 	$(foreach tool,$(APPARMOR_TOOLS),\
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
