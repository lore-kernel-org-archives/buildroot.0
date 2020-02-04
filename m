From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  4 Feb 2020 11:47:10 +0100
Subject: [Buildroot] [PATCH] package/grep: fix busybox aliasing
Message-ID: <1580813230-11405-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When grep package is selected, it should be installed at the same exact
location where busybox installs it too, this way the grep/egrep/fgrep
executables will end up overwriting the busybox provided ones.
Busybox installs *grep executables in /bin, grep package in /usr/bin.

Moreover, egrep/fgrep is using autotools SHELL variable to execve the
grep executable with correct options, SHELL is defaulted to /bin/bash
which is usually not available on target.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/grep/grep.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 96685b0..7365a57 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -10,6 +10,7 @@ GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+GREP_CONF_OPTS = SHELL=/bin/sh --exec-prefix=/
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-- 
2.7.4
