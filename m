Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CDDC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C607D60D7A;
	Fri, 25 Sep 2026 14:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOmO6akY2y8F; Fri, 25 Sep 2026 14:43:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E67EB606BB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347422;
	b=NgvutghBZTyNuoVCg1qFJMLN7KvL9JOBt7vstax/2NTVHhDZOC3rfmLHJCIyp5o/MxIM
	 9LIBcocdogMAYJS9MT2h8RxHyyocVcYh5RhD/Fu8rmeTTD4hdnSdE26DQGb9M4jk+2iZk
	 6qxeRACfYLTPDX94cmss1sHMWMl4cp5s86t14RNAyQOiFp8DMoj3fAWPQlf4qsZ4kRQhN
	 g+P4Yi74CkgWdV94ceKNKcvXy7U21BGBRWCGZ2NSY77RR05Mv4pqhnv7n2Lgzqj1j5/Yw
	 WXc8IMTFWr4Fk2Ee5VYcyeDnJ8ilRPy9vpqNS9FcnHZeSVgZ6LrcxskqWjMEjFwrP4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347422;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rZeRBc3Tb1GiEHtuvBa+W0hTizhzJC+c7ETAunxlp14=;
	b=Nx9Br1/qoVK80F5T6IBsvtVXa+BEshCvoOxUffYxL1K+CWG7yPWY04REnWXRX2VE9tzP
	 keqQWJ791Jbal3iLRTcWWeVvS4fkyyecszCAgtXrn/2guJBLJEBQPpK/X6Ldu3TiujyN7
	 jV1Nkl5IDBXhlOT9r8BHiODQdt/D+Kng126nZdnsmI7a9Geg1P9Omt7mF08ffRx6Zaqq/
	 YTkdbHHN+d+ByNDk6KwOC2n32/79dLbgnPkRfGMaUVBhueQQB7XtEBarj3nxwl9WkdH8J
	 tT5ItJnWJlcWImXBe+O95VzYdN48S/Q/GkxKW7PnrPh5ii0AubPoCer901jVEcZRSUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347422;
	bh=rZeRBc3Tb1GiEHtuvBa+W0hTizhzJC+c7ETAunxlp14=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HuhBSo8P514dlt1vDuOJgJzKs8FSO5m5pvr91haIrMF9ht4zwJqFUviPewruVUb4M
	 sUzH6La0SXC0Spes9stJ2kW/tl7eu1XQDm7qCAgLZV6gowv6M1qFRciUgmLYq7YtSf
	 vxWt6FZAl2KBMPvBcnMYQXGQEejOH2XGXkVNWFaYcJrhMRTxCuZ8WJUY193cnoLvSs
	 okjdVFnIOkFt7hA/jOliP0WoDeolqfZVzgpWJKXA+PmBssjYMmzcbL2in7l+2Iy2JL
	 E43aThxC9qq92vP66xVLvyjKXiob+2oPgwuiLnl8/qgAD/Z3mCOStpY1las/CiqLY7
	 43gBsfqlYLLRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67EB606BB;
	Fri, 25 Sep 2026 14:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BA69334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29A1740790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPM8VjKeCfLL for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A049B407FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347419;
 b=ZAadwWnDNLiOToPknY8tBY/7FHQNxOKWHhNmyoUC9tET+yyaEmshAE6DDR8ZkbQcwh7o
 uIhCU1H/TlanSU69/0yzhB4HZ4mlKMVQd6zVW+Qpua5NaZ1MAuWP9GibkzoRe1PeUUPr3
 3WOHlcqXqOD/7ubv3JzAzS6SgXg2ktLvh4L+tAFczA6K35r2ZO0c2ApplFpdbBH72cW0H
 8dplayJJ+Qi5S5CHtpcoSo4UuxIEXNCXpIbknrJVK2PUKxdCasMmYsWqkSfbttox/1N7u
 A9oWNK0TboP2Pvh5H6TSR2xXnZDdaEXQca5JXWbR73tFTZDpyoxNpwe9MwSZGmCuHjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347419;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=fPwro6nW33XYvG4UF82KCIQcmWxktzu6SbENyOaFEow=;
 b=fm3ZHo4bofmLWWTTUipDpe+HlFh8ItpEcF7IsLrIw2Be0YyGWsNmTgERQ8GCy2X80/rO
 lDcu5KvpVsZzHCMABECaMV7wZ3qRcrDMJiX3TaVQyhcvW5zFGXU/X6cCId2XhneA012LF
 1CBRKF2D7HXo5peZvfh0cehrbfKbCtBmQtnM1m+71IRI0RO6zJM+p+XDaPXZ1Vp+5lrlc
 cJsW0qHLJqyoGwQB7Ia3xz/c5YbX+K19pIVwNDggde1pBkISsyeytJaITql1DJHMRoK08
 5S+Jy4K27fvEGA28M0Duxna+Mv/WRrCGakT3Ni22YG5/Pv9EqJuhfWmb8r6WF8pkPjQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OgiPe9hT; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A049B407FC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:38 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so6145555e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347416; x=1790952216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fPwro6nW33XYvG4UF82KCIQcmWxktzu6SbENyOaFEow=;
 b=SLjm/BrtankJp28bftAFqAQOp3Lf468Qsb+EgkWTUX5phPWdWAw6G9jBpnr2H4dwdP
 RT68lgwmkGAnkKtWx5B8ek5U5aT39lfPfRIePeJSCjX0kWiFsTkFWUARGZBaT0xSjT2Z
 tvLU0gq8F5gjS54PYj2LmfMytA0lw8bYEA+YPnePjv1wv+IQ+iOltqgTLdnJlZzy/3Kv
 tJWceHnl7x4+gQ0vRloUrC7BqbZCSyazoAoiJZan6PLWQKoUAHOxbxwW/8dSFpI1pW9j
 VkExxdhUF903vYSUYCn7JrzjdOL4JCMYHYcU/KjYpQ+B6bwukvzyDVgkA86fKzTa2u2V
 K45Q==
