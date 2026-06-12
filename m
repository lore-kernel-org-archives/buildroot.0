Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D88CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 155B5612AC;
	Fri, 12 Jun 2026 11:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocScFAqvgsTO; Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B67D36133B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264292;
	bh=x74Ip4bE2MJMo8Z8oj7si+A1wt9le4eAnekoHBgRLkw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PsgKNZ8pqBgco593XD+EwBTZy8YOGMLGBs7QrrYt6Qmc8rnm34xTZ4U+HU9ZFEcjY
	 XAitAhpIR4yJ+lo7Cx98gh7cH6T/Ibo8dZmj88/8Zpx4MNaoSroHSZGRjRgtWxD7fh
	 ua/CTzA4nxM6nfiqi63FqgSIoNE7/PhCvJemzNW6IKWIcmDKEFS/e4uZZ+7sXXoBQY
	 6bgVFnei5A/NSVlGL0szdRp6XbbtykkBU7Gi72oJFQiFUsO+RXhNFJU0tVvztXwzVT
	 QqXlUUBFfBcoyciEtKsjjtyDrFYgYRuhDzpMJpit3DlNihweIuzE3XpL4uoaB0OcuZ
	 b1lI6vK1i62DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B67D36133B;
	Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EAE79237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7852612A3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkj12S5LBiX9 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72DC260AEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72DC260AEE
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72DC260AEE
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso7284245e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264279; x=1781869079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pWy/Yjg7xI1eX0HdlgtSr0iaZi3GnVI6GDwjsgnY1HY=;
 b=TWl60dsaFgW63WqSb5K6IZs0FZstByU5Da5gHrNeEzSxJmbuZ1PZYoRJU0AAXcOQYA
 nJzfV+vf2z5I2sLAeKkr/pvPYGBrtNsxRZ/d/CeNqSneDI/7biuNl33iOLYRmReszF8H
 3OUvuYN4H1BcquLZN6xqIF8+XdS0J2Z/iw0dN0U0hf4AqkUTpWuCF1B6ogcgvs2TFY9K
 HJSwsuelftACz30n0hA0Zdto+v6JW+Y5+w/OCbWjevO37HkpyV6VP9ijmEfiOuy4TQ4q
 scvAgcK7TiyOAA5oCeD7iN3LY8Gl8He3KYnDzHUKL5QPsXucE61X1WoJ4RCrbZvJCL+6
 qm3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DiSuoxAJjR9EFCoKHadFJnepxrQPdc2fc4Erq6F6v01DSPKEh5pNTWz3gr5rYhFezUirPACnkGas=@buildroot.org
X-Gm-Message-State: AOJu0YxNjul2VkWijB2P3u1p0DdTM2HOHwCSiZZb+Q5S79YVV69TSBzI
 wXpGR24Itn+WP1tXavSn/WRTTldrmKEwgIc2cgjyRQBhqBLdF5saO+6zVoYT7KzNPsUS7MRObsF
 2SoZ/
X-Gm-Gg: Acq92OGG7/HYmFBr5C5jv+YOs4lX4njLm+OEPOO1sOJfmHzYuxRi4Dogudc9iCWcPPC
 lc7Jf+HlUzrr7nF91SCjqkalhvnfCaRXQxZxOMfdfsZbgXZCUBD2v06F0Cf78BsNJIUYD5+KFrW
 1LgGNT8OaiAxNTLi9KfH01kDVjjXKg9icjdNJTAW5S8PHCCOiu4+gTdnNkkCf2fPOT8R1hFPIwv
 Ia6HEWEMxC0A00NgiHZ3K0XctGARcXwA5VbHSMKDcmPNSDVdFWbFnlAVkUKbEiCLgY3ID0vuNd8
 VZAU72npCRt6IICG07wFxUTd6jmAzSWeYZlWGZnCQdMuIqmJzGSTPeLcR5w/IJP3Mz6xF0hQwh5
 t6jNUkiUSlllofNidFIMxIT8XwtKqUuC8DLmN0qYZbPEOoEfJWxcMx9ZAhM3afO+J3Zwe4aOtQ/
 PGZ3RSX7F6U/Ndawc=
X-Received: by 2002:a7b:c310:0:b0:490:50eb:b777 with SMTP id
 5b1f17b1804b1-490ec4b9126mr18302205e9.5.1781264279411; 
 Fri, 12 Jun 2026 04:37:59 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2cf5542sm140237415e9.11.2026.06.12.04.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:59 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:58 +0200
Message-ID: <20260612113758.252583-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601085852.1792002-1-peter@korsgaard.com>
References: <20260601085852.1792002-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264279; x=1781869079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWy/Yjg7xI1eX0HdlgtSr0iaZi3GnVI6GDwjsgnY1HY=;
 b=PbsFuPWodB5q8ZCA+2w+ZNOx2RT4TWRoED70+wwsqxe3VMSb48BJIr5kmeIIEaCMWV
 8SK4km5s5FnpuBYiuqYMl4ly7Fq5RYCPJdRQZgstFxq3RoIpqSxmXNDQHjkOWK01m6lF
 SRQsyIpcRADveEYhwfOU0q+TKuXbNjUuwTJypQBODNiEJF/m+yO+KGuaw8A/v9LJ/W03
 m0q4XsxeIhlj3SQ6ksvALgwXQksPKr7WOxxcxmJFIXjne5BLgEqE724PMi/RtXel6tjc
 7BFyYhBkNTnRVv3mnZDWlLlvXFblNhmR7lSW6fqNELV+yXfVJ9lwsRqN6CdMEFWyk5Rv
 fu9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PbsFuPWo
Subject: Re: [Buildroot] [PATCH] package/zsh: correct download URL after
 5.9.1 release
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
> Fixes:
> https://autobuild.buildroot.net/results/9f0f50858b2f41c306f172bf011a34d2c0ad65dc/
> 
> >>> zsh 5.9 Downloading
> wget -nd -t 3 --no-check-certificate -O '/home/autobuild/autobuild/instance-42/output-1/build/.zsh-5.9.tar.xz.FpXHXy/output' 'http://www.zsh.org/pub/zsh-5.9.tar.xz'
> URL transformed to HTTPS due to an HSTS policy
> --2026-06-01 01:46:35--  https://www.zsh.org/pub/zsh-5.9.tar.xz
> Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
> Resolving www.zsh.org (www.zsh.org)... 94.142.241.90
> Connecting to www.zsh.org (www.zsh.org)|94.142.241.90|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2026-06-01 01:46:36 ERROR 404: Not Found.
> 
> zsh-5.9.1 was released on 2026-05-31 and 5.9.0 release tarball moved under
> old/, so update ZSH_SITE to match.
> 
> https://zsh.sourceforge.io/News/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/zsh/zsh.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
> index 2c464c33a8..06da8a6b89 100644
> --- a/package/zsh/zsh.mk
> +++ b/package/zsh/zsh.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ZSH_VERSION = 5.9
> -ZSH_SITE = http://www.zsh.org/pub
> +ZSH_SITE = http://www.zsh.org/pub/old
>  ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
>  ZSH_DEPENDENCIES = ncurses
>  ZSH_CONF_OPTS = --bindir=/bin
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
