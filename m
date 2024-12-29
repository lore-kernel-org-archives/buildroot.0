Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5DCE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 15:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCCCC80540;
	Sun, 29 Dec 2024 15:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCELU0VMtrMB; Sun, 29 Dec 2024 15:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCB0080533
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCB0080533;
	Sun, 29 Dec 2024 15:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EB37C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FE1E804EC
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXVjYYsoebBZ for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 15:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41DA6804B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41DA6804B4
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41DA6804B4
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:17:23 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 26E034402AC;
 Sun, 29 Dec 2024 17:12:53 +0200 (IST)
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241229131711.707899-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 29 Dec 2024 14:17:10
 +0100")
References: <20241229131711.707899-1-thomas.petazzoni@bootlin.com>
 <20241229131711.707899-2-thomas.petazzoni@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sun, 29 Dec 2024 17:17:20 +0200
Message-ID: <87ttamwmbj.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1735485173;
 bh=/VTzQEdDlnzyYbMjwPItrqDjg72jkOpLUrjOYT01BDE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BcYGTvM6TxBKaT7IOHfAI3g/X/zzvf2vpuQN6w81yUr1StkGYKqwbxaYVYQtpUMxV
 wNJU/7uKsTrUhWKX9foHbDFEzqBK7MPhPn2SSfLB/7JelM1WaTSwpxwoViyEe4Qz59
 z5qslPn3DmEbpZLuvi5/mnutZABEMCeiqHTkmIMDtTPHMv4Utq9N/r6CRlc7dODoog
 Lf+9q8d+OCPBT8d/ijMlPmZ4q8QK1gqpBNGRR7jTqvDntUnWiAKX6Isp7jcgEe24Bp
 LOd0j0qI9vORSw5ux3g6XSrIgaoLHC0dNIptdS5vrDJDXuD0bakmN6sL2vRRWKkHEk
 uGPSrweKwflVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=BcYGTvM6
Subject: Re: [Buildroot] [PATCH 2/2] package/procps-ng: bump version to 4.0.5
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sun, Dec 29 2024, Thomas Petazzoni via buildroot wrote:
> Patch 0001 is dropped as it's upstream as of
> ca004d4657d5e8b468a4552ede429be53193a3a9.
>
> Patch 0002 is dropped as it's upstream as of
> 263fe04f9ed6f3f40fdb7ce249221e03dc926c9b.

With both patches dropped, is autoreconf still necessary?

In any case, the comment at PROCPS_NG_AUTORECONF needs update.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
