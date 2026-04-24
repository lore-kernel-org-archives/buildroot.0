Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95387FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8C44296C;
	Fri, 24 Apr 2026 16:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KXkBX3TDHKb; Fri, 24 Apr 2026 16:27:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4BC42967
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048028;
	bh=ep/06er+/hYmTb9esORQAxu4EFq+5jnN0lf/hBxlXag=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q6XRQ14KYHWcy7cdXpONc0T6R7ETdT6rPDY5pYA+Ps+zTa//PXzYKBg+XopmELPG2
	 iIJgs4mLNw3tLOQylo/BpPdqRSgC/i9WRzbRXtwVwf3SQZrk4GCEkvRxUMjrCxfhtM
	 53s4q5gtoWlhMcRHCTBh9Jn1iu9YfyIjEebnbJIQBTU5wrqSKCNJp76553U2PWvN89
	 Iqs26G1roMy0zLj7pOn9w1uSuxtODixzp/YIHapbH262QKeRlqpwsOrg+xGghd+djl
	 hO0mLWU9r1tKxKuJBmTbmetcYAHM5GGPASZErW4aNgzoN7KAgs5CJuA1KFsVOXjuFH
	 8AsQkB6U/v+mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C4BC42967;
	Fri, 24 Apr 2026 16:27:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79E78206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B3A5423CF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9E0ex36aWnUg for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AC02423E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AC02423E3
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AC02423E3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48374014a77so104798315e9.3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048022; x=1777652822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0UVb+mdTkwnBS6Oi+sVOy1WYVA0iyLUIPbpryoEvMOY=;
 b=HFFL2pA7Bqmq27QGpX7D/jqd9jZyj2uatMq7z7/8a7b6PQqo0WJfxl3DBql9iAIJbz
 EwrBRfuoFvi0ul5d9++oXdcP/Nhfj7qzHvG8yA0ytoQy6KmoR48uBCJTYcFfavbo8TIV
 85SH8gHeDCBalmeAAT3Ckcn5PD2yGpgrfbS8R1i7rR3UmJv+qfsPKKxwCUcA7m9+b9cI
 my9UpW0qm9CN950qLdn6TguMMaalA0g6uckFlo1tAK7p1ovtpy95I7IQJZS972aniYGS
 w9zSIxuv4uOUcKQLfKCiOeMRigJNkZ4u/lIpipaOnTXKGbD+s1/u5si3hURFz0FUpshx
 ORIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+wLkAXxlq/VMdVxCziaOQRmCeUFIlc/LfcCMveCXnXUmumkmDrbcucvZDAFOgfl2tGBvzyAgU3e7A=@buildroot.org
X-Gm-Message-State: AOJu0Yzsr2cByJJDneav49cHfjU0lqmyayYprLMiKyLSPxgentedTU+b
 W6J6UkNzRmCUyC/wPRuyhJKKZSG6U4j1+L8PFNnUzg2OVxsZEvZAYj/T3jg8RlRCWaE=
X-Gm-Gg: AeBDietsBME+CKuKCBHCtzSsI7cMbeX1eGuCEUMNqzaK0kDFVnZ+ycsGzNxTnYB/sk4
 Y5TDy+cpUnHOTkkTTEkcYCd9SkMpROVvy8m5PwsyDMt3zQOIxqEWdajzEhG6FbGhNGrOSUGGuZm
 x9WiDAxrahHL0gxBRmQxDramTw7IUbCTT+/V3uDSLQY36IDOdswTeqbJg4FlmbA6AgYJp9/KcDi
 DLnnSeDaGGbgt+sT/wPqunogZldwGk7lXUEFDxq+JUMsfIssTP5Y0KUl3GL7WT3oF3yTVNzI9rf
 Cxr9hzG0luvWie3O1B31CkV1NXbL96Y/aRMJjdJXUJcaVuwfPEw6s4mD0so9VGTRRwVhIH/Uuf1
 ZK8xDqagQD9YSXrn1b9+ZdjAomjncEl2WKf4HJkvRke36Y6IfL1T6y6Kp7WdEMT9Ale1TWo+1YJ
 qzdwsHJFoVvy6TXnWh+Fo9wjczrw==
X-Received: by 2002:a05:600c:4714:b0:48a:5574:3a5b with SMTP id
 5b1f17b1804b1-48a55743d05mr242333875e9.27.1777048022253; 
 Fri, 24 Apr 2026 09:27:02 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc07bbsm64573297f8f.11.2026.04.24.09.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:01 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:01 +0200
Message-ID: <20260424162701.161381-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260414160708.2041081-2-bernd@kuhls.net>
References: <20260414160708.2041081-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048022; x=1777652822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0UVb+mdTkwnBS6Oi+sVOy1WYVA0iyLUIPbpryoEvMOY=;
 b=L7mtxethz9AULcVAMRr+b9gRfkw3tD/8lUJJFw293DdvrttUnizmo73cohyevhCBXW
 qm65FQyStoTcLFt+KSlPSnJL7HL40pLolwnVxHn1M1Wms71MkktBp7ZiQUGt3sPF63aS
 +AgLmJPHNAZ5cZlwNw48Zuu3sraO/QBpw5v2YP9odfF79HBHjPBMkxjbF07r981DvHLj
 GYVQgCPJlhSPqJ2T1D5HB10hgCBOSFKIStI+wjkXVBEZ8SJvIXWBD//Q/MthMnfU/2sx
 IDiJqTMw19UulaQJF2tOBgb+zXqpR8D8p0+PVd2+Err+2SJkZEJ9SHQLvwZMe1kq7WLq
 Y+0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L7mtxeth
Subject: Re: [Buildroot] [PATCH 2/5] package/strongswan: security bump
 version to 6.0.5
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
> https://github.com/strongswan/strongswan/releases/tag/6.0.5
> 
> Switched _SITE to https.
> 
> Fixes CVE-2026-25075.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/strongswan/strongswan.hash | 6 +++---
>  package/strongswan/strongswan.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
> index 7a6939b979..44eadbaecf 100644
> --- a/package/strongswan/strongswan.hash
> +++ b/package/strongswan/strongswan.hash
> @@ -1,7 +1,7 @@
> -# From http://download.strongswan.org/strongswan-6.0.4.tar.bz2.md5
> -md5  f6b78a99e95179b6a65df218d75da7ca  strongswan-6.0.4.tar.bz2
> +# From https://download.strongswan.org/strongswan-6.0.5.tar.bz2.md5
> +md5  7049111627010dc02293970c82e43d28  strongswan-6.0.5.tar.bz2
>  # Calculated based on the hash above
> -sha256  79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec  strongswan-6.0.4.tar.bz2
> +sha256  437460893655d6cfbc2def79d2da548cb5175b865520c507201ab2ec2e7895d9  strongswan-6.0.5.tar.bz2
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index bb5fd2d217..2e20b244ad 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -STRONGSWAN_VERSION = 6.0.4
> +STRONGSWAN_VERSION = 6.0.5
>  STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
> -STRONGSWAN_SITE = http://download.strongswan.org
> +STRONGSWAN_SITE = https://download.strongswan.org
>  STRONGSWAN_LICENSE = GPL-2.0+
>  STRONGSWAN_LICENSE_FILES = COPYING LICENSE
>  STRONGSWAN_CPE_ID_VENDOR = strongswan
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
