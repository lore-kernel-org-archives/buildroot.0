Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1096C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49A58812BF;
	Fri, 31 Jul 2026 12:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a98T8natKrfx; Fri, 31 Jul 2026 12:05:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E350812DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499521;
	bh=YLzYlrIBYYN2bQ7MgVnLPvQM/46rHBtMUGZl5WBZhqU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U7HmpnmOzMuPiCu4A4/wmsET1c8cO4g8gP1gd2oM7wtmzUShf5pjfI0XhI1x7zM5w
	 w4kSYWEZfWRXJUX2oe4Ioijne+frn021vadcv5+tLgTwjH2hHPAdEnBJHS6uKMzogf
	 UF93ygtD1nTbeB4XrYxu8hwAs0NRqiiqYwqke5DTIr41O3HUBJt7ePghH9JmHMX4ig
	 BrG0aJ5DlF9CyU0wr4Z+XU/fS6+f/BSZ0WGc1kC6i7E92ae8Y9zgrMlvTuVBGO439m
	 Bk7+hgTqI+2rWuXkfPkMXTShk08H/GFR/0rS0mEKZiq0z0Y1f55Vj+sZQjSxvkqd9A
	 BRgonRXMFgGQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E350812DA;
	Fri, 31 Jul 2026 12:05:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 035F827B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE15840463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TG9WwKZnh_CW for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6549400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6549400DA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6549400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso930693f8f.3
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499515; x=1786104315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SWS3s03Dz+FVwkgSxbKhoOGxSOXz36ccLAomVtrIVCU=;
 b=TlFgGyx5hxyG0WAgg6Jfi4Pf8q0pmjQJYnV56Btqacdex50j01aDwJJl9oa3P549CT
 q/2ZgG2Xb6ZhFIqM3mAsKmqcnS5t4vVZZd8Hh8SfzY8UaDNN1/w2LOfhznITTtMBE4K4
 ABKexiyEdQTBfzijVBk5GxmGoHzfzshu9kA5PwJxcaP3W4Q2aePz6ObjHr+cs65FCLrA
 dn/PxlgkuT8sEbJXQVwUFVHUhenvicH86FTVYR83cVZjklUvKStAkuilAjsWyJXjJ9IJ
 V1dQB4ryEGcztqP39Hbb5WqqPuow9BEU0VQZITE4RSXxJs4wnYNGaUuCwX6IAXkPOWpJ
 KI3g==
X-Forwarded-Encrypted: i=1;
 AHgh+RohVUVBG4OLmJS1OErvz4MQTJLvlwT9OtSZZrnqBeNWaKFNDyer0xZZLN63MuYcDt4gPp45NLTp/Ok=@buildroot.org
X-Gm-Message-State: AOJu0Yw8RT/yISLiBT1d9t7UvWVRTceMQOj5CoJMq7LQxgbGPyEoRSnl
 h6yYlzMOrOaLYtgEQndGe2QFecTDc2s53TP2qYNR4DWKqYY/EoMIuxg1uMfSXLh9JSxhYrUVSWF
 nMvJJ
X-Gm-Gg: AR+sD11X7ISgA6qM6AKWcLvGwnU/UBYdmQqQcomuYTpomLFIsqZoZ5eZpyqGj4gPbSf
 4ptwgdJ5KE8oPaRbJ1E7wPzjHM2TBD1Qh0eyzgxPKDvG5u9xV60wawcPDBY6i1JL3ydr39PIcxF
 dTOpzA9tQ8fwfjT0pS6Ih8JDSXPAClbpLIri11+cLjCjzL8HGPn7EaYCB8VwhABbtHBxVReF4aF
 U4Z9gAnLx1OgB6QqJpIbwg6/UcfDazfGD0loi+mGjd/GD+xpTNQaIjbakCujfa4pcyATDR8k92H
 naFHq1zdW9h6G8eQkJNy0iWo7BnuXkt+AU+N2kgjab22c/KTjQ83yZkgUMYZxdL9XG+TtVAH6Wn
 pEOfE1u1cnUqxputrq7Ayc20svKJdDUUYdYcUEDCqb/SmnHPPXrWGT4l9iNw+/QeZIs7AY0L8BP
 5wVADZcXETmrEONO7cv7uqB775h67yH4o55j3crCMqGMYPyyAWjwjcwuRGEwCSvAAcfRofoN3im
 3D09zBhqt/iYx44/QY6xgciiQ==
X-Received: by 2002:a05:6000:29c2:b0:47f:6f28:4eb4 with SMTP id
 ffacd0b85a97d-47fd2b56035mr2664762f8f.53.1785499515296; 
 Fri, 31 Jul 2026 05:05:15 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd4068fb7sm4675769f8f.0.2026.07.31.05.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:15 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:14 +0200
Message-ID: <20260731120514.3440-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720170437.133823-2-fiona.klute@gmx.de>
References: <20260720170437.133823-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499515; x=1786104315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SWS3s03Dz+FVwkgSxbKhoOGxSOXz36ccLAomVtrIVCU=;
 b=ajEeSWwb8AwnpV8ddiyDxMlMJjqGSPLheSGTc11SLum2ocTJI5BjYHg8AA4ogUaFuB
 N2fXkXVij2Pzxs08Aa3oo1Y7SI6p7eU71DoG5SufTgGWK30RXCVlqUgH6lrPzq0u7fcx
 SwDcPXA/2l9y9EMv1LiKwYSpE1S/naDbOb+fUBE8ylVcfQwxPrajwDl0Kz2dRvRZVD6Y
 hboV5NOMjHNrdKVlRGD7axQZNiPJ3w+z92fhn3nfN/x13SnO4IRCBgaBPxudkaiIw4IV
 krh4y12ZFcvPKzpMn4iP0F/FOR2e4zsSIomeWkE88biM3nrJIuUmj4s30bYAv1IIZhhP
 BM3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ajEeSWwb
Subject: Re: [Buildroot] [PATCH 2/4] package/dbus-broker: clarify license
 information
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
> All these bundled subprojects explicitly give "Apache-2.0 OR
> LGPL-2.1-or-later" in their README.md files.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Note that the dbus-broker "main" branch has changed its license to
> GPL-3.0-or-later, DBUS_BROKER_LICENSE describes the packaged v37 (latest
> release).
> 
>  package/dbus-broker/dbus-broker.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
> index 7e029879f9..869eec462b 100644
> --- a/package/dbus-broker/dbus-broker.mk
> +++ b/package/dbus-broker/dbus-broker.mk
> @@ -10,7 +10,7 @@ DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS
>  
>  DBUS_BROKER_LICENSE = \
>  	Apache-2.0, \
> -	Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
> +	Apache-2.0 or LGPL-2.1+ (bundled subprojects c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
>  # For the third-party code, the licensing legal-info is inconsistent between
>  # the AUTHORS and README, so keep both
>  DBUS_BROKER_LICENSE_FILES = \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
