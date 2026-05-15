Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747EFCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 520B541D27;
	Fri, 15 May 2026 17:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gutVTA-YyEeB; Fri, 15 May 2026 17:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F06941D29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867193;
	bh=O97adKZ67/nlhBFj73XbtaEI/+o6WdXjfFjVcgH5rGc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DY8SxCLKy78/HmEfZIp6PD7cecoX7IMnrKCnlVaE97rLdiVUJZjyiqwmZOFA17uXT
	 giAbeQgEIx86TwnOi+dLCXMssDExEXEtjyQevsGm9yHbdRrfh9rD9dqZTbz2ipHfps
	 2urUhvnpygxzZiVoMgMIuRr9c++x4GFTOvmZhWE/AO5Xu1DzQF/pGrcUaVDfIQ63Ek
	 gn3+qjFaJI+3vX/m9EkM9OyB7P2+bYhBqullbaVy5htQR4HKQuPJt8DbTSvJDN3IZT
	 uNbYycXt5pMdmIC/mxvmbnwRJwWqchf1+VLsewe23wyxQbrlhwWx2ZtQwPOJi+1tii
	 39w913cSPHPqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F06941D29;
	Fri, 15 May 2026 17:46:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C20623F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39B5440FA4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0d3-LzhdeKtJ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C6654027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C6654027F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C6654027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-44a74032ff8so31876f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867189; x=1779471989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kCuSTIPD5v7QoLQ7a+aX9MyYx6DD53o6wcwFZP5Q70w=;
 b=Xq6o2aHlpJ60scDLSHYnf84pf6IN5LZ8j3WIaasC8sczsddmZtZu6kDvz0aRBEx5Wt
 B/UdMNmH3n/ri6ZNg3KQWDRGqYq0vKyZ9y5n1ZI34DhUgp/2R4PEhy4cSKt0krwnSb5r
 ctPZ/mbDZ1vUJ3psCtjDwfL06kg9j8aYNLpVjyLcPgdv764o+wcHel6secw5aslsoKJz
 qlVdc2iSTuOI2OSPPf/FwY5ff0Htn9n80fC9HAjeSiXeTiYMlVK0k0kfrejek/ol/0dn
 P/3b9xDyrsb6elxNCPxbT0uPFaql8s6hfcIFJhWTo91gJJzj0szRG1a5NIE2AQpvm1jT
 CvJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MhmdAncPVUChw7Zf6u3wRvhMyr/ulxkb+hCg3fhzH2uT8StTUd0ZNAgDI/dUviWQ/s+/kY38COks=@buildroot.org
X-Gm-Message-State: AOJu0YzpfCQb6ps0CciuOZ6og4c0CXOGv/nSREpvnTTccdrFuH2H+wvm
 jab8qBDZ7TKui3cgNgopDRzmjAkYA11b5W+Rnif6TBs11qF5sQwwFVxaEnN88KzuoJY=
X-Gm-Gg: Acq92OG7X3mqfUi3I4lba/tcMFVBwgQtx0c7uO64s2OOOSg8zwUznqyH7kOoWoyPuau
 vHUNuuV5nGPbtWt73DIehDxqi5gR1HtRW/YmgHuWyN23m3u2dxzde/RqYI8Jr1Dkldy54gLQf74
 5eHv0PeF4mZTXkcrP6Tcy+eyB//IYJ1xs0kfCgt1wNW/xo5MvNwK+icflS9LweU0Z74sCVbVKYL
 hYrD0JcDcVZfGm1EfPpF7oEwqMsMHnELCqSIWw/uNNEQq0VdKlaN9hscV6an/2JVviTrerGZR73
 a8y/P/ED3jSPBKjFZJ5bu1XPnimC8zBrmPGvau9tU5pD0NeXzTlWH6zSAqFRq76zZ6UfDO/Rxjx
 e2fv6C3atiuGUF5sIX1VV8meC90qrVmckhjcL5+aRFaeKK3hgk8Oy+qPXpyKZMx5GO5tpOFVGjM
 SlBUJEeWZPqACwAqBzx4O9IWPmubi8j7y2yLn6acQZlt1L
X-Received: by 2002:a05:600c:8b18:b0:485:3b9e:caa7 with SMTP id
 5b1f17b1804b1-48fe6515983mr77122075e9.23.1778867189330; 
 Fri, 15 May 2026 10:46:29 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe661e1sm18929355e9.22.2026.05.15.10.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:29 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:28 +0200
Message-ID: <20260515174628.529790-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421190532.2722923-1-bernd@kuhls.net>
References: <20260421190532.2722923-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867189; x=1779471989; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCuSTIPD5v7QoLQ7a+aX9MyYx6DD53o6wcwFZP5Q70w=;
 b=F+yoNBnY89guQX72//GbTtEDYFpg3qtF7MRA+IA6ALQLNaxT4rP78IS5rFWsQCg1If
 pBp2E45c1KklQP/uii/LiG7gR4xQEuBNPZg/dsj2TT/w3iNTtnjTPtnL3X5OmVKbtQd1
 Qg+EgU2cvf8JEvv3h9efay+guG/nZ1FL59KuLneftXs5+mKMPb4OeiW9UrkXXmze0QbF
 yvbAlVKqk/kR9F+I1NeD6Zduz340AnejSqw1oldVg2cMewvwjATGhovCzph1rniX+8ww
 x2ivT7XJF6GhHP7T2kQyM/f8wwWOJtKpKiYU8NJbPU5oovsr1WPeIcb7pVwVyX74ETn/
 rRmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F+yoNBnY
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump version to 2.6.25
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
> http://www.haproxy.org/download/2.6/src/CHANGELOG
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
> index ce5dae17e7..5c644356a6 100644
> --- a/package/haproxy/haproxy.hash
> +++ b/package/haproxy/haproxy.hash
> @@ -1,5 +1,5 @@
> -# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.23.tar.gz.sha256
> -sha256  1281d57f25e98456a042c81f32801a106a293c1340b0c06debb2a87d6a7b3611  haproxy-2.6.23.tar.gz
> +# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.25.tar.gz.sha256
> +sha256  d861cacbe2ed51ae8ad5fa9ee5165b4e5e2bccaa5b9e04324711761d7d946be9  haproxy-2.6.25.tar.gz
>  # Locally computed:
>  sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 9504ec6b7a..a22c8b38ce 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  HAPROXY_VERSION_MAJOR = 2.6
> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).23
> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).25
>  HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
>  HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
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
