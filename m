From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Feb 2021 22:42:56 +0100
Subject: [Buildroot] [git commit] package/readline: disable bracketed paste
 by default
Message-ID: <20210226212105.58B6886310@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba05d014763bb87b07096e9a2c065389ef2d5030
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of readline 8.1, "bracketed paste" is enabled by default. However,
the feature causes control characters to appear in captured (telnet)
session output. This can throw off pattern matching if the output is to
be processed by scripts.

Let's keep the previous default of leaving this feature disabled and
provide a configuration option for users to enable it.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
[yann.morin.1998 at free.fr:
  - explicit enable/disable
  - no indentation in conditional block
  - rewrap help text
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/readline/Config.in   | 18 ++++++++++++++++++
 package/readline/readline.mk |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/package/readline/Config.in b/package/readline/Config.in
index 7021472623..fd21cfeaf8 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -7,3 +7,21 @@ config BR2_PACKAGE_READLINE
 	  as they are typed in.
 
 	  https://tiswww.case.edu/php/chet/readline/rltop.html
+
+config BR2_PACKAGE_READLINE_BRACKETED_PASTE
+	bool "Enable bracketed paste"
+	depends on BR2_PACKAGE_READLINE
+	help
+	  Enable the "bracketed paste" feature in libreadline.
+
+	  Bracketed paste is helpful for interactive sessions when
+	  one wants to prevent pasted text from being interpreted
+	  as typed-in commands. However, it also causes control
+	  characters to show up in the raw output of a (telnet)
+	  session. This can cause issues and throw off pattern
+	  matching if the session output is being captured for
+	  automated processing.
+
+	  For further information on this feature and whether you
+	  may want it, see:
+	      https://cirw.in/blog/bracketed-paste
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 326cffab18..06a96b67a8 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -16,6 +16,12 @@ READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
 READLINE_CPE_ID_VENDOR = gnu
 
+ifeq ($(BR2_PACKAGE_READLINE_BRACKETED_PASTE),y)
+READLINE_CONF_OPTS += --enable-bracketed-paste-default
+else
+READLINE_CONF_OPTS += --disable-bracketed-paste-default
+endif
+
 define READLINE_INSTALL_INPUTRC
 	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc
 endef
