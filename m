From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Mar 2013 22:45:10 +0100
Subject: [Buildroot] [git commit] package: add enscript
Message-ID: <20130326221004.8B7D19B313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3e8188815f608f783a8d6a5e95cc76ef17ac95b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU Enscript is a free replacement for Adobe's enscript program.
GNU Enscript converts ASCII files to PostScript, HTML, or RTF and
stores generated output to a file or sends it directly to the
printer. It includes features for `pretty-printing' (language-
sensitive code highlighting) in several programming languages.

[Peter: fix Config.in indentation]
Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
[yann.morin.1998 at free.fr: space-damage, unneeded variables, licensing terms]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/enscript/Config.in   |   11 +++++++++++
 package/enscript/enscript.mk |   19 +++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index be1aa99..82e6c5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -290,6 +290,7 @@ endmenu
 
 menu "Interpreter languages and scripting"
 source "package/erlang/Config.in"
+source "package/enscript/Config.in"
 source "package/haserl/Config.in"
 source "package/jamvm/Config.in"
 source "package/lua/Config.in"
diff --git a/package/enscript/Config.in b/package/enscript/Config.in
new file mode 100644
index 0000000..26c45e1
--- /dev/null
+++ b/package/enscript/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ENSCRIPT
+	bool "enscript"
+	help
+	  GNU Enscript is a free replacement for Adobe's enscript program.
+
+	  GNU Enscript converts ASCII files to PostScript, HTML, or RTF and
+	  stores generated output to a file or sends it directly to the
+	  printer. It includes features for `pretty-printing' (language-
+	  sensitive code highlighting) in several programming languages.
+
+	  http://www.gnu.org/software/enscript
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
new file mode 100644
index 0000000..93e4d6d
--- /dev/null
+++ b/package/enscript/enscript.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# enscript
+#
+#############################################################
+
+ENSCRIPT_VERSION = 1.6.6
+ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript/
+ENSCRIPT_LICENSE = GPLv3+
+ENSCRIPT_LICENSE_FILES = COPYING
+
+# Enable pthread threads if toolchain supports threads
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	ENSCRIPT_CONF_OPT += --enable-threads=pth
+else
+	ENSCRIPT_CONF_OPT += --disable-threads
+endif
+
+$(eval $(autotools-package))
