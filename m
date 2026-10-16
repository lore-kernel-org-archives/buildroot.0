Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D927CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 05:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E028E8126C;
	Fri, 16 Oct 2026 05:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXNej6yiauDY; Fri, 16 Oct 2026 05:05:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E9A8B8125F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792127126;
	b=UhpGTuMAlIyyyhaoaQsDSe1NhruT6rQd1Fe9bBFA3e8iArUxmf0kQzmvjbcuJHI76kpL
	 H8BDnqLL4WLgLC57b7Fo8C0Ba4lXtshUpJyR6WoCjuOwwqwnxti+RalreWkbqQdF6yH5c
	 NLZqi1F7DWKwOT5URoQPd3T/CRLAae+8W/ee4lIU/N1LgrJILQAEAm+EKjNKxi8UkSlfM
	 M8Zuc1U7MPlqIld2UltwIETIC/S17/Lhr39YAGxBvrfW0TnMstG92mEs1rKHVU3b0FlhX
	 JWiEPiki2aRJGnpN186jUasiv19SYlvMJP+hWT6DqEhjARMliZzN/w1AQr+fqOrB8tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792127126;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:From:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Date:To:CC:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=3s6zba3jhSwS1y5CvjDDbsHyyMSQu6ZiTXCGmZASdrg=;
	b=VC+RGglq9U7PPl+OEdoB6u0jRecJOQHHJhLudp5ExDciFbnsfrCRb5JJq7MbrPFp1kIz
	 07B5nIQ1lnuYspgui79S/HxBEXBRWsDsBOu53Dli9YkSFxo0xj5rY7RTDnA7h4pjEKhe0
	 fFptBs1woFbHgCnjHuUtY4pOx0N/H+EgTotO6JVVymNQWqU9bfbtNgHBjruv8YRusziMj
	 vN9VGOIfaOfF1QimvNhZh8Ouf8r6+VHLBg8h4qNGo7Fb5XDm+ge9frEc7ppXxz5aFL8g2
	 H9r2nt2dngMymls10OVRNGG/LlZ8aDB3ChUZrHVd+jCkRkcH7PI+pt76fsmi32/YbXw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=orange.com;
	dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=nBqDTKm2;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792127126;
	bh=3s6zba3jhSwS1y5CvjDDbsHyyMSQu6ZiTXCGmZASdrg=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdoVJaa9eULRlU7UC7T0Ws8tdQppRuLmvxOzhgnDrszOilnraSNIkGQLXPjByvJWy
	 /pyCyAUTSyngFSBvzJbUFJMOGDWpL4Re8o/TpuvL7Z3Kod8/kRN5dDtLckBUZdRvju
	 tyTFfl3j7YFk6CSvCLXrtYwarMIjDyrxP3n7hPbUuHJTDlaoMrTz2sN8VLiLsG9Cp/
	 Te9XsIsyygjdqluouM27nGLfO18lMXtmQ/g6gV2Af4vxBOLE6tscgX2pChavbv18Hs
	 RH8VAvciXXRr7OJYdQHYOr7svpGmOFuccMUef6BthB9z31h3Giwi/NqFK1JgWWKCaR
	 cPwPUPcjP8+IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A8B8125F;
	Fri, 16 Oct 2026 05:05:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40194263
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 260AC8125F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sfigrHyeRVf for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 05:05:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 93B3781233
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.210.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792127123;
 b=fbpslYiUfwjCWctfNN4SmjkrPZGj/q2yIdBiMVLRIYss1cdSmd93SOt2YQGoyk07ZZ/H
 uz/bx2vcY9NXM/zrCcmhbebIbW7aS46LMhm+pNEOCSTtdMRSoppRdIjZ4BUaNe+vMouPA
 /LRO8/XrACkh5TrWVkBjl38VVVdBmzzxHTuEhz3S/9zxFT17WXdSLe7Z/h6ijdCnBKK5X
 +O6ksIoATM5wCkjhd9a+P7WT92qO6kBI8doXL/mzzjzXPrhOVClYdDlBQ0V8dFEohYqZK
 J5Ltl9lXt+Nrj1AyAvVvbFmYUBSLziHENXZgM5duDM6GhH7Q7JnYNfjs2TxbhhC5PxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792127123;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:From:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:Date:To:CC:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
 Content-Transfer-Encoding;
 bh=ZfMEFO91vLPDC+OmYVTWrM9kzq3ixhxlW2Iasv39Bw8=;
 b=VYuSA+zHRZ6QPKotLuLlixwIxeABRMMupXCDI0ngHxr1u65kIJ1GVjF/Edn1kAGnpew8
 fBrmuDaiuVTpaPD1qYLTVNRWtZ7xLcEDVYAw0NbDEdrk2ej1nKjgsJiACi7SVAt0Zi/ap
 x/ACGORP8BUBGq9jTsIhE3LAkXfdz5W4aJR5K1VPtMQ8WoRdfBSZL19wnwWAKU/FhY4mJ
 h0NhhPYNvfbCV2qnY3RiQTi6OxHYaAUFTGAgsbjD57ZqmECF85rtUzI8TonGnNRn2rlOp
 fIN1ppWcqdx1QAV6BfvlvoVRRazldfH04J01PdvyvYebrxLiKas7G49fnctAzxeZztg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=orange.com;
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=nBqDTKm2; 
 arc=none smtp.remote-ip=80.12.210.122
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=nBqDTKm2
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93B3781233
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1792127123; x=1823663123;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ZfMEFO91vLPDC+OmYVTWrM9kzq3ixhxlW2Iasv39Bw8=;
 b=nBqDTKm2sEez6xVBG808lvPbyLfq4zYkzpaQ8lm4YsPd+J1C+Jg6JN1o
 +B4/catVRnvpxqSRRnfs1ERLXp/WvXiwQ8fv8zmxjyddNse5HZvuNKs8I
 33VakEyLMQrzZwij+9Z/RRyoFVCl4CdgBH065tkEUpPTCIcT1VfpFTQWQ
 E7md4PNaOuKbKSQ40HnkpNwNS+KyQE9EiCCaz58OmvLt7BBsuoohsWgWk
 Pzdmx8alJFm6gi8WxxKrej7CR9BCEFrWdpxnpD0ReXFOkMxojfy1ACT3B
 YmZNZs9/Q/5+Fwbov+lmPaSm024hVOhnPVhcJoPbwgBNb8vP3g6Noq7r3 A==;
