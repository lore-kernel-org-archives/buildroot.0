Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD06CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 560A261622;
	Fri, 15 May 2026 13:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9SzXpdSsyHt; Fri, 15 May 2026 13:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76C7B61626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852050;
	bh=pnolD+B8xpNVnfIxNcmkVd6Xvd3KOiOVBTOAUkMVyvQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jg6hRfdYfXy6V2Y+TNE0QtxFDpO+dbM2WZuVkN/c4JRfAGBAnmkcMCMj8/4hpHNn7
	 LrfXyWok58kErYUq9LOr9u8fzJDBQ4bN89B+3GY9n21AbkyfdnRC1IGTnKDmY4roOv
	 V1PL3SeJHywt2foMXFTTIOv3pcbiOq+wYzFY+O1d58v9UM+/QAEOPH4m2cH/Bk3EfA
	 QTSSu6dCCJlVmH5YFpi43t3ckd90B7nq8AdTzgZIrjgn971Y4VM6vmUkUAMRKEKT+Z
	 SvWRvUfHUgvbsMHv0Tz+YxFaMp0UI9tPmx+Fola4uLBWuIMZeYnHPyaKf/RbWzYsFo
	 uIxzzBClzvxIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C7B61626;
	Fri, 15 May 2026 13:34:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0771936F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA9CC4059A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9cJgHw1cjmJ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAF95405FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAF95405FF
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAF95405FF
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-44ccbd3290aso7548682f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852043; x=1779456843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nIKItXzQSqc2zwnBw95knF+K+HCaBTKRZ3etV5Nqpfc=;
 b=jglNJqGK5jqW+MibA64Z9vbBP3RmFJAo3/RfC47ZPe7Eu62l1+qAvBuDPTzblQ5B5g
 XysyHmqNa974iUCF0PRtcZnzB5Zc9rtIcfz2slVljkWKfh3Uj6mpNAhWJwabPCdPZuAH
 54E2t61Muc4cUppH2KMpK7e9JCKKpEGeW/bOj3k9mnIXeMY+8V/P3uBadfwVg/6hHgdG
 l44doTP+9K2owwJuHXaQZbSRyVqvh64xpSSDOpXdMPfqBAcA2HfO4FKmz3M0omf4KkbS
 6qndHKB4tEpyKOKJfxF9hyUt09vskVZ/72so1wjOWo4b7Hcf8x84l8O18CJCPOd1OnTT
 +jtQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+bOWWY/Fp3jwDkibWBj9U3jMksrD7KihWKHQ8PajBWvpFu7XZAkfPe1mQRtGfHNnhKgv0VwcYu/NA=@buildroot.org
X-Gm-Message-State: AOJu0YwsJnV0f/B6+HxfG+eVNfNpmyu6beivyOslyW4z4F07qelA715G
 m9Vh7Fh3tnpoq5Lgg1KNipFo230mU6dsxAGmWD8OVP8eRL1KLWMBD5dNjMoZHdV7NxI=
X-Gm-Gg: Acq92OGEosM+95THK/D4yoU2jzL8yNHBlu23jQlaJT92CdYapwWak/FrDJEx6u8HjxE
 fEXcdCDCnvXb604Q8lNKKDfvPhMXYMtvA8qDe92j1mH6oxJVpe+yns8g+3eC4PPGwnvnNeFlOlt
 hR7H82+vYKFbJpr8xE6GVOGJ8E1T/UwmVliukUBLCLm7Dzi69pHPQR2zBRTA1oUijClBj0qvrL/
 dzG6U1q9Z5Tv0ySpC0d6safs0htGiKpJXfka2vYR1EHsznBpS11PQor+lwgEct0gbK2uGVPbuNO
 bUsPhm7FDq2Ps1urPlLu5pMnOWLspVI7Z+PfMezqeqhUMKWxGbtHsWWB6Na/puAvKnP/buhxlzr
 cjYk5cqiqptUXXGAJGyjedzHr/hbMRyTeNqczQjHgpa7jNY7JFH8vPmnPxnE3dzU3fHA7dJVDOF
 uDns22072LNsFJu1ugu+06gUp467nK+xtU/BYRqFt7NHudEJwqOK3qf48=
X-Received: by 2002:a05:6000:1845:b0:44a:47a4:ce91 with SMTP id
 ffacd0b85a97d-45e5c58d4b5mr5506411f8f.25.1778852043471; 
 Fri, 15 May 2026 06:34:03 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768c4fsm14950353f8f.8.2026.05.15.06.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:02 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:02 +0200
Message-ID: <20260515133402.316064-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425101513.784747-1-fiona.klute@gmx.de>
References: <20260425101513.784747-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852043; x=1779456843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIKItXzQSqc2zwnBw95knF+K+HCaBTKRZ3etV5Nqpfc=;
 b=Rrp3/ZmvdBD/q2newB7CMEy/sKr/17jxyklpBBC54dbpjfnd32jqVWEtXpKJ/PdzIz
 04wScLdR6Vgv1Wi9/hKCcq13Tw/6c1LiYVSMb92zQORN8c3xiH6Ug8REymIJnRETD4gz
 aK8QoqC0a63sN6wszKYu5YHIxQox1E8spMqV3aCTmJxPz90SVhXi9rKJPfeGD9IJVyyb
 AgGdeMrYufISrX1SOL5S847zgDNqXksS9LvtEMUFp6VCbh+ebghQUBgC/jQd4EFH4hnH
 lbHbNVsOU0HOZ3EO6EZ/byeesozj6F+V0AQAU2coRTHvuxpYY/EkvrGrLRGe7cZ4QOeI
 jCVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Rrp3/Zmv
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: drop obsolete
 dependency on host-intltool
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
> NetworkManager stopped requiring intltool with 1.40:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/56b51b98fbb8627c4c09a483702e18fd8aee7ce1/NEWS#L434
> 
> host-gettext is already an indirect dependency via package/libglib2.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> I hope Marcus' series to update NM to 1.56.0 [1] can be merged soon,
> but this patch applies either way.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/list/?series=492286
> 
>  package/network-manager/network-manager.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 76f4b09fbe..763caa6754 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -16,7 +16,6 @@ NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
>  NETWORK_MANAGER_SELINUX_MODULES = networkmanager
>  
>  NETWORK_MANAGER_DEPENDENCIES = \
> -	host-intltool \
>  	host-libxslt \
>  	host-pkgconf \
>  	dbus \
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
