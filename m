Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D676EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D96C849FC;
	Fri, 13 Feb 2026 19:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEntrt2v8VCb; Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D0D849EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011680;
	bh=lP81aZBOZbKYjcUPwopOPU01YKRbeZEJqP2AwrdAfR0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AtZe9PWcSg+nNjn0hp0Jh20lkejimxWoHe9JfVcHkm5lxhtD5OHcgQMRwzLPS0qgk
	 4DzdxQtySL6P6bW+/30qwZcVxWmvujXPEJr9gV+vb5E85LVv4B283nDLq5AsWvl+UK
	 sOI6jLx8kw6TtaKcpRjKbOslQYcWTxtkn8ZA1XpRszDmeC4sgooSrBIT4hMYvYmM1X
	 P+GvKl2xh3sKqLTfyWLD3fJ7hVeIElxkokAjjrDumlRGazR4ctCjb+QUong2GmuJYp
	 qXBDFD4UC4r4lf2mTV/jwi+bkMxV2SRHaAAj777qWC7uxhGNOor38V0+muQ4mlj0zh
	 8zsXRcqAKHEVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D0D849EB;
	Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EDA5283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54587403B1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0efjGqd_HQL for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E44A40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E44A40055
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E44A40055
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so905363f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011672; x=1771616472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jyf/Qm/x2nKFquddM4BF8yenKmvf3vKgnme9VXbZTDw=;
 b=H4hU3p1pbXzkguH26TmjZGjXU1I+wChD5LXgioSWqeoTGklJSfSBMG6OTUMrWBBg/r
 g1VzqvBubdk+vrcil7oJk/5cxomA37DfKIpcVpqHISZ0RP3gZRqgM6CBHd+K6w/mrUCo
 h64vILYagHcL5tN29NNfncB47zaqCOhILsTO1g1glmRXwcu/kMAO1RmfL5tw/Kcd3jF+
 g1JN8DMAwPHZ9buyBW8tGuiNgsYayaU66dXunM/LqBDxV1lg+8GBpLg8be3pkcNYk4T7
 aoTsZnnxtdYpM7J0TN7IRGAbgCrWaDkaTn43Hc5L7SJ30sgAyfQqAi7pdhFeCR6GeOsf
 8Jvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiiX7dgvMx8t+MSWS8Vv6or+DLkgf2dTfqD6wmYf8IeBLKq4DgSaPG9ppw3J0Sl6SVRfczoshLQoQ=@buildroot.org
X-Gm-Message-State: AOJu0Yyl8Eb0JprVE/aokkwSfgSHuvdeiBgDuELqEMpI5iw+fjLia3JU
 U2yCG6QzCEYbSb1xLboKoJRtVABgSw5cruZ4Vghoi+taCy6yt9C1w9MDrNATe+X0sMk=
X-Gm-Gg: AZuq6aL5Zj9+zEBFIlNxi7Z7mFA5rblQ7O52UVrxQRwrjDbEPUZ7CwoMt9SBmfR0Hnn
 HBueZhxb8r2nS6Vl7r4hxuqh7WDVIDolkj9wx7BHtAulioY1qvSAO7WjwBEPyhtlLPJ4SVikptC
 733OndC5PIZPRwsyIUmemIzSrCnWR/+1QJ9HIuSrEfI/p5RGwYiruw034nRmTJY3ppxcEUB6gVp
 51C52ztDW2pWThwa6+lACnGL0sgo2jRNmf9+LWvV8qwWV+KmsoOMRbmqCbCMY9LJkg4n3lhcxoC
 7YJvujH1dQBxjkYgiyjgtx9o0hL7prM6sVV5W1ZetHasBL2eOp3XxFdO58sypZ1K8imq2VLEWc6
 1G4crORd8ZWCIG+lffFG4FlTCmqNm0IvbgBU/cg2neiTHVpKhoHyeKG45hbOxyf+ZP38UY2/WF6
 iEDZMDFZUd5vwlLmwmVvQfUKnSfw==
X-Received: by 2002:a05:6000:4305:b0:437:68d5:f167 with SMTP id
 ffacd0b85a97d-4379db9859fmr1197827f8f.44.1771011672483; 
 Fri, 13 Feb 2026 11:41:12 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a5e5sm7560070f8f.9.2026.02.13.11.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:12 -0800 (PST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 13 Feb 2026 20:40:30 +0100
Message-ID: <20260213194031.43982-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204092207.3009275-1-giulio.benetti@benettiengineering.com>
References: <20260204092207.3009275-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011672; x=1771616472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jyf/Qm/x2nKFquddM4BF8yenKmvf3vKgnme9VXbZTDw=;
 b=QA3SgpPrninghOnCidnbXz3PI+1OyPWFDvPmvj1xOuMYShMYxNu5RONTMjiKvM7wpK
 Jc0/3dRhzcet+4hmAN9tY/+hyIO9uy4pM9tRsokObPFn9R6f4dc8AUHpN7yCCQoo0521
 m93J9wswndgz9ANPvMmcFWXF5cE0TdLiK6+ggkFVmAvsjFPp8x+OZOggvRumdqov5BKw
 nRZ2YDARh3dL1eHY9yv8Hr48VGJUXkRlvO7pj/uMqj8pspW8pcYThzb22+0WeQyI8fRR
 t/sCrukEvT9kytQ8JZHTiIOx1IOgjCbdrfnwrH1M5CkcpJQDQLXeUmoGXXm1bBtYLDpO
 Po1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QA3SgpPr
Subject: Re: [Buildroot] [PATCH] package/bind: security bump version to
 9.18.44
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
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/changelog.html
> 
> Fixes CVE-2025-13878.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index d601e87b75..aaf3519ced 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.18.41/bind-9.18.41.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.18.44/bind-9.18.44.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d  bind-9.18.41.tar.xz
> +sha256  81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d  bind-9.18.44.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 8b336ab781..041541b037 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.18.41
> +BIND_VERSION = 9.18.44
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
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