X-CSE-ConnectionGUID: 0BHicjhFS1+hG1DEXUT3Gw==
X-CSE-MsgGUID: as5d0V/SS8W5Z3pHIlBeHw==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 16 Oct 2026 07:05:18 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:05:18 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Fri, 16 Oct 2026 07:05:16 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 16 Oct 2026 07:05:16 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: /97yG9sQR0mnHwohd//Cnw==
X-CSE-MsgGUID: 8+uK2FWNRnCxRQlMXC8EbQ==
X-IronPort-AV: E=Sophos;i="6.27,161,1787004000"; d="scan'208";a="490220264"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Fri, 16 Oct 2026 07:05:16 +0200
To: Christian Stewart <christian@aperture.us>
CC: <buildroot@buildroot.org>
Message-ID: <atGwjPFYcThe92U7@yd-6wlzhs3>
References: <6ad19e7e.2bb6edcb.6bbd4.5ca9@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ad19e7e.2bb6edcb.6bbd4.5ca9@mx.google.com>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2026-10-15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

Christian, as our go expert-in-residence, can you help with the
following build issue reported by the autobuilders, please?

On 2026-10-16 03:48 -0000, Buildroot Notifications spake thusly:
>     arm      |  distribution-registry-v3.1.1  | https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8a417baa

The error in that build is the following:

    [...]/output-1/host/lib/go/pkg/tool/linux_amd64/link: R_ARM_THM_CALL, are you using -marm?

The configuration if for Arm v5 Thumb:

        Target Architecture (ARM (little endian))  --->
        Target Architecture Variant (arm926t)  --->
    [ ] Enable VFP extension support
        Target ABI (EABI)  --->
        Floating point strategy (Soft float)  --->
        ARM instruction set (Thumb)  --->
        Target Binary Format (ELF)  --->

Notice the discrepancy in the link command: it calls for the amd64
go linker for an Arm v5 target.

I have no clue as to how to further investigate this issue... :-/

Christian, any suggestion?

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
