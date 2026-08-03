Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB2C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 12:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3375260750;
	Mon,  3 Aug 2026 12:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4Zle7cfWju2; Mon,  3 Aug 2026 12:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F8876072F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785761423;
	bh=xy1Nml6815UgBWNMxYOcIhF4PLvr+hwpetEVUipBAMc=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L20QdR5r5Xdh0vQtrupe9ZubMQZkAt3J9MtEEv6mbQuJzBV8quf/eyrXrSaNhlMQK
	 2G6aqvct6ll8ut3aQHVdzu2Ckj+U1aJ6p7Vn5OL0oTCaP/osCgFnANvlXrPUY7a2C/
	 td3cjC6ntK51QTevFzvTV6cViyzbWZ6zkj6trkv5PlqCGf804Te8Y7gvCSCz2ijjxs
	 L89uWfhMPXSnwLURO6l+6Q8D2uAG+JfuB47LHPcDwxkQ6w3jUMJDVkPeO8VJ4FB+Wq
	 mHYg0l4TIodkoAPEWjkfY1900N3HRESGJ7mTSKxyJ2zrpLxdeXjrzDq+vvW5jMxzni
	 +ljntIkZDDyfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F8876072F;
	Mon,  3 Aug 2026 12:50:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09AC4218
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3F016072F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKk2Y7t9puTC for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 12:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EAFD60703
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EAFD60703
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EAFD60703
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:50:20 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 3 Aug
 2026 14:50:16 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Mon, 3 Aug 2026 14:50:16 +0200
To: Matthew Weber <matt@thewebers.ws>, "j@j-ernberg.se" <j@j-ernberg.se>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Alistair Francis
 <alistair@alistair23.me>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>, Julien Olivain <ju.o@free.fr>,
 =?utf-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@arm.com>, Titouan Christophe
 <titouan.christophe@mind.be>, "Weber (US), Matthew L"
 <matthew.l.weber3@boeing.com>
Thread-Topic: [Buildroot] [PATCH] package/xen: bump to 4.21.1
Thread-Index: AQHdCpUT1XJKgW7MOkCo4d/rYkioLrZk3eMAgCTLbwCAAq1AAA==
Date: Mon, 3 Aug 2026 12:50:16 +0000
Message-ID: <40f8623f-50e2-4dcd-8940-c492d420de4b@actia.se>
References: <20260703023758.3883041-1-matt@thewebers.ws>
 <CAAHg4Zg8g5sxprMwQnUYpnApD18k8SrqBhuBzfk=6qhEospE=w@mail.gmail.com>
 <CAFt09wMb3eOkZruyPZJr-t9xjpxqCBOEOVga5y0kvuqykrFuoA@mail.gmail.com>
In-Reply-To: <CAFt09wMb3eOkZruyPZJr-t9xjpxqCBOEOVga5y0kvuqykrFuoA@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14556677264
Content-ID: <0F3C1D7EA59BC54B8CCA58D1D5EEDED5@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [PATCH] package/xen: bump to 4.21.1
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

Hi Matthew,

On 8/1/26 9:57 PM, Matthew Weber wrote:
>>
>> I'm also not fully convinced the qemu-xen part is needed at all, Xen
>> does support system qemu, and looking at the commits the Xen project
>> did on top of the qemu version they picked here they are pretty much
>> only required for *BSD.
>> Have I overlooked something that would make a system qemu path inappropriate?
> 
> I mostly kept it separate after looking at the prior attempt at using
> system qemu.  It felt like adding that dependency between system qemu
> and xen could block updates to either package over time (e.g., if xen
> hadn't moved that far forward or other corner case conditions between
> upstream and Buildroot revs.)
> 

That makes sense to me. Thanks for the explanation.

Best regards // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
