From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Jul 2014 10:07:27 -0300
Subject: [Buildroot] [PATCH] atftp: fix static linking
Message-ID: <1404997647-12843-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openssl uses libz hence pull it in, also needs to explicitly link
against libpthread. Fixes:
http://autobuild.buildroot.net/results/259/2592612be38a2c1dde21b44be2ecf25d1cc5211a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/atftp/atftp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 1d6a7c3..a018b9d 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -9,10 +9,15 @@ ATFTP_SITE = http://sourceforge.net/projects/atftp/files/
 ATFTP_LICENSE = GPLv2+
 ATFTP_LICENSE_FILES = LICENSE
 ATFTP_CONF_OPT = --disable-libwrap --disable-mtftp
+# For static we need to explicitly link against libpthread
+ATFTP_LIBS = -lpthread
+ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)"
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 ATFTP_DEPENDENCIES += readline
 ATFTP_CONF_OPT += --enable-libreadline
+# For static, readline links with ncurses
+ATFTP_LIBS += -lncurses
 else
 ATFTP_CONF_OPT += --disable-libreadline
 endif
-- 
1.8.5.5
