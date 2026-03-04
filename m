Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5587EEF8FF0
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 14:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082DF607C6;
	Wed,  4 Mar 2026 14:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2O8UDyeV9Wd; Wed,  4 Mar 2026 14:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B1BE607CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772635686;
	bh=5YlwWXiaskQs9/wFscl3c5+xBatZrcCTOPyTShh3c6Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qQA/YUYI8a5FF7u2oDsfrgMEiFEyRto2YEENcBwL977gfOc70neSbwZkQyW5TARXG
	 YVNBP1G9ICr8MKcHXQInjF1NpZq0QiBfJIijuumE/jID0PYYA77rzFyz5rjMPibjBI
	 aR2R34SUUvNPP0dddtjHnlQkAzXulEx94WvDEqSrdkk8OvouTssc6Afp+FWplQP3yn
	 cYmS/+r0AqNHwNzEMvX0Iq9mP+cm3ILA/dj2oyzmR/Sd1sW4eVWA/J0Bqh2G2OF+8z
	 WJvs7e3SsweHXCHmbQ8su9cTtB7UP5O96CCh+iUm48QvbD133jc2g+csQ8BrLZzIEa
	 7M2JPIwWXtcAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B1BE607CB;
	Wed,  4 Mar 2026 14:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E553225B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB3DF40867
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vFAfpQg2Z6B for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 14:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AF4040861
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF4040861
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AF4040861
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:48:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYqv-1vetuu12iZ-011F7F; Wed, 04
 Mar 2026 15:47:59 +0100
Message-ID: <c4d66d10-019a-4b37-86c6-390a4aa884c1@gmx.de>
Date: Wed, 4 Mar 2026 15:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
References: <20260304133241.3389941-1-neal.frager@amd.com>
 <20260304133241.3389941-2-neal.frager@amd.com>
 <4a2f2b4a-ee67-4049-85cb-56285f02f619@gmx.de>
 <BL1PR12MB5032A1CD6A81B8C5CCBA2164F07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <BL1PR12MB5032A1CD6A81B8C5CCBA2164F07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
X-Provags-ID: V03:K1:CIHkDuss4xOXjTYSmptXZdB+mS8t6KedaTkRFW0BuwcRMgpYPhL
 8N0+RVAjZ41blmCJ/q7HL8LXisuy6lOjqXyEAlr1aJwnTjjeHdKKYCvYxnMgMFNC0rsulv3
 DLUney059HEdI90uJY4ZkntRiybSZzyF17VWhB90TKxept5GgNfAoaqh4Fu9+1y5mdZzSKr
 IuYe7Etue6ix32ZBNJCwA==
UI-OutboundReport: notjunk:1;M01:P0:HQta4Cf+XqI=;r31/50OF0p7nEpCbNkUxgepcUjs
 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
 WGV26d3gLPO0ddoNIa/6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772635679; x=1773240479; i=fiona.klute@gmx.de;
 bh=gmoUVmSZ3fEXYuVJPRr85CeUmS29KOMN6ue3yY3gdiM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oZgb95LOwOI6IezTWWmwTAvTiuXOoEYkMVf9QQHLIVLxgxcuVgBLxkyXKa7jMRUK
 xd2IdK6cClhfqRUuXCe23DL3UJ6tFa4kKNEXKQI2OxmK32KT1Mr3ZEyhfs7L2aycJ
 EO4AFpGqcss5SlF7/IcTXirqSx8y4DbTuv4J4VGUpT6okB33CJO4lLMCCXol3ytNU
 hcD5LZTvwxQGI1/FmEgzDhnzZNooJfwS174Sl8Q/72/GEIpWdf0Up6hxl2ndCmmQx
 47kuQiWC5XzpqLYSzSSKa4D2Nye7Uwx7qq2U3k87IfS+yma5E/Yr79rRVSo84Acui
 GpT95UXJOrG9L1GaWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=oZgb95LO
Subject: Re: [Buildroot] [PATCH v2 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.03.26 um 15:16 schrieb Frager, Neal:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Fiona,
> 
>> By switching to the LINUX_DTBS variable, the post-image.sh script can now
>> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
>> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
>> the transition users will make when migrating from a zynqmp evaluation board
>> to a zynqmp custom platform.
>>
>> To keep the example post-image script as simple as possible, it assumes that
>> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
>> filename that u-boot will use for booting. Users are free to implement their
>> own post-image scripts for use cases with multiple DTBs.
>>
>> Signed-off-by: Neal Frager <neal.frager@amd.com>
>> ---
>> V1->V2:
>> - removed unnecessary $BINARIES_DIR from symlink source
>> ---
>>    board/zynqmp/post-image.sh | 9 ++-------
>>    1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
>> index f44b66342d..10a3c32b2c 100755
>> --- a/board/zynqmp/post-image.sh
>> +++ b/board/zynqmp/post-image.sh
>> @@ -2,13 +2,8 @@
>>
>>    # By default U-Boot loads DTB from a file named "system.dtb", so
>>    # let's use a symlink with that name that points to the *first*
>> -# devicetree listed in the config.
>> -
>> -FIRST_DT=$(sed -nr \
>> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
>> -               "${BR2_CONFIG}")
>> -
>> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
>> +# devicetree in the LINUX_DTBS list.
>> +ln -fs "$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
> 
>> The comment and commit message talk about the "first DTB in the
>> LINUX_DTBS list", but this command will only work right if LINUX_DTBS
>> contains *exactly one* file. With two the second file is interpreted as
>> a possible suffix to remove (in practice, probably ignored), with >= 3
>> you'll get an error.
> 
>> That may be fine for the defconfig (I haven't checked), but in that case
>> comment & commit message should be clarified.
> 
>> Same in patch 3.
> 
> Interesting.  I only tested with two DTBs in the list, and when it worked, I
> thought that basename was ignoring all the additional filenames in the list.
> 
> Since users may very well have multiple DTBs, do you know of a better command
> that we can use that will strip out the first filename in the list?
> 
> What I would prefer is to have a command that matches my commit message.
> 
> Any ideas?
In Bash I'd say "turn LINUX_DTBS into an array", in a POSIX shell script 
given that LINUX_DTBS is a space separated list the easiest solution is 
probably to use "${LINUX_DTBS%% *}" in the basename command to cut off 
everything after the first space. AFAIK there is no supported escape 
syntax for filenames with spaces, otherwise it'd get more complicated.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
