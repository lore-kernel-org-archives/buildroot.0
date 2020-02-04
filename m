From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  4 Feb 2020 14:14:41 +0100
Subject: [Buildroot] [PATCH v2] package/grep: fix busybox aliasing
Message-ID: <1580822081-3713-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When grep package is selected, it should be installed at the same exact
location where busybox installs it too, this way the grep/egrep/fgrep
executables will end up overwriting the busybox provided ones.
Busybox installs *grep executables in /bin, grep package in /usr/bin.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changelog:
* Patch splitting as suggested by Peter

I tested manually chenghing the package to:

GREP_CONF_OPTS = SHELL=/bin/dash --exec-prefix=/

And this works. If /bin/sh is a link to /bin/zsh for example, it will
not work cause the configure is not able to run on zsh.
I suppose that changing the default /bin/sh to something not sh
compatible woulb break many other things.

 package/grep/grep.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 96685b0..be3e53b 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -10,6 +10,7 @@ GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+GREP_CONF_OPTS = --exec-prefix=/
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-- 
2.7.4
