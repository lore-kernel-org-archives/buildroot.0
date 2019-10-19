From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Oct 2019 22:47:26 +0200
Subject: [Buildroot] [PATCH 1/1] board: Add FriendlyARM Nanopi NEO Plus2
 support
In-Reply-To: <20191017203947.17662-1-aussedat.louis@gmail.com>
References: <20191017203947.17662-1-aussedat.louis@gmail.com>
Message-ID: <e10c0985-a168-c732-a15e-d713f8644d3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Aussedat,

On 17/10/2019 22:39, Aussedat Louis wrote:
> From: aussedatlo <aussedat.louis@gmail.com>

 Please set your name correctly with `git config --global user.name="Aussedat
Louis"`.

 I've fixed that and applied to master, thanks.

 This is a pretty good patch for a first contribution! Still, there are a few
extensions I'd like to ask, if you have the time for it.

> 
> board with below features:
> - U-Boot 2019.01
> - Linux 5.0

 These are old versions, and the kernel is EOL. Could you update to the latest
of each (and of course test if it actually still works on the board)?

 It would also be nice to do the same for the other friendlyarm boards.

> - Default packages from buildroot
> 
> Signed-off-by: Aussedat Louis <aussedat.louis@gmail.com>

[snip]
> diff --git a/board/friendlyarm/nanopi-neo-plus2/genimage.cfg b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
> new file mode 100644
> index 0000000000..a4c2a7a894
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
> @@ -0,0 +1,39 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"Image",
> +			"sun50i-h5-nanopi-neo-plus2.dtb",
> +			"boot.scr"
> +		}
> +	}
> +	size = 64M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition spl {
> +		in-partition-table = "no"
> +		image = "sunxi-spl.bin"
> +		offset = 8192
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot.itb"
> +		offset = 40K
> +		size = 1M # 1MB - 40K
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}

 For booting from eMMC, U-Boot seems to evolve towards having the kernel inside
the rootfs in /boot, with an extlinux.conf instead of uEnv.txt to define boot
parameters. See for example orangepi-lite2. It would be nice to do the same for
the friendlyarm boards.

> +}
> diff --git a/board/friendlyarm/nanopi-neo-plus2/linux-extras.config b/board/friendlyarm/nanopi-neo-plus2/linux-extras.config
> new file mode 100644
> index 0000000000..f73f582331
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo-plus2/linux-extras.config
> @@ -0,0 +1,10 @@
> +# wireless core
> +CONFIG_WIRELESS=y
> +CONFIG_CFG80211=y
> +CONFIG_MAC80211=y
> +CONFIG_CFG80211_WEXT=y
> +
> +# wireless drivers
> +CONFIG_WLAN=y
> +CONFIG_WLAN_VENDOR_BROADCOM=y
> +CONFIG_BRCMFMAC=m
> \ No newline at end of file

 I've added a newline here.

[snip]

 Regards,
 Arnout
