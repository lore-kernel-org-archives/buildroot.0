Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2564C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89A1160E4F;
	Fri, 18 Sep 2026 13:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXnrVO-4QZYh; Fri, 18 Sep 2026 13:09:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9A63B60E65
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736944;
	b=Quv6O3oQ7xEf7ozJgcM/lzhJM4yq9Gj+KsXhLCyZOqC44vKIu49dAgZYb/MMyWuRioqI
	 aEU45E2RnjOeqShd+JlJCR6B6NJM+0UEp2IDFRkbtfkONyOBQDVpJfCxVbQYAcKAf/dIx
	 QSU7k88CbbWeAni7wV/UndbapAF7a6Kw0qs59Hh3BF0dk6ixV4JjKmgCkZq0xRelqeksy
	 mQYs640ESFJdVT/CUv8OVutm8Qugr8G8bTawQGE9VGYzA3fOXgT2FUzKu1rbge3oFyeeY
	 yCm3QICpKKXo5vp1sWMdhafa/FN22BbTyt9W2KZ/yVoWeVrvgUpjUO4mtrmGpZzfU9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736944;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GVXogSzLepHzVDMbCET9DkZ9YG7QCyGzq+JbrhhRWc8=;
	b=pSssoa/nQ+wvkfz0bXWWTjUITc6F5FP2PzEht6lLmNbMnuivyVufjJNKqtmcLfB641gL
	 zdhk+0rirzppglCeaqBVDlSowB5ubPI/Qd3kjSrwnQ442RUzGLJ7qfSe/dQjf2ztg4A3q
	 IBEz2aPHG338hLC84OF7mvUDFG8ZbyVqCOLevtNot0XHGJ2ewV3s5nvoNd1N18LGVt9Hq
	 ERIs4CJnKGB6jLynYzvFIDdHhgkV1H5/nWcvDNpBkvbMuGlle02NvXFA4AGUlTodG6gIt
	 DuSHFSBOGffc3yRxCAdH7G+4E5z3eCVjoNipZMH4xytp8o2CSyhmQKYz+dvTXOX2kNw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736944;
	bh=GVXogSzLepHzVDMbCET9DkZ9YG7QCyGzq+JbrhhRWc8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YoU5osWzPn/hQWny940WllJyPUJzuYekMDH22CRkbL9S22xG3QSJHhq0cCqQti3uT
	 PcM7Mg286j8zdil3WwVN04Br00xHUQNTZm02cT4+qUtb1k+NPOZ1YW+I8DhFqfAh2l
	 A2AqMPW5gZqPG/V5Is9AfBRr2cHam/3BVMOymOca10RVXheCHzx2EQF3/TMlJ+Pm7d
	 cAdBvUZyb09bcH1hKEZXcirB2whfyCAl+yNzh9orRZc7cbnnPkhkhBOG7MJS7KpX+3
	 kaq4PrDcq/UF5QzdzYxlBndkWQxJ6swgk2ldMQQF0aRMZ1hUlVN0rrVn3dVMDaC7FA
	 H/2HTpKgylaHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A63B60E65;
	Fri, 18 Sep 2026 13:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E00AE29B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6CE1811AC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3l9yUB47HqMM for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A40EF8116B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736941;
 b=o+VBlCuq+A0byK/xzCL3ZHF33ZrG5WHB9Y/AmqJsZjYy30POrfc8ocw0izwt93vrgBrU
 y4q4EfJuLS0Ggv735XgJHIGOCA1ZO9tEq5i6T5fRg+fw44JFWChI7MTJrkMV+1jwXz1lx
 4/VA8xZZzJ7Jt4qRT5Nb/xz4Dp+448S/6KtD2PGwqJUki5MKW6r5gUa2jV+tf915u0evB
 peXAN7qC/Re5U7pQrIGrC0dhBzoD/lyU1aoWffFzFYZ1SX9ZTvOEA/ZV6AmM8XpHzQre2
 C+DYyHHyKTgEQBgwPBF0MEm1NWBZDTAk7NF6e3yx8Hfd2+NbW/v7Oa+vEnavV722bkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736941;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=WKZj5zwn7jXvEGYnVPDYXVJwgQ8+tMAFpBaxDjp+YCQ=;
 b=nuHTxK9NgorhQq7SSg7VmzyaidYk2aLIO6c+1xHCDyBK0+hCjUmjPgl2SUzlFqMbYP4A
 A/DE20UnwjdFTXvW1HJM+SRgoIhTgguiyyqbsUgsDjuOkW3OY3Rc2ZfX8e362ph0VrM4K
 e1LxYGOObgfLPwaIPnEwwV0eEeC0ElMZvYKvTBD8BsmWrbMTX6iMPSx62jNUZLSbKn3gN
 fUURhd1/iaruCcr3KMqYZbHhGc+s47c0p5Llwy7VVsXOeVR+0sBBukpRn+mQgi+/FJ7c7
 DlD4TYZV2IWVyz2kP0pZlay4zuQJon/ymzzj5Mu7y385gbiIwp+VSxRZqP1HHlgVoqA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PsWQtalS; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A40EF8116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:00 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso6245135e9.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736939; x=1790341739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WKZj5zwn7jXvEGYnVPDYXVJwgQ8+tMAFpBaxDjp+YCQ=;
 b=SVfsG4UvyPu6ELqj9hdB/bS64skM/pL8u+eSLehjt6raT//qoYh1fNQlrbDxx+5p30
 syU6o6VfJhhcTlXkEvIyfQqLUFKNDB+SJQAksI6UlFOyqsGspvnplsoAZjBb/ozOect1
 h81mBadPc8EzrfUPvVgdbux86IbjaK6Lr6ZhQjP5BnI6cBV5x7wTrFkdG6dkHeknkWYB
 hsIKD/uN9avL1Ebuu3P+24fkP5L/jYSIRmWGFoPsdPt6LEMRyhGbfMvSS4arhmGLdQTg
 8GUiaDqy9QGLYt4ZYBny9NIAZiAb/0lxsdPV+Onpv61K8aiAom2SfwwZaaSVwu3OTzV4
 nB8A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQxX9oTZsQojJBmP2b186074yUinD/v72YMgC4OH4VlY+bgA4IxVH/JoRxOld7bWRrlo9Qz0dM/0k=@buildroot.org
