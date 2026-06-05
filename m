Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00F2CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A4460B16;
	Fri,  5 Jun 2026 12:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nj1xzXHVOMRI; Fri,  5 Jun 2026 12:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AE5360FBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663779;
	bh=ADA0lhkxpsMDwgrM20UpQ49mveYUmquCeanZPbYB2qs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kITwagwAcwx/wkw8v1Kn3Az3PCDyJo4/DgDiJPEn+wMGkUEKUhbnh4D7lDTP1HU5t
	 pzrAF+0/lJPID+Yu2tr/5mEvTl7QG93NSmvqVzeD+mV22oJzXtFhumJT/TLN5EHhaw
	 T6S5NzdIQ02M2rYVH8uFZzqXcw28sVC/rP+2RJDr12Q2zI124XTirucsrPpzGjX1Yw
	 yJqBZ+DG8fEMvt/9QUFzbX9ATlKnq3Cx1WxALXm4QUF/yHOFLl84t4OdWstXRM4oDs
	 sgsPoU/byA+G6SBe3BYDwKB11mxjPuHK34QsYDz5wRgx2f90IX/wOdYzTuX1wPORIC
	 ks1/XTN57L7kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE5360FBC;
	Fri,  5 Jun 2026 12:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 229E53B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08C598257D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAuIVs05mZSZ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D63CF82542
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63CF82542
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D63CF82542
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso14165775e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663772; x=1781268572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RnmNqjd7I6b+bXmQeJbU9f0s2owDOgbQC5h/puAwZXY=;
 b=F5JvaqvYsCXKoyoo7tn9KoZa01TktQv6mxKf332ptfQHYhveiB7WA9mSz36ODyDzph
 P8f7xlzXlrkA3A9Nq2b+jPppmbnfMJTTQba32ZEArAyrxGs+HBxwL/E96hk9yzv+GB08
 boY7EK8L7qF54F05VlTJd1a3xQdeFbKM+OoNRwI+vrhLO3wiIFEdkMR799YMwkPiXaXY
 V1qLiFSJnQKYhWVkBikAFX2YdXXMDZQWgIxNltwzw9Q20TEAVxNm52a1N+V1Gn5Ml2il
 MZtTV4ug/azjtHrmwoSj9dvv8UTknSXG1BJbwDycr1QP4ZlkuRuI0KEFiaT2sMzB8ewC
 Uk4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9rhxWMaMSDs6xlod1OuebU+W///PYLLEtNW4Sa+stUuit6TRqufzryvWxU5OjHLXMVQDAsTVlgnVc=@buildroot.org
X-Gm-Message-State: AOJu0YwyRwZRcZOQH7imceb53V/R19LHRSNVjZJYlWA6Dd7bfrgKHSMV
 ZzzinatpJrVnuo4iJul3vKCWm6vPzgTzqLK+pJ6A6RTuoIC0cxt7aggFG9+xORI/FkE=
X-Gm-Gg: Acq92OHJ2OZ21vv4SJGTTFTWD80KPjEqlqji6MytOGP7R5EwwwD7/HaxmKH0PzBBulZ
 0fY3B5Odpbo1NVUJqRZC1CE0RHYFLrMBG592MYTLJd2kl/ldcooVON+6B5k/Ld1d6JVLrebVrup
 AM+jcLNXkJL0QT212Ji0XCQPYKUg/uxZ54vKBeDJEVr4R4N+bQ0haGzfc144HkrAPnDg4ylkPUd
 qpsodmJKDC6pQD9HRMNLHSHesysHTeaGyWmVUR7fwnx+Au7KiXdJmqh69QbFZhA3TtOCFNmGphw
 M2oeyFw0/nj43hkXe2+6N9APg9017rc/Ehw4Ever+N1HwxxtWRw1r2hlW7a6pjg2DZyekYsFTI2
 g7H86IEYeIfnMPyk+vBTVNC7RRQvYV5iZF9p+1Sn/N4S0klKb86LUh+2d7pN8Nf8r0rprUeNnR1
 kCAe7XJHd1GVgXslk/NlFVqyTujw==
X-Received: by 2002:a05:600c:c0d3:b0:490:b0e0:3de2 with SMTP id
 5b1f17b1804b1-490c265c148mr38540555e9.33.1780663771881; 
 Fri, 05 Jun 2026 05:49:31 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3e59f5sm157323605e9.14.2026.06.05.05.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:31 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:31 +0200
Message-ID: <20260605124931.271473-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529204350.971888-1-peter@korsgaard.com>
References: <20260529204350.971888-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663772; x=1781268572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RnmNqjd7I6b+bXmQeJbU9f0s2owDOgbQC5h/puAwZXY=;
 b=caNAFt3tuFVcMZtOsvrRdXtnK1cokTnefbmimTkyTRxDgeuzURfDzq0asZF6NYpHxe
 5VHfWGtXfsfAVahNUMI2Na6/7Spk1s2vjZ8pew3Ks3GTlhCyhw/zEudz+FWIaKVbqVtY
 DTxTrwRozp1Q8ZDCwvzaRq98fmx8k+hkKP2rqcv1yGkW9yM4N7SnFZbHHcZqOVnjJYLW
 RD85PJcBDiZAWtS2nqZumMBTGkvAnxCYhtKxRHkWS868Tvt9JN8xqTrq29UsHc2UG1Dw
 XHFN4DYMGI5OCVuMcolaIBaF7vF2M3nGPGLU7wEylgY5GYsE2As8vHJ/g38Nu3FExXnq
 QqHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=caNAFt3t
Subject: Re: [Buildroot] [PATCH] package/podman: ignore CVE-2026-33414
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
> As stated in the advisory:
> 
> The affected code is only used on Windows, all other operating systems are
> not affected by this and can thus ignore the CVE patch.
> 
> https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59
> 
> So mark it as ignored.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.02.x. Thanks

> ---
>  package/podman/podman.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
> index 80107f3d9e..f601f7e6d7 100644
> --- a/package/podman/podman.mk
> +++ b/package/podman/podman.mk
> @@ -33,6 +33,10 @@ PODMAN_TAGS += libsubid
>  
>  PODMAN_CPE_ID_VERSION = $(subst v,,$(PODMAN_VERSION))
>  
> +# Windows only issue:
> +# https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59
> +PODMAN_IGNORE_CVES += CVE-2026-33414
> +
>  ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
>  PODMAN_DEPENDENCIES += btrfs-progs
>  define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS
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
