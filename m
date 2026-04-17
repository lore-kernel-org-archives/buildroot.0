Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3779FF436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECC0D816FC;
	Fri, 17 Apr 2026 15:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlYevUsFglZJ; Fri, 17 Apr 2026 15:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 820BE817AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439509;
	bh=t+OraGRdzpINCNL3bzo0kmgTYLdMf8/lVsa+eJ4YMLk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g52+O7pJFGmTp0t/WUYm8pSMtV8xt8f59PnDEu8L/XvshnSLwIRoyRSP22+COUFOq
	 0UYapTyG4DFJfFyj1awQUgu/i3Jk1HqyASzEi2wjbW+6ZHTyv1FdsXO4QNNF83LoXB
	 ZAl3YtfERs4qZwkPe7WKI1PlG689svDKIS5b5MHLa71npV79+p9CORm5n9c4q4AW8S
	 mQlAIVuSGdXUudMqkHpsPa2pP1xvJILJbHGs4BMwbv85CclO43CNtae/cUWoqv0dHm
	 5BCPvbNTj4LPev/qFMK/QhJDCcP1DQEMyI0n/WjJobylXl0l5Fj3GmdzcVupHrCntg
	 0k8RVOtdHgA/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 820BE817AA;
	Fri, 17 Apr 2026 15:25:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1E8D259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C38EE60E62
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1XmSr6IpLS2 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3415A60E71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3415A60E71
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3415A60E71
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso9982375e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439501; x=1777044301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K+McY2yvltDI7BBH7XK7dDZjBvNYRwST82FT//Qwhrc=;
 b=n7DfI5Hl402fsV89tkfBvbfnIHNI2IG1PCHhVBbqnTNZ94XyHbn4HRZ3L8dyOc4OU+
 rtsPbGREOkx3pTLxsbaFqvr8yYPy3fsJi4frxjnYgrMn39RxvKmfcg8Jw6F/9XDBLwV8
 0rUhhWkYfHYFHgmJzRvJPGfiMqVwOqHkrac2UyFhtIvaeKcyWMVm8pKRlXK4wf0iul92
 18g5CTDcriCOiGU7B6LvHE/x0mHgOgJYzr1KqygwA/vEbXASHIIz9aRcfrlVtNdbftGl
 UihaCNrfRupNAhhbB6QEgiJSUwhZSWT75C7WweyB0vNbz/+Eyy3oAQqWI1u+HXlCqIUg
 V+0A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9iIFUuedHX8bxoY4sSRwRjEAI39UI5ldf558L+88Te3QLgFXceBlmR3EcNOuLuwQho4AB3E/XvXJk=@buildroot.org
X-Gm-Message-State: AOJu0YzJzofc3nooOr1yAIK4jdvNA9bO1OmJy9RsykxmheWb121ckajh
 //7oaB4bzRL+7mvJ93zD569Vvx82C7tjw5wTreoM6EgHoWwcGNNAwnMWDChz+ACcDL4=
X-Gm-Gg: AeBDies/jRo14fyEDUMDZisQLQH1GfuNUxj2rCVrm0i0umTCqaMpNgtksp8JO8+fyfD
 cMO9zny/7lCpIN0wW2VfmZRp/hoc7JY+S+o0TGPbPxWA+NvFRx1DC/N5omOoq38jYOF6JnhVs7f
 L8o9+SbtJY1wmZHf390h5AVYxhWqAiiGj8kDnaw0sLGYJqNsU7TsKRx6vCHc6S+grMoqsa784pa
 DgklUGv8ItMpnqYowBQojiKgF+NK4n+LQyGvUpPDTsO2APmAaGD6Spq6Xphjm2yqQFtLvDUlOxR
 WAYfGKXM6xg+pl/PI1SeMxV40BLIrTwLBVOp4pMEUc18HLkX2/NRYNQtqEixVpNtPPezJN1vHnU
 naEtHKw2ob3OCUAAGHtotezHFVZ4rGfajETwQh+xbX5Kx4rzu526bvv/pgfsVACU8Kk12Mjgq4S
 RtgzOEDigCjrP7bObRL16fv2Z5Zyk=
X-Received: by 2002:a05:600c:c085:b0:488:acbc:b2e with SMTP id
 5b1f17b1804b1-488fb765b04mr36763125e9.17.1776439501075; 
 Fri, 17 Apr 2026 08:25:01 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1393d3sm80420095e9.11.2026.04.17.08.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:00 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:00 +0200
Message-ID: <20260417152500.313680-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410052000.26329-1-bernd@kuhls.net>
References: <20260410052000.26329-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439501; x=1777044301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+McY2yvltDI7BBH7XK7dDZjBvNYRwST82FT//Qwhrc=;
 b=CnLmajkmBcS6BczFyp/8xvkc36EysFMOQbHirdPn47lMb/PnaOunNEIZeGQf/zOuY6
 ZjzOhXjkWqeEQ4/IPqH9ebfvIq9/qLzRkeHexCmfJ9SBr6WJcvRqkrffsc8dp8lANCy5
 BmZ4DppAGn1aK9c5RhU653mbJfTnDD5o79zwk0qddQAwehKVlS9+uPjmVnxU0KzWXfpG
 a6gVe7ZEiOM4JM6Tbij4nrSVw7d78rmgK+pabx7ocXHnRO7CaGt0MEUpiT2VmPzAerSj
 dVfFzwbKNIeH9aMJSg2rAQvzkrGIx2F4qK5C/AqkwjIwKvBE0iczMIrSjCUzhKVE6p40
 a9mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CnLmajkm
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.5.5
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
> https://www.php.net/ChangeLog-8.php#8.5.5
> https://news-web.php.net/php.announce/488
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 7fdb76b01a..d400f8e0bb 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  c1569f1f543f6b025c583cdc0e730e5c5833c603618613f1aa8e75d1524b8c91  php-8.5.4.tar.xz
> +sha256  95bec382f4bd00570a8ef52a58ec04d8d9b9a90494781f1c106d1b274a3902f2  php-8.5.5.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 220fb8c5c0..9976884001 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.5.4
> +PHP_VERSION = 8.5.5
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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
