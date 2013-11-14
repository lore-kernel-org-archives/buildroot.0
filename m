From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Nov 2013 13:54:42 -0300
Subject: [Buildroot] [PATCHv2] nano: fix build breakage with libmagic
Message-ID: <1384448082-2678-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Cassiano Martin in bug #6692 if host == target the nano
package can pick up the host libmagic and break.
So add a check to see if the file package is enabled and use it,
otherwise just disable libmagic support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 3707e77..8a40f71 100644
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
-- 
1.8.3.2
