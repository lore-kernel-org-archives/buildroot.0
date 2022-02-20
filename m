Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABC6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 17:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8454640386;
	Sun, 20 Feb 2022 17:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1i6nx9wRwevL; Sun, 20 Feb 2022 17:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC9C04035D;
	Sun, 20 Feb 2022 17:36:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 453321BF20F
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 17:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D87D605AD
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 17:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Br2PYmMyBIrL for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 17:36:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ED326059A
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 17:36:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Lq8enmrnAroAhLq8fnRzxy; Sun, 20 Feb 2022 18:36:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645378609; bh=cdUxR2b+i4+so8GogJRIbO/WVdCjuJPCTQDyEetdngY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Q91BIire6nDtNpKmq0TZO6h2AeLDIDpj56id5sxLyRoYtCJ6MptnuxHw1WwLmfs7a
 G7ByBR/tYCLPbAbBSD87FN/tdfvSFBN41buXSW8UwuzsaIcOofShca1P3ZPOve3ypy
 h182yZGzEcmbwlQa/2/WB7P9o00Vl4zQFIs8Mj2i3dVmGDHJz2DkoXekyJ6MXf0Azi
 NuxmSxgoMWNUmzfjZeWqlefLYp17KVdCuBNhFNj9hkZA4q5jP3DmfP9S4Pve+DQRcn
 ranSgaxNSLJn5MfpTlYIulA2hLtn4LGP2bzSHAmnT0iFGjUiVn1f+7WV5kc7isJ5ok
 TH5FZFjAYZMNg==
Message-ID: <1d826e4c-b6ee-0caf-901a-97cd9755e188@benettiengineering.com>
Date: Sun, 20 Feb 2022 18:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Arnout Vandecappelle <arnout@mind.be>
References: <CAOf5uw=9FxAfegsPf7F2TG3ZPBvyhTb9aCOCJwZLogZvVRJWJw@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAOf5uw=9FxAfegsPf7F2TG3ZPBvyhTb9aCOCJwZLogZvVRJWJw@mail.gmail.com>
X-CMAE-Envelope: MS4wfOWR6EEWcg7QUnav0MpmtIqj5tODxz4BxykaahyHU9/9nnuXEYrXSpjL8u8KBjaUfn+Xon+MV0vyw/Cp3cHPjFpoVx5H+eoSkgUIf+NszQz1QVF2lDsl
 YR31KQhTqn0AWDYX/3EWrKAV+Yub3cEScfEH2qXG/cE4ncvc1pNSZMA9J9XRU1vC+4XJ9FRY7iDSc/n6gXsnG4/n/6jnljiZvq82JD4BacfknNijMRSbN3SC
 no7T+uDwtn7dZTXvHdVVrdppqv0+iM0MZWP/gyq9S3tsGiuKov6IOWLmXoUVCtjEaHfqZNeihbwAJ9ogs7iSHQ8gyuOxCsvd+YZZ/gr9FOs=
Subject: Re: [Buildroot] imx8 common script problem
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael, Stephan, All,

On 20/02/22 18:05, Michael Nazzareno Trimarchi wrote:
> HI all
> 
> I found that in order to generate a correct flash.bin image, the
> script at the moment are broken at least for imx8mn. It works only
> with this change
> 
>    ${HOST_DIR}/bin/mkimage_imx8 -fit -loader
> ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BIN
> ARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
>          elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$"
> ${BR2_CONFIG}; then
> -               cat ${BINARIES_DIR}/u-boot-spl.bin
> ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> +               dd if=${BINARIES_DIR}/u-boot-spl.bin
> of=${BINARIES_DIR}/u-boot-spl-pad.bin bs=4 conv=sync
> +               cat ${BINARIES_DIR}/u-boot-spl-pad.bin
> ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
>                  BL31=${BINARIES_DIR}/bl31.bin
> BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00960000
> ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} >
> ${BINARIES_DIR}/u-boot.its
>                  ${HOST_DIR}/bin/mkimage -E -p 0x3000 -f
> ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
> -               rm -f ${BINARIES_DIR}/u-boot.its
> +               #rm -f ${BINARIES_DIR}/u-boot.its
> 
> 
> The padding seems correct even in the origina soc.mk of imx tools. Can
> anyone comment?

I think the correct person to ask is Stephan that added support for:
board/freescale/imx8mnevk/
configs/freescale_imx8mnevk_defconfig
and he maintains him as you can find in DEVELOPERS file.

Michael, can you please send a patch --in-reply= to this e-mail with 
these changes putting in Cc all people I've listed here? So it's easier 
to review it. Especially for Stephan or who else owns a board with this SoC.

Unfortunately I don't have such hardware :-/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
