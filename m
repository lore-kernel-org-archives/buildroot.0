Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFCDFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23942610CE;
	Tue, 28 Apr 2026 19:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFWTfhIGNcPq; Tue, 28 Apr 2026 19:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8706760E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777404627;
	bh=/Oat7LP6/4WRDGtSVB8T2SjBz1krSWS2vF3pz5Ez3H0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cMNdmTCxYDmN2z9RYRvrm5zAFBpIXeGPZSnagNc7KgW6VTIoV1HscY0XiduHzaAKK
	 E/k5v6MWPJafzORbpW8WUbkP1r7dZAuUV9fA4c/gTPs1n/zmfzWPHhDrlZo0/YNBC1
	 UIt3BrPZcKgqkChD51LWyYN8zhmIv4CW/4TXITBhn3rx8ycPr7jLixBPGLUdlYgk6w
	 Evh160vcCXLjRzDSoT9v3zLwRn8buyMPqdGGW1PDIH0vQQKA6p6SBgZQJCc4YYEC8+
	 OfJjmnoKOIrUkfCoWElFICyahfeAClNv1hnP0VYp6cX4xJM8eDQTIcIoo5a7knhGUe
	 g4Rtx1V/PpfTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8706760E64;
	Tue, 28 Apr 2026 19:30:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37CE41B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D2BE60E64
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTgG2idWURSA for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1937860DC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1937860DC4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1937860DC4
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:30:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 37090780372;
 Tue, 28 Apr 2026 21:30:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 21:30:22 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 21:30:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260427192342.634324-1-bernd@kuhls.net>
References: <20260427192342.634324-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <868eaa0d10bd289f37288ce4ec9911e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777404623;
 bh=HLyR73SQyW0C5JFbey97qfORny1clsfX32tW/lgqFvk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KOZPQM8UAr2EJ/m6p/mqMqp9UehzCgJaPGRQJgNF1/HPzemQBy0nUVq56TVCqYPIz
 7e/nna8hFRORkG9EMrnb22lOx9zgFRl3U5DPC8i1eiO7dH+5fJNzgGJROC/4SxZc8+
 ZiQzW5GGxncGzntWhVsPguhQcOUn8BBT3nTKi7Zxiya/FpUJz7WFgMituNKOhX6QRF
 gNshCaFMOzYK1cUGNB7xkrTLUFI64Dmoe7ollhrgCnr5tsfuX8TnK+kTyu8LVj68fN
 Cw+50OwDEz6/wKaflXrttDpkHup4fJu4cfbhbNex8IDyF+BoV4yj1/RZqmKJZYl+fc
 tvQH02Fy5kqQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KOZPQM8U
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 7.0
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

On 27/04/2026 21:23, Bernd Kuhls wrote:
> https://github.com/strace/strace/releases/tag/v7.0
> 
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
