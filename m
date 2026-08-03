Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2E7C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 12:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 441C040647;
	Mon,  3 Aug 2026 12:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAwyp4s24pEr; Mon,  3 Aug 2026 12:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A720340633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785759603;
	bh=1qYupBKD1L2ggcaJqc7dHEXUfuYuJss7KX9eNGwPCHg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fJdUKRhZVjfa0JTxyy+nEk6GIn+BmigRAI/tZ8UoNQRUKQS3JdTKH2RbdeZDZJ/P4
	 g4lz9xygYvt3Ly5tlv+TqzDqrP/pReJX/baUagBWYN+tcIsDCoxBEb2Xl+GdkKzsig
	 QCohSTTGgU/yyxeHfFIMqTcb0B0b2DlQ4AmW/tVgV8VNzFWFiwjt77IFF+7DM6GYL2
	 cxi87iEL9kCrZU4yBHXCeOyYIIf1QEDhv4ySu2+mAid0cKqDM861SVR68X7yEaSeyC
	 NU1clDoTRpa+YXdHRAWZybG4e23RbQwc7xcDhEIQD1ZrBPzuBftJePdgEvtlCpe9xv
	 v2xQh00GbtFbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A720340633;
	Mon,  3 Aug 2026 12:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94BA136E
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92286400C1
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPR6XBQM8kTm for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 12:20:00 +0000 (UTC)
X-Greylist: delayed 338 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Aug 2026 12:19:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5888C400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5888C400A0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.158.66.151;
 helo=cczrelay03.in2p3.fr; envelope-from=david.picard@clermont.in2p3.fr;
 receiver=<UNKNOWN> 
Received: from cczrelay03.in2p3.fr (cczrelay01.in2p3.fr [134.158.66.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5888C400A0
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:19:59 +0000 (UTC)
Received: from [172.27.130.118] (unknown [195.221.122.29])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by cczrelay03.in2p3.fr (Postfix) with ESMTPSA id AC7651806832
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 cczrelay03.in2p3.fr AC7651806832
Message-ID: <bc3bab14-ea4c-4a55-a81f-1dc808bf39be@clermont.in2p3.fr>
Date: Mon, 3 Aug 2026 14:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Picard <david.picard@clermont.in2p3.fr>
Content-Language: en-US
To: ML_Buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=in2p3.fr; s=20260401; t=1785759258;
 bh=MN8FDghYS/YR+fa59LLJGl/O/WtczznEF+AZK+GFQ7U=;
 h=Date:From:To:Subject:From;
 b=bJmgqoF3PwiD0GeBPgUViy8MVr0wwow4szXWcsQZkSJei2SG3mOssJKM3O1ABxD2y
 4aUQKndkjGi1ebtSpsdH5j5k1QTKZXLATRtJbT+Nxdc2x9Qc1PxwG77h+bL7cH7/aC
 R8ne/RKLVCRwUg6Cy5uOARXcq2+kCi+rCmIwmYOfDX3PUhNyktjoX2HGA0TKHWug+J
 qXlPM4sfT0yKg34NFG+K/guTPeHrnxgFBD95rqATwhs+lEY3Cbzz3Cywb/x8DS+sk8
 weAQZokTmb5/JIXxb+rUtpQxveNxU74KqA+TBPSM/rFUnwccJeDrzf2pes4TXGow9z
 ZKvEqmpjmaQiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=clermont.in2p3.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=in2p3.fr header.i=@in2p3.fr header.a=rsa-sha256
 header.s=20260401 header.b=bJmgqoF3
Subject: [Buildroot] passing a compiler flag to a package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'd like to pass a compiler flag to package/poco. I saw that the project 
configure script has a --cflags option.

What's the best way to do it?

I was thinking about patching package/poco/poco.mk, but the patch will 
have to be applied manually, right?

David

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