X-Gm-Message-State: AFuF++mTjfx6s6vSydlazJn6rnfvh/TrDpjwHbXStcWJvuyfFALkO9Rw
 V8zZwWHWGAzp3NKdViPaS/D4xvMg/lLEeCitoMksfu9F1SgOPlGh0susBtdyQMBjEXf9UZ1JsxQ
 vIL+b
X-Gm-Gg: AYBFou2+rO32tMamUQnzAc62/zNvLUlNSxwtfY2LbLTumzDHNI2z9S+ldrrP6PgKYiq
 DqgJbzAT0yoTVirkTS3UQrpJgeKZI6fAoZQFkZyo92pgCtnf9O1/+/Na4Qrfi4rEA9bgD9W0BsO
 xi7/5ARwey4FQFdv5w81R3jTC4W9QHwwIIc6fsE/TTPqqlDZqj5rN8l25/DebOv2wvTUnR81Ltj
 Aq+x1pASYVNfICkyJXg1UzYyCzvI17eaOY/8s3KYHehQPJWv99QHk3ft626jwREafUmc9Y1di4u
 GK0WrjwE7d2o7RrXEY5Mw2yUgrwtylQR8JWEYMa1JU2Zb6PC2/qcwO45HLLmnDWpwErZmJE9TD0
 GAHkxgZARtTcnkg/KrM3NiBazOKQH12M+eammalwMhNLFbfxYcY7rFpd/3a3cAYQZEOPhYte+ko
 diiu+0YxuQCCJ4lAVNGjRJPBpGoV/KZP/RaOFSLOh9johLlGHy5w50375Oi5sOiEib
X-Received: by 2002:a05:600c:3ba9:b0:49c:f504:2af5 with SMTP id
 5b1f17b1804b1-49fc566939emr35758495e9.1.1789736938758; 
 Fri, 18 Sep 2026 06:08:58 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd216ec7sm152289345e9.8.2026.09.18.06.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:58 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:57 +0200
Message-ID: <20260918130857.162761-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913162236.1673931-1-thomas.petazzoni@bootlin.com>
References: <20260913162236.1673931-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ivi-homescreen: add missing
 BR2_USE_MMU dependencies
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
> - BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS selects gstreamer1, which
>   has a depends on BR2_USE_MMU, but does not propagate it
> 
> - BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN selects
>   libsecret, which has a depends on BR2_USE_MMU, but does not propagate
>   it
> 
> In practice there is no problem since ivi-homescreen depends on glibc,
> and glibc doesn't support any noMMU architecture. But just by walking
> the chain of option dependencies, this is not something that is
> theoretically guaranteed (making automated verification of
> dependencies difficult).
> 
> The other "depends on" from gstreamer1 and libsecret, BR2_USE_WCHAR
> and BR2_TOOLCHAIN_HAS_THREADS are on the other hand already handled by
> the top-level BR2_PACKAGE_IVI_HOMESCREEN option, so there is no
> ambiguity.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/ivi-homescreen/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
> index a4f5f6835f..d7cc4ce04e 100644
> --- a/package/ivi-homescreen/Config.in
> +++ b/package/ivi-homescreen/Config.in
> @@ -187,6 +187,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
>  comment "plugins with external dependencies"
>  config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
>  	bool "Audio Players"
> +	depends on BR2_USE_MMU # gstreamer1
>  	select BR2_PACKAGE_GSTREAMER1
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
> @@ -201,6 +202,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
>  
>  config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
>  	bool "Flutter Secure Storage"
> +	depends on BR2_USE_MMU # libsecret
>  	select BR2_PACKAGE_LIBSECRET
>  	help
>  	  Store data in secure storage
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
