From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:07:04 +0100
Subject: [Buildroot] [PATCH v6 4/6] support/testing: add polkit systemd
 test
In-Reply-To: <20191206234649.3972927-4-aduskett@gmail.com>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191206234649.3972927-4-aduskett@gmail.com>
Message-ID: <20191208160704.71cf7855@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 15:46:47 -0800
aduskett at gmail.com wrote:

> +class TestPolkitSystemd(infra.basetest.BRTest):
> +    br2_external = [infra.filepath("tests/package/br2-external/polkit")]
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_INIT_SYSTEMD=y
> +        BR2_JLEVEL=10
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.86"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"

This requires building the kernel, while the test infrastructure
provides two pre-compiled kernels, one for ARMv7 and one for ARMv5.
Isn't it possible to use them ?

> +    def test_run(self):
> +        self.login()
> +
> +        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
> +        self.assertRunOk(cmd, timeout=10)

I'm confused, shouldn't this command fail, since it's executed before
you copy the rule at the right place ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
