From: Craig Swank <craigswank@fastmail.fm>
Date: Sun, 27 Dec 2015 11:27:04 -0800
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <1451242088.1715665.477206994.26B1FEBA@webmail.messagingengine.com>
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
 <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
 <20151223193943.21a6f0fc@free-electrons.com>
 <1450910736.3752716.475291418.490BB3EA@webmail.messagingengine.com>
 <20151223235253.0afe702e@free-electrons.com>
 <1450917779.3775953.475348978.37FAC3A8@webmail.messagingengine.com>
 <n5mdi8$5go$1@ger.gmane.org>
 <1451154853.3394517.476716010.48669FA1@webmail.messagingengine.com>
 <CA+-urNRO0DWv7Xw+DctiFspDootbJRwbwdE66UYMbfCjL8jWuQ@mail.gmail.com>
 <1451173488.3993354.476829962.2D827969@webmail.messagingengine.com>
 <20151227110817.288a2e3f@free-electrons.com>
 <1451223280.497246.477065626.34AC2AD3@webmail.messagingengine.com>
 <CAOURK2uwXJd7KpTrWZqZP_Ci3oPQjOYedF-_Je0yTTo5tnFbNg@mail.gmail.com>
 <1451235670.1698153.477162482.3D38F83F@webmail.messagingengine.com>
 <CAOURK2s7T+0U08HTBBKKpvVRxrvqTQBLD0VjqM-NwoHdnr-Zww@mail.gmail.com>
 <1451242088.1715665.477206994.26B1FEBA@webmail.messagingengine.com>
Message-ID: <1451244424.1722334.477223642.2606D039@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Never mind. ?I found that the 'ocp' section is in?am33xx.dtsi. ?And
looking at the history of that file you can see that gpio in the
ocp node used to go from 1-4 and now they are 0-3 (gpio0, gpio1,
...). ?Fixing that doesn't help with the kernel modules not being
loaded, however.



On Sun, Dec 27, 2015, at 10:48 AM, Craig Swank wrote:
> The modules are there. ?I'm able to modprobe them from the
> command line.
>
> As far as the difference between the device tree structures, I'm just
> trying to learn about this. ?For instance, my overlay looks like:
>
> /dts-v1/; /plugin/; / {? ? ? ? compatible = "ti,beaglebone", "ti,beaglebone-
> black";? ? ? ? part-number = "BB-W1";? ? ? ? version = "00A0";
>
> exclusive-use = "P8.11";
>
> fragment at 0 {? ? ? ? ? ? ? ? target = <&am33xx_pinmux>;
> __overlay__ {? ? ? ? ? ? ? ? ? ? ? ? bb_w1_pins: pinmux_bb_w1_pins {
> pinctrl-single,pins = ?<0x34 0x37 /* gpmc_ad13.gpio1_13,
> OMAP_PIN_INPUT_PULLUP | OMAP_MUX_MODE7 - w1-gpio */ >;
> };? ? ? ? ? ? ? ? };? ? ? ? };
>
> fragment at 1 {? ? ? ? ? ? ? ? target = <&ocp>;
> __overlay__ {? ? ? ? ? ? ? ? ? ? ? ? onewire at 0 {
> status ? ? ? ? ?= "okay";? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? compatible
> = "w1-gpio";? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? pinctrl-names ? =
> "default";? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? pinctrl-0 ? ? ? =
> <&bb_w1_pins>;? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? gpios ? ? ? ? ? =
> <&gpio2 13 0>;? ? ? ? ? ? ? ? ? ? ? ? };? ? ? ? ? ? ? ? };? ? ? ? };
> };
>
> I see am33xx_pinmux in?am335x-boneblack.dts, but I don't see 'ocp'.
> Is this what you mean by looking at the structure of the new device
> tree? ?Since I don't see 'ocp' then does that mean that target (target
> = <&ocp>;) could be my problem?
>
>
> On Sun, Dec 27, 2015, at 10:36 AM, Chris LaRocque wrote:
>> Yes, I'll test the DTC. I've already created some overlays but there
>> is a difference between the version 3.X and 4.X capemanager. You need
>> to look at the structure of the new device trees and patch the old
>> cape overlays to make them work. I'm struggling with that as well.


