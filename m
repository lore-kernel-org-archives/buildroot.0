Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84715FEE4F8
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4312560FF2;
	Sat, 28 Feb 2026 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kf9Z6f6E9Oee; Sat, 28 Feb 2026 21:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D745760FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772312657;
	bh=uidtL7Hnff2Kx9OPKdIlA3HYO/UfOVs5ADmofOah6FM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XuVE+yer3m5IONoSsePOKEd7U2okLFz2QG+9dNlczzk+dYNnvWw4S5jLNEcSjK9LZ
	 eXlG7pLj2RszT3CeY9TuNmAKNe+i0nJhN0X/9ykOMTaA+T8N9N/0ghU0sAhO86//X4
	 /NNybXb4etXt/XLA1lu1N4/2u5OdLSaFsG1gALG6++E1ILrixX18WOFch4wQDrPPl0
	 zJyaPW1Uq3vEtu0Te1a0eYlvpislUQZacOLVeOKnXDffoJ7It9LsCaNtk2FnnY3a+e
	 1CNJuknOZBwC5SecLxaEko5kTzJZgcGjoy/DvscqnOle5slgTjsOAqnyWu19KIGQj0
	 eOZNoZFFwnFeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D745760FE8;
	Sat, 28 Feb 2026 21:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AC824E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A983741A50
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8Rj-yxZVgQz for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 21:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D69C441A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69C441A4F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D69C441A4F
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:04:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E317BB00573;
 Sat, 28 Feb 2026 22:04:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 22:04:10 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 22:04:10 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260228202847.96486-1-thomas.perale@mind.be>
References: <20260228202847.96486-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <208db4fb6e6404701f0ea3d374294f24@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772312653;
 bh=xemiV+nwn8kSI1lqWd6EEGj967VmmpRkZ46YkZn68QE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DICSnT4bjF7Eiohpp2hhNzj28mTwvSsy/3nEMvlSwHj9MYwM1R7dp/MNl/68pKHiA
 sV2T6JjQjp2TngSiqvDQ3+7WDDTZa7B1z/Ts7pELoq6GV6HxxYJnqoz7sWn0CGPsIF
 KG9nNEDDEg4a57W7kpFf6UZezEXDw95thhDscjmp117BD0GkL+/gQTnuOOM/xQly/z
 tmuSiSUQ9cq+1damcdUv1/HB1n+dz+MYSpRtNTySfLt0pLGRucpKDFUS4jpc4Vp3hO
 fd0DBWsfUkRpB5TQ376nBV3tzsfHPGqL2EXZj5nBtAUX9Z4CGfoy9yyxD/5YSX7Q3x
 90tSaILPYAm8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DICSnT4b
Subject: Re: [Buildroot] [PATCH] package/rtl_433: add patch for
 CVE-2025-34450
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/02/2026 21:28, Thomas Perale via buildroot wrote:
> Fixes the following vulnerability:
> 
> - CVE-2025-34450:
>     merbanan/rtl_433 versions up to and including 25.02 and prior to
>     commit 25e47f8 contain a stack-based buffer overflow vulnerability 
> in
>     the function parse_rfraw() located in src/rfraw.c. When processing
>     crafted or excessively large raw RF input data, the application may
>     write beyond the bounds of a stack buffer, resulting in memory
>     corruption or a crash. This vulnerability can be exploited to cause 
> a
>     denial of service and, under certain conditions, may be leveraged 
> for
>     further exploitation depending on the execution environment and
>     available mitigations.
> 
> For mroe information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-34450
>   - 
> https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
