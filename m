From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 May 2013 08:36:14 +0200
Subject: [Buildroot] [PATCH 3/5] am33x-cm3: add FW for suspend/resume
In-Reply-To: <CAE4k239uzqJGVwGSsP7AtrQrbcKqNbe3f1P5ix33U8rpge96EA@mail.gmail.com>
References: <CAE4k239uzqJGVwGSsP7AtrQrbcKqNbe3f1P5ix33U8rpge96EA@mail.gmail.com>
Message-ID: <518DE6DE.2070101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/13 06:38, Anders Darander wrote:
> (Resend a as I first sent from an unsubcribed email).
>
> Arnout Vandecappelle <arnout at mind.be <mailto:arnout@mind.be>> wrote:
>
>  >On 09/05/13 22:31, Anders Darander wrote:
>  >> From: Anders Darander <anders@chargestorm.se
>  >>
>  >> Without this firmware, the beaglebone won't be able to reboot
>  >correctly.
>  >>
>  >> Signed-off-by: Anders Darander <anders@chargestorm.se
>  >[snip]
>  >> diff --git a/package/am33x-cm3/am33x-cm3.mk <http://am33x-cm3.mk>
>  >b/package/am33x-cm3/am33x-cm3.mk <http://am33x-cm3.mk>
>  >> new file mode 100644
>  >> index 0000000..6180157
>  >> --- /dev/null
>  >> +++ b/package/am33x-cm3/am33x-cm3.mk <http://am33x-cm3.mk>
>  >> @@ -0,0 +1,26 @@
>  >> +#############################################################
>  >> +#
>  >> +# am33x-cm3
>  >> +#
>  >> +#############################################################
>  >> +
>  >> +# SHA1 corresponds to tag "AM335xPSP_04.06.00.10-rc1"
>  >> +AM33X_CM3_VERSION = 27ca4643e422245a95723de1df0247a00eada45b
>  >
>  >  If it is a tag, then use the tag, not the sha1.
>
> Ok, I'll double check that the tag exists and update the patch.
>
>  >> +AM33X_CM3_SITE = git://arago-project.org/git/projects/am33x-cm3.git
>  >> +AM33X_CM3_METHOD = git
>  >
>  >  Since the site starts with git://, the method is git by default.
>
> I didn't get the fetcher to actually try git unless I added the method
> explicitly. All my previous ?ries ended with wget errors.

  Works for me though. But anyway, if you switch to http it's irrelevant.

>
>  >However, if the site supports http, we prefer to use that. Some company
>  >
>  >firewalls block git.
>
> Ok I'll lade if I can find out if http is available.
>
>  >> +AM33X_CM3_LICENSE = TI-BSD
>  >
>  >I don't really like this license name. Either it's BSD (then it should
>  >specify 2-, 3- or 4-clause), or it is not. In the latter case, it would
>  >
>  >be something like "TI Open Source license (BSD-like)".
>
> To be honest, I merely used what TI is using in their own BSP. I'll see
> what it reads like.

  OK I checked and there's nothing BSD-like about it. The full title is
Texas Instruments Incorporated Technology and Software Publicly Available 
Software License Agreement
I propose we abbreviate that to e.g.
TI Publicly Available Software License

>  >> +AM33X_CM3_LICENSE_FILES = License.txt
>  >> +
>  >> +define AM33X_CM3_BUILD_CMDS
>  >> + $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
>  >all
>  >
>  >Does it work with $(TARGET_CONFIGURE_OPTS) instead of CC=? If not, then
>  >
>  >please also pass the CFLAGS and LDFLAGS - they may be important.
>  >
>  >However, now I think about it - this is abusing the cross-compiler for
>  >the Cortex-A8 to generate code for the Cortex-M3, correct? In that
>  >case,
>  >passing CFLAGS and LDFLAGS is probably not a good idea. But it would
>  >also
>  >be good to add a note about what is happening here.
>
> I'll add a comment on this. Once again, the technique is taken from the
> TI's BSP.

  I get a lot of

warning: switch -mcpu=cortex-m3 conflicts with -march=armv7-a switch 
[enabled by default]

but I guess these are harmless.

(the -march=armv7-a is added by the toolchain wrapper).

  But I'm not 100% sure if a custom toolchain will actually build for the 
correct architecture. Could you try if the result of something built with 
the buildroot toolchain works correctly? If you want, I can send you the 
.bin file so you don't have to wait an hour for the whole toolchain to 
compile. Or, if you have actually tested it with a buildroot toolchain, 
could you try if it also works with an external Sourcery and/or Linaro 
toolchain?

>  >> +endef
>  >> +
>  >> +# Not all of the firmware files are used
>  >> +define AM33X_CM3_INSTALL_TARGET_CMDS
>  >> + $(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/
>  >> + $(INSTALL) -m 0644 $(@D)/bin/am335x-pm-firmware.bin
>  >$(TARGET_DIR)/lib/firmware
>  >
>  >  We normally create directories with the -D option to install, so:
>  >
>  > $(INSTALL) -m 0644 -D  $(@D)/bin/am335x-pm-firmware.bin \
>  > $(TARGET_DIR)/lib/firmware/am335x-pm-firmware.bin
>
> Ok, I'll fix that.
>
>  >> + $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/init.d
>  >> + $(INSTALL) -m 0755 package/am33x-cm3/am335x-pm-firmware-load
>  >$(TARGET_DIR)/etc/init.d/S93-am335x-pm-firwmare-load
>  >
>  >  init scripts are installed by a separate variable,
>  >AM33X_CM3_INSTALL_INIT_SYSV. And of course, the same remark about the
>  >-D
>  >option applies.
>
> Thanks, I'm fox that too.
>
> Does that make it install when using busybox init also?

  Yes it does.

  Only when systemd is selected, it doesn't install anything. So ideally 
you should also add a systemd unit file.


  Regards,
  Arnout

>
> Thanks for the feedback!
>
> Cheers,
> Anders
>
> --
> Anders Darander
> ChargeStorm AB          Tel: +46 702 44 84 36
> Laxholmstorget 3        Email: anders at chargestorm.se
> <mailto:anders@chargestorm.se>
> 602 21 Norrk?ping       Web: www.chargestorm.se <http://www.chargestorm.se>
>
> Sent from my Android phone with K-9 Mail. Please excuse my brevity.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
