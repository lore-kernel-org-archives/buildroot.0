Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064B2F9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C94DF6F498;
	Tue, 14 Apr 2026 15:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmjKkhHkagcs; Tue, 14 Apr 2026 15:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA8CD6F49B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181576;
	bh=WA5ICXgDTjGKvWnRGErtPpybO4nlVeoa459gcz7cL6E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lyVp+3ItwNJNON7NjxOEBAx15BOYSsyWXvYInAXYeDatau+3lHA9jgQRxHQcZCcgb
	 3JkfyU8haI3UH0dTxPgOExlk99OR7HMDOlK69cMj9kn9ksyb8k4YvoQ2v1E7SsfA7E
	 o2BNQBzLhZIx1jco3wE40JhPhCTq2MLBsjto7tym18R94I22/q88tMrx6BxbmSPdDy
	 +KwmUjf69AdCJu+mpgCf9OlSL2H6pLO346MzGHEowZQItFuIQoq0RzxCCvSyedMxhj
	 XbwOGxTa+llvUfLBDI0MxqL9U41s5hsYkF+XzGBpOok9J9x1IORdptqAudyvIHwzaS
	 Ng8iSOLIbts5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA8CD6F49B;
	Tue, 14 Apr 2026 15:46:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C38A9237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9B0A40078
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-Ccu_fAfP0J for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:46:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A23A5400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A23A5400F6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A23A5400F6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4887fd35e60so40797585e9.2
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181569; x=1776786369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5yNHALsXAgMO+pPpxO+yhfVih561fvYyNXoYiXIlvGY=;
 b=IdMae7Jg2hQsADfYUmRVorlBB43rFEwcqZgzgpVPq7+EOmpG2TwwfArG6eiP6q3dLp
 IhbuJPYEyXvd1nhe9Qh9vaPTLYBfMg2jco7RpO5aUZ6vTMNMqLCCf9cVyKLQeNHBuVUW
 NshBbJOiA8O4yIAVxm3bquHW6MWC0YPGsiPgDVG7h9DfaYTiBv2T7pUl+qt0igqsKJvV
 /s6uCZU7SScKB3bWLIPBmg9K0Hufg07NMoL4bnved8N+nslfL/XfZnMk9PAewa4MnvDy
 3Y1/jBEDciRZMU4u+Kl9AB2vX08F+vFA8M+BPhcH6tDdPRzMkhSpb/jWJJwtPHiMSXgW
 8qaQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9PR+TTryEMcTpJd690qR3PvQXwdR5fRVrABA7xlLIAPDzNE6t6VYC7s3DDbR+AzLeTDMRNFuKaNjQ=@buildroot.org
X-Gm-Message-State: AOJu0YymL8P8BQB0ei5KE2y9IdJ7lxA3xapdOoQ9ckQ2qex3nhBCa4Wd
 viPt75gr+nJ0YhB2ITgCj6b5lyYuV2V+Al9BA1u9ACoxiAK+yEqEsscTrm6bCOciEUk=
X-Gm-Gg: AeBDiesdWc5rmAw8p+DVYp7U+zxtEP7egOLPNRiHItsubcA+B13o0f7MPbo6f3cZn+m
 Pe3tdw7eV5j9zJ/FjnOpiqgTNBoDqWvKrazuD4rHoYNKpRoMt7Gf9pX2iwcDOhVRFdQZxVsNkpz
 bo7gky71udbZ1GT3Huf5GmnXzEFlO2j2HUoxHjuwbc3X7ra3gC8+HAtlJ4gvNK2aOFQeOIqGVjc
 94czMF9g0XN0A5PYlyXqg3kVGO1x+7XHZ9XiJm7kWimh2BtKJJgVNRKS/6QMg9rpH83dAUOXGkt
 qafrVscFpsyk8CLE7nJOi5hNDGgmrocgl1ZQ59Lqcz0EIL42zGfg920w61Ycx8G2AcYu+t+dgl7
 ZXTZbYUyvUnDBhIn1YE+7PcZdiJLWge1/zROr5N0XmrvoQta0YKnwooaStjizECyIx5N0QAp4Pz
 PWd8RiZqxCrVHc0H7E
X-Received: by 2002:a05:600c:19d1:b0:488:c282:e77e with SMTP id
 5b1f17b1804b1-488d688608emr228636545e9.28.1776181568677; 
 Tue, 14 Apr 2026 08:46:08 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5061fsm44240408f8f.30.2026.04.14.08.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:46:08 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:46:07 +0200
Message-ID: <20260414154607.335958-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405073025.13295-1-bernd@kuhls.net>
References: <20260405073025.13295-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181569; x=1776786369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yNHALsXAgMO+pPpxO+yhfVih561fvYyNXoYiXIlvGY=;
 b=QNxcZFQlJdsEobRkYdFR5myS3LMpinMABPTQYMiNMXEF1ayL3L7dSiz+oEh6JE3wg1
 +N5QhkcgQVJeu+/72TerQRPDuCzTVnfMln125tU3PsNj+GsoDhm96b5KkA4wpY4vdgTe
 vnwXVuUTrJ4cy25X54clXi3cvWHC7bhd+P0YVZum+qvIKF8qo+w/ZXf71icWLulEfM/Q
 eNGWPtefqid/kEHzJwkaK3HMYANE416Qx7jCwsSlXUm1H5HQ0wojrUeSebngw0Lsof86
 0rP0C5tqOoIMEAJxKqIASwmWeavGxqiFsQX8n1MUSfPYAab/0Dzq+ne2LsRkemrmFtMm
 1oBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QNxcZFQl
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: remove
 redundant pcre dependency
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
> Buildroot commit 736c4c1655d93652a9a7e79235bbe726b3d46176 added the
> package with two identical code blocks dealing with the dependency to
> pcre:
> 
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/freeradius-server/freeradius-server.mk#L161
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/freeradius-server/freeradius-server.mk#L218
> 
> Remove one of these code blocks.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/freeradius-server/freeradius-server.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
> index 946750f1a5..9b5b3d13ea 100644
> --- a/package/freeradius-server/freeradius-server.mk
> +++ b/package/freeradius-server/freeradius-server.mk
> @@ -215,13 +215,6 @@ FREERADIUS_SERVER_CONF_OPTS += \
>  	--without-rlm_eap_pwd
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PCRE),y)
> -FREERADIUS_SERVER_CONF_OPTS += --with-pcre
> -FREERADIUS_SERVER_DEPENDENCIES += pcre
> -else
> -FREERADIUS_SERVER_CONF_OPTS += --without-pcre
> -endif
> -
>  ifeq ($(BR2_PACKAGE_RUBY),y)
>  FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ruby
>  FREERADIUS_SERVER_DEPENDENCIES += ruby
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
