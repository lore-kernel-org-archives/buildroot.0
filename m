Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B0E73179
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 699DD606A2;
	Mon,  2 Feb 2026 13:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkrSwQNVMx6S; Mon,  2 Feb 2026 13:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CA7F606B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770040628;
	bh=hDP7oBzEJ+Z6VBXQ2FTVb+EPBZqB+XFVlm+yiKAR/fw=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kDQF+fsDoh4AOx68g6eQH5aDegiqRKwAvX8Qve6l6XyO9nICYip88T90nqXYRbwGY
	 7U47VtZ/TYNPgO8yk5QFySyU+oHQ8aWFV5PoDyEnteCl5/i9HAw8FED9ubz5oqrpDL
	 +m27xddoybseiOZJJ73tgBOCIf3JlR86Z6Q2mYy+YtkYwYzi15wwa2OH9k3SmDcpsq
	 yFaUdXKTjLbMKYdFmxF0uux0kjuVWAP899yjFZsfJkrMAEcN5wWxoze0alE9T1JVkw
	 D6FlLHszBtgCvDj1OoM8NOhZz/CBRJ0wVSsY8Xls0rzDouqoYZikSYKfFuYJTqcQAj
	 ZyGldScdOT3Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CA7F606B0;
	Mon,  2 Feb 2026 13:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D78E623E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C49D940802
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rX8mWiDG2PR for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:57:07 +0000 (UTC)
X-Greylist: delayed 906 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 02 Feb 2026 13:57:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65D44407F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D44407F7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65D44407F7
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:57:05 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 2 Feb
 2026 14:41:56 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Mon, 2 Feb 2026 14:41:56 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rustam Abdullaev
 <rustamabd@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Andreas Ziegler
 <br025@umbiko.net>, Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, =?utf-8?B?TcOlcnRlbiBTdmFuZmVsZHQ=?=
 <marten.svanfeldt@actia.se>
Thread-Topic: [Buildroot] [PATCH v2 1/1] toolchain/toolchain-external:
 introduce BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
Thread-Index: AQHcd3Xaa/wGNkeRC0aV4gXUiH/JP7U1/2cAgDmUQYA=
Date: Mon, 2 Feb 2026 13:41:55 +0000
Message-ID: <5188f4ad-3451-4992-849f-c9ea92d23911@actia.se>
References: <20251227211415.2269024-1-rustamabd@gmail.com>
 <20251227232420.1644a29f@windsurf>
In-Reply-To: <20251227232420.1644a29f@windsurf>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.59]
x-esetresult: clean, is OK
x-esetid: 37303A2956B1445E677C64
Content-ID: <428608F90FF74E44BA7F2ABC26DC6154@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain/toolchain-external:
 introduce BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
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
From: John Ernberg via buildroot <buildroot@buildroot.org>
Reply-To: John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Rustam,

On 12/27/25 11:24 PM, Thomas Petazzoni via buildroot wrote:
> Hello Rustam,
> 
> Thanks for your patch!
> 
> On Sat, 27 Dec 2025 21:14:15 +0000
> Rustam Abdullaev <rustamabd@gmail.com> wrote:
> 
>> It is important to have matching kernel headers when building packages
>> that make use of kernel features such as seccomp, as they depend on
>> system call definitions in linux/unistd.h. A typical example of this is
>> openssh - building it with the official ARM GNU toolchain and kernel 6.x
>> results in a non-working sshd.
> 
> Do you have more details on this? Which version of the ARM GNU
> toolchain? Which kernel header version do they use? Which kernel
> version are you running?
> 
> Indeed, there are two cases:
> 
> - The kernel headers in the toolchain are newer than the kernel you're
>    running => you are doing it wrong, and updating the headers in the
>    toolchain are not going to fix the fact that your C library is built
>    with headers that are too recent for your kernel (even though I admit
>    glibc has some tolerance on this)
> 
> - The kernel headers in the toolchain are older than the kernel you're
>    running and you're seeing breakage => this is a kernel bug as it
>    shouldn't happen.
> 
> In both cases, your proposed patch should therefore not be needed.
> 
> Could you clarify which situation you're in, so that we can
> understand better whether the use-case/issue you're having warrants
> this additional complexity?
> 
>> Currently restricted to glibc-based toolchains as glibc is backward- and
>> forward-compatible with different kernel versions while uClibc and musl
>> are not.
> 
> Not sure why this matters here though. Could you clarify?

We ran into the same issue with the pre-compiled toolchain from ARM.
We needed the CAN J1939 socket support in python, and python enables 
this based on tests done on the installed kernel headers.

Since the J1939 support landed after Linux 4.20 we ended up spending 
some hours figuring out how python enabled the CAN J1939 socket support.

Having the ability to use kernel headers from the selected kernel would 
alleviate such problems where the project depends on the installed 
kernel headers to enable / disable features.

Unless the python package is broken instead and should bundle the 
necessary headers rather than depending on them being provided by the 
toolchain?

Best regards // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
