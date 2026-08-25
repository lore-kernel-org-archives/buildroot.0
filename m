Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B061C5DF94
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C7280B50;
	Tue, 25 Aug 2026 08:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bU6trS1OPGl; Tue, 25 Aug 2026 08:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787646258;
	bh=E//fZqjIFBaAgVV62+uE9HkkFBqecDOSmScVjjqX3ko=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJ6yusrzAo2gAAULtVPk3Pc/Wx/h6AClc+aTsBUCCAVeNLCJniGRxWjLLQbn3+Yjz
	 Rb4B21zXZuFL6gaOB2WTwjIjSvIIfzIi6drAx68y03T1589DpHhMthiVY1eC7oA0jf
	 d5gLG192Tpx92jiaZdN5lFEuZsFToKODOQeOMCpuI26zzquYugE8WqgSP5+5XEeHce
	 /qQ3UGFF2OqWC4Bb0ypLy/ASfyGuETyzMAh0L/MKXr4S/zk8X+vTFKhxRzQVxJc4uO
	 GgftgOMiRigrcaFPBJQT5vK0zVnVT3wNT/OmEe7zm/PbF0Sy4K2OLKI6/CdNRegosi
	 IRhizdAi1QgGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC8980B2E;
	Tue, 25 Aug 2026 08:24:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A18C1118
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9385E40068
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CCCrcGLGimh for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=fyYqj3ZL
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14EA840064
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:24:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=fyYqj3ZLd6JoGe08VdcfDRHBGJADoERDq9XPDMOknZhAibUt598XiJfkBIBcGLJN71dxLo19IQ3y/UUXTOojxv1Xggmc5Id6k84R72GfBZtkwD8QE5SoQSkv9R8WglEroNeyM+wz39J1h0R8Ap1oHxGrL60vKDb45OOMcZA9S3wFLhBnUDALiHljRufkH5myo47VsHPocx0tRZCMIIQ4UJ/nw/SNExqxLHbvrqoOLUhxEgvmYFu5Kgthv5Ud/24uinwHgYRe2KU6hXMej7vKh8qjcvZr99ZykpKDGGbE0na4UKgyUGOxKADyhSiepI6FrIqSznqLY2x9Zv/AY3nRvw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=vPT5zmpIMRe/+sSTOSP0ca8JPP6X8b+MPhd5MKMDRpU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1155230727; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 25 Aug 2026 08:24:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wymS0-0000000CPQ9-1B2P;
 Tue, 25 Aug 2026 10:24:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260825075109.3385-1-bernd@kuhls.net> (Bernd Kuhls's message of
 "Tue, 25 Aug 2026 09:51:09 +0200")
References: <20260825075109.3385-1-bernd@kuhls.net>
Date: Tue, 25 Aug 2026 10:24:08 +0200
Message-ID: <87se42y5ef.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Update the latest kernel releases to:
 >  - 7.1.9 -> 7.1.10
 >  - 6.18.45 -> 6.18.46
 >  - 6.12.104 -> 6.12.105
 >  - 6.6.152 -> 6.6.153
 >  - 6.1.183 -> 6.1.184
 >  - 5.15.216 -> 5.15.217
 >  - 5.10.265 -> 5.10.266

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
