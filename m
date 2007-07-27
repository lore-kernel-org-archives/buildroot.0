From: Crane, Matthew <mcrane03@harris.com>
Date: Fri, 27 Jul 2007 13:04:00 -0400
Subject: [Buildroot] "multiple target patterns" error while building
	under cygwin
In-Reply-To: <20070727162707.GH25147@aon.at>
References: <000501c7cd42$2a1b0d20$dcc4af0a@atmel.com>
	<E496871456016F4CA8959BE4105D2A890E8B8C@troe2k1.cs.myharris.net>
	<20070727162707.GH25147@aon.at>
Message-ID: <E496871456016F4CA8959BE4105D2A890E8BA7@troe2k1.cs.myharris.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
 
Thanks for your response.  I think my build error is the result of the
dos2unix + unix2dos patch.  My cygwin system was installed with Unix
text mode, and I've tried to explicitly set the locale, but fixdep
always seems to output the Dos text. 

I instead used the dos2unix/unix2dos patch to fix the fixdep output,
which I think ending up causing the error below.  Not sure how though,
or how to fix it.  Thanks,

Matt

 
.applets.o.cmd looks like this:
 
cmd_applets/applets.o := <snip>
 
deps_applets/applets.o := \
  applets/applets.c \
    $(wildcard include/config/static.h) \
    $(wildcard include/config/show/usage.h) \
<snip>
 
line 410: applets/applets.o: $(deps_applets/applets.o)
 
$(deps_applets/applets.o):
<eof>
 
I had already patched the make process so that it runs fixdep through
unix2dos, dos2unix similar to this patch I found online:
 
define rule_cc_o_c
     $(call echo-cmd,checksrc) $(cmd_checksrc)              \
     $(call echo-cmd,cc_o_c) $(cmd_cc_o_c);                  \
+    dos2unix $(depfile);                                              \
     $(cmd_modversions)                          \
-    scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \

+ scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' |
unix2dos > \ 
                                                   $(dot-target).tmp;  \
     rm -f $(depfile);                          \
     mv -f $(dot-target).tmp $(dot-target).cmd

It proceeded to build, but failed with the above error.   Maybe related,
not sure.  I'm looking forward to the day when cygwin support is
completely transparent in buildroot, soon I'm sure.



-----Original Message-----
From: Bernhard Fischer [mailto:rep.dot.nop at gmail.com] 
Sent: Friday, July 27, 2007 12:27 PM
To: Crane, Matthew
Cc: busybox at busybox.net
Subject: "multiple target patterns" error while building under cygwin

Please paste lines 409-411 (take care not to word-wrap it).
Just to be sure, untar the busybox into a separate dir, then 'make
defconfig && make'. I expect this to happen there too..

thanks,

On Mon, Jul 23, 2007 at 12:33:58PM -0400, Crane, Matthew wrote:
>Hi, 
>
>
>I'm trying to build on cygwin, busybox is failing with the error:
>
>
>applets/.applets.o.cmd:410: *** multiple target patterns.  Stop.
>
>Has anybody come across this?  I'm wondering if it's related to the
case
>insensitivity of cygwin.  Any help much apreciated, 
>
>Matt
>
>
>More complete error log, starts just as the build process has run
>through building busybox once, and starts again, which I think is
>normal??
>
>
>  AR      util-linux/lib.a
>  LINK    busybox_unstripped
>cp busybox_unstripped busybox
>make[1]: Leaving directory
>`/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/b
u
>sybox-1.6.1'
>/usr/bin/make -j1 CC=/usr/local/arm2007-uc/bin/arm-uclinuxeabi-gcc
>CROSS_COMPILE="/usr/local/arm2007-uc/bin/arm-uclinuxeabi-
>" \
>                CROSS="/usr/local/arm2007-uc/bin/arm-uclinuxeabi-"
>PREFIX="/usr/local/src/hd2/buildroot-20070718/project_bui
>ld_arm_nofpu/uclibc/root" \
>                ARCH=arm \
>                EXTRA_CFLAGS="-Os -pipe
>-I/usr/local/src/hd2/buildroot-20070718/build_arm_nofpu/staging_dir/inc
l
>ude -I/usr/
>local/src/hd2/buildroot-20070718/build_arm_nofpu/staging_dir/usr/includ
e
>-I/usr/local/arm2007-uc/arm-uclinuxeabi/include" -C
> 
>/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/bu
s
>ybox-1.6.1 install
>make[1]: Entering directory
>`/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/b
u
>sybox-1.6.1'
>  HOSTCC  scripts/basic/split-include
>scripts/basic/.split-include.d: done.
>  HOSTCC  scripts/basic/docproc
>scripts/basic/.docproc.d: done.
>  SPLIT   include/autoconf.h -> include/config/*
>  GEN     include/bbconfigopts.h
>applets/.applets.o.cmd:410: *** multiple target patterns.  Stop.
