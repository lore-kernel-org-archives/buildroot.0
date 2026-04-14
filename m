Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98DAF9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88FAF42B94;
	Tue, 14 Apr 2026 15:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-rOH9ik8Jyi; Tue, 14 Apr 2026 15:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2811A42B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181578;
	bh=2s6N/yL5y167tltv9geBzXR3BqnI1okLFmhpfqWsMmg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cOcsZiwSi1x+/0NuhqNlTLP28Pkk9sTYPGODIClfBDAM71VAk4k5NOlAkiEbHDOhY
	 CShtwkdxgEGBn+3Blvd4bXVT0RNKtwcLNDELd8PMwua2AkCDhg94Lw0wLA1zjoa93G
	 T1s1oe1lLgVFAth72ERy+AneS5Por6uqpRyXLSV0idbjjMcZ6GpM8FFgkyFSdcjaw+
	 xIU6uGAndFIiya4X+n6AwEvoxNRCjZdmsY/wJkFQjEQL0l8q+ONyMXvWhyA1KJmwrD
	 k02Ux2+tVaom19fWglAMJWUoAO56WSPrGOtq9Oyl+pSKWVOR+YrFFIRs16Zr3Eh6Nk
	 OyDLZJUzn69gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2811A42B89;
	Tue, 14 Apr 2026 15:46:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3FB9283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5CF340078
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7jE8UTYMKyi for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADCDC400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADCDC400F6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADCDC400F6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so90624205e9.2
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181570; x=1776786370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ypyrzJSoJL+Hf2+zNOk/sR3VK7s9KvojzTgwMJ2wmTY=;
 b=Afp5fZZjnhxl+dxKQP1c8JWXhU0Jb+CEapbChymrszp4OWiwLAixmRvPJbMRIfag9A
 AG4xJr71JNZoLvpXUFhwj8GW/siueaLbz+kwEIh6COKVODaIc9EFV1pW/4OHksZycY5f
 9m915ERrCIsrFkT3IA4INj2bNjgA2im8ZCva7SY0IWAOikPPDnIS68Z7rGSJ+IsbBqM2
 /IpebYzKgOw6dJBAWzFsVQs5UtppNzt9kSf1lrRUjP/m9KLHf2UtCU4cP904iB5lzyxm
 l12e1PDui9y+7a12NRThjkK6Y2KWo4nyzfWW3JAlNrUtlBvSlqV24OdrIu8ucF1iyXFg
 6U5w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xf5MTe8Hfl7oc3t1X/dwywm5JHLwBIn1G9PKDSwzg42fws8YTXHCRVPBilceuSZ/m2QLQCw9Re9w=@buildroot.org
X-Gm-Message-State: AOJu0YwodZdbrKyrw4H5KVoRDoRuasMHQGqDz2JYSKOGk2y4v+9FRJ9A
 NNNgTXFoq/5wwiJ4vhvIlNpAeUoPm9JuHz0dPCiGZ5+oS7E6+RDj8eTth815MP2lfdE=
X-Gm-Gg: AeBDiesDH8MjfZ4ngazdn4yhm2W+xugq3JszmVpd6EY6w92iHb/WZwkhbTP07H2G89x
 L6ZlV3jTv+fqLjvKYkpKqTAUOkRQr44HvTPR69mP8fDlOAFDpZn2OByoA9/3vmxuPpegjolThMJ
 ZRqm6PMvJxLv7SmxAlptsPMMBYqHhUtRJF98hCsbdz6Iommw4SlOihS4Ez5WMYlWxK61MAG7+9u
 ggyeCeIZmGK80ugCT6zKQ3vZjkxS9DLQdjAyyETb+0qx4UOg1SsmzMb/LKLEgGCv3Pba7cfjijW
 w8qAbA8Q1/SkGqX7nf4Q16grx3Og38tH7FirtpMia3t9KyI3LiCIB8O9B3IlF5/L00/Nkbr9zPy
 EblOOq6PR/PA3ZagRF7v0F8xh3d8SlFRKhCe9njcVilfpvr7KmmrtOcgreS04NHjw59GihNigFU
 mHfJe22sOCANkbf8fK
X-Received: by 2002:a05:600c:8594:b0:485:46fd:7887 with SMTP id
 5b1f17b1804b1-488d67f9a73mr175220925e9.13.1776181569661; 
 Tue, 14 Apr 2026 08:46:09 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede24eb0sm64366155e9.8.2026.04.14.08.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:46:09 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:46:08 +0200
Message-ID: <20260414154608.336012-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405162711.620128-1-bernd@kuhls.net>
References: <20260405162711.620128-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181570; x=1776786370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ypyrzJSoJL+Hf2+zNOk/sR3VK7s9KvojzTgwMJ2wmTY=;
 b=XPVcWgxWQlpBF/Xdxw0RmVPDDM79xunUPEvtp0MvLlAqjU8UEVm68Y1SYauy7qKDax
 Y92D8lo7yRP2ck5WKSHaQ33G3dtA3wsvnanp3bdY2O1W9X/k8PkmG/58vVtb+WneFgzb
 K2rsw6oaK6wk06pMJdOYn2odb2mWWoXRm56g9JswKctlqSem8WkCp5Y5+/WewiSUFFtg
 /HSx5Mxi1eBX5iabyxZyvFXNPRpSR6gUGpIq6WX34EUtFAmsg+BRCJnx2MEaxxjQvSGu
 dJaT483tGo5WP0ZhyFNJQrYCnPl5nJEKzCMsf89h5O0S5sgOfR2Mf/TptiZXnjMeh8VV
 sq6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XPVcWgxW
Subject: Re: [Buildroot] [PATCH v2 1/2] package/leafnode2: fix build without
 pod2man
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
> Fixes a build error when pod2man is missing on the host:
> 
>   pod2man ./tools/lsmac.pl >lsmac.1 || { rm -f lsmac.1 ; false ; }
>   /bin/sh: line 1: pod2man: command not found
> 
> Fixes:
> https://autobuild.buildroot.net/results/999/9996e81429f90f4615755827ac182094d416c467/
> 
> Although the build error only occurs since 2026-03-05 it should be
> backported to LTS branches because the last change to the buildroot
> package dates back to 2024.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> v2: no changes
> 
>  package/leafnode2/leafnode2.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
> index 566aaf3d55..8c44071209 100644
> --- a/package/leafnode2/leafnode2.mk
> +++ b/package/leafnode2/leafnode2.mk
> @@ -11,6 +11,12 @@ LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
>  LEAFNODE2_DEPENDENCIES = host-pcre pcre
>  LEAFNODE2_AUTORECONF = YES
>  
> +# pod2man doesn't work when cross compiling
> +define LEAFNODE2_DISABLE_POD2MAN
> +	$(SED) 's/GENERATED_MANS=lsmac.1/GENERATED_MANS=/' $(@D)/Makefile.am
> +endef
> +LEAFNODE2_POST_PATCH_HOOKS += LEAFNODE2_DISABLE_POD2MAN
> +
>  LEAFNODE2_CONF_ENV = \
>  	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
>  
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
