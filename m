From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 10:28:50 +0200
Subject: [Buildroot] [PATCH] ncurses: fix wide-char enabled compilation for
	noMMU targets
Message-ID: <20160731082850.GA30195@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For noMMU targets -D_XOPEN_SOURCE_EXTENDED must be explicitely
passed to the preprocessor to allow cchar_t usage.

Fixes:
http://autobuild.buildroot.net/results/5bb34ff490c70eea5e4fb497e5228ca1319fffdc/
http://autobuild.buildroot.net/results/8ba1410ed3ffb4954ccc4b7c3996d1839d677bef/
http://autobuild.buildroot.net/results/26ee52ad549b7ef75c9ce4b2eae94f9312cea775/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ncurses/Config.in  |    2 --
 package/ncurses/ncurses.mk |    4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 44713f9..8c8acde 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -13,8 +13,6 @@ if BR2_PACKAGE_NCURSES
 config BR2_PACKAGE_NCURSES_WCHAR
 	bool "enable wide char support"
 	depends on BR2_USE_WCHAR
-	# Build broken @ curses.priv.h with bad declarations
-	depends on !(BR2_bfin && BR2_BINFMT_FLAT)
 	help
 	  Enable wide char & UTF-8 support in ncurses libraries
 
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index bef57c5..412f548 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -57,8 +57,12 @@ NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += form
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
+# for noMMU we need to set it explicitely, fixes cchar_t problem
+NCURSES_CPPFLAGS += -D_XOPEN_SOURCE_EXTENDED
 NCURSES_LIB_SUFFIX = w
 
+NCURSES_CONF_ENV += CPPFLAGS="$(NCURSES_CPPFLAGS)"
+
 define NCURSES_LINK_LIBS_STATIC
 	for lib in $(NCURSES_LIBS-y:%=lib%); do \
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
-- 
1.7.10.4
