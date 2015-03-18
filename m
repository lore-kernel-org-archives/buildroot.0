From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Tue, 17 Mar 2015 20:40:03 -0500
Subject: [Buildroot] Driver for C-Media Electronics,
 Inc. CM106 based usb audio device?
In-Reply-To: <CAFGceHHUm-4eQAA+ZDaK+B1CM6GtVKA6TgBoGhd42gacqq4PTw@mail.gmail.com>
References: <trinity-47849913-e383-4ff5-93a0-78074e46f85e-1424984060999@3capp-gmx-bs21>
 <CAFGceHHHVN_Fnnc6=pX-7LdyrTzWXeHGQd1R0FfBcLxf0un4xA@mail.gmail.com>
 <CAFGceHE5Hm1jK7DExHmf74E=XV5U3a8ZQ-zwwbZCnG=PN8iR8w@mail.gmail.com>
 <CAFGceHEKyhqV1LRfjBUUXqPqkAC51khmHbSh5jhKbCTU_=H-SA@mail.gmail.com>
 <CAFGceHHUm-4eQAA+ZDaK+B1CM6GtVKA6TgBoGhd42gacqq4PTw@mail.gmail.com>
Message-ID: <CAFGceHFpx3mFkVhV1mrH2i--2jm6U9c3raKmBnc-hs+BKYvxbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I found out what can be causing the garbled audio issue. I was able to
change the login shell at /etc/inittab and changing it from

tty1::respawn:/sbin/getty -L tty1 38400 vt100

to either

tty1::respawn:/bin/sh (this one allows autologin of root)
tty1::respawn:/bin/login -f root tty1

but each has its problems.

the /bin/sh one, while it allows autologin of root and gets rid of the
garbled audio, seems to override the settings on mplayer, alsa, and
sometimes I get a LOUD white noise. It changes mplayer's behavior.

the /bin/login solves the problem better, but it doesn't autologin, and I
want to autologin to root.

both of the above options also change the way mplayer's console output is
displayed. instead of the time scrolling line by line and filling the
console with numbers, it's one line instead, which I like better. The
default /sbin/getty login has the garbled audio problem.










On Sun, Mar 15, 2015 at 10:46 PM, Lou Crittenden <loucrittenden63@gmail.com>
wrote:

