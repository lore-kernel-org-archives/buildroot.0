From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Nov 2013 22:43:28 +0100
Subject: [Buildroot] menuconfig / legacy bug
Message-ID: <20131112224328.4edae7b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Samuel noticed this today: it seems like we have a bug in menuconfig
that is annoying for the legacy thing.

Scenario to reproduce the bug:

 * Checkout commit 38dbd33b91adb4543e922e644b09430fa3836068 (which is
   right before the removal of the BR2_PACKAGE_QT_JAVASCRIPTCORE)
   option.

 * Create a configuration that has BR2_PACKAGE_QT_JAVASCRIPTCORE set.

 * Checkout the latest master (or any other commit that has the
   BR2_PACKAGE_QT_JAVASCRIPTCORE removal commit)

 * Run make menuconfig, it shows that Legacy is detected, which is OK.

 * Now, go in the Legacy menu, and try to disable the Qt Javascript
   Core option. It doesn't disable it and instead menuconfig "jumps" at
   the beginning of the long comment that explains the legacy thing.

The following patch workarounds the problem by removing the problematic
lines of the comment. Basically, all lines that contains only "signs"
and not actual text seem to confuse menuconfig for some reason.

Ideas?

Thomas

diff --git a/Config.in.legacy b/Config.in.legacy
index 587afe1..d4bf7a0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -68,20 +68,17 @@ comment "Legacy detected: check the content of the menu below"
 menu "Legacy config options"
 
 if BR2_LEGACY
-comment "----------------------------------------------------"
 comment "Your old configuration uses legacy options that no  "
 comment "longer exist in buildroot, as indicated in the menu "
 comment "below. As long as these options stay selected, or in"
 comment "case of string options are non-empty, the build     "
 comment "will fail.                                          "
-comment "*                                                   "
 comment "Where possible, an automatic conversion from old to "
 comment "new symbols has been performed. Before making any   "
 comment "change in this legacy menu, make sure to exit the   "
 comment "configuration editor a first time and save the      "
 comment "configuration. Otherwise, the automatic conversion  "
 comment "of symbols will be lost.                            "
-comment "*                                                   "
 comment "After this initial save, reopen the configuration   "
 comment "editor, inspect the options selected below, read    "
 comment "their help texts, and verify/update the new         "
@@ -90,12 +87,10 @@ comment "menus. When everything is ok, you can disable the   "
 comment "legacy options in the menu below. Once you have     "
 comment "disabled all legacy options, this text will         "
 comment "disappear and you will be able to start the build.  "
-comment "*                                                   "
 comment "Note: at some point in the future, the oldest legacy"
 comment "options will be removed, and configuration files    "
 comment "that still have those options set, will fail to     "
 comment "build, or run, in unpredictable ways.               "
-comment "----------------------------------------------------"
 endif
 
 ###############################################################################

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
