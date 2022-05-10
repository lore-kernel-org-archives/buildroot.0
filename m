Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E636DC433FE
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 08:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BBB340AA8;
	Tue, 10 May 2022 08:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BrE52guSSk9; Tue, 10 May 2022 08:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6172340AA4;
	Tue, 10 May 2022 08:22:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E392C1BF2BF
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 08:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D153060C1A
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 08:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smtpcorp.com header.b="B0GvEquz";
 dkim=pass (2048-bit key) header.d=sonifex.co.uk header.b="Uih2RRub"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1RhUHNIlCbl for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 08:22:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from e2i465.smtp2go.com (e2i465.smtp2go.com [103.2.141.209])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F46460B63
 for <buildroot@buildroot.org>; Tue, 10 May 2022 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=List-Unsubscribe:Feedback-ID:From:To:Subject:Date:
 Message-ID:Reply-To:Sender:X-Smtpcorp-Track;
 bh=X/vig//FAsP/jrJR3kKKR/JpmdX2Af78r5hiM4wD8rI=; b=B0GvEquzlCxZhg6AAtMcsagoJY
 07fn7LTjg2KnWUWdOjqaYI79edexAFm67FnEFd3rQLBa8Yy+s7i4BXZ8+CdQTRczs7r4QwnVFWhFK
 Cjkzm3jcY0Mhf1sGFPShtReawMEsTn4gkLuragqY1pdhMDL4vKY9wamr/EKK056m2ZLSqYcKB4Yd+
 xtklX1jrY1ojj2c+4ETO4fE7CkMrjJtu+rwqWwRWHRgC9vrs+eZ3M2C5mFU1JZdXbnOHdIiTO/+BE
 q0xSl7Vrq1an6AHpZ8NrP7iUzGpKQmplRsNUEh9pVpcgHocKN1eSG9Awk+a+jNE98EhdWKx7FW5ur
 RyXOTckw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonifex.co.uk;
 i=@sonifex.co.uk; q=dns/txt; s=s592615; t=1652170964; h=from : subject
 : to : message-id : date;
 bh=X/vig//FAsP/jrJR3kKKR/JpmdX2Af78r5hiM4wD8rI=;
 b=Uih2RRub5dMltLHvChepD2tVYUE5e2sPMz61qpuixy4HnRPZF0/rWvIYUgErheTeXvtXA
 QwbFUaRXtQIIxrQUvOJ42tznoa/eAAuka/J9yEZorp3SxK+8KF0iKvEfDkURrUVWArbGKBu
 uoZBUXCWOHE85OpM9ynT4aYsAA1oVxPRBoSJ8GQy5myUaqLpG2mrz2Cp3G/mJD5B0rSezst
 j09RafoytvD5HMBiFvQ5zzXx98r7mIa2ngAEYHaqwuSX+foyh25wxj+huz3L0FANHoFNfoM
 5YnrwqflL+T9EIHcNViOUH90gKGUbtZpopggIzi+eD/h6vdbjLgbBoBqVlOg==
Received: from [10.45.33.53] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1noL8d-TRjwlC-4N; Tue, 10 May 2022 08:22:35 +0000
Received: from [10.87.224.66] (helo=NETHMAIL.sonifex.co.uk)
 by smtpcorp.com with esmtpsa (TLS1.2:DHE_RSA_2038__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1noL8b-rlZEBl-7i; Tue, 10 May 2022 08:22:33 +0000
Received: from [192.168.0.19] (WesPC.sonifex.local [192.168.0.19])
 (Authenticated sender: wesley.revens@sonifex.co.uk)
 by NETHMAIL.sonifex.co.uk (Postfix) with ESMTPSA id 65860819F89A;
 Tue, 10 May 2022 09:22:30 +0100 (BST)
Message-ID: <193b6338-e28b-b974-ab4d-25bcd173d67f@sonifex.co.uk>
Date: Tue, 10 May 2022 09:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220505155424.3002847-1-neal.frager@amd.com>
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
 <73ea7940-e778-cdf9-9364-66773632efbd@sonifex.co.uk>
 <SJ0PR02MB7758E384FFAF82E99CDEA261D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758287753500487E7078A4AD7C99@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Wesley Revens <wesley@sonifex.co.uk>
In-Reply-To: <SJ0PR02MB7758287753500487E7078A4AD7C99@SJ0PR02MB7758.namprd02.prod.outlook.com>
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

On 10/05/2022 05:29, Neal Frager wrote:
> Hi Wesley,
>
> Simplifying the steps, here is what you need to do to get this working.

Success! - Following your instructions, my board is now booting into 
Linux from the SD card. My Linux image is not fully booting to a login 
prompt however but I have made some device tree changes so it is likely 
that I have broken something in there so will investigate that. I 
suspect a clean build will sort that.

Thanks for your help with the u-boot side of things.

Kind regards,

Wesley

To unsubscribe click: http://link.sonifex.co.uk/us/?e=1noL8Pr_ZEU_7i.-vDNcyoIUQSZ9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
