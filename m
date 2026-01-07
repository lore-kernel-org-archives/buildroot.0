Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40F5D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82AB41063;
	Wed,  7 Jan 2026 17:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xuk7NP963Hfh; Wed,  7 Jan 2026 17:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C32741056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808527;
	bh=szSpiDmG5L+oi+I++asoFjAWMdfFxrVZFVd+expTKkQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S1BomSTYUNbSZG07CvDiLD6nBfmfm36q3T9FIMgtdYxJh/tL2Cwrmt/ttWBHrbbTw
	 5j+u6NIb7ZCS57/KbcIaTuDZk/fVAZxt3YmCija7WLxSeiwwjKeo/OAReLL0WYVr4+
	 +tA9XMB22g5wbA1XxnxHGzOXVl9WebvNstf0VuaBoFW9Id4V8YpprglS6dmWZsGbyN
	 xAVfFgXh8SJ1bMILqFpSsAYd57VCXryRWO5nXJ8pPSjUEfYfMDqValKkdXbicxG9Gv
	 nW9GXMTxzzcxEVR5Pg0tIvU2jq6/pWksGQ/v66VomZbtdHsBLyJ8+8g0iZQk0I+0pX
	 y7Peexylmdfuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C32741056;
	Wed,  7 Jan 2026 17:55:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1C949ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9352E40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92BVThy8Ms7A for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81CD340128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81CD340128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81CD340128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B1DAB97A704; Wed,  7 Jan 2026 18:55:21 +0100 (CET)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:19 +0100
Message-ID: <20260107175519.229883-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204190609.3846747-1-buildroot@bubu1.eu>
References: <20251204190609.3846747-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808521; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fuEgJm79nMLX0pa2ekxBsabBwAGZ0Mqw4NS3Mzbzy6I=;
 b=fFVBOSfoiEuMInAtR9mW/CuVLHTfom8O/Kk0vXfE4yQZuKQ9125wCooctjaQBegTvvxsAX
 BKEzxM72haSMgy06VWtnJMLmvK+XNFGObxl3zx0FUKBz+7y/3dDmYsnb6f7QeiyrugLzh8
 /4BdwqTNlfLzTkK5spOiooMB09nstwPif44pHSrlnKP3dfJppQdC0VJGzvBeAsLGpk4AsX
 jdj7HM51fHR0lPFHiCxcTVSZskN0hmJUdgOcM9KZ6q0LmpP2vVWcOyn25ZMDWdDpJbHa/K
 1FQ1E3VJ5e07x+Vwo1PUcYHreOdrD2cljfochMp4wUCNSNfO4rXwDwusCjEyUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fFVBOSfo
Subject: Re: [Buildroot] [PATCH] package/python-can: remove msgpack
 dependency
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Dependency was made optional in 4.6.0 release here:
> https://github.com/hardbyte/python-can/commit/6058ab9dfe8b3ba5d23cbff670c0fe767147390a
> 
> python-can has a lot of optional dependencies, most of which are not
> represented in buildroot. As msgpack is used for the virtual multicast
> udp can interface[1], which does seem like a bit of a niche usecase,
> just drop the mandatory dependency without introducing a user-visible
> config option to enable it.
> 
> [1] https://python-can.readthedocs.io/en/4.0.0/interfaces/udp_multicast.html
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.11.x. Thanks

> ---
>  package/python-can/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-can/Config.in b/package/python-can/Config.in
> index 34ba35bad2..e3f47813af 100644
> --- a/package/python-can/Config.in
> +++ b/package/python-can/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_CAN
>  	bool "python-can"
>  	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
>  	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
> -	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
>  	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
>  	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
>  	select BR2_PACKAGE_PYTHON_WRAPT # runtime
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