X-Gm-Message-State: AFuF++mRmiCk1/TgWc2282z0WPhT9yMFo6QvcDoCWORtrG7aR/JOgkb/
 4ribRO865XMmtBTtTMIG9ILD8aLj8Zi6pRstDR4KecriwMZcSTMpxUD6R48KA7nGEG+F0+iD7uo
 1Zn2YRtIvbw==
X-Gm-Gg: AYBFou3WPjsix1RlLmnWC3TPOuCdBH9mpkjJuCN1b252WVAjZmKJ3lBc5oMa8kkRiSn
 XqlUZ0SyzpSMBFuR5iUEgjpkxu/LkgdR3XHL8cFGVH9KVO2VL+d+l8fH986zTJs8L8ie4EXFpCy
 d14PPS13Y/HRe+/T7ZnwwGql2IM5p0YGE+qHd7W8Qha4ndDA/lKQtVe/TTPRAWCwMWgcJgyhNbZ
 zfaiu6xru2kbBbxTvrM7OPHFBSB+Ba4LHlXOiloLRMB1zL3TnnJ9jauFZIkruJI0I2DkJk/W8/N
 IvRtJZtV74L8dQRJ4OiUGyCQZ4WrBL6R7oP2qV1JKBTJHGsPBtZZSSi0P9i/+crxWrSabUx4miH
 oy6iM5QT19/QsBCjMQgZgbqsnuInk/eLhBNH8IrTV668UEt+ikA4ZTGI9d4dyn49csn7DZ6mNUn
 wGaP2ONnGIMSPVyB8mmM7tHk03c4Csmr6h9Iv7bTgvVolC3QX7S8b6lhX+3aGmPILdNdEXMegPQ
 gTQyt/j0C0xHQPJUR8Nu6fVYH15IbbVV32mUx6vGg==
X-Received: by 2002:a05:600c:34d4:b0:495:6e68:5df2 with SMTP id
 5b1f17b1804b1-49fe66d07c9mr97379805e9.12.1790347416296; 
 Fri, 25 Sep 2026 07:43:36 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a6456f8sm7316535f8f.26.2026.09.25.07.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:35 -0700 (PDT)
To: buildroot@buildroot.org, Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:33 +0200
Message-ID: <20260925144334.4094863-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825073605.68465-1-sebastian.michel@oss.othermo.de>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mali-t76x: add missing license
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Added MALI_T76X_STRIP_COMPONENTS = 0 as tar archive follows nonstandard layout with license file being in the topmost directory
> 
> Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/mali-t76x/mali-t76x.hash | 1 +
>  package/mali-t76x/mali-t76x.mk   | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mali-t76x/mali-t76x.hash b/package/mali-t76x/mali-t76x.hash
> index a754b98074..751d0e7bf2 100644
> --- a/package/mali-t76x/mali-t76x.hash
> +++ b/package/mali-t76x/mali-t76x.hash
> @@ -1,2 +1,3 @@
>  # Locally computed:
>  sha256  5a0b00438edc8066b374481d3332a43c07ec2bd3bc73265983a968970f754902  mali-t76x_r5p0-06rel0_linux_1+fbdev.tar.gz
> +sha256  b0ca7cedaf4f604a1c863ea71f741d6ca1474aebac7e606ec43d725b3c74cc63  END_USER_LICENCE_AGREEMENT.txt
> \ No newline at end of file
> diff --git a/package/mali-t76x/mali-t76x.mk b/package/mali-t76x/mali-t76x.mk
> index 387685c033..05d7d4812c 100644
> --- a/package/mali-t76x/mali-t76x.mk
> +++ b/package/mali-t76x/mali-t76x.mk
> @@ -10,9 +10,14 @@ MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T7
>  MALI_T76X_DEPENDENCIES = mesa3d-headers
>  MALI_T76X_INSTALL_STAGING = YES
>  MALI_T76X_PROVIDES = libegl libgles
> +MALI_T76X_LICENSE = ARM Mali GPU EULA (LES-PRE-20376)
> +MALI_T76X_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
> +MALI_T76X_REDISTRIBUTE = NO
> +MALI_T76X_STRIP_COMPONENTS = 0
> +
>  
>  define MALI_T76X_INSTALL_STAGING_CMDS
> -	$(INSTALL) -m 755 $(@D)/*.so $(STAGING_DIR)/usr/lib/
> +	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(STAGING_DIR)/usr/lib/
>  
>  	$(INSTALL) -D -m 0644 package/mali-t76x/egl.pc \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
> @@ -21,7 +26,7 @@ define MALI_T76X_INSTALL_STAGING_CMDS
>  endef
>  
>  define MALI_T76X_INSTALL_TARGET_CMDS
> -	$(INSTALL) -m 755 $(@D)/*.so $(TARGET_DIR)/usr/lib/
> +	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(TARGET_DIR)/usr/lib/
>  endef
>  
>  $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
