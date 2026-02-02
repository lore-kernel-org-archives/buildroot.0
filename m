Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C508E7DF19
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2906077A;
	Mon,  2 Feb 2026 18:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bZq1UKMwfIP; Mon,  2 Feb 2026 18:18:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81EFA607AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056337;
	bh=JwYs4P1oYuBqs9n6lMAkdnqKg/skMmRzCuiB7KHB7PQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bKSnwWp82ijUqPSaKWytUP0tZ+NZJxJff+gkgGD6KF7m1uT5Ryi9sGQ+SF4yFBYGt
	 hsOF6lEI/hd2AWhRN5fdacFjw6uEslS63/IrduENhGcRLe/WflbNedweXh0PLZra7p
	 VRDav1/Q1weW+NMF2LwysVXAyxbMtJ0xG5NaKS2mnBz7QG2nibT/NhZcXvqCJ7VsjV
	 o964biwsvmajb4IP73FqPIbPWkrzL+Zt95ds+R2/i1BH+8L8ElbrLxW0PJyMm4alvF
	 ZrgtBqR0eVRl5srMUhreVf6uMf27LmScUPjOD2XgYmuPGbqzVX5eY8awow0Nqj6krf
	 +P2k3+wSts10g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81EFA607AA;
	Mon,  2 Feb 2026 18:18:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75D9FF5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CFA940244
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcAArWFmO7tw for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 529AE400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 529AE400C5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 529AE400C5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1947329828; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 18:18:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmyVa-00000007RdT-2cRD;
 Mon, 02 Feb 2026 19:18:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260105194056.2156773-3-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 5 Jan 2026 20:40:56 +0100")
References: <20260105194056.2156773-1-bernd@kuhls.net>
 <20260105194056.2156773-3-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 19:18:46 +0100
Message-ID: <87ikcfuhyx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hIBwj45jNNx8Z4Bd5mxnKzNsrRgx64mK1HU2vJKdZX+aj80NGArGHwafXD4C0W/aM+eTZ6vQmWEa7CzMcggbMZuYulM3sbjMZ2kf6+D5p5cAUtclLZoj4SjoAI5XiBN5BNV0fgmgb5CO+LcpBUwrLGe2jY/m0EjzSUjcKcsMYFcrQ/f3GwRe6j+/TO6/mXqWyynZI8Gvuf9y2Zx/dJULLvRsbynTr7xsWL4JRwsTnswCykXeFDlbhRKwPElGlgFC3V7Y0md407cCV4+dqftzrhr+8fI+XOqcyuIT9hL+2ztolIcDuywF6yptXqA4IRiEOUv+T8S/LWPoMKFLjQOZ7g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ow4wiSmyLc4l6FDCMbeRQD9labsE39ZyM+B2QxpBRhU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=hIBwj45j
Subject: Re: [Buildroot] [PATCH 3/3] package/dc3dd: needs MMU
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

 > savewd.c:75:27: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
 >    75 |           wd->val.child = fork ();

 > Fixes:
 > https://autobuild.buildroot.net/results/40a/40a90638f90260ca2cb51bac03b0f8fb23a6ccc4/

 > The build error occured already in January 2025:
 > https://autobuild.buildroot.net/results/9f3/9f3fefe5578dc41272e460146b566ac20f6cde75/
 > so a backport to the LTS branches should be considered.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
