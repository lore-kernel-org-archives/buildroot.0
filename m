Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE6ACD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3960B61162;
	Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yenuvIrOP_yo; Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5606F61164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663854;
	bh=qG6W4p+jfVW2ZHBJngQogCeuJXB6XGziBrwVac1us5M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jhw3k6+PPnIn/AC/NqgJu2cbsgt3YeRwD63+oCw2QWAO215o0jfDqUdCqdMMZD/gj
	 tpiXhu2dRweGjGujr7BBtN6JgdIyFwZ2NTDpP/oBfT1Fvktc9e78rwjnjarXEf7/NA
	 jAiciEnqcOiYj31qlr9dffL1tB7HsZkrQDBoKmOmC67+H5J6NbpSHdtPtfTRwMT4AQ
	 tb7ptfMqDQtzjiaZYjRnMjbW7aU3G1l7IoTnJ5iltFEAN2i3jJxC9lB5M2jc4VH3ik
	 TjU6tL8AQyWYzdsllukHo/Z/TEbKHzttGrrD62/Zo3Wzf6yObVH6edJvldlp0xbGFV
	 oGFeRknmZAw/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5606F61164;
	Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61CD0F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 481B182DDE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZ5_LyYltClS for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1EAF482D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EAF482D7C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EAF482D7C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490b915ded5so15324555e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663847; x=1781268647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R8LNi3VKHoiY5LfcD2RMGil+ccUuoxhl9raP+MqHL6w=;
 b=eGJhA1iCQQQ32VuBB98g0A8ViIF7nZiBqcjJnuFLcUgy7vzoeOJfy2Vk9tNMCfxvEa
 0AMLgMFcrR9/ELNCytE421HwDQU9RQ4HgGQJbeMYBYR1cVRsXyMeZc/fdh4PyERU+Jcc
 yuZyWF4I6EMnasPOZ7B7E7SrwOvo6jxg+caQ916SXRg9uuQkMZPP1fQO0GG9ueWiIwyN
 ALCCRkr4jfD2veYy4EK7Trkl/8d0z0JJYgv0uNIPjdSr+p1HCVDD/SRlAZrybdfmkfgp
 eK9h6nPmd11kjna8kxoVWmWHfB+qJDB1vZAL8dEY7zZMKZ2yFeoDbcmUPvBCN+uKyDeO
 aHzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8FtFWDryWIjXAOCyG2xDXcFSRXVQNeT7iZeA+8YA6nlU+RKRh5wYCSsaZUY+vFSs4wJqVXno+Y7Lw=@buildroot.org
X-Gm-Message-State: AOJu0YwU6RCadMPsJtSSzphRcKffEzKY+fhtmlzh9azASatuT6fIcvEL
 EcySL3YE/yzkFIAbnKcdiJJc7HfqKq+PA1MkACf3mBD13sH2MbFjgVJd8NdXDVoyBDEhp546VLb
 1onq7
X-Gm-Gg: Acq92OEVtFsP4AEJZc/42H1r26yGvG2Im3ydQLdJnHy+Ry3iCsdjnpQrhQel6/5FaO+
 pll0vlWQSWJfB3lfbhGICfCOR3+lxO+5swJ2QVTXxR6sDswdvIfy0V/vntodw54aSA1OHi1hB+7
 eDVU8VdFVsvneddUinGN9kc453m8WQeCPiFY2ZWviN6wZ0PzzEU5fdnMmfvSv+/suJUEfv03UQ2
 6X+BGmV7tHH5zwm9HwMIAsNBS/ADFFt0A84FoAd3RYRXDZQvG5Uj6a5XYRQkrG+21d2eVfSQUyJ
 PlR6kIuvhM573KQopxYFCbPicb7cc2xcRz0nB5cfLCneYUDVQcg9qsO0K7YYUzxh8AJe8kc2aIf
 smRfpyQsaeyoRgLg8Rlmx9d3nPm/6tuvhPlftVvfC5SS7f56Qj/kViiG4BSGgh0838Mp3MM+fa0
 jePcQ9jSvxBv49fcXiYyYvz3+OdQ==
X-Received: by 2002:a05:600c:34c7:b0:490:bb45:79ee with SMTP id
 5b1f17b1804b1-490c2525299mr57841765e9.0.1780663846833; 
 Fri, 05 Jun 2026 05:50:46 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3918d7sm141180245e9.2.2026.06.05.05.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:46 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:45 +0200
Message-ID: <20260605125045.274385-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527210646.3568047-1-bernd@kuhls.net>
References: <20260527210646.3568047-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663847; x=1781268647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8LNi3VKHoiY5LfcD2RMGil+ccUuoxhl9raP+MqHL6w=;
 b=eLYPOyH2Ve+Q2Nny6+/8TdCC65+pFmpWQDo5qg0EMqVfSiMf0vGFs8M0Ol9UlWsouF
 jzW5RuoLCBc8GWnCVOx+zESYbIX6o5CIk79UQ0KlooRBb7qF1iVdim3by2yxqF3bcIq/
 8Y5L5c47N2sHVQUT9ozVgic3oT+0l/aPsu47JXl4j3eIeWdQe02rJAcv5uUxwVlPnVcg
 G243yz7K9HhZaHrYuv72GGKe1pkPiT5HyfTXVtI4B1BnLn1c/QhsQU+tDtu2jPK0aMT0
 2PDOZLFbAzG3iHw7IFVi0ZUU+0Ebq8NKVSSzoKNT4wBe9P2zHN7229VRQfkMY7MXibj+
 Ac5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eLYPOyH2
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libmicrohttpd: needs
 host-pkgconf
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
> Buildroot commit 712121326f84e2508ab161053c2b04e45511c79f bumped the
> package to 1.0.5 which includes upstream commit
> https://github.com/Karlson2k/libmicrohttpd/commit/a1f937422658d3c6d53853c587bc025274afac4d
> that breaks the build if pkgconf was not found:
> https://github.com/Karlson2k/libmicrohttpd/blame/master/m4/pkg.m4#L84
> 
> Fixes:
> https://autobuild.buildroot.net/results/e3e/e3e25753c670b5d86d042d850582e2e1e0eedca5/
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14386351826
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> v2: added host-pkgconf as mandatory dependency (Romain)
>     Gitlab pipeline passed:
>     https://gitlab.com/bkuhls/buildroot/-/pipelines/2557122497
> 
>  package/libmicrohttpd/libmicrohttpd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index 7a243b42cf..a3b24d363c 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -9,6 +9,7 @@ LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
>  LIBMICROHTTPD_LICENSE_FILES = COPYING
>  LIBMICROHTTPD_CPE_ID_VENDOR = gnu
>  LIBMICROHTTPD_INSTALL_STAGING = YES
> +LIBMICROHTTPD_DEPENDENCIES = host-pkgconf
>  LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
>  LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
>  
> @@ -16,7 +17,7 @@ LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
>  
>  ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
>  LIBMICROHTTPD_LICENSE = LGPL-2.1+
> -LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls
> +LIBMICROHTTPD_DEPENDENCIES += gnutls
>  LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr
>  else
>  LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
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
