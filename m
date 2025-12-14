Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8619DD5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5304660DA9;
	Sun, 14 Dec 2025 17:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYOGGdseZFda; Sun, 14 Dec 2025 17:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A11660D94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765731857;
	bh=DouYDw4EOYKCTquaPwvv8DMyBg4xnMakwuZ3NdtPEWc=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pR6fNR00Z6Rz47QsniUxMnqW47sMYSfsch+Q5XEOlY05qQQc4iY5jZkJT2phLKGRx
	 Ua9AEv+To4o1q7eUfFrgp9ZK68cHsSl7tliOIdwQhQ17fvXyP11F+vDXMhpMA0Bwm9
	 7+6Gfqo9HuqnxhSkMtkRmoOmTPqbimtD7V0nvST0IWVfM4N3pmnibTm8LNMOPEcaCG
	 bc/cwWut+UMEQa62dHILN4C1shHr9v2YNH1JytiIFxma+olXkLr4xIyug1mOxl4IWK
	 H7VN5F+bMcuyrU/DMYFGcMefm9FtuOuI0Jw3ACoOXWwN3x3qX+rlLJhslYsx5lcGjw
	 Gfx3cPGmqhGdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A11660D94;
	Sun, 14 Dec 2025 17:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18E5E2D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F40B140785
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYZHAuQNonLR for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7C4840871
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7C4840871
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7C4840871
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B798D4E41BF1;
 Sun, 14 Dec 2025 17:04:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 74D2E60713;
 Sun, 14 Dec 2025 17:04:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6319B11940D7C; Sun, 14 Dec 2025 18:04:06 +0100 (CET)
Date: Sun, 14 Dec 2025 18:04:05 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20251214180405.04d3e0c1@windsurf>
In-Reply-To: <20251209122541.849522-1-buildroot@heine.tech>
References: <20251209122541.849522-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765731847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=R0MnzgQBxR6cTKO0IjHSBeAgIKTE5C1m/e+LZWOiMd0=;
 b=AJjFc4bRDxJOLdBSmG+XCsjMKd2+XZ8X/Ucv8QVuWSeTO679nrJ0dNYUFnJVtvm+JWLtg5
 iwY9rmVxIvmw6Eq4328Oceui1W2EzTnYUmxksyuqnT8GtgVUqGJW9ChXsLrHJMEK8sO5Cc
 rIkl95Be0FdL96LSefQGWvD+vAbboZil1TTrca679PnpNJNVgnmTnXFbzTg+GLBTbvLk88
 XDf12N6pi5BrynnRlrkc3cAxkNGkkGImANqr9Hovg6WBOlp1uVGTPYyW9dEAgYQo6hKVU0
 Bv6+VHBTrd04UpYwM/RkvGJ2kdHJ6WgrhtgtFDndMRUMpxIsn1P4fmp67lbwsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=AJjFc4bR
Subject: Re: [Buildroot] [PATCH] package/grpc: remove BUILD_CSHARP_EXT option
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Dec 2025 13:25:26 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> the CSharp Extension was removed in grcp 1.47.0 [0]
> and the option in the CMakeLists was dropped in 1.58.0 [1].
> So remove this option for host-grpc as well.
> 
> Fixes:
>   CMake Warning:
>     Manually-specified variables were not used by the project:
> 
>       gRPC_BUILD_CSHARP_EXT
> 
> [0] https://github.com/grpc/grpc/releases/tag/v1.47.0
> [1] https://github.com/grpc/grpc/commit/3a2bd221ef1166ae7d7bba3f700ff92ce3df5e86
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/grpc/grpc.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
