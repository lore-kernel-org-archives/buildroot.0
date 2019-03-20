From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 20 Mar 2019 13:06:11 +0100
Subject: [Buildroot] [PATCH v2 6/8] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <0193b95d-b0cd-9076-b618-487a10fadeb8@mind.be>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
 <1552951269-16967-6-git-send-email-etienne.carriere@linaro.org>
 <fd4d553e-7db9-3e2e-7e2d-e266a352fa31@mind.be>
 <CAN5uoS-TB-qso-27HKP6G4zhHmh-VrvQ+KgkbTsF47SrQ08K9Q@mail.gmail.com>
 <0193b95d-b0cd-9076-b618-487a10fadeb8@mind.be>
Message-ID: <CAN5uoS94pjr62mPk3GOeJeWjVZkEqpQ5e4FVXScBh58+iVDx_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Mar 2019 at 10:20, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/03/2019 09:49, Etienne Carriere wrote:
> > Hello Arnout,
> >
> >
> > On Tue, 19 Mar 2019 at 23:00, Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>  Hi Etienne,
> >>
> >>  Just a few points I noticed, not a complete review...
> >>
> >> On 19/03/2019 00:21, Etienne Carriere wrote:
> >>> +  ln -s ./u-boot.bin output/images/bl33.bin
> >>> +  ln -s ./tee-header_v2.bin output/images/bl32.bin
> >>> +  ln -s ./tee-pager_v2.bin output/images/bl32_extra1.bin
> >>> +  ln -s ./tee-pageable_v2.bin output/images/bl32_extra2.bin
> >>
> >>  This should be done in a post-build script.
> >
> > This file renaming is very specific to the Qemu platform due to Qemu
> > semihosting. If done at installation time, it should be part of
> > optee-os.mk or arm-trusted-firmware.mk. But such a change would be
> > relevant only for the Qemu based boards. It is not generic at all.
>
>  ... which is why I say it should be part of a post-build script that is
> specific for this defconfig. I'm talking about BR2_ROOTFS_POST_BUILD_SCRIPT.

Ok, great, I didn't saw there is such support. I'll add a script.


>
>
> > I though it would be simpler to state this file renaming in the board
> > readme file, rather than a hack in boot/arm-trusted-firmware package
> > for the Qemu case.
>
> [snip]
> >>  In fact, I think this defconfig should be as close as possible to the vexpress
> >> defconfig. But I'm not sure if the a9 supports trustzone, so perhaps it's better
> >> to switch the vexpress config to a15.
> >
> > c-a9 supports trustzone. But c-a15 is more handy to cover various
> > armv7-a cores flavors.
> > c-15 supports c-a9 features plus other features found in the armv7-a
> > family (virtualization, 40-bit addressing, ...)
>
>  ... which is exactly why a9 is interesting, because code built for a9 will run
> on most other cortexes while code built for a15 will possibly not run on a9.
>
> > The Qemu platforms upstreamed in TF-A and OP-TEE are based on c-a15.
>
>  That, however, is a good reason to use a15 for this defconfig.
>
>
> > That said, whether the proposed qemu_armv7a_tz_virt should replace
> > existing vexpress, I really cannot tell.
>
>  I never said to replace it! I said it should be as close as possible. IOW, any
> difference between the tz defconfig and the vexpress defconfig should have a
> good reason. And that reason should be explained in the commit message.
>
>  This reminds me: the defconfig should be named qemu_arm_vexpress_tz_defconfig
> so it is clear that it's a variant of qemu_arm_vexpress_defconfig.

Ok, i'll change.

>
>  I would also tend to merge the readme with the existing
> board/qemu/arm-vexpress/readme.txt because their content is a bit similar. But
> there are also reasons to split them (e.g., the script that scrapes the qemu
> launch command from the readme wouldn't work anymore).
>
> > Enabling arm-trustzone in
> > Qemu (-machine secure=on) may drop features that the current vexpress
> > supports (graphics?).
> >
> >>
> >> [snip]
> >>> +# Qemu emulator for the Arm target
> >>> +BR2_PACKAGE_HOST_QEMU=y
> >>> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> >>> +BR2_PACKAGE_HOST_QEMU_VIRTFS=y
> >>
> >>  Why is this needed? AFAICS there is nothing special about the Buildroot-built
> >> host-qemu, so the system-installed qemu should work just as well, no?
> >
> > By system-installed you mean the user OS, as my ubuntu, for example,
> > where I run Buildroot builds and tests?
>
>  Indeed, that's what I mean.
>
> > I think it is a shame I need to install a specific version of Qemu on
> > my host when Buildroot can produce the up-to-date Qemu tools.
>
>  Do you mean that trustzone emulation is a recent addition to qemu and is not
> yet available in the version shipped with e.g. Ubuntu 18.04? That would indeed
> be a valid reason to build qemu. But is should be explained in the commit log.

Qemu supports Arm secure world since 2.6.0, and there were fixes merged since.
Ubuntu 14.04 provides qemu 2.0.0.
Ubuntu-16.04 native qemu is 2.5.0.
Ubuntu 18.04 provides Qemu 2.11.1. I've not tested this later.
Buildroot is synced with 3.1.0, latest Qemu revision.

>
>  Otherwise, we should be consistent with all our qemu defconfigs. I agree that
> there is something to be said for building qemu as part of the defconfig. It
> would increase the build time, but probably not that much more compared to
> building the toolchain. But if we do this, it should be done for all qemu
> defconfigs, and the readme's should be updated.
>
>  Regards,
>  Arnout
