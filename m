Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AAFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 10:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8BAC80BC0;
	Tue,  8 Feb 2022 10:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9y5DVeyYk0u; Tue,  8 Feb 2022 10:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AAB681A30;
	Tue,  8 Feb 2022 10:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC6C91BF2FB
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 10:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D898C40191
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 10:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jG3CZDUAKxEh for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 10:18:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47DEC40164
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 10:18:05 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HNZSn5oNuroAhHNZSnWrtd; Tue, 08 Feb 2022 11:18:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644315483; bh=suiQrbhhRlosvczlfe7qSnKWrgxAz0z9PON5jE8EKeQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=lPQq4V5bd2krD9TZwv+O6vs04Qi/ZJnowmKStgnr9/xHDCvtaji10x1gZflM2DA4K
 uT7/2Kd6IW7eM3a9iuF+/UMspxliT+SkjAJ6h8hm10ZROg56ApE0hzVtM7uiHUVk3r
 641JBDOfI1TNie8PpcccP0FwNChUxsL7JaokfTS+9u9WXB05Qe2yj4qX9zdjl+1QSD
 0dBIXeDHNSfWDv8knQTFeEG3rKkZfLlYjdbMrSj097rbjBTbZvvKQIY/ZoUKwL//vw
 vX+zCQCbN7+P7KaPO8vaTBziQPI5A9j5EelP46fI+QIx8+IJD4MUTn61uV4lJ21KWl
 QBAHZjM+/QdsA==
Message-ID: <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
Date: Tue, 8 Feb 2022 11:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfACft8Y/JS6xYK3krwjyoJhH0zFr0guCJ2+qt4wm8ochibm17hnFjd0SsoxNw4tB8A+Zb8vJyiaMo756UhXxVqNU5JHyIVQvcD4QONL8ziHU+Gble+JX
 x/lA6TEpdqam1TlKTBDhjjJCJ7fT+zSWfZb//3Q4hZTUDp95GmotxGuhTG6iRZkKVI8GNnwmOQ2vNTOvKrsVJa9iqyDLgdfb91fdfW/jdR/QI2wQbqBS/wdo
 13PPD4NT4eap6B7fg97u7WtQCSymm5CYQDbEMr6+/knHWcRWAjLkeH22y2sWeuZ4
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
 Michal Simek <michals@xilinx.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 08/02/22 11:07, Neal Frager wrote:
> Hi everyone,
> 
> Please disregard this patch set for now.  I thought of a better way to handle the pm_cfg_obj.c file without adding it permanently to buildroot.  I will be sending an updated patch set shortly using the following configuration:
> 
> BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="https://raw.githubusercontent.com/Xilinx/embeddedsw/xlnx_rel_v2021.2/lib/sw_apps/zynqmp_fsbl/misc/pm_cfg_obj.c"

Ok, I was about building your patches :-)

Please send as v2, so when creating patches add -v2:
# git format-patch -s -M -o outgoing -2 -v2
then add 3 dashes before the actual 3 dashes in the produced patches and 
described what is changed between V1 version to V2 like:
---
V1->V2:
* moved BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to an URL instead of local patch 
as suggested by Giulio
* other eventual modifies
---

And if you send then a v3, then keep previous V1->V2 and add:
---
V1->V2:
* moved BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to an URL instead of local patch 
as suggested by Giulio
V2->V3:
* modified ....
---

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
