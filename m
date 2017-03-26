From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 12:31:59 +0200
Subject: [Buildroot] [git commit] slang: use correct ncurses config script
	name
Message-ID: <20170326103215.899C18221F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3e4ed92380080334d3d09bb4a53dc6102edd8aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ncurses config script can have different names depending on the
configuration (e.g. wchar support enabled/disabled). So, use
$(NCURSES_CONFIG_SCRIPTS) from the ncurses package as it contains the
proper name.

Fixes:

  http://autobuild.buildroot.net/results/c97554c05e121c76407be53ba37924cfcb658e9d/
  http://autobuild.buildroot.net/results/b0a31a3491a30ee0d6e6e7dbba68a86f0e00943d/
  http://autobuild.buildroot.net/results/a77241141cf8710fa945523ef62327798e3c4824/
  [...]

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/slang/slang.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 9078bf2..e6abdee 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -40,7 +40,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 SLANG_DEPENDENCIES += ncurses
-SLANG_CONF_ENV += ac_cv_path_nc5config=$(STAGING_DIR)/usr/bin/ncurses5-config
+SLANG_CONF_ENV += ac_cv_path_nc5config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
 SLANG_CONF_OPTS += ac_cv_path_nc5config=no
 endif
@@ -49,7 +49,7 @@ ifeq ($(BR2_PACKAGE_READLINE),y)
 SLANG_CONF_OPTS += --with-readline=gnu
 SLANG_DEPENDENCIES += readline
 ifeq ($(BR2_STATIC_LIBS),y)
-SLANG_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/ncurses5-config --libs`"
+SLANG_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS) --libs`"
 endif
 endif
 
