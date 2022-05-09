Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFBCC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 16:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 870F960D76;
	Mon,  9 May 2022 16:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peL9PhKCKHmZ; Mon,  9 May 2022 16:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8370F60B06;
	Mon,  9 May 2022 16:11:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5661BF281
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 16:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BF5140253
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 16:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smtpcorp.com header.b="tl0aUrqU";
 dkim=pass (2048-bit key) header.d=sonifex.co.uk header.b="J0r77L9o"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UieQ8ZZwrU3N for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 16:11:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from e2i465.smtp2go.com (e2i465.smtp2go.com [103.2.141.209])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B2D240104
 for <buildroot@buildroot.org>; Mon,  9 May 2022 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=List-Unsubscribe:Feedback-ID:From:To:Subject:Date:
 Message-ID:Reply-To:Sender:X-Smtpcorp-Track;
 bh=22Z1xPLO2Im1rP2A6xesO+Vz1GdD9h7MXoHylT/iFCI=; b=tl0aUrqU4wuNshFHsbZspuo8y4
 Nuxqpn8b3hrr5TfthwgUu9wET8o/BoftHx+JUKmE402hNQ8mNoQFolkESEZVzPL0/CcEf8+bujyeZ
 9BDLMmrhnFob5iWx5idsvgYmM/tevWl5veDOYbLzjqZ1vu21oWyIv7Niz6kW9JJdO4SAfIbNoRPhB
 QWu/WA1xiCuzNRyn+XylfjwF0z+yaAt+kP2YKCrxhvs6xmUu52t37V0pJfzBHTu85Wv82/nPzZPMO
 K8qJmBarIwyGtHeDdxSmp+6caReK1DKpX7+5ieekIcL6LGf8F5jjbeUwXwCKMVj54Tq59I/dObHeO
 RZytTZ9g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonifex.co.uk;
 i=@sonifex.co.uk; q=dns/txt; s=s592615; t=1652112663; h=from : subject
 : to : message-id : date;
 bh=22Z1xPLO2Im1rP2A6xesO+Vz1GdD9h7MXoHylT/iFCI=;
 b=J0r77L9oqlRmzcKrKgeu9xcLZoSicpIbzcsRy1VINGeFnKZHlwX/4M1THwvmXDsbVrw3J
 FUcAO7mkqVNdffJUNpvAeswlDb9AwM/izgylMjThVGrsUArjxcZja0QtTFSjneQOgiZ2ox3
 DquTAi6K8w46/Jnk82tIjMKqTHhrHFYmTJuY05FWWKPZmbYTRl6MOzKL5eyomcXJcC4F2Dk
 3/ProEktftqcqVNO4A1+Nohga5gyaGpvGq5IRI4LDth/3DnvG1waxGASc0rqN5JU1WYxjNV
 sES1T1NDx8w/xxFHvo2Cp2OB6vswPrjcy/xd0Qb5/B1GCzHvsrTeK+6AIAOw==
Received: from [10.173.255.233] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1no1Q2-TRk6ZE-0h; Mon, 09 May 2022 11:19:14 +0000
Received: from [10.87.224.66] (helo=NETHMAIL.sonifex.co.uk)
 by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1no1Q0-IbZqa7-Vf; Mon, 09 May 2022 11:19:13 +0000
Received: from [192.168.0.19] (unknown [192.168.0.19])
 (Authenticated sender: wesley.revens@sonifex.co.uk)
 by NETHMAIL.sonifex.co.uk (Postfix) with ESMTPSA id 5DCE58099AD0;
 Mon,  9 May 2022 12:19:10 +0100 (BST)
Message-ID: <7a83f95f-b3c1-9aeb-447d-9c7361158485@sonifex.co.uk>
Date: Mon, 9 May 2022 12:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
 <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
 <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <f4f5acff-c577-b7cd-c708-4415c2a08b4c@sonifex.co.uk>
 <SJ0PR02MB7758243996DD3EB0BE94D176D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Wesley Revens <wesley@sonifex.co.uk>
In-Reply-To: <SJ0PR02MB7758243996DD3EB0BE94D176D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
Feedback-ID: 592615m:592615abMtQZZ:592615sHGBV5TFLK
X-Report-Abuse: Please forward a copy of this message, including all headers, 
 to <abuse-report@smtp2go.com>
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 09/05/2022 12:00, Neal Frager wrote:
> Hi Wesley,
>
>> I initially tried using pmufw from the xilinx-k26-starterkit-2021.1 petalinux BSP but that failed. So I tried the pmufw from the 2022.1 BSP instead and have now made some more progress.
>> My board is booting to a u-boot prompt now but not continuing into Linux from the SD card.
> Have you added the following to your board/zynqmp/kria/kv260/uboot.fragment as recommended by Michal?
>
> CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
> CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
> CONFIG_DTB_RESELECT=y
> CONFIG_MULTI_DTB_FIT=y
> CONFIG_ENV_IS_NOWHERE=y
> CONFIG_DMA=y
> CONFIG_XILINX_DPDMA=y
> CONFIG_PHY=y
> CONFIG_PHY_XILINX_ZYNQMP=y
> CONFIG_PINCTRL=y
> CONFIG_PINCONF=y
> CONFIG_POWER_DOMAIN=y
> CONFIG_ZYNQMP_POWER_DOMAIN=y
> CONFIG_DM_RESET=y
> CONFIG_RESET_ZYNQMP=y
> CONFIG_VIDEO_ZYNQMP_DPSUB=y
>
> Best regards,
> Neal Frager
> AMD
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Yes I have those configs set - the only ones from Michal's list that I 
don't have are:

CONFIG_ENV_IS_NOWHERE=y (only)
CONFIG_USE_DEFAULT_ENV_FILE=y
CONFIG_DEFAULT_ENV_FILE="vars"

When I was using the pre-loaded QSPI bootloader to boot my Linux image I 
had to enable some peripherals in the Linux device tree to get Linux to 
start correctly (e.g. disabling write protection on sdhci1 and enabling 
the phy) Are any changed like that going to be required in the u-boot 
device trees?

To unsubscribe click: http://link.sonifex.co.uk/us/?e=1no1Q0mPZqa7Vf.-Ci0cfJb9IcX4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
