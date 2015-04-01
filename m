From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Apr 2015 00:03:50 +0200
Subject: [Buildroot] [git commit] package/powertop: handle ncursesw properly
	and depend on wchar
Message-ID: <20150401220606.B6D58800C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29df1ee7efc3e20d4cf33a62ed2f26fbd62a474b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The powertop code uses some wide-char functions, so the package should
depend on wide-char support. Also, when wide-char support is
available, the wide-char variant of ncurses may be built, but powertop
detection logic isn't quite up to the game, so we help him a little
bit.

Thanks to Gustavo Zacarias for doing some additional investigation and
proposing the solution implemented in this patch.

Fixes
http://autobuild.buildroot.net/results/913/913cea22f8a8f5902d8da5f64c3fce056d66790f/
http://autobuild.buildroot.net/results/6e1/6e11fa2a7405a69c59ced046b92ff08660c4aab7/
http://autobuild.buildroot.net/results/1d3/1d3323b2afaefa7989854dbccf92015731199e66/
http://autobuild.buildroot.net/results/1e3/1e31d412d8b3a38a375ad0be8f696bee993ec297/
http://autobuild.buildroot.net/results/2ff/2ff511eb8d00b94aca68427446e2d0f6e4317a5a/
and maybe others

[Thomas:
 - do not force select NCURSES_WCHAR, instead improve the detection
   logic to properly use it when available. Solution provided by
   Gustavo.
 - improve the commit log.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powertop/Config.in   |    5 +++--
 package/powertop/powertop.mk |    8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index f157f46..5ba83b3 100644
--- a/package/powertop/Config.in
+++ b/package/powertop/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_POWERTOP
 	depends on !BR2_bfin
 	# libnl dependency
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_LIBNL
@@ -13,6 +14,6 @@ config BR2_PACKAGE_POWERTOP
 
 	  https://01.org/powertop/
 
-comment "powertop needs a toolchain w/ threads"
+comment "powertop needs a toolchain w/ threads, wchar"
 	depends on !BR2_bfin
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 331edc9..87da5a4 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -18,4 +18,12 @@ POWERTOP_DEPENDENCIES += gettext
 POWERTOP_CONF_ENV += LIBS='-lintl'
 endif
 
+# Help powertop at finding the right ncurses library depending on
+# which one is available.
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+POWERTOP_CONF_ENV += ac_cv_search_delwin="-lncursesw"
+else
+POWERTOP_CONF_ENV += ac_cv_search_delwin="-lncurses"
+endif
+
 $(eval $(autotools-package))
