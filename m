From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  4 Feb 2020 14:15:52 +0100
Subject: [Buildroot] [PATCH] package/grep: fix egrep/fgrep shebang
Message-ID: <1580822152-6622-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

egrep/fgrep are using autotools SHELL variable to execve the
grep executable with correct options, shell is defaulted to
/bin/bash which we usually don't have on target.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
I tested manually changing the package to:

GREP_CONF_OPTS = SHELL=/bin/dash --exec-prefix=/

And this works. If /bin/sh is a link to /bin/zsh for example, it will
not work cause the configure is not able to run on zsh.
I suppose that changing the default /bin/sh to something not sh
compatible would break many other things.

 package/grep/grep.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index be3e53b..7365a57 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -10,7 +10,7 @@ GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-GREP_CONF_OPTS = --exec-prefix=/
+GREP_CONF_OPTS = SHELL=/bin/sh --exec-prefix=/
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-- 
2.7.4
