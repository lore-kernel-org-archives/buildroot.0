From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:14:09 +0200
Subject: [Buildroot] [PATCH 1/1] support/testing: add
 package/test_mender.py
In-Reply-To: <20200429131954.GA18375@P-NAN-EREVAN-mikbou>
References: <20200429131954.GA18375@P-NAN-EREVAN-mikbou>
Message-ID: <20200429221409.62eb04bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mikael,

I'd be really interested to have some feedback from Angelo and/or Adam
(who work with/use Mender).

On Wed, 29 Apr 2020 15:19:54 +0200
Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr> wrote:

> +class TestMender(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y

Is this needed ?

> +        BR2_PACKAGE_MENDER=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_ROOTFS_OVERLAY="{}"
> +        """.format(
> +           # overlay to add a fake 'fw_printenv', used by Mender
> +           infra.filepath("tests/package/test_mender/rootfs-overlay"))
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Check if the 'mender' binaries are correctly installed
> +        self.assertRunOk("ls /usr/bin/mender")
> +        self.assertRunOk("ls /etc/mender/mender.conf")
> +        self.assertRunOk("ls /etc/init.d/S42mender")

I am not sure these particular checks are really that useful. Checking
that Mender is started and works is IMO enough.

So overall, I have pretty minor comments, the test looks good to me. It
would obviously be nicer to have a more complete test, but this is
much, much more difficult to implement.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
