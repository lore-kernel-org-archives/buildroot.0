Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB0AFCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1481613DD;
	Fri,  6 Mar 2026 19:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEEDWEFwOdjs; Fri,  6 Mar 2026 19:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B903C61417
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826839;
	bh=b24QkCQZ0h7T055aZvXHaRjj7m7ajWvdNjDZes8jb1E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DRTNCFj9+1z+W/Fn1LJkjTmRW7Q7+LelZr63dDhCur5V09FWM7j+u6rv3FfAdz4UX
	 oICZ8to5EfY2+f02glXPoq9BbzokFA7XNmfN/bT4HAeyy5/xy3QhsEULz1w8cWhPRA
	 +RUk11RiaG1SsVCtnI+aDdzU3jLsoCLHjkBvkRA2/D/tD9loP7OUM/Rc5uSXDOYokF
	 4bIvU60THbWe39XJ8FeX6msAFebohaZr0pCSRAoNH6TQzgoaYoo60soGH9WpLVLPe0
	 Ht9b+xmaUx49hOGRrbXIIxwOQjHirJPz3s68G1NAGteOc8Dm4ROGeE8kEFP7gaIjd1
	 rEDBUEoEYelBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B903C61417;
	Fri,  6 Mar 2026 19:53:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78B8F169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 681E74217E
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWWR4W0wR9AA for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21F444218D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F444218D
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21F444218D
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439b8a3f2bcso4674417f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826829; x=1773431629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=prDkQUKz8zkFXQ4xNYVigfP0pcuidVKruUG3fNlcNC4=;
 b=fAIgxZM1YdHto2b5WuH9f68VlJ4MGF3Tss4FILufDGtzUisnOAxiRpnbpXUy9pqIqd
 aYp+fFudfpDZOqGRr16EzWI7+4DOauFpL42WuTqjqae85B/uyrxKo382jOnE3X/BZhZY
 AesWm+zjeHF5E+jnHg/vCJv3prU5NdOXD4rrlvq24aYACUFrRQ4wt9YNCXTtypd3FaIj
 TMHK82wVc2K8rj+mc8U01xAhq2R/TFXhh33HvermF0uWxd/xwPfj0j1CIH/FH8sZPZ/r
 q1N6sgR18NufBfihXVc6S/T6yvmihTR2YcIafxh8ayMW2P/0BFjqkk/sabsEMVk31xGo
 MsBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzavkGXcj49WmAbVu57CmVaBGWEbjS5UGmPs6LuHRb9FYEFVo7xm2QM1J4tlvSkt8C7L6mJOo+1Mw=@buildroot.org
X-Gm-Message-State: AOJu0YzrFpHFAvzjPbp3BGaaf5O3B5LuXcydqybm7mDZGyzoZyrjxZaF
 609/0miyKAZrbekYvge5cM9uGYukjOKjXH63jdUZrIC0b+oQ7qkHXfN0XrF6uMQk/ejrQ6iaETj
 +8aat
X-Gm-Gg: ATEYQzxY+AQtrcxIiWGyMK0OVpJDm9EuiMtyV0RsixVtXfOOZk9cq35PZXEe5p+DDOo
 s5If+vbQByL2IxYuYnn8tEATX6QKjg7ga9bwAVJ+jciyX6vdmzz7/4FZKolZe8x69n/dKyG1NuD
 J0l6cPEt1MeEHqWKeO4UwVp96biiPMl5az0nhMHn3ZjWQMO9apX6qcZv44zCw+7OGnjwe/yCjVI
 WKI6m9e14ZaVeaJ67292Kjhq7d/ybFq0xv3CKGA/0tZIzhVcNSMEz9R7WpKOSHgVxb/QsBhhdus
 8KLyVzSSgHpFgcowUv5o9meWDVHq2fOPBUON9Ibdd1Wz0y3gCvATK9eNz4Nu7NCsDClU+F28pfJ
 kp43wqB5lTmoRiJ4wt7bxQ52YXaOF11w8So8mEI0DCA9E6KxJwWSqYwKP3ICYLZZwPhx6YlpZXz
 31twXG4AEXwUOMMUI=
X-Received: by 2002:a05:6000:4011:b0:439:c279:32ee with SMTP id
 ffacd0b85a97d-439da8852d4mr5279290f8f.33.1772826829095; 
 Fri, 06 Mar 2026 11:53:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae36785sm6340179f8f.27.2026.03.06.11.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:48 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:48 +0100
Message-ID: <20260306195348.8995-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260301103722.3526268-1-bernd@kuhls.net>
References: <20260301103722.3526268-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826829; x=1773431629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prDkQUKz8zkFXQ4xNYVigfP0pcuidVKruUG3fNlcNC4=;
 b=Q80sZdGsgD9c6D8NxEngYPlnztRFYHODMpAE2gqrjfENgrGRA19VZurlNPvdNFJ8iA
 kOXxU2To3rQbIBe2y/aXULKw2AT3xk+0mYRN3Quirm9xknoTzXx2zad/xAXmUiyuacG2
 VQG8kwtvAiru4XHmWjE+f9jemjuS6QSZ+fsOpSv72UKls4fia90mQAED5TnMb1G94B43
 Iix8XSPU+QYT3cGu77ZC48l2Y6SvxQ33lHPis+xSH3cXNgpM0p4NNpsWfm+qra3Eapz5
 Q37xYsRBd3Ljbca7qV9/IKHSUGcvtDLAFBAzo2ClQ2mla047yzu+meHdgE+FC194QBN+
 FBHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q80sZdGs
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.6
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
> Release notes of this bugfix release:
> https://www.samba.org/samba/history/samba-4.23.6.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index cc07b2527b..84ada82bfd 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.23.5.tar.asc
> -sha256  593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f  samba-4.23.5.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.23.6.tar.asc
> +sha256  e3dabd8b5e42dc97669fa0faef032510a94e496b58f7067082e5036d88f0e702  samba-4.23.6.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 5d9eacef90..2631f2dcad 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.23.5
> +SAMBA4_VERSION = 4.23.6
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
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
