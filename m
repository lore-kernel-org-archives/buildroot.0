From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 28 Mar 2012 10:47:52 +0200
Subject: [Buildroot] xbmc package
Message-ID: <CAAfyv35s2iDxa8iWXqvfCMQDoF4kk-+_4zDFY=A6sE59i=sHXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to add xbmc package to buildroot and have problem how to
fix one dependency problem.
Problem is with mysql_config which is requested by xmbc during config phase.
I add mysql_client dependency (mysql_config is installed in staging)
but xbmc config
still complain. I've check that qt use similar with configure option
but xbmc don't have such an option.

Any ideas how to fix that?

config.log from xmbc attached.

diff --git a/package/Config.in b/package/Config.in
index b394f18..68d28fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -120,6 +120,7 @@ source "package/sdl_sound/Config.in"
 source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/sdl_gfx/Config.in"
+source "package/xbmc/Config.in"

 comment "other GUIs"
 source "package/efl/Config.in"
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
new file mode 100644
index 0000000..623e518
--- /dev/null
+++ b/package/xbmc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XBMC
+       bool "xbmc"
+       select BR2_PACKAGE_BOOST
+       select BR2_PACKAGE_SDL_GFX
+       select BR2_PACKAGE_MYSQL_CLIENT
+       help
+         XBMC
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
new file mode 100644
index 0000000..6379ab8
--- /dev/null
+++ b/package/xbmc/xbmc.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# xbmc
+#
+#############################################################
+XBMC_VERSION = 11.0
+XBMC_SITE = http://mirrors.xbmc.org/releases/source/
+
+XBMC_DEPENDENCIES = host-pkg-config boost sdl_gfx mysql_client
+XBMC_CONF_OPT = --disable-debug --disable-gl
+
+$(eval $(call AUTOTARGETS))
+


Regards,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 129729 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120328/e35072c6/attachment-0001.bin>
