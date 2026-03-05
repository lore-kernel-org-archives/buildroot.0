Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27FBEEF317
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A2EC40A70;
	Thu,  5 Mar 2026 08:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvDm5rpbRMCP; Thu,  5 Mar 2026 08:00:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4470C40A72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697647;
	bh=hCY7lvgwJIrmi9DDs/vO71Sv5uYXVueFjdBARHD4npQ=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nUfBmvCNG7dZN3WRF64PsYSj2y+Vv/7RD+3J4YxRN5DBxx3bW+eC3F4yoASbxm05V
	 Ogy3U1UA/B7XwqYyFzU6VnY/hX7rqcp53KkEIRfnbNXCcluXX5yFuLB1d8FqufdZlJ
	 bY9VkI258jJdKAHGbGSAiGrf9mRB+wKzF1rCwbfFz6tEC5FxlL5LjcUUXIZOqTT/RY
	 cc/J1mW6K3s0vLhhmK0uIRnpeYzKbHk6hNk8lDwZPae60AZA23Wx7y4+m1EMDiOKAI
	 VVnYam3Bs54C93tyzC56rsMpQEHr+FLqr+l1C7X0XdbyaZbLewe3f4e1K7pGGe/+6h
	 ljkOlpIh52tcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4470C40A72;
	Thu,  5 Mar 2026 08:00:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06D6F1EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E08C8816FE
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vd2IZc8q8zuw for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:00:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3534817AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3534817AB
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3534817AB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:00:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 38AAF4E42559;
 Thu,  5 Mar 2026 08:00:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D7815FDEB;
 Thu,  5 Mar 2026 08:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52AA91036981A; Thu,  5 Mar 2026 09:00:25 +0100 (CET)
Mime-Version: 1.0
Date: Thu, 05 Mar 2026 09:00:24 +0100
Message-Id: <DGUOV22DUF46.1KEQI49EBL4Y8@bootlin.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
To: "Frager, Neal" <neal.frager@amd.com>, "Fiona Klute"
 <fiona.klute@gmx.de>, "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20260304133241.3389941-1-neal.frager@amd.com>
 <20260304133241.3389941-2-neal.frager@amd.com>
 <4a2f2b4a-ee67-4049-85cb-56285f02f619@gmx.de>
 <BL1PR12MB5032A1CD6A81B8C5CCBA2164F07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
 <c4d66d10-019a-4b37-86c6-390a4aa884c1@gmx.de>
 <BL1PR12MB5032D465352231089A7AAB95F07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5032D465352231089A7AAB95F07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772697634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qpaRvMcW9bQGNKLjT2opzpP4mYRwWS/l1g15SuSgWCo=;
 b=f6iNEjlQrfWxgJ+zDslh+stRq9pXa8CtkzU1JQUxygPTLoxKf+VhGWiLCJFhCWfVOqkfrK
 hQ4kgwoN6ykV7oruxQi3ae/aBy9bJaDlvMftH1dvkuXWEEmU5492jW4T0cVlxHpZBNRo/9
 knp9024VAqetuZIzAxAZs3Gogj18R5qAh4Cpxsn1uwSSlF8kMhi5fRtNCFztPrNeAW0pUs
 dgu4ZxxBz0fvYC+FqZjATk3t18BPXV6x4XzAXe/bsyMCFv1oibTcyrnyj7bH8inyQKVV4m
 i5CGpLIiRzq2CSdOEXnM5WVlvJwB/kILbKahyisAo4JHOsSQbzEelZTMIX+IXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=f6iNEjlQ
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed Mar 4, 2026 at 4:19 PM CET, Neal Frager wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Fiona,
>
>>
>> Hi Fiona,
>>
>>> By switching to the LINUX_DTBS variable, the post-image.sh script can now
>>> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
>>> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
>>> the transition users will make when migrating from a zynqmp evaluation board
>>> to a zynqmp custom platform.
>>>
>>> To keep the example post-image script as simple as possible, it assumes that
>>> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
>>> filename that u-boot will use for booting. Users are free to implement their
>>> own post-image scripts for use cases with multiple DTBs.
>>>
>>> Signed-off-by: Neal Frager <neal.frager@amd.com>
>>> ---
>>> V1->V2:
>>> - removed unnecessary $BINARIES_DIR from symlink source
>>> ---
>>>    board/zynqmp/post-image.sh | 9 ++-------
>>>    1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
>>> index f44b66342d..10a3c32b2c 100755
>>> --- a/board/zynqmp/post-image.sh
>>> +++ b/board/zynqmp/post-image.sh
>>> @@ -2,13 +2,8 @@
>>>
>>>    # By default U-Boot loads DTB from a file named "system.dtb", so
>>>    # let's use a symlink with that name that points to the *first*
>>> -# devicetree listed in the config.
>>> -
>>> -FIRST_DT=$(sed -nr \
>>> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
>>> -               "${BR2_CONFIG}")
>>> -
>>> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
>>> +# devicetree in the LINUX_DTBS list.
>>> +ln -fs "$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
>>
>>> The comment and commit message talk about the "first DTB in the
>>> LINUX_DTBS list", but this command will only work right if LINUX_DTBS
>>> contains *exactly one* file. With two the second file is interpreted as
>>> a possible suffix to remove (in practice, probably ignored), with >= 3
>>> you'll get an error.
>>
>>> That may be fine for the defconfig (I haven't checked), but in that case
>>> comment & commit message should be clarified.
>>
>>> Same in patch 3.
>>
>> Interesting.  I only tested with two DTBs in the list, and when it worked, I
>> thought that basename was ignoring all the additional filenames in the list.

With two arguments it worked "by chance" and with 3+ it won't work at
all. The manpage is clear about that:

       -a, --multiple
              support multiple arguments and treat each as a NAME

So, no support for multiple arguments without -a.

With two arguments you used this syntax:

       basename NAME [SUFFIX]

So that 'basename a/foo b/bar' takes 'bar' as the suffix to strip if
present, but being there no such suffix (by chance!) it did not strip
anything.

>> Since users may very well have multiple DTBs, do you know of a better command
>> that we can use that will strip out the first filename in the list?
>>
>> What I would prefer is to have a command that matches my commit message.
>>
>> Any ideas?
>> In Bash I'd say "turn LINUX_DTBS into an array", in a POSIX shell script
>> given that LINUX_DTBS is a space separated list the easiest solution is
>> probably to use "${LINUX_DTBS%% *}" in the basename command to cut off
>> everything after the first space. AFAIK there is no supported escape
>> syntax for filenames with spaces, otherwise it'd get more complicated.

Using bash arrays seems a bit overkill to me. Also POSIX shell does not
support arrays, and depending on bash for such a simple task is not great.

What about:

    $ basename -a a/foo b/bar c/buzz | head -n1
    foo
    $

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
