Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A47C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B9BF60AC4;
	Sun,  9 Apr 2023 21:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B9BF60AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVFmnwmDjl9n; Sun,  9 Apr 2023 21:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68F4E60AE4;
	Sun,  9 Apr 2023 21:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68F4E60AE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 555C01BF2A9
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7DA60AE4
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7DA60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fONXjIw3vgxd for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:02:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 205B960AC4
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 205B960AC4
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:02:55 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t4so41110453wra.7
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681074173;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o8xvMj6hP7DZf80SS3XCJdQq/fiMqiQpRAiap6xc4rk=;
 b=yR2IL0SXRfzoAhbpjcpyBrRBfDPsKg60blEOuejhl0ez/NQ3fTUARWVBiX58uO3u52
 LRGufkVyzvbc+eIXBUJFd4OCDnLcNjLAtgCyeKYEbimy2InbvXSyw2HkmbUlNSTlnsqz
 NnwZXPPCR3Pjspqy/8yPYQ5f/J4q0x2nUQGFOMPAhtTRqac56Bf5uqwLEbQzJdoQVs7c
 N+7Z4sM9Mw2YieSRSnYAD3RO0o7KFSK2mgxGVswSUkN/NjWMhWo5i61ItKDaRm/nW22W
 4NbGmnbWJ7yVyXl/rCke/o1fnKmWg2zQLonjAN7nhAoR7leDcIlj80YLvTlQwDT/hLG2
 lXGw==
X-Gm-Message-State: AAQBX9f6BBru6sxXuvqk0DjuTY9I6R+cw2Y75Q68cBO0VTQ57VZFDWjF
 e+FZ3wrZUFYwG7JmzBC8Z1STwQ==
X-Google-Smtp-Source: AKy350YWtQdZoSMXipjAA6VWsw7GK+M/0OsLeiZZ6wvqezWbGWUQjf2RMZtcMJVPj6bGZgm4tufPbg==
X-Received: by 2002:a5d:6b03:0:b0:2ef:268b:ba72 with SMTP id
 v3-20020a5d6b03000000b002ef268bba72mr5762040wrw.34.1681074172992; 
 Sun, 09 Apr 2023 14:02:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a05600001c100b002d51d10a3fasm9991092wrx.55.2023.04.09.14.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 14:02:52 -0700 (PDT)
Message-ID: <344a1fda-eeb7-940b-a986-5ec3d82422fc@mind.be>
Date: Sun, 9 Apr 2023 23:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-13-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220724054912.2354219-13-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681074173;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o8xvMj6hP7DZf80SS3XCJdQq/fiMqiQpRAiap6xc4rk=;
 b=BIRcqmO93bnqyho7/t5SSPj91m2EJCxYosXSicOUbV/YKYfvQwAIw9o9FddfJuh03X
 VimMBOg1U/S2ASiGQlZi+tzxoHF4ocIOnjVTAbrl/8fZq5ZyyRMmVSzyz4gGiU+pQpZW
 fVr/1p/ijrvF1wIxh2Jm5kDxG2BtpsnoSYapw8ZDohE6QIbAH4VHQETogp2M14zvy/sV
 UVb1jBCX7/632Kmu2fLHbZTTqfPrdaYaZukz0lw8F5FzxXTfotgPQtbtp95FSfi6Jwiw
 WiMGURl2Etee6+TwV0oca667kJ7XK4+UfCZoVKSoLKP0r+dJWIUz1MdzwEeJICMw4Vwe
 YgDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BIRcqmO9
Subject: Re: [Buildroot] [PATCH 12/16] utils/check-package: check files in
 board/
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 07:49, Ricardo Martincoski wrote:
> When a SysV init script is inside package/ it does not need to be
> executable.
> But this check does not apply in the case the script is in a fs_overlay.

  I reformulated this a bit because I didn't understand it first.

> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> NOTE to the maintainer applying this patch: please re-generate the list
> of ignored warnings while applying:
> $ ./utils/docker-run
> br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore

  Applied to master after regenerating the ignore list.

  Regards,
  Arnout

