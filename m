Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD79C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 14:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDCF181A92;
	Mon,  9 May 2022 14:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgFUguDAspsB; Mon,  9 May 2022 14:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B7208137A;
	Mon,  9 May 2022 14:58:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2471BF33D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 242F840353
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smtpcorp.com header.b="dfjuq/Uw";
 dkim=pass (2048-bit key) header.d=sonifex.co.uk header.b="FzVjk3ni"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nknK0f9_Q_zO for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 14:58:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from e2i465.smtp2go.com (e2i465.smtp2go.com [103.2.141.209])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E6EC4033C
 for <buildroot@buildroot.org>; Mon,  9 May 2022 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=List-Unsubscribe:Feedback-ID:From:To:Subject:Date:
 Message-ID:Reply-To:Sender:X-Smtpcorp-Track;
 bh=mNRS5jNOy0wIt7R1ZEi/oEe9pb3qdpzDxuoSaTmLx08=; b=dfjuq/UwPM8sR85JtLLZmODbxV
 ZnnKNdqlsWIROA9/V+tvHKmFTMfZP5yHNE8EEiI2nxZpY9ZqfUisnyh+yvBLDJeenCMq3RqJRXSca
 8S/rFN4kj0WhmObZ2Hc1S9FlW0lJy5kJRPxe5lZ1KYM9GD2dmXafV2ufczTFkmUoOAEtzkdFo2LSg
 A6tZHsd3CBhI9ficlmIXqCUetVXuogLiBBKwfz2ukRTEblFiijWLfRDLX5mUbV2XE6+zEOIepcd5w
 SlujPyNRXccgcKqtWGamcTjH8N/vta9NNs0IH5mT/Mn0RZfoArTNZTjICT+HyNiAUY/EM3hRXp6cL
 iof3u5Dw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonifex.co.uk;
 i=@sonifex.co.uk; q=dns/txt; s=s592615; t=1652108298; h=from : subject
 : to : message-id : date;
 bh=mNRS5jNOy0wIt7R1ZEi/oEe9pb3qdpzDxuoSaTmLx08=;
 b=FzVjk3niSIK2iuZyqd+2JC12tkArJtqSCWNf9MyC1R9ToLe6L/MPegMkL2bl8X99XFQCA
 qpi28vjpPw+K9+/gkdAkRfE6eOoC8HXzk0tpaCMYZo3LXnS/9HEmIW88yo7q9RuY4XVDPnR
 Q0X3DCavjNX3UOfuYOFIUFNVJLIL7N7QcVH1fe6qoJs8DTEfUAxUetdjEPExn1SWHcAGt4X
 MeYbaNiBm2DDUaegOmPNNa5M4VUQU5y3Of2MCwr7Em37kCn4Hl7X8C7N+yQX07ZBp7RDfY7
 TtX2qIxzdt6wyfkFS5zqOiPPIfSKN5aZqMOjwIyg10QqhSjMy8koqXSYYoYQ==
Received: from [10.45.79.71] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1no4pt-TRjyWO-L2; Mon, 09 May 2022 14:58:09 +0000
Received: from [10.87.224.66] (helo=NETHMAIL.sonifex.co.uk)
 by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1no4pr-DuuauN-US; Mon, 09 May 2022 14:58:08 +0000
Received: from [192.168.0.19] (unknown [192.168.0.19])
 (Authenticated sender: wesley.revens@sonifex.co.uk)
 by NETHMAIL.sonifex.co.uk (Postfix) with ESMTPSA id DA3D18107735;
 Mon,  9 May 2022 15:58:04 +0100 (BST)
Message-ID: <73ea7940-e778-cdf9-9364-66773632efbd@sonifex.co.uk>
Date: Mon, 9 May 2022 15:58:04 +0100
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
 <dfd44be7-0dbc-0a05-4e90-ed04501e4043@sonifex.co.uk>
 <SJ0PR02MB7758B99F6AD8F668FE7F318AD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Wesley Revens <wesley@sonifex.co.uk>
In-Reply-To: <SJ0PR02MB7758B99F6AD8F668FE7F318AD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
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

On 09/05/2022 15:41, Neal Frager wrote:
> Hi Wesley,
>
>> No change with the updated psu_init_gpl.c.
>> When using the pmufw from the 2022.1 BSP is there a different pm_cfg_obj.c also required?
>> I am still using the original in buildroot/board/zynqmp/kria/kv260
> I am currently stuck in the same place as you with the exact same boot log.
Glad I'm not the only one!
>
> I generated the buildroot/board/zynqmp/kria/kv260/pm_cfg_obj.c with Vitis 2022.1, so this file should not be the issue.
>
> Also, for completeness, only the zynqmp_console needed to be correctly defined for the atf as the zynqmp uses uart1.
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
>
> The PRELOADED_BL33_BASE parameter was already correct by default when using the zynqmp platform.
If I leave out the PRELOADED_BL33_BASE setting, my ATF does not run and 
I get stuck at the end of U-Boot SPL with "Trying to boot from SPI"
>
> Once we get this working properly, I will patch buildroot, so other users will have a working solution.
>
> Thank you for your patience and let me know if you make any progress on your side.
No problem, It will be good to get it all working
> Best regards,
> Neal Frager
> AMD
>
Regards,
Wesley
To unsubscribe click: http://link.sonifex.co.uk/us/?e=1no4prDIIaINlS.-fv7cCEYCzrKP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
