From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Fri, 07 Aug 2009 23:40:53 +0200
Subject: [Buildroot] [PATCH] Re: buildroot-libtool.patch failed with dbus
 1.3.0
In-Reply-To: <20090807221717.53039a10@surf>
References: <4A7C85F0.7070604@eclis.ch> <20090807221717.53039a10@surf>
Message-ID: <4A7C9F65.4060104@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni a ?crit :
> Le Fri, 07 Aug 2009 21:52:16 +0200,
> Jean-Christian de Rivaz <jc@eclis.ch> a ?crit :
> 
>> If I understand correctly, buildroot have a script
>> package/Makefile.autotools.in that try to patch the ltmain.sh for his
>> specific need. How can I disable or fix this ?
> 
> You can disable it by adding DBUS_LIBTOOL_PATCH = NO in dbus/dbus.mk.
> 
> However, libtool will not be patched anymore, so depending on the
> version of libtool being used in dbus-1.3.0, it might break the build.

Thanks for the trick! It seem that dbus archives contain a new ltmain.sh
since the dbus version 1.2.16. I have successfully tested the following
patch with dbus version 1.2.12, 1.2.14, 1.2.16 and 1.3.0. On each test I
also verified that dbus-glib compile.

Best Regards,

Jean-Christian de Rivaz


 From cf50719def4ff430755b1ddf8e8adf9edaafabfc Mon Sep 17 00:00:00 2001
From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Fri, 7 Aug 2009 23:31:08 +0200
Subject: [PATCH] Update dbus to version 1.3.0. Disable ltmain.sh 
patching for dbus version since 1.2.16

Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
---
  package/dbus/dbus.mk |   11 ++++++++++-
  1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7326b41..6bf98c0 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
  # dbus
  #
  #############################################################
-DBUS_VERSION = 1.2.12
+DBUS_VERSION = 1.3.0
  DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
  DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
  DBUS_INSTALL_STAGING = YES
@@ -18,6 +18,15 @@ endif

  DBUS_DEPENDENCIES = uclibc host-pkgconfig

+# DBus project have changed there ltmain.sh since version 1.2.16
+# Why the package/Makefile.autotools.in can't handle that ?
+ifeq ($(DBUS_VERSION),1.2.16)
+DBUS_LIBTOOL_PATCH = NO
+endif
+ifeq ($(DBUS_VERSION),1.3.0)
+DBUS_LIBTOOL_PATCH = NO
+endif
+
  DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
  DBUS_CONF_OPT = --program-prefix="" \
                 --with-dbus-user=dbus \
--
1.5.6.5
