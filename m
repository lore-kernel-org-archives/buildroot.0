From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 09:47:37 +0100
Subject: [Buildroot] [git commit] erlang: add option to enable SMP support
Message-ID: <20131215090215.E81069C021@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1781787f8425d7baea3e399667dac97e8850665
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang builds two emulators depending on whether SMP is supported or
not. If it is known that the target does not support SMP, turning off
the SMP emulator saves compile time and reduces the size of the
installation.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/Config.in |   14 +++++++++++++-
 package/erlang/erlang.mk |    4 ++++
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 27206f3..2ee8515 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -10,11 +10,23 @@ config BR2_PACKAGE_ERLANG
 
 	  http://www.erlang.org
 
+if BR2_PACKAGE_ERLANG
+
+config BR2_PACKAGE_ERLANG_SMP
+	bool "enable SMP support"
+	help
+	  Erlang provides both a UP and an SMP emulator. The UP emulator
+	  is always built, and this option enables compilation of the SMP
+	  emulator. The choice of which emulator to use is made at runtime.
+	  If you do not need SMP support, turning this option off reduces
+	  compile time and the size of the Erlang installation.
+
 config BR2_PACKAGE_ERLANG_MEGACO
 	bool "install megaco application"
-	depends on BR2_PACKAGE_ERLANG
 	help
 	  The Megaco application is a framework for building applications
 	  on top of the Megaco/H.248 protocol. It is approximately 14MB in
 	  size so if you do not need it then it is recommended not to
 	  enable it.
+
+endif # BR2_PACKAGE_ERLANG
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 4a94af0..34d027b 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -43,6 +43,10 @@ ERLANG_CONF_OPT += --enable-shared-zlib
 ERLANG_DEPENDENCIES += zlib
 endif
 
+ifeq ($(BR2_PACKAGE_ERLANG_SMP),)
+ERLANG_CONF_OPT += --disable-smp-support
+endif
+
 # Remove source, example, gs and wx files from the target
 ERLANG_REMOVE_PACKAGES = gs wx
 
