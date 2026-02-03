Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA03E6E7EE
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E4C983B56;
	Tue,  3 Feb 2026 10:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TmcMxCYIprP; Tue,  3 Feb 2026 10:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4FA8144C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115328;
	bh=BPPca5jkYTpFpfEQr47W4TBRZowY7BgPiM7wmUeJxoQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UUt1vxz4P3q4e+cYYvHFDiNnDC9mzKRcWw7qItsDcmtXqP6XqQsa2iSTUyTZWoflW
	 de7UHrD093LfwRaHLByNYCHEgu6c+zzNrZgti31beMEVGfluRiDAEijp0CZfFCQH8R
	 cE+iIC77gQg5kX3Z5aUI837L83sgyzdieLmL0XdGF22fBX8QnsFAounJX+Vt67ZOSF
	 CiPnPUYeWD3avyBbxR79hVOn7ZVu1HaKM1pX+kb4tKqqyA3g1jCu1M41tnrRjLI/mE
	 Qu2vPzZ90vChtv8959cqGkFo6C+XDrRqeUEx9dOkjtv/EFnEvBW0Badsw9CDzdKSEg
	 0+l7TahdfiH3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB4FA8144C;
	Tue,  3 Feb 2026 10:42:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69011F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 524C36063A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuY3_cw2r1Xt for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3238F60635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3238F60635
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3238F60635
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:42:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9CD63C211C9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:42:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E8F360728;
 Tue,  3 Feb 2026 10:42:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD3B6119A8891; Tue,  3 Feb 2026 11:42:02 +0100 (CET)
Date: Tue, 3 Feb 2026 11:42:01 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <aYHQ8BoSkT4f7QJ2@windsurf>
References: <20260104172232.3437646-1-giulio.benetti@benettiengineering.com>
 <20260104172232.3437646-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104172232.3437646-2-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770115323; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=vCnkifnp1zFqMV/JHeMqC0koh1/XLgVhsJmPvGsUEnQ=;
 b=Q9PTvXssNRV6PcuLpuVIBrE+g02Xr5kYvV8g42cU9cCrIDClOwcIODuPbwuYiD4NNASXMY
 rbT2XVt27nzGcjmJ2oGSLI7sthOaDzQF7x5YHJMSbxkDy2caBJnQQJmOiMMkbPBPqmo8e2
 9Is/kXdqa/oSM/xuvwvKN8HJ6Gik5SxApYXIZnW+x+1CwpdH5yrro0UGzMfPDZYRp9deQr
 5uu+wIVbGzKADAKrrCkRoXZYxJ+Afc6R143CR3X6bAN6q3JSNvX2sp42BNTJto8MSN60W3
 vCPTPxviJcNCNcb9hlRu8nCNsmzL3xC0d6MjSWESqehEIm6lPT3Bn/Jnny2Hfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Q9PTvXss
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package
 bind
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 04, 2026 at 06:22:26PM +0100, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
