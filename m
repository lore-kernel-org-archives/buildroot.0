From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 20 Mar 2019 09:49:35 +0100
Subject: [Buildroot] [PATCH v2 6/8] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <fd4d553e-7db9-3e2e-7e2d-e266a352fa31@mind.be>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
 <1552951269-16967-6-git-send-email-etienne.carriere@linaro.org>
 <fd4d553e-7db9-3e2e-7e2d-e266a352fa31@mind.be>
Message-ID: <CAN5uoS-TB-qso-27HKP6G4zhHmh-VrvQ+KgkbTsF47SrQ08K9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,


On Tue, 19 Mar 2019 at 23:00, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Etienne,
>
>  Just a few points I noticed, not a complete review...
>
> On 19/03/2019 00:21, Etienne Carriere wrote:
> > +  ln -s ./u-boot.bin output/images/bl33.bin
> > +  ln -s ./tee-header_v2.bin output/images/bl32.bin
> > +  ln -s ./tee-pager_v2.bin output/images/bl32_extra1.bin
> > +  ln -s ./tee-pageable_v2.bin output/images/bl32_extra2.bin
>
>  This should be done in a post-build script.

This file renaming is very specific to the Qemu platform due to Qemu
semihosting. If done at installation time, it should be part of
optee-os.mk or arm-trusted-firmware.mk. But such a change would be
relevant only for the Qemu based boards. It is not generic at all.

I though it would be simpler to state this file renaming in the board
readme file, rather than a hack in boot/arm-trusted-firmware package
for the Qemu case.

>
>  Also, don't use ./, i.e.
>
> ln -s u-boot.bin output/images/bl33.bin

Ok, I'll fix.
Thanks

>
> [snip]
> > +Note "-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic"
> > +brings virtfs support for file sharing with the hosted Linux OS.
>
>  I thought virtfs was enabled with -virtfs. The netdev option creates a virtio
> net device and IIUC you use p9 to get an fs over that.
>
>  But I don't think we typically enable or document that kind of feature in our
> qemu configs. Just enable the minimum that is needed to be able to get a console
> and a network connection.

Hmm, looking back at this... this setup and description is incomplete.
Actually OP-TEE can be used in networking support. When so, argument:
     -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic
enable Qemu SLiRP user networking. This is used by the OP-TEE tests.

For virtfs, there are a few extra args to provide, no listed in the
proposed readme.txt.

I will fix the readme and remove info about virtfs.


>
>  In fact, I think this defconfig should be as close as possible to the vexpress
> defconfig. But I'm not sure if the a9 supports trustzone, so perhaps it's better
> to switch the vexpress config to a15.

c-a9 supports trustzone. But c-a15 is more handy to cover various
armv7-a cores flavors.
c-15 supports c-a9 features plus other features found in the armv7-a
family (virtualization, 40-bit addressing, ...)
The Qemu platforms upstreamed in TF-A and OP-TEE are based on c-a15.

That said, whether the proposed qemu_armv7a_tz_virt should replace
existing vexpress, I really cannot tell. Enabling arm-trustzone in
Qemu (-machine secure=on) may drop features that the current vexpress
supports (graphics?).

>
> [snip]
> > +# Qemu emulator for the Arm target
> > +BR2_PACKAGE_HOST_QEMU=y
> > +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> > +BR2_PACKAGE_HOST_QEMU_VIRTFS=y
>
>  Why is this needed? AFAICS there is nothing special about the Buildroot-built
> host-qemu, so the system-installed qemu should work just as well, no?

By system-installed you mean the user OS, as my ubuntu, for example,
where I run Buildroot builds and tests?
I think it is a shame I need to install a specific version of Qemu on
my host when Buildroot can produce the up-to-date Qemu tools.

Regards,
etienne

>
>
>
>  Regards,
>  Arnout
