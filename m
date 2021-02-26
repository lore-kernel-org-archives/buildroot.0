From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 26 Feb 2021 12:08:21 -0800
Subject: [Buildroot] [PATCH] package/readline: disable bracketed paste by
 default
Message-ID: <20210226200821.2992417-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of readline 8.1, "bracketed paste" is enabled by default. However,
the feature causes control characters to appear in captured (telnet)
session output. This can throw off pattern matching if the output is to
be processed by scripts.

Let's keep the previous default of leaving this feature disabled and
provide a configuration option for users to enable it.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

We started running into issues after bringing in the changes of the upcoming
BR 2021.02 release, because raw output with the feature enabled looks like
this, with interspersed escape sequences like "<ESC>.[?2004h":

< 0x00000: 1b 5b 3f 32  30 30 34 68  24 20                     .[?2004h$ 
> 0x00000: 70 73 20 78  0d 0a                                  ps x..
< 0x00000: 70 73 20 78                                         ps x
< 0x00000: 0d 0a 1b 5b  3f 32 30 30  34 6c 0d                  ...[?2004l.
< 0x00000: 20 20 50 49  44 20 54 54  59 20 20 20  20 20 20 53    PID TTY      S
< 0x00010: 54 41 54 20  20 20 54 49  4d 45 20 43  4f 4d 4d 41  TAT   TIME COMMA
< 0x00020: 4e 44 0d 0a                                         ND..
< 0x00000: 20 31 36 36  39 20 70 74  73 2f 30 20  20 20 20 53   1669 pts/0    S
< 0x00010: 73 20 20 20  20 20 30 3a  30 30 20 2d  73 68 0d 0a  s     0:00 -sh..
< 0x00000: 20 31 36 37  31 20 70 74  73 2f 30 20  20 20 20 52   1671 pts/0    R
< 0x00010: 2b 20 20 20  20 20 30 3a  30 30 20 70  73 20 78 0d  +     0:00 ps x.
< 0x00020: 0a                                                  .
< 0x00000: 1b 5b 3f 32  30 30 34 68                            .[?2004h
< 0x00000: 24 20                                               $ 

Our automated test setup didn't like that too much. And others might be
facing similar issues.

Besides, Buildroot-based systems are probably not used interactively all
that often, so a feature that helps with interactive sessions, but makes
life harder for automation, should probably remain disabled by default. At
the same time, it should be possible to turn it on if desired.

 package/readline/Config.in   | 14 ++++++++++++++
 package/readline/readline.mk |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/package/readline/Config.in b/package/readline/Config.in
index 7021472623c8..ed63e00cc8f3 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -7,3 +7,17 @@ config BR2_PACKAGE_READLINE
 	  as they are typed in.
 
 	  https://tiswww.case.edu/php/chet/readline/rltop.html
+
+config BR2_PACKAGE_READLINE_BRACKETED_PASTE
+	bool "Enable bracketed paste"
+	depends on BR2_PACKAGE_READLINE
+	help
+	  Enable the "bracketed paste" feature in libreadline. Bracketed paste
+	  is helpful for interactive sessions when one wants to prevent pasted
+	  text from being interpreted as typed-in commands. However, it also
+	  causes control characters to show up in the raw output of a (telnet)
+	  session. This can cause issues and throw off pattern matching if the
+	  session output is being captured for automated processing.
+	  See
+	      https://cirw.in/blog/bracketed-paste
+	  for further information on this feature and whether you may want it.
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 326cffab1880..ce2a08b9375b 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -16,6 +16,10 @@ READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
 READLINE_CPE_ID_VENDOR = gnu
 
+ifeq ($(BR2_PACKAGE_READLINE_BRACKETED_PASTE),)
+	READLINE_CONF_OPTS += --disable-bracketed-paste-default
+endif
+
 define READLINE_INSTALL_INPUTRC
 	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc
 endef
-- 
2.25.1
