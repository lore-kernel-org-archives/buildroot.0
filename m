From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 5 Mar 2019 10:14:07 +0100
Subject: [Buildroot] [PATCH v4 6/7] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <8d23dabb-4270-9c5f-4432-84cebee42c5a@mind.be>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
 <1548845249-28201-6-git-send-email-etienne.carriere@linaro.org>
 <20190217231234.321ec6e4@windsurf.home>
 <8d23dabb-4270-9c5f-4432-84cebee42c5a@mind.be>
Message-ID: <CAN5uoS_1zj1=ywE3-Gu55UksPAsHdGGEgAgm+YAAV=Wuo2pBfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Feb 2019 at 09:31, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 17/02/2019 23:12, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Wed, 30 Jan 2019 11:47:28 +0100
> > Etienne Carriere <etienne.carriere@linaro.org> wrote:
> >
> >> This change introduces a Qemu board for an Armv7-A target executing
> >> with OP-TEE secure world services.
> >>
> >> The target Linux based normal world embeds the standard minimal
> >> filesystem with OP-TEE non-secure components embedded files from
> >> OP-TEE test, examples and benchmark packages.
> >>
> >> The Linux custom configuration is dumped from the vexpress_defconfig
> >> with few added fragments: OP-TEE driver and 9p for virtual filesystem to
> >> ease file manipulation and exchanges through Qemu virtfs support.
> >>
> >> The standard way for booting OP-TEE with a non-secure world companion
> >> use the Arm Trusted Firmware-A as bootloader. OP-TEE OS provides the
> >> BL32 image and U-boot the BL33 image. The proposed board enables OP-TEE
> >> and U-boot build for this. However package boot/arm-trusted-firmware
> >> needs few change support building Armv7-A targets.
> >>
> >> Therefore the proposed board allows one to build the images but not
> >> yet to run the target with the built Qemu host tool.
> >>
> >> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> >
> > I don't know what is the opinion of Peter, Arnout and Yann, but I think
> > this PATCH 6/7 and PATCH 7/7, instead of adding more defconfigs should
> > instead add test cases to our runtime test infrastructure in
> > support/testing/. Indeed:
> >
> >  - We probably don't want to have Qemu defconfigs for every possible
> >    feature in Buildroot
>
>  I don't quite agree. I think we *do* want to have defconfigs that demonstrate
> major features. For example, I like that we have qt5 defconfigs for several
> platforms.
>
>  And for those defconfigs, obviously it is great if it can be qemu-based, as
> Etienne pointed out. (For the Qt5 ones obviously they can't be qemu-based, and
> indeed currently we don't have any qemu-based feature defconfigs.)
>
>  So IMO this TrustZone defconfig is a good thing.
>
> >
> >  - A runtime test case, even if it's indeed a bit less visible than a
> >    defconfig, still documents a configuration that "works" for a given
> >    feature.
>
>  So I would propose a runtime test that uses that defconfig.
>

Dear all,

I've prepared something to test the optee on qemu/arm through the
runtime tests but few questions puzzle me.

1/ To use the board defconfig for the test, I created the file
support/test/conf/qemu_xxx_defconfig as a symlink to
configs/qemu_xxx_defconfig.
I'm not sure it is that nice. But it allowed to set the test config in
the test_opee.py using:

    class TestOpteeXtest(infra.basetest.BRTest):
        with open(infra.filepath('conf/qemu_armv7a_tz_virt_defconfig'),
'r') as config_file:
            config = "".join(line for line in config_file if line[:1]!='#')

If you think there is another more convenient way, feel free to suggest.

2/ To share this test I need few preliminary changes in arm-trusted-firmware.
This will brings a series of dependent patches: tf-a updates + qemu
board defconfig + optee runtime test script.
The series depends on branch next, as dependent on OP-TEE packages.
That will make several versatile changes in a single patches series
over the next branch.

I plan to submit the series to the ML, for the next.
Tell me if you rather have this work be reviewed in 2 steps: first
tf-a changes, then once merged, qemu board and the optee runtime test.

Best regards,
etienne



>
>  Regards,
>  Arnout
>
>
> >
> >  - A runtime test case allows to really runtime test the feature by
> >    booting Qemu.
> >
> > Etienne, would you be willing to convert those two configurations to
> > the runtime test infrastructure ?
> >
> > Thanks!
> >
> > Thomas
> >