> I am reading around that the garbled audio is a result of latency in the
> usb audio stream and it has something to do with the i/o packets or
> something like that, as per here:
>
> http://www.raspyfi.com/raspberry-pi-usb-audio-fix/
>
>
>
> On Sun, Mar 15, 2015 at 8:23 PM, Lou Crittenden <loucrittenden63@gmail.com
> > wrote:
>
>> Good news on getting all the channels to work on my card: as per this how
>> to located here: http://ubuntuforums.org/showthread.php?t=783222
>>
>> I had to create a .asoundrc file in my /root (or my home) directory with
>> the following contents:
>>
>> pcm.!default {
>>     type route
>>     slave.pcm surround51
>>     slave.channels 6
>>     ttable.0.0 1
>>     ttable.1.1 1
>>     ttable.0.2 1
>>     ttable.1.3 1
>>     ttable.0.5 0.5
>>     ttable.1.5 0.5
>> }
>>
>> I then had to tell mplayer to use alsa as the main output as per instructions in this link:
>> http://crunchbang.org/forums/viewtopic.php?pid=229427
>>
>> of course, I edited out the x11 stuff and others that are not relevant to my setup.
>>
>> I still have the garbled audio on mplayer unless I use the -quiet option, unfortunately.
>>
>>
>> On Tue, Mar 3, 2015 at 7:23 PM, Lou Crittenden <loucrittenden63@gmail.com
>> > wrote:
>>
>>> Also tried loading songs on the sd card, but I have the same issue.
>>>
>>> On Mon, Mar 2, 2015 at 2:08 AM, Lou Crittenden <
>>> loucrittenden63 at gmail.com> wrote:
>>>
>>>> > Do you have audio distortions too in case of leds blinking etc.?
>>>> > If no its definitely not a pure electric problem..., if yes try
>>>> another
>>>> > sound device...
>>>>
>>>> No.
>>>> The garbled audio I showed happens only with the usb device on
>>>> buildroot, but not on the raspbian image, whereas the noise happens on both
>>>> the raspbian image and buildroot.
>>>>
>>>> The clicks, whines, pops, hiss etc are noticeable in between songs or
>>>> quiet passages of a song as background noise that is also present on the
>>>> onboard audio of the Pi. The pi audio has it much worse, though
>>>>
>>>> On Thu, Feb 26, 2015 at 2:54 PM, Peter Seiderer <ps.report@gmx.net>
>>>> wrote:
>>>>
>>>>> Hello Lou,
>>>>>
>>>>> On Wed, Feb 25, 2015 at 07:53:01PM -0600, Lou Crittenden wrote:
>>>>> > >I was able to compile and run a rockbox version on RPi/buildroot,
>>>>> but still
>>>>> > > without audio file playing...
>>>>> >
>>>>> > Awesome! Can I see it?
>>>>>
>>>>> See buildroot patch at end of e-mail (very early, very hackisch
>>>>> version)...
>>>>>
>>>>> >
>>>>> > I was able to run mplayer with no options in a terminal within the
>>>>> raspbian
>>>>> > image that came with my waveshare device and it didn't have a bit of
>>>>> > problems with the audio. It sounded great actually.
>>>>> >
>>>>>
>>>>> Do you have audio distortions too in case of leds blinking etc.?
>>>>> If no its definitely not a pure electric problem..., if yes try another
>>>>> sound device...
>>>>>
>>>>> > You're probably right on the resource part, and I believe the
>>>>> buildroot
>>>>> > kernel has a lot to do with it, but the raspbian kernel didn't have
>>>>> that
>>>>> > issue at all, but of course it just takes a long time to boot
>>>>> compared to
>>>>> > buildroot. I want to use the isolator to isolate the usb sound
>>>>> device from
>>>>> > the background zipper noises, pops, buzzes, whining, and other
>>>>> garbage from
>>>>> > the main computer board that happens when for example you are
>>>>> scrolling a
>>>>> > page or leds on the board blink.
>>>>> >
>>>>>
>>>>> Sounds strange...
>>>>>
>>>>> > I have included a sample of what I am running into as far as the
>>>>> audio.
>>>>> > This was with the commands:
>>>>> >
>>>>> > # cd /media/usb0 (this thumbdrive is where my music is located)
>>>>> > # mplayer *
>>>>> >
>>>>> > and with my usb sound device plugged in. It doesn't do that with the
>>>>> > onboard card, though (even though it sounds like poo, as I have
>>>>> heard it
>>>>> > was only 11-bit audio). When I'm running:
>>>>> >
>>>>> > # mplayer -quiet *
>>>>> >
>>>>> > it plays normally through the usb card even with other processes
>>>>> running,
>>>>> > but still doesn't sound near as good as either my ubuntu system or
>>>>> the
>>>>> > raspbian image.
>>>>> >
>>>>> > [-- Attachment #2: garbled mplayer no flags switching songs.mp3 --]
>>>>> > [-- Type: audio/mpeg, Encoding: base64, Size: 743K --]
>>>>>
>>>>> Strange, but I would suspect some kernel/driver problem, try to copy
>>>>> the sound files to the local filesystem, unplug your usb-memory and
>>>>> try with only the usb-soundcard attached (just guessing, not much
>>>>> help without hardware to test)...
>>>>>
>>>>> Try to find out the difference between raspbian and buildroot
>>>>> kernel version/config...
>>>>>
>>>>> > I also found out that the snd-usb-audio driver indeed does work with
>>>>> all of
>>>>> > the channels when I input the command
>>>>> >
>>>>> > # speaker-test -Dplug:surround51 -c6
>>>>> >
>>>>> > to test all of the speaker channels. The woman's voice came through
>>>>> on all
>>>>> > the appropriate channels, plus they are adjustable in alsamixer. I
>>>>> just
>>>>> > can't get mplayer to use them all when using alsa as the backend (I
>>>>> haven't
>>>>> > gotten pulseaudio to work in buildroot) and it outputs through the
>>>>> front
>>>>> > only. I have the same issue when using alsa as the backend on this
>>>>> card in
>>>>> > the raspbian image as well (but good sound) yet it uses the same
>>>>> > snd-usb-audio driver, same with my ubuntu system.
>>>>> >
>>>>> > Would you recommend pulseaudio in my situation?
>>>>> >
>>>>>
>>>>> Should work with alsasound directly....but you can never know...,
>>>>> sorry I am
>>>>> no alsa-/pulse sound expert...
>>>>>
>>>>> Regards,
>>>>> Peter
>>>>>
>>>>> >
>>>>> > On Wed, Feb 25, 2015 at 1:42 PM, Peter Seiderer <ps.report@gmx.net>
>>>>> wrote:
>>>>> >
>>>>> > > Hello Lou,
>>>>> > >
>>>>> > > On Tue, Feb 24, 2015 at 05:58:45PM -0600, Lou Crittenden wrote:
>>>>> > > > Good news, I found a workaround to the garbled audio issue on
>>>>> use of
>>>>> > > > mplayer when using my USB card. What I have to do is pass the
>>>>> -quiet
>>>>> > > option
>>>>> > > > when running mplayer. For example: mplayer -quiet test.mp3. It
>>>>> turns out
>>>>> > > > that activity on the lcd screen was the culprit, and it
>>>>> interferes with
>>>>> > > the
>>>>> > > > audio and it ONLY does that when using the usb audio card. When
>>>>> no
>>>>> > > options
>>>>> > > > are passed, the display continually scrolls the time and whatnot
>>>>> of the
>>>>> > > > audio playback every millisecond.
>>>>> > > >
>>>>> > > > mpg123 has much less terminal activity, and thus doesn't have
>>>>> the issue.
>>>>> > > >
>>>>> > > > I was wondering if this is a power issue and if it would work if
>>>>> I used
>>>>> > > an
>>>>> > > > isolator that allowed the device to receive its own power
>>>>> independent of
>>>>> > > > the Raspberry Pi board? Something like this:
>>>>> > > >
>>>>> > > >
>>>>> > >
>>>>> http://www.ebay.com/itm/ADUM4160-USB-Isolator-Board-ADI-USB-Port-Isolator-Protection-/191303685123?pt=LH_DefaultDomain_0&hash=item2c8a969403
>>>>> > > >
>>>>> > > > that electronically isolates the usb audio and power from the
>>>>> pi, but
>>>>> > > > allows the pi to talk to the device so the sound improves and
>>>>> improves
>>>>> > > > power stability.
>>>>> > > >
>>>>> > >
>>>>> > > Hard to tell without hearing a sample of what you describe as
>>>>> 'garbled
>>>>> > > audio',
>>>>> > > but I would less suspect a electrical/decouple problem, more
>>>>> suspect a pure
>>>>> > > resource problem of the mplayer aplication doing audio and display
>>>>> > > updates...
>>>>> > >
>>>>> > > Maybe you can stress mplayer -quiet and/or mpg123 doing some
>>>>> concurrent
>>>>> > > work/
>>>>> > > testbench running (e.g. untar a huge file (kernel source)), etc.
>>>>> and get
>>>>> > > the
>>>>> > > same audio defects?
>>>>> > >
>>>>> > > I was able to compile and run a rockbox version on RPi/buildroot,
>>>>> but still
>>>>> > > without audio file playing...
>>>>> > >
>>>>> > > Regards,
>>>>> > > Peter
>>>>> > >
>>>>>
>>>>> ---begin---
>>>>> From 218e06519422ec6923ec0b6bb068bee65ef39e6e Mon Sep 17 00:00:00 2001
>>>>> From: Peter Seiderer <ps.report@gmx.net>
>>>>> Date: Sat, 7 Feb 2015 14:53:17 +0100
>>>>> Subject: [PATCH] rockbox: new package (erly draft - hack version)
>>>>>
>>>>>
>>>>> diff --git a/package/Config.in b/package/Config.in
>>>>> index fe3d3d0..30eed47 100644
>>>>> --- a/package/Config.in
>>>>> +++ b/package/Config.in
>>>>> @@ -30,6 +30,7 @@ menu "Audio and video applications"
>>>>>         source "package/on2-8170-libs/Config.in"
>>>>>         source "package/opus-tools/Config.in"
>>>>>         source "package/pulseaudio/Config.in"
>>>>> +       source "package/rockbox/Config.in"
>>>>>         source "package/sox/Config.in"
>>>>>         source "package/tidsp-binaries/Config.in"
>>>>>         source "package/tstools/Config.in"
>>>>> diff --git a/package/rockbox/0001-hack-for-buildroot-compile.patch
>>>>> b/package/rockbox/0001-hack-for-buildroot-compile.patch
>>>>> new file mode 100644
>>>>> index 0000000..1e98854
>>>>> --- /dev/null
>>>>> +++ b/package/rockbox/0001-hack-for-buildroot-compile.patch
>>>>> @@ -0,0 +1,58 @@
>>>>> +diff --git a/tools/configure b/tools/configure
>>>>> +index 2dd1bf3..999dc6c 100755
>>>>> +--- a/tools/configure
>>>>> ++++ b/tools/configure
>>>>> +@@ -158,6 +158,12 @@ findsdl(){
>>>>> +   files="${CROSS_COMPILE}sdl-config:sdl-config"
>>>>> +   winbuild="$1"
>>>>> +
>>>>> ++  # check for overwrite via SDL_CONFIG
>>>>> ++  if [ -n "${SDL_CONFIG}" ]; then
>>>>> ++    echo ${SDL_CONFIG}
>>>>> ++    return;
>>>>> ++  fi
>>>>> ++
>>>>> +   IFS=":"
>>>>> +   for file in $files
>>>>> +   do
>>>>> +@@ -327,6 +333,8 @@ simcc () {
>>>>> +
>>>>> +  sdl=`findsdl $winbuild`
>>>>> +
>>>>> ++ echo "sdl = $sdl"
>>>>> ++
>>>>> +  if [ -n `echo $app_type | grep "sdl"` ]; then
>>>>> +     if [ -z "$sdl" ]; then
>>>>> +         echo "configure didn't find sdl-config, which indicates that
>>>>> you"
>>>>> +@@ -416,6 +424,13 @@ EOF
>>>>> + # the gcc version should most likely match what versions we build
>>>>> with
>>>>> + # rockboxdev.sh
>>>>> + #
>>>>> ++buildroot () {
>>>>> ++ prefixtools arm-buildroot-linux-gnueabi-
>>>>> ++ GCCOPTS="$CCOPTS -mcpu=rm1176jzf-s"
>>>>> ++ GCCOPTIMIZE="-fomit-frame-pointer"
>>>>> ++ endian="little"
>>>>> ++}
>>>>> ++
>>>>> + shcc () {
>>>>> +  prefixtools sh-elf-
>>>>> +  GCCOPTS="$CCOPTS -m1"
>>>>> +@@ -3391,6 +3406,7 @@ fi
>>>>> +     app_set_paths
>>>>> +     app_set_lcd_size
>>>>> +     memory=8
>>>>> ++    buildroot
>>>>> +     uname=`uname`
>>>>> +     simcc "sdl-app"
>>>>> +     tool="cp "
>>>>> +@@ -4232,7 +4248,8 @@ if [ -z "$arch" ]; then
>>>>> +     elif [ -n "$(echo $cpp_defines | grep -w __arm__)" ]; then
>>>>> +         arch="arm"
>>>>> +         # cpp defines like "#define __ARM_ARCH_4TE__ 1" (where we
>>>>> want to extract the 4)
>>>>> +-        arch_version="$(echo $cpp_defines | tr ' ' '\012' | grep
>>>>> __ARM_ARCH | sed -e 's,.*\([0-9]\).*,\1,')"
>>>>> ++        # arch_version="$(echo $cpp_defines | tr ' ' '\012' | grep
>>>>> __ARM_ARCH | sed -e 's,.*\([0-9]\).*,\1,')"
>>>>> ++        arch_version="6"
>>>>> +     elif [ -n "$(echo $cpp_defines | grep -w __mips__)" ]; then
>>>>> +         arch="mips"
>>>>> +         arch_version="$(echo $cpp_defines | tr ' ' '\012' | grep
>>>>> _MIPS_ARCH_MIPS | sed -e 's,.*\([0-9][0-9]\).*,\1,')"
>>>>> diff --git a/package/rockbox/Config.in b/package/rockbox/Config.in
>>>>> new file mode 100644
>>>>> index 0000000..837ed53
>>>>> --- /dev/null
>>>>> +++ b/package/rockbox/Config.in
>>>>> @@ -0,0 +1,6 @@
>>>>> +config BR2_PACKAGE_ROCKBOX
>>>>> +       bool "rockbox"
>>>>> +       help
>>>>> +         Rockbox is a free replacement firmware for digital music
>>>>> players.
>>>>> +
>>>>> +         http://www.rockbox.org/
>>>>> diff --git a/package/rockbox/rockbox.mk b/package/rockbox/rockbox.mk
>>>>> new file mode 100644
>>>>> index 0000000..9731b54
>>>>> --- /dev/null
>>>>> +++ b/package/rockbox/rockbox.mk
>>>>> @@ -0,0 +1,40 @@
>>>>>
>>>>> +################################################################################
>>>>> +#
>>>>> +# rockbox
>>>>> +#
>>>>>
>>>>> +################################################################################
>>>>> +
>>>>> +ROCKBOX_VERSION = 8aa72f07f4bf38e9b898fb8d8042239861b9a423
>>>>> +ROCKBOX_SITE = git://git.rockbox.org/rockbox
>>>>> +# ToDo: check license and find the correct files
>>>>> +#ROCKBOX_LICENSE = GPLv2+
>>>>> +#ROCKBOX_LICENSE_FILES = COPYING COPYRIGHT
>>>>> +ROCKBOX_DEPENDENCIES = sdl alsa-lib
>>>>> +
>>>>> +# $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS)
>>>>> +
>>>>> +#      BUILDDIR=$(@D)
>>>>> +
>>>>> +define ROCKBOX_CONFIGURE_CMDS
>>>>> +       mkdir -p $(TARGET_DIR)/opt/rockbox
>>>>> +       cd $(@D); \
>>>>> +       CROSS_COMPILE=$(HOST_DIR)/usr/bin/arm-buildroot-linux-gnueabi-
>>>>> \
>>>>> +       SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config \
>>>>> +       tools/configure \
>>>>> +       --target=sdlapp \
>>>>> +       --lcdwidth=320 \
>>>>> +       --lcdheight=240 \
>>>>> +       --type=normal \
>>>>> +       --prefix=$(TARGET_DIR)/opt/rockbox
>>>>> +endef
>>>>> +
>>>>> +#      $(MAKE) -C $(@D) help
>>>>> +define ROCKBOX_BUILD_CMDS
>>>>> +       cd $(@D); $(MAKE)
>>>>> +endef
>>>>> +
>>>>> +#define ROCKBOX_INSTALL_TARGET_CMDS
>>>>> +#      $(MAKE) -C $(@D) fullinstall
>>>>> +#endef
>>>>> +
>>>>> +$(eval $(generic-package))
>>>>> --
>>>>> 2.1.4
>>>>> ---end---
>>>>>
>>>>
>>>>
>>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150317/51806e80/attachment.html>
