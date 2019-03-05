From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 5 Mar 2019 11:58:17 +0100
Subject: [Buildroot] [PATCH v4 6/7] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <20190305105529.1fcccbc3@windsurf>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
 <1548845249-28201-6-git-send-email-etienne.carriere@linaro.org>
 <20190217231234.321ec6e4@windsurf.home>
 <8d23dabb-4270-9c5f-4432-84cebee42c5a@mind.be>
 <CAN5uoS_1zj1=ywE3-Gu55UksPAsHdGGEgAgm+YAAV=Wuo2pBfA@mail.gmail.com>
 <20190305105529.1fcccbc3@windsurf>
Message-ID: <CAN5uoS-PdCLnh3BFkPF9a_-JQN79Rn6+Z3N0Spd6O931EEeAXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 5 Mar 2019 at 10:55, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello ?tienne,
>
> On Tue, 5 Mar 2019 10:14:07 +0100
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
>
> > I've prepared something to test the optee on qemu/arm through the
> > runtime tests but few questions puzzle me.
> >
> > 1/ To use the board defconfig for the test, I created the file
> > support/test/conf/qemu_xxx_defconfig as a symlink to
> > configs/qemu_xxx_defconfig.
> > I'm not sure it is that nice. But it allowed to set the test config in
> > the test_opee.py using:
> >
> >     class TestOpteeXtest(infra.basetest.BRTest):
> >         with open(infra.filepath('conf/qemu_armv7a_tz_virt_defconfig'),
> > 'r') as config_file:
> >             config = "".join(line for line in config_file if line[:1]!='#')
>
> infra.filepath() is as simple as:
>
> def filepath(relpath):
>     return os.path.join(os.getcwd(), "support/testing", relpath)
>
> so you can just do:
>
>         with open(os.path.join(os.getcwd(), "configs/qemu_armv7a_tz_virt_defconfig"))
>

Ok, i should have looked into :)
Thanks. I prefer to get rid of such symlink.

> however, I see one down-side with this: defconfigs are usually using an
> internal toolchain, so they take a long time to build. We typically try
> to use external toolchains for most runtime tests, to make them faster
> and therefore more usable. But perhaps you can take the defconfig +
> inject a few lines of configuration to use an external toolchain.
>

Great, I'll go this way: defconfig + extra toolchain directives.

> > 2/ To share this test I need few preliminary changes in arm-trusted-firmware.
> > This will brings a series of dependent patches: tf-a updates + qemu
> > board defconfig + optee runtime test script.
> > The series depends on branch next, as dependent on OP-TEE packages.
> > That will make several versatile changes in a single patches series
> > over the next branch.
> >
> > I plan to submit the series to the ML, for the next.
> > Tell me if you rather have this work be reviewed in 2 steps: first
> > tf-a changes, then once merged, qemu board and the optee runtime test.
>
> Note: next is going to be merged back in master very soon now, since
> 2019.02 has been released.
>
> If you already have all the changes, then please send them in one
> single series, it makes it clearer why the preparation patches are
> needed.
>

Fine, thank.
I'll send soon.

Regards,
etienne

>
> Also, I have seen your series improving various things in optee related
> packages, I intend to have a look very soon.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
