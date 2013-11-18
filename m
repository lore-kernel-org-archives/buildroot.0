From: universe II <universeii@gmx.de>
Date: Mon, 18 Nov 2013 15:34:45 +0100
Subject: [Buildroot] [PATCH] Fixing rshd/rlogind configuration and make
	target
Message-ID: <528A2585.5040402@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
I found out that build of rshd and rlogind is commented out in Config.in 
of package rsh-redone. Re-activating them lead to compile errors of the 
rsh-redone package (when linking with pam). After a while I found the 
root cause. The make targets are wrong: rshd and rlogind must be 
replaces by in.rshd and in.rlogind. With these changes rshd and rlogind 
are compiled and are running fine on my target. Just activate them in 
inetd.conf and adjust some PAM settings. That's all.

Regards,
Andreas

Signed-off-by Andreas Ehmanns <universeii@gmx.de>


diff -Naur rsh-redone_org/Config.in rsh-redone/Config.in
--- rsh-redone_org/Config.in    2013-09-17 13:42:07.000000000 +0200
+++ rsh-redone/Config.in        2013-10-24 08:22:47.324184620 +0200
@@ -17,15 +17,15 @@
         depends on BR2_PACKAGE_RSH_REDONE

  # requires PAM
-#config BR2_PACKAGE_RSH_REDONE_RLOGIND
-#      bool "rlogind"
-#      depends on BR2_PACKAGE_RSH_REDONE
+config BR2_PACKAGE_RSH_REDONE_RLOGIND
+       bool "rlogind"
+       depends on BR2_PACKAGE_RSH_REDONE

  config BR2_PACKAGE_RSH_REDONE_RSH
         bool "rsh"
         depends on BR2_PACKAGE_RSH_REDONE

  # requires PAM
-#config BR2_PACKAGE_RSH_REDONE_RSHD
-#      bool "rshd"
-#      depends on BR2_PACKAGE_RSH_REDONE
+config BR2_PACKAGE_RSH_REDONE_RSHD
+       bool "rshd"
+       depends on BR2_PACKAGE_RSH_REDONE
diff -Naur rsh-redone_org/rsh-redone.mk rsh-redone/rsh-redone.mk
--- rsh-redone_org/rsh-redone.mk        2013-09-17 13:42:07.000000000 +0200
+++ rsh-redone/rsh-redone.mk    2013-10-24 08:23:00.643065545 +0200
@@ -13,8 +13,8 @@
  rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
  rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RSH) += rsh
  rsh-redone-sbin-y =
-rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += rlogind
-rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += rshd
+rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += in.rlogind
+rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += in.rshd

  define RSH_REDONE_BUILD_CMDS
         $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) 
BIN="$(rsh-redone-bin-y)" SBIN="$(rsh-redone-sbin-y)"
