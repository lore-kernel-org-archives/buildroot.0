Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE5EC5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F8B360B8C;
	Fri, 31 Jul 2026 12:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DobT-Mis8xkM; Fri, 31 Jul 2026 12:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8254960B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500521;
	bh=60Ltgg7IixgW9xKfmgAah9hFyXDYw+iFpUkSe19qxeU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L/6dyjQCB8D7X00BKFxWKXpUyY60h1eWad3m9bTZpvAWm3XY8y7mNJ+LZQmg3OieT
	 LXPkqfUSkjtmKGbwVLfVIRN9uKJv2k+WGLrO9QOCBL/A+I+KVAjc50sWgTenaIM618
	 v8p901QxXiMNTT24e92YOwMFsqYxqq79ePIJ556e7+Nna/9O1KCduOxyFkPxplgUl7
	 1PT/+4uP87NVd0cf5cee8X5W00A5Mu1LIvFgbm17qSEin90rpj8JmImBSlsZuuTbkT
	 oKtBvBgkkX2wl4h2FM5cwpj+oj3GWxVzyaCwBvjGv93SUTygreWp3A9VgQOU3aKYDb
	 o2s22RRAjnPdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8254960B8D;
	Fri, 31 Jul 2026 12:22:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9962E2E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FF2740463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7k9ASfcWx2B for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:21:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A93140470
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A93140470
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A93140470
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c1712a04ddaso139834366b.2
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500514; x=1786105314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jXamINCZ+O2xVJwLMkO5ln+WXtQOQx9KSwdXeYGHmmE=;
 b=WdiRf5yzvYG9JTYlN+rbf9tb/N4FckIZUzrs+oBtbITCcrW0/zh5RS9Nawx2VOfBZq
 Vzb2Om6doQjfU501mVCi27iqS96NUvf/EaKZjEcqXuNrTH4n1RzW04zilNFLoTfL+CMT
 smVb3nQgGh+ud0Qg+BoHtXoffV3+5W9/5Sxe2XW4YL1yc2+3T3UF3LT4enwyDK2jEQr/
 wOT2EwzePxOaprcmC44TGTJTrfdHLHUYLZ+EgDiDkUS7saAd4fn/9QyVGRzLovBrkQeJ
 fNGisXPtp4t6E2KUZtd9qHjpNDmi6mEUOEUYgcfs0Gs/TFe0UQ7Zfbl+hmBtHfScF2H+
 TYWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpogvJYXrkVSXCrZY8hdj0kCDKgySQEpQIvZMwEQtbtC62uh955EbQXRUxFKRs6qs7S8oiOvuEJJxc=@buildroot.org
X-Gm-Message-State: AOJu0Yzjiok+X/9Az1TE//4bc7rFX9yoz3JDWlca9J0DpqP7E+Uh7AHP
 pjKcJfn5Wr5TDS2KzHgHi1FoH9SzvFWNbDrVMhyE7k0W6lwgBep4vmWpJQM2wl3ZTdZgLTLtwrt
 70LTV
X-Gm-Gg: AR+sD11CSbMteUmSAOTrGo7b8VvjaVqL/1l7ImRpb3LrUP63s1oEsGCugqYhPogPY49
 6g2m4IoC1NVuzP7K/ET8/BS5ofGu67gFC2rOp2NQAa3+2D/jV0y55y2ZDiytUIm3VFPTFrWIZil
 m7NEfIEFgyZnnNjWrmA2yfZzptqLg9DHOnIzG4sQlzjv1gZ/J11cVYSpftGmxigYjkh+/cNZk4A
 n+jczRauG/4K79XBv71AjHhkno1yzB/GDXRDcpkJPdxdW3aIRBbVru9F+2/nnbh9rMYdc7soWfg
 ABOQyJHGc4T+JHVxUjsJ42SjixtJ10hW36tngAuQOJ+rVuzqPmOq6Bwnd1GMY/MiB1iscFN8wWH
 VQzSYsPwQKay8VzMPrW/miJctfVpJwRci00KaVSS/UEhr8fyVEEQCH8a1YqpytGGjxU+rA2xYmk
 EndlujVEcIRDe7P2N3bsqQZy15eMshcsUAmBUz5lvltccdwAhlL48WZ1yNnIy+S/+NjmdDD9w9g
 82tvAlEXanzQiu+074qGg==
X-Received: by 2002:a17:907:c18:b0:c1c:257e:4888 with SMTP id
 a640c23a62f3a-c1fd239fd0bmr116006066b.27.1785500514255; 
 Fri, 31 Jul 2026 05:21:54 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2cf1sm4242285f8f.10.2026.07.31.05.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:21:53 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:21:53 +0200
Message-ID: <20260731122153.155578-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <23f5f721705e82a88212b4930d7876d4c1983ddf.1784867189.git.yann.morin@orange.com>
References: <23f5f721705e82a88212b4930d7876d4c1983ddf.1784867189.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500514; x=1786105314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jXamINCZ+O2xVJwLMkO5ln+WXtQOQx9KSwdXeYGHmmE=;
 b=LArKRWIUCSFkjneyh1F0dPMj23aDwASbysp5K47KmsIXyiIr/pYD58ZfZPWH0ep6jm
 ESAUPYiPxKQZ5+RD25jdGXlUatvG+GiE0hRSmd+Hmnfe7Eskw8moB5d9WDEcfENN4JYn
 dXcjWVLLbkz9YMnEruoKkEKqNSWuAgG9Fz3yu14jBsAPBjlmwD8hutqxwBcYiXnaoZyT
 +mpulezjkdzbc0FRTyKNjg/NS83w23Ub9lSWXMiilCHSz8QUFZfjrI712EjCh0YOyUTS
 US+szVQZeorOJHi9yvHZwb/qbB/VXbtV/ySQ5kEk1A7f6SDDkAohkSV267Lgha6ybVQa
 J0rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LArKRWIU
Subject: Re: [Buildroot] [PATCH] package/docker-credential-acr-env: needs
 NPTL
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
> docker-credential-gcr calls pthread_getattr_np() which is only available
> with NPTL; i.e. always available with glibc (where it originates from,
> since 2.2.3), always available with musl (which has had it since 0.9.10
> in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).
> 
> Fixes: https://autobuild.buildroot.org/results/525273d178d89ae8eef306d6ec662af368f20f73/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2026.05.x. Thanks

> ---
>  package/docker-credential-acr-env/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/docker-credential-acr-env/Config.in b/package/docker-credential-acr-env/Config.in
> index ddb101d52f..a4f7766fdd 100644
> --- a/package/docker-credential-acr-env/Config.in
> +++ b/package/docker-credential-acr-env/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_DOCKER_CREDENTIAL_ACR_ENV
>  	bool "docker-credential-acr-env"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
>  	help
>  	  The ACR docker credential helper is an alternative to the
>  	  existing file store based ACR helper [...] which relies
> @@ -10,3 +11,7 @@ config BR2_PACKAGE_DOCKER_CREDENTIAL_ACR_ENV
>  	  to push to Azure Container Registry.
>  
>  	  https://github.com/chrismellard/docker-credential-acr-env/
> +
> +comment "docker-credential-acr-env needs a toolcahin w/ NPTL"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