>> You might want to verify that the modules are built.


>> C


>> Pushing back the boundaries of ignorance.


>> On Dec 27, 2015 12:01, "Craig Swank" <craigswank@fastmail.fm> wrote:
>>> __
>>> I'll be interested in how your tests for the DTC patch go.? I'm not
>>> having luck with the bone_capemgr at the moment and am considering
>>> filing a bug at beagleboard/linux.
>>>
>>> Will your tests involve compiling a .dtbo file and doing an echo
>>> command to /sys/devices/platform/bone_capemgr/slots?? When I try to
>>> load my dtbo file (for dallas one wire temperature sensor), the
>>> expected kernel modules don't get loaded even though no errors show
>>> up in dmesg.
>>>
>>>
>>>
>>>
>>> On Sun, Dec 27, 2015, at 08:28 AM, Chris LaRocque wrote:
>>>>


>>>>
>>>> Hello
>>>>


>>>> I'm running a new beaglebone_defconfig as we speak and may be able
>>>> to post a patch this afternoon.


>>>> The DTC patch will take me a couple of days to test. What I posted
>>>> earlier was a hack that accomplished my needs but it needs to be a
>>>> little more refined. I'll review the debian install script at?github.com/beagleboard/bb.org-
>>>> overlays to see how to best incorporate both the DTC patch and the
>>>> device tree overlays. Can I put the DTC patch into the
>>>> /board/beaglebone directory and have it specified for application
>>>> in the board defconfig? Suggestions on this aspect would be much
>>>> appreciated.


>>>> Regards


>>>> C


>>>>


>>>> Pushing back the boundaries of ignorance.


>>>> I'd like to help out, but it might take a bit of hand holding for
>>>> me since I'm pretty new to buildroot and submitting patches.? I
>>>> suppose the things that would need to be changed would be
>>>>
>>>> 1. configs/beaglbone_defconfig
>>>> 2. the uEnv.txt file needs to be different in output/images
>>>> 3. Chris attached a patch for the host dtc
>>>> 4. Two configs for the kernel build need to change
>>>>
>>>> I have a diff for configs/beaglebone_defconfig but everything else
>>>> I'm not sure where to start.
>>>>
>>>> If someone has time to coach me through this I'm happy to learn,
>>>> but if it is easier for someone else to do this I could learn from
>>>> that too.
>>>>
>>>>
>>>>
>>>> On Sun, Dec 27, 2015, at 02:08 AM, Thomas Petazzoni wrote:
>>>> > Hello all,
>>>> >
>>>> > On Sat, 26 Dec 2015 15:44:48 -0800, Craig Swank wrote:
>>>> >
>>>> > > YES!? Using Chris's uEnv.txt and u-boot 2015.07 instead of
>>>> > > 2015.10 it finally booted up correctly.? Many thanks to Thomas,
>>>> > > Chris, and, last but not least, Frank, who swooped in with the
>>>> > > secret sauce at the very end.
>>>> > >
>>>> > > I'm not even close to being able to figure out why the 07
>>>> > > version worked and 10 did not, but I'm just too happy to care.
>>>> >
>>>> > Glad to hear that you solved the different problems.
>>>> >
>>>> > Our beaglebone_defconfig is utterly old, and it would be really
>>>> > great to update it to use newer kernel and u-boot versions.
>>>> >
>>>> > Thanks!
>>>> >
>>>> > Thomas
>>>> > --
>>>> > Thomas Petazzoni, CTO, Free Electrons Embedded Linux, Kernel and
>>>> > Android engineering http://free-electrons.com
>>>>
>>>>
>>>> --
>>>> Craig Swank craigswank at fastmail.fm
>>>
>>> --
>>> Craig Swank craigswank at fastmail.fm
>>>
>>>
>
> --
> Craig Swank? craigswank at fastmail.fm
>
>
> _________________________________________________
> buildroot mailing list buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
? Craig Swank
? craigswank at fastmail.fm
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151227/5aae6731/attachment.html>
