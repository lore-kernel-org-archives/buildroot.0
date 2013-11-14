From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Nov 2013 20:46:26 +0100
Subject: [Buildroot] [git commit] nano: fix build breakage with libmagic
Message-ID: <20131114194655.4D1CE9BCC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=893108810b952777feca054a90c7ecfe7cad06e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Cassiano Martin in bug #6692 if host == target the nano
package can pick up the host libmagic and break.
So add a check to see if the file package is enabled and use it,
otherwise just disable libmagic support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 3707e77..4609f72 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -13,6 +13,12 @@ NANO_CONF_OPT = --without-slang
 NANO_CONF_ENV = ac_cv_prog_NCURSESW_CONFIG=false
 NANO_DEPENDENCIES = ncurses
 
+ifeq ($(BR2_PACKAGE_FILE),y)
+	NANO_DEPENDENCIES += file
+else
+	NANO_CONF_ENV += ac_cv_lib_magic_magic_open=no
+endif
+
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
 	NANO_CONF_OPT += --enable-tiny
 endif
