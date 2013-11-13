From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Nov 2013 10:05:45 +0100
Subject: [Buildroot] menuconfig / legacy bug
In-Reply-To: <201311130943.34449.yann.morin.1998@free.fr>
References: <20131112224328.4edae7b0@skate>
 <CAAXf6LUhpgN16gBY_WFnq=kSepT-LHt-Q3Js-cAHwSUGd2CL6w@mail.gmail.com>
 <201311130943.34449.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LW96vUik2RKMCs3aHwNvcBygkL1TP27Y-TkkwdGV0YkQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Wed, Nov 13, 2013 at 9:43 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On Wednesday 13 November 2013 09:40:53 Thomas De Schampheleire wrote:
>> Hi Thomas,
>>
>> On Tue, Nov 12, 2013 at 10:43 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Hello,
>> >
>> > Samuel noticed this today: it seems like we have a bug in menuconfig
>> > that is annoying for the legacy thing.
>> >
>> > Scenario to reproduce the bug:
>> >
>> >  * Checkout commit 38dbd33b91adb4543e922e644b09430fa3836068 (which is
>> >    right before the removal of the BR2_PACKAGE_QT_JAVASCRIPTCORE)
>> >    option.
>> >
>> >  * Create a configuration that has BR2_PACKAGE_QT_JAVASCRIPTCORE set.
>> >
>> >  * Checkout the latest master (or any other commit that has the
>> >    BR2_PACKAGE_QT_JAVASCRIPTCORE removal commit)
>> >
>> >  * Run make menuconfig, it shows that Legacy is detected, which is OK.
>> >
>> >  * Now, go in the Legacy menu, and try to disable the Qt Javascript
>> >    Core option. It doesn't disable it and instead menuconfig "jumps" at
>> >    the beginning of the long comment that explains the legacy thing.
>> >
>> > The following patch workarounds the problem by removing the problematic
>> > lines of the comment. Basically, all lines that contains only "signs"
>> > and not actual text seem to confuse menuconfig for some reason.
>> >
>> > Ideas?
>>
>> I cannot reproduce this problem on my end. I followed the exact steps
>> as you described.
>> This is on Linux Mint 15, not sure which packages would be relevant
>> here. Ncurses is:
>> lib32ncurses5-dev: 5.9-10ubuntu4
>
> You have to use 'space' to deselect the option. Using 'n' works as expected.
>

Confirmed.
Typing 'space' simply cycles between visible comment lines _not_
containing any letter (number fails too).

Adding a letter on each non-letter line is a workaround:
diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -68,20 +68,20 @@ comment "Legacy detected: check the cont
 menu "Legacy config options"

 if BR2_LEGACY
-comment "----------------------------------------------------"
+comment "---------------------------------------------------o"
 comment "Your old configuration uses legacy options that no  "
 comment "longer exist in buildroot, as indicated in the menu "
 comment "below. As long as these options stay selected, or in"
 comment "case of string options are non-empty, the build     "
 comment "will fail.                                          "
-comment "*                                                   "
+comment "*                                                  o"
 comment "Where possible, an automatic conversion from old to "
 comment "new symbols has been performed. Before making any   "
 comment "change in this legacy menu, make sure to exit the   "
 comment "configuration editor a first time and save the      "
 comment "configuration. Otherwise, the automatic conversion  "
 comment "of symbols will be lost.                            "
-comment "*                                                   "
+comment "*                                                  o"
 comment "After this initial save, reopen the configuration   "
 comment "editor, inspect the options selected below, read    "
 comment "their help texts, and verify/update the new         "
@@ -90,12 +90,12 @@ comment "menus. When everything is ok, y
 comment "legacy options in the menu below. Once you have     "
 comment "disabled all legacy options, this text will         "
 comment "disappear and you will be able to start the build.  "
-comment "*                                                   "
+comment "*                                                  o"
 comment "Note: at some point in the future, the oldest legacy"
 comment "options will be removed, and configuration files    "
 comment "that still have those options set, will fail to     "
 comment "build, or run, in unpredictable ways.               "
-comment "----------------------------------------------------"
+comment "---------------------------------------------------o"
 endif

 ###############################################################################


> I have a (quick) fix I need to further test tonight, since it may have some
> weird side-effects...

Could you elaborate a bit, or maybe show the patch?

Best regards,
Thomas