> ---
>   .checkpackageignore               | 92 +++++++++++++++++++++++++++++++
>   utils/check-package               |  1 +
>   utils/checkpackagelib/lib_sysv.py |  3 +
>   utils/checkpackagelib/tool.py     |  5 ++
>   4 files changed, 101 insertions(+)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 765e5c1cba..58c05416c4 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1,3 +1,95 @@
> +board/aarch64-efi/post-image.sh Shellcheck
> +board/amarula/a64-relic/post-build.sh Shellcheck
> +board/amarula/vyasa/post-build.sh Shellcheck
> +board/andes/ae350/post-build.sh Shellcheck
> +board/arcturus/aarch64-ucls1012a/post-build.sh Shellcheck
> +board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
> +board/aspeed/common/post-image.sh Shellcheck
> +board/asus/tinker/post-build.sh Shellcheck
> +board/atmel/flasher.sh Shellcheck
> +board/beaglebone/post-build.sh Shellcheck
> +board/beagleboneai/post-build.sh Shellcheck
> +board/beaglev/post-build.sh Shellcheck
> +board/beelink/gs1/post-build.sh Shellcheck
> +board/boundarydevices/common/post-build.sh Shellcheck
> +board/boundarydevices/common/post-image.sh Shellcheck
> +board/canaan/k210-soc/post-build.sh Shellcheck
> +board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
> +board/chromebook/elm/sign.sh Shellcheck
> +board/chromebook/mksd.sh Shellcheck
> +board/chromebook/snow/linux-4.15-dts-tpm.patch ApplyOrder
> +board/chromebook/snow/sign.sh Shellcheck
> +board/cubietech/cubieboard2/post-image.sh Shellcheck
> +board/firefly/roc-rk3399-pc/post-build.sh Shellcheck
> +board/freescale/common/imx/imx8-bootloader-prepare.sh Shellcheck
> +board/freescale/common/imx/post-image.sh Shellcheck
> +board/freescale/common/mxs/post-image.sh Shellcheck
> +board/friendlyarm/nanopc-t4/post-build.sh Shellcheck
> +board/friendlyarm/nanopi-m4/post-build.sh Shellcheck
> +board/friendlyarm/nanopi-neo-plus2/post-build.sh Shellcheck
> +board/friendlyarm/nanopi-neo4/post-build.sh Shellcheck
> +board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
> +board/hardkernel/odroidc2/post-image.sh Shellcheck
> +board/hardkernel/odroidc2/rootfs_overlay/etc/init.d/S09modload Shellcheck Variables
> +board/hardkernel/odroidxu4/post-image.sh EmptyLastLine Shellcheck
> +board/intel/galileo/post-build.sh Shellcheck
> +board/intel/galileo/rootfs_overlay/etc/init.d/S09modload Shellcheck Variables
> +board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch NumberedSubject
> +board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch NumberedSubject
> +board/kontron/bl-imx8mm/post-build.sh Shellcheck
> +board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch NumberedSubject
> +board/kontron/pitx-imx8m/post-build.sh Shellcheck
> +board/kontron/smarc-sal28/post-build.sh Shellcheck
> +board/lego/ev3/post-image.sh Shellcheck
> +board/lemaker/bananapro/post-build.sh Shellcheck
> +board/lemaker/bananapro/post-image.sh Shellcheck
> +board/minnowboard/post-build.sh Shellcheck
> +board/nexbox/a95x/post-build.sh Shellcheck
> +board/nexbox/a95x/post-image.sh Shellcheck
> +board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch NumberedSubject
> +board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch NumberedSubject
> +board/olimex/a13_olinuxino/post-build.sh Shellcheck
> +board/olimex/a20_olinuxino/post-build.sh Shellcheck
> +board/olimex/a33_olinuxino/post-build.sh Shellcheck
> +board/olpc/post-build.sh Shellcheck
> +board/orangepi/common/post-build.sh Shellcheck
> +board/orangepi/orangepi-lite2/post-build.sh Shellcheck
> +board/orangepi/orangepi-one-plus/post-build.sh Shellcheck
> +board/orangepi/orangepi-rk3399/post-build.sh Shellcheck
> +board/pine64/rock64/post-build.sh Shellcheck
> +board/pine64/rockpro64/post-build.sh Shellcheck
> +board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
> +board/qemu/post-image.sh Shellcheck
> +board/qemu/x86/post-build.sh Shellcheck
> +board/qemu/x86_64/post-build.sh Shellcheck
> +board/radxa/rockpi-4/post-build.sh Shellcheck
> +board/radxa/rockpi-n10/post-build.sh Shellcheck
> +board/radxa/rockpi-n8/post-build.sh Shellcheck
> +board/raspberrypi/post-build.sh Shellcheck
> +board/raspberrypi/post-image.sh Shellcheck
> +board/roseapplepi/post-build.sh Shellcheck
> +board/sifive/hifive-unleashed/post-build.sh Shellcheck
> +board/sinovoip/m1-plus/post-build.sh Shellcheck
> +board/solidrun/clearfog/post-build.sh Shellcheck
> +board/solidrun/macchiatobin/post-build-mainline.sh Shellcheck
> +board/solidrun/macchiatobin/post-build.sh Shellcheck
> +board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh Shellcheck
> +board/stmicroelectronics/common/stm32mp157/post-image.sh Shellcheck
> +board/stmicroelectronics/stm32f429-disco/flash.sh Shellcheck
> +board/stmicroelectronics/stm32f469-disco/flash_sd.sh Shellcheck
> +board/stmicroelectronics/stm32f469-disco/flash_xip.sh Shellcheck
> +board/stmicroelectronics/stm32f469-disco/post-build.sh Shellcheck
> +board/synopsys/axs10x/post-build.sh Shellcheck
> +board/technologic/ts4900/post-image.sh Shellcheck
> +board/toradex/apalis-imx6/post-image.sh Shellcheck
> +board/udoo/common/post-build.sh Shellcheck
> +board/zynq/post-build.sh Shellcheck
> +board/zynq/post-image.sh Shellcheck
> +board/zynqmp/kria/kv260/kv260.sh Shellcheck TrailingSpace
> +board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch NumberedSubject
> +board/zynqmp/post-build.sh Shellcheck
> +board/zynqmp/post-image.sh Shellcheck
> +board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch NumberedSubject
>   boot/binaries-marvell/binaries-marvell.hash HashSpaces
>   boot/s500-bootloader/s500-bootloader.hash HashSpaces
>   boot/shim/shim.hash HashSpaces
> diff --git a/utils/check-package b/utils/check-package
> index 880fcfa21e..874f58e0d2 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -101,6 +101,7 @@ CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
>   DO_CHECK_INTREE = re.compile(r"|".join([
>       r"Config.in",
>       r"arch/",
> +    r"board/",
>       r"boot/",
>       r"fs/",
>       r"linux/",
> diff --git a/utils/checkpackagelib/lib_sysv.py b/utils/checkpackagelib/lib_sysv.py
> index 386d085afc..dc4afd71b8 100644
> --- a/utils/checkpackagelib/lib_sysv.py
> +++ b/utils/checkpackagelib/lib_sysv.py
> @@ -21,6 +21,9 @@ class Indent(_CheckFunction):
>   
>   
>   class NotExecutable(checkpackagelib.tool.NotExecutable):
> +    def ignore(self):
> +        return 'etc/init.d/' in self.filename
> +
>       def hint(self):
>           return ", just make sure you use '$(INSTALL) -D -m 0755' in the .mk file"
>   
> diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
> index e719fdd407..632aaa9f9e 100644
> --- a/utils/checkpackagelib/tool.py
> +++ b/utils/checkpackagelib/tool.py
> @@ -4,7 +4,12 @@ from checkpackagelib.base import _Tool
>   
>   
>   class NotExecutable(_Tool):
> +    def ignore(self):
> +        return False
> +
>       def run(self):
> +        if self.ignore():
> +            return
>           if os.access(self.filename, os.X_OK):
>               return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
