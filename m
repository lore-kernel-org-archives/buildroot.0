Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9910DC98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 270E3808A1;
	Sun, 18 Jan 2026 21:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1ZbVp7yeyAW; Sun, 18 Jan 2026 21:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54727808A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768771890;
	bh=ETiKaF3VWuOZX1XeCqzYZ2jbFjww2v2n6WaFuT0Mbfs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ILAqEgizS2XrFFUO7PftNHztIFh7SVmgcHMlbaIXEaBGFG/Nrzx1MaibCRct48wSd
	 WvIhyskXl7bjEmJYa14slMgajwYbqH8L0/J1Eiu71CQLvflAgx/TTyYzyAb81Dan/f
	 JPC8QYuz+5guQDleErqm1VQfPxEdfzRzh7PUG7qekl4Ok5wNHgq9bgu2TcI/BjBdWu
	 Oz9Lfl02+eJMMO6a2B16ha74hjMUpgSGz800f1lp/lz5U/87EvzyF+hbWJv/unuWC1
	 CuTpKD0/h4RZtQJbNt5z4l4k2CMl6saVg0XZmXRsCfAxa0MMooihaS5ekSO3XX2OcW
	 TY1ZXMWSPPHLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54727808A4;
	Sun, 18 Jan 2026 21:31:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D89712CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4311402B8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mu4hUdqbTVwD for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 21:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8A5240291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8A5240291
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8A5240291
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:31:27 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:17d1:a908:70b9:90c3])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1850420039C;
 Sun, 18 Jan 2026 22:31:22 +0100 (CET)
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 18 Jan 2026 22:31:19 +0100
Message-ID: <20260118213120.69615-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107234505.0810d964@windsurf>
References: <20260107234505.0810d964@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768771884;
 bh=0QlwCAGHKdgSD5QDcPCcauSU7hN5HMeREwOXOQlYo/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a1LLKaosa+3ZZNHCS5k/e+U0VD2ghYfMMto6CAVJKipXuu7a0R8huTyaLMUx+D/Pn
 yG05GpXZuyUPWp4RuIMitp7p8cXmvngzLkTiy75Ll9s9IGojtsIfuEj1YtIDOUBmLE
 hRE6t+w3xkd8wgKf8ndK6ft8lF6Ce+6NmTCmlWt7xp3U4SELgImJYxoylJKOAF5jpL
 pOtRjimf4/HqEtbapnjTuR8RQZT2b6qt8L3fjU+nhMVUqe3vGMIfF8MAz+8FhafnMs
 5dzlUVDiq5RTSxakK6WjeFtSxaHEnE7FaSP15QcndYqo4cBa1L/X9DEvdhZpP6r6Hu
 Ef5e7yC1zK6Kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=a1LLKaos
Subject: [Buildroot] [PATCH v1 0/1] package/sysrepo: fix build on riscv32
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes sysrepo build on riscv32, where glibc doesn't define
SYS_futex (only SYS_futex_time64), causing the build to fail.

The fix uses pthread-based condition variables instead of futex on
this architecture by setting -DSR_COND_IMPL=sr_cond_pthread.

This issue affects all sysrepo versions on riscv32 glibc configurations,
including the 2025.02 LTS branch (sysrepo 3.6.11), so this fix should
be backported.

Fixes:
  https://autobuild.buildroot.net/results/b0f/b0f30feeddad1a8d51ac87af8b7c56fd9a9b5ff6/build-end.log

Upstream: https://github.com/sysrepo/sysrepo/issues/3346

CI build verification:
https://gitlab.com/vjardin/buildroot/-/pipelines/2269971852

Vincent Jardin (1):
  package/sysrepo: fix build on riscv32

 package/sysrepo/sysrepo.mk | 7 +++++++
 1 file changed, 7 insertions(+)

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
