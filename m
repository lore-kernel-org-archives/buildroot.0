From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Wed, 11 Jun 2008 12:46:06 +0200
Subject: [Buildroot] U-boot and nand flash
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB695782DF@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB695782DF@MAIL-UA.ccs.local>
Message-ID: <330EC2471BF24E48B513AF1A6975EB695782F9@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to add the errors u-boot is giving:

U-Boot> nand erase 0x0 0x20000

NAND erase: device 0 offset 0x0, size 0x20000
nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 0x00
nand_erase: start = 0x00000000, len = 131072
nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 0x00
Timeout!nand_erase: Failed erase, page 0x00000000

NAND 256MiB 3,3V 8-bit: MTD Erase failure: -5

OK
U-Boot>

I couldn't find what the result -5 means.

Since this is evaluation board that (at least buildroot) is supported directly I'd though that nand handling would work too without too much hacking needed.

-Teemu

________________________________________
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Teemu Keskinarkaus
Sent: 11. kes?kuuta 2008 13:15
To: buildroot at uclibc.org
Subject: [Buildroot] U-boot and nand flash

Hi,

I have used buildroot to generate bootstrap, u-boot, kernel and rootfs for at91sam9263ek evaluation board. Everything works pretty much okay, but there are couple problems.

First, for some reason, u-boot can read NAND flash, but can't erase nor write it. It is identified ok at boot. Or it can erase it at least in some part, but keeps printing errors along the way. Write won't work at all. I'm not sure this is correct mailing list for this, but since the u-boot is not standard I'm trying here. The U-boot version I'm using is 1.2.0-atmel with atmel patch in it. I tried to lengthen the pulse times from u-boot configuration file, but that did make any difference. Any idea what might cause this?

I tried with pre build binary of u-boot 1.1.5 and it seems that nand handling is working there just fine. At least I was able to erase nand without problems.

Second problem is that I've been trying to save my configuration to target specific directory so that I could recreate the buildroot without needing to manually configure it again. So far I've been able to get everything else there except configuration for busybox and uClibc. For some reason, buildroot wants to use busybox-1.6.0.config although I have configured it to use busybox-1.10.3. So correct sources are used, but config is old. There were default config for 1.10.x? marked to be same as 1.6.0 in package/busybox/Config.in. I fixed that, but that didn't help anything and it seems to be used only if no other configuration file is available. I wasn't able to find where the other reference to 1.6.0 is. The configuration file is looked at the right directory, but the version is wrong. Current quick and dirty 'fix' I have is to have sym-link from busybox-1.6.0.config pointing to busybox-1.10.3.config.

And for the uClibc config. It seem that there are no target specific way to configure uClibc, Only system wide? I'm using daily snapshot from May. ?When I debugged 
the making uClibc it seems that only place where the configuration is checked is from toolchain/uClibc. This is not that big of a deal since it's highly unlikely that I would use that buildroot with another target. It just that now I have to spread the configuration files here and there.

-Teemu
