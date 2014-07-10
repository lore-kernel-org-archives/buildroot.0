From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 16:59:00 +0200
Subject: [Buildroot] [git commit] atftp: fix static linking
Message-ID: <20140710150058.1E68C9C46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c84418e414b1c1645cd7c677e98649827daf9b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Readline uses ncurses hence pull it in, also needs to explicitly link
against libpthread. Fixes:
http://autobuild.buildroot.net/results/259/2592612be38a2c1dde21b44be2ecf25d1cc5211a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atftp/atftp.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
