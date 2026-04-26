Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A439BFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 19:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 771EB84E2C;
	Sun, 26 Apr 2026 19:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bc5CfpNDD8Qf; Sun, 26 Apr 2026 19:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6FEC84E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777230857;
	bh=F/wPJAsSHYthxWg3zw0jwcxzfYFa7SkTTITxs0RfCR0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fuadHaP7mGSTudOtNCXVGqi++XkihKr45zI+2o12xMSyyqs7CbdIeR6tyGpakqHpb
	 51SAPfVA4MbgW5Wwbrnuw29WGrXs4tUbRsLNP8k8cAR3mG8zDPwcM+SIcEPBGK+TrW
	 npruaUMW+51524hXRP7mzMVs2FPu8IJi2gVmmFi5oQIX5bKYB4AzSb+vw0+jjVzAzk
	 RCqy1nKlnW/ANbYw+PgbSNqhDGSW2zxZNhhH/sBmfIofizEMZg0luYLQAIjeAlcATE
	 xIs/lBQZKFguOSi6JJaD2xigt9idkOEiJWVCsQs44bXkfd3Vyu8Qa9RFYlgwDxWuPC
	 Pcxg1Wf7fZ5CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6FEC84E24;
	Sun, 26 Apr 2026 19:14:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53E061B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39B3440376
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkA6EkfAYH4i for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 19:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D1C840331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D1C840331
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D1C840331
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:14:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8243E19F58A;
 Sun, 26 Apr 2026 21:14:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 21:14:12 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 21:14:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260426092637.2320150-1-bernd@kuhls.net>
References: <20260426092637.2320150-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1219466189c86067e9683beb093570f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777230853;
 bh=fBhBjeCPiRoJq6tqKjeUCceunzQJyvnyjOtknCUk+VY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T4Lum86Eb8Mih81HYAtr6zqvjiUad0WGsr1g7qUtkavruf8I7fincT+PhAVJWXgjB
 2vJ1nQCCQu8w+oIY/n9GQLiCFtzyxJDSlLs2eaDgiNWsXInrDwXHtMnvK56EyMvmzQ
 i3SfcYiLllaIZ/MchcnwJ2rd0Y6q5pNHt2mQed9TkVmqkJ8XLfm4ut3hcgnw6DFmvx
 EAPPXk+nc1gW49CmS3ztz1wvtQSrGrMiAWsl1K7lRgJwg/ng5BjJ2Vf6ej04yesJq2
 p1HTUMtmgWNrAbkyv78Og/vqqa1ZIDrhZ7Anjds0XR7G8y1eNrPbG93EnwHDGDr0/B
 QJDU05u9RDxwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T4Lum86E
Subject: Re: [Buildroot] [PATCH 1/4] package/gnupg2: bump version to 2.5.19
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

On 26/04/2026 11:26, Bernd Kuhls wrote:
> https://lists.gnupg.org/pipermail/gnupg-announce/2026q2/000504.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
