Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F05CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0262280570;
	Fri, 15 May 2026 17:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGWjO2a4n6YS; Fri, 15 May 2026 17:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A24684536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867249;
	bh=fLBI2lJDMw32NPG7+z4kXXzUKGfplEJNUwM50DRBcU0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UzOgS5fXZHHf2IW32RC2vzctEWi5YQQSpTi9GvjzICO8J4JDmER5jwkGCWm+aLuAz
	 blHDk2RQwjH+wPV7xT8Lg/GAeeW2eKU9F/TOUFniv65DnqFFqnjEQKFJHAwgqXnAIW
	 7szd9Vi4grXVv/xwbE6dTLnaYuxkE+ojExKTMsNLkLGRvLkWhwgfwwdnZcw3AA5qC7
	 2MoBUrgH1jxS9UYd4pK5Pl1PBcUJHvLz8SKSqlOhOeoS26qR3jZx6CgJKvo/XAS82t
	 Vy+1kp+08kD6DE4X9TjTGxGwNZbqqI+ERw4cpZJT96+9US+y6eWqg5zF/+rv8ausn2
	 wRZ23pAI03veg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A24684536;
	Fri, 15 May 2026 17:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A87223F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF07584682
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3AvDlh3c5Nz for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C590284671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C590284671
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C590284671
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so19217f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867211; x=1779472011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DJDmp+h2WfNPImfCMVVBkBD6vC9pJXnxatBhV488DUg=;
 b=KhWCAORLJg8jSGydAo0xVNScG5acF3md1xnYH0w9diFT0y5SY60K1/K0xHQJEA7Tls
 5ceVkhihhQcWiczeoC/NSKfhbKshxpcbEM5+nIUTCAViJJF4Qduk0fUBL44LguZ06Qr7
 VCt/OkyAO3OnkPzwTqY9vzylYqYIWE7DqkZSPhiREvV5NJDqAZFD4WErvUpu4Wn4KWX8
 f2R4GZUDQITzC+yXl/0EmFHb4d+qPKhjVCkeOHR39oMfPC3tYSXPTJ74+FIL9tcU8AXX
 K5WIwgYPBFAePHT3SrOq9uoSj+6M/iojBHynLA7ZomnD2dErPhpQRyfeI8tmX4oZl+I0
 vh/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+xLV3fsMy9g7nBHpeHr7rJEk7+kiKkY5Zycx8cpoljVly5fKoUt44gwXYB3JvAwxt+WkQRSoi+5QQ=@buildroot.org
X-Gm-Message-State: AOJu0YwI0u+OziTlSvXif6A61hWWYVL6vGSrmpOLrZvT4P5jwJs/WtRz
 w0pU5uCB6mhFAcx56oZfI2HYAUMEzg9FS9uaNglk2Kr4GhqbW4bh78JHARqmJI1ayTU=
X-Gm-Gg: Acq92OG+az4g4gKvYaJzL/OW6ZuU7ra00ttgKmznmZ8o3Ayn6gZJvn4Di9Z9Sker1Wr
 sPjSy7c1XbGN6+4+Q+a8HLqLTG8hDfZLQ9rej0EgzJjSsEhzLULDOUOqTVCnj44RffkqnMyGh7F
 U4Jt/yUljB1iHyGLzqcebZo73LCmTchkLViJn25yBpOJhK/YtsdVXkYvWb0rMuEyTeXVHbl95z2
 xFt7sqdfO+4Tg0mAd7AhGbRUwqt7gP88zbihGTzZFGzZ4aLGFepBpYztLBs5/czJb0HTsRYNmvr
 LGktrBQPrUp4m4h3a7mkgnnuoBpJqeHeqQQXKu7MIjCc/xAweZjMAGd4W88XUovBaFXg3FMFuXD
 hOalXCVRSXrqo/yXSwtqxAEu9upsjh1kEhbUPIHEftqQSkRsdcLxqktrfApW+x/FuDnh8Uw2KDq
 ePv00Y7bu6DcAux/YyB/N2r787G5r5NFpqPtrysvR9r3wj03ALCEnhi0E=
X-Received: by 2002:a5d:5d13:0:b0:448:659b:abec with SMTP id
 ffacd0b85a97d-45e5c57d6b1mr6914913f8f.8.1778867210831; 
 Fri, 15 May 2026 10:46:50 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3ac86sm16349690f8f.14.2026.05.15.10.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:50 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:50 +0200
Message-ID: <20260515174650.530912-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507174031.4074853-1-bernd@kuhls.net>
References: <20260507174031.4074853-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867211; x=1779472011; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJDmp+h2WfNPImfCMVVBkBD6vC9pJXnxatBhV488DUg=;
 b=gagNN+La0UgW1waJevhMOABgHeab5zQ2YzjRU9/70ZPqsyP3wc4jQXXZNMcaz1kcjC
 jln1EWHOLiRzv+pufnbrK24EG1S/cheMso8VBt016Bc0goJiNDqNzEQ03onm451U0IDZ
 aIVQqukcSIWdLiDr0uWB1J17dmXXzBxUSwZ7Y7pfQpszS2WhULNfzeQXyJnMF6bZIdIR
 JHCxpiu+jrx6XiaLoehkq/lG2V/HFEF+pvWAeOA6zEVnrk+W76IB9kfg07OMPHAp/Dtc
 KXgw5oM7Y0dv69sBkQbyLW838o6Piz6nfM/pjle9ff7Qna+nnLqQl+JgrKkapbxqZJ+C
 ZbJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gagNN+La
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Version 0.4.9.7 fixes the following security bugs:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.7/ReleaseNotes
> 
> Fixes TROVE-2026-011, TROVE-2026-010, TROVE-2026-009, TROVE-2026-008,
> TROVE-2026-007, TROVE-2026-006:
> https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE
> 
> Version 0.4.9.8 fixes a bug introduced by the bump to 0.4.9.7:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.8/ReleaseNotes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index a70b9e9baf..f748afecfc 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
> -sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.8.tar.gz.sha256sum
> +sha256  ac1f394e2dd2ab0877d27d928fd0d9e86662fe3ca6afdffb9fd9b6f0f96d05de  tor-0.4.9.8.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index f11afcc449..a24708ddad 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.6
> +TOR_VERSION = 0.4.9.8
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
