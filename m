Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5043C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 14:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA3181CDC;
	Mon,  9 May 2022 14:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mGTXsGGpeYLg; Mon,  9 May 2022 14:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0F981A65;
	Mon,  9 May 2022 14:33:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA00E1BF33D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98D2781A65
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOInDfDLOkbk for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 14:33:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from e2i465.smtp2go.com (e2i465.smtp2go.com [103.2.141.209])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44B7181A58
 for <buildroot@buildroot.org>; Mon,  9 May 2022 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=List-Unsubscribe:Feedback-ID:From:To:Subject:Date:
 Message-ID:Reply-To:Sender:X-Smtpcorp-Track;
 bh=uoLvwa5/Rs/fzgc4K2YPS7tUscjWu6n1Tab8KdR3Skg=; b=e1rw/ggcfavVzrackJIlVrUq/E
 dL3N5h6V5sLUbuEDts93lq0g7EK2lkfexHy4m5VSMMP/fes6sgzY//oCcS1N9YtquzFHWi0bfhg4W
 tLiTWxUf+/4BKOElZU6M2ItpA+m4WT++gD2kSr/Dk3ocJEFMJGc32pqQExsAbucAYW6lTvti6Nk1z
 pg6UpMiZ3pwLzenNcW+y0P7bF25Epi9WqWRG9gSP97TS70V3L6Kn37CeZfikYTP7QgoJrq1ORwOLj
 IYZZ9ME1TJ1IOHqM4fnXOCAeSTow4xrjjcpcB5yPzoKT6XLG+0fyEpdzjZ+Y3J2xGyryJNxOiR5tS
 DSv556XA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonifex.co.uk;
 i=@sonifex.co.uk; q=dns/txt; s=s592615; t=1652106806; h=from : subject
 : to : message-id : date;
 bh=uoLvwa5/Rs/fzgc4K2YPS7tUscjWu6n1Tab8KdR3Skg=;
 b=LwTHZIpLYPmagWDOlsJGS1w/5FLVSYqLeaVxRA17QNoCCmyxux6nLWbMBL8cdZCMEXh9h
 GWlNIzWpCw25zjdU+jHFO9eCrAoWTUhj9dJQFyZljIbRljOEsrQQH9CMSOMfJbY+gSPIMci
 o6ZeWOGmVIG7YvRKs4qyQ+4YhyfXm47RfRu8t0rptVmlckTjwPuowSUTEqmwgAsOl5NebQY
 MbhVlASIvJubo1ratjZBezqteT8FxbDCtieCy73UyVFqHkqNHaWzgbb3qppbrPY0WFk4eWg
 jHCUlo3/KxQ2Dhabf4yIzszflM7N9YGosgEeHmSs63dXXAAyn1QKvuC8x4Aw==
Received: from [10.66.228.43] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1no4Rp-TRk3Ku-Oe; Mon, 09 May 2022 14:33:17 +0000
Received: from [10.87.224.66] (helo=NETHMAIL.sonifex.co.uk)
 by smtpcorp.com with esmtpsa (TLS1.2:DHE_RSA_2038__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1no4Ro-wSEUxi-J0; Mon, 09 May 2022 14:33:16 +0000
Received: from [192.168.0.19] (unknown [192.168.0.19])
 (Authenticated sender: wesley.revens@sonifex.co.uk)
 by NETHMAIL.sonifex.co.uk (Postfix) with ESMTPSA id 9FD4C810EAE4;
 Mon,  9 May 2022 15:33:13 +0100 (BST)
Message-ID: <dfd44be7-0dbc-0a05-4e90-ed04501e4043@sonifex.co.uk>
Date: Mon, 9 May 2022 15:33:13 +0100
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
 <7a83f95f-b3c1-9aeb-447d-9c7361158485@sonifex.co.uk>
 <SJ0PR02MB77588AD2DD701582C5F45A92D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Wesley Revens <wesley@sonifex.co.uk>
In-Reply-To: <SJ0PR02MB77588AD2DD701582C5F45A92D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
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

On 09/05/2022 14:46, Neal Frager wrote:
> Hi Wesley,
>
>> When I was using the pre-loaded QSPI bootloader to boot my Linux image I had to enable some peripherals in the Linux device tree to get Linux to start correctly (e.g. disabling write protection on sdhci1 and enabling the phy) Are any changed like that going to be required in the u-boot device trees?
> Could you try replacing your u-boot board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c file with the original commit below?
>
> https://github.com/u-boot/u-boot/commit/02ac1553b8329f866c1761f5d9fe66972817782c
>
> Please let me know if this version of the file resolves your SD card issue.
>
> Best regards,
> Neal Frager
> AMD
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

No change with the updated psu_init_gpl.c.

When using the pmufw from the 2022.1 BSP is there a different 
pm_cfg_obj.c also required?

I am still using the original in buildroot/board/zynqmp/kria/kv260

To unsubscribe click: http://link.sonifex.co.uk/us/?e=1no4RowSElxiJ0.-fYocCzL41ULD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
