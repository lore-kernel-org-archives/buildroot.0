From: jean at iddad.fr <jean@iddad.fr>
Date: Tue, 28 Sep 2010 17:18:48 +0200
Subject: [Buildroot] [PATCH] Option to disable mouse cursor in QT
Message-ID: <39650.1285687128@iddad.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,

My company is developing a touch screen product and we are using QT. Because of the touch screen, I don't want to display any mouse pointer/cursor so I patched buildroot to disable it at configuration time.
As touchscreens become more and more common some other people may need this patch as well, so here it is:

diff -crB buildroot-2010.08/package/qt/Config.in buildroot-2010.08-patched/package/qt/Config.in
*** buildroot-2010.08/package/qt/Config.in 2010-08-31 23:07:06.000000000 +0100
--- buildroot-2010.08-patched/package/qt/Config.in 2010-09-28 08:56:31.000000000 +0100
***************
*** 373,376 ****
--- 373,384 ----
Build the Qt Script Tools module.
if unsure, say n.

+ config BR2_PACKAGE_QT_CURSOR
+ bool "Mouse Cursor"
+ default y
+ help
+ Enables the mouse cursor.
+ If using a touchscreen, say n to prevent the cursor from being displayed.
+
+
endif # BR2_PACKAGE_QT
diff -crB buildroot-2010.08/package/qt/qt.mk buildroot-2010.08-patched/package/qt/qt.mk
*** buildroot-2010.08/package/qt/qt.mk 2010-08-31 23:07:06.000000000 +0100
--- buildroot-2010.08-patched/package/qt/qt.mk 2010-09-28 08:56:54.000000000 +0100
***************
*** 371,376 ****
--- 371,382 ----
QT_CONFIGURE += -no-pch
endif

+ ifeq ($(BR2_PACKAGE_QT_CURSOR),y)
+ QT_CONFIGURE+= -feature-CURSOR
+ else
+ QT_CONFIGURE+= -no-feature-CURSOR
+ endif
+
BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))

# x86x86fix


Regards,

Jean
