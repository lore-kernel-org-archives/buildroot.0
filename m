Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC75DCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8EC419E9;
	Fri,  5 Jun 2026 12:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYeDsPhKDlnd; Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5C4419EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663768;
	bh=wqE78V06TdnTrRZeMzNB5mp5cKPDT4PgRBhPEW/aSTE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iGj+01zCb7B1iRCgPKD0ygNQN1QSJ4zN0/U5gJcYjUDggKQ/vChpmSrziH99yZU5h
	 LpARCN3UMlB/HPV9UTGuoMaum1PoAAaZ1jIXUTKio0z6NSANGWdCO9WO3GSREuLvgs
	 jAi58/0gzmQhgTDMogaIT5Fzi8Fy4ys39tG+Y5IlSnJFjJU6sDjikpWZFBtZpRzWav
	 bjR8VSBE/ltMiWkUOncvvETLLSUj/qyCzA1f2Id+iHMPnugj2rbNuScY9GOJnmDLDG
	 5UYxsTflA1x4vuxQp1HC339kd87Itz+dFp82Ykm5/mzpQKmqkMnrBdUwtYl320oV9D
	 HJl4gcsYEimhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5C4419EF;
	Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3018F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B80FC419A8
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phMQTYCfCM5P for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52CDB4125F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52CDB4125F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52CDB4125F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4601949975dso311464f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663761; x=1781268561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o8aDOw2V02VUEpDLu2RhXv39Zd8Qj2o7uLcGWIECgIY=;
 b=Na1FuWw4vbIMUc5kUQT0y/NuGZQjr3l2giwiWD2jeHp6cOZOkG3QXYafkJI77I1Dlw
 YKtYWlhU3JyucKTp7df/IRGMpYz/i9Sc9R3m9q/7p4G3+/0/NvyWTU0ypfn3SmgGw2Vv
 7K0dlXOAD3hkW71QyAhaVor7nWluR7BAVZViJu8tAeyS/rIIlcmbIUv4fthew+7h+2kD
 iW+tuJ9AZcXNEU9mtp3MPt/91+4kMeDICi1GwNjx2EokMbFnnKG8GDccjBFVJWMlsJuy
 BjIAaAQYNNwr3LcM6rPaBRDKzrU5HcSxBoIQJnPRkHvj95BqHLSL+TrSNtBCc31PBwIT
 Hv6Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9dkK5u0o7JeQ1qRvgAczJ1fbGE8RamfncuA63HwAnIzvKmnNbT6u28RblArGvuovOJudROqFplld4=@buildroot.org
X-Gm-Message-State: AOJu0YxMvjGY74FqHSqbn0VV8w6SKrzoGQJI+S5MO6zCYRpHqiwtSGme
 48s1zzG71DlTpdSHXFqkM89lP4MzcHt6w7G/MKlVG2OK72GDZarEo5QBgxJDyCv3oOM=
X-Gm-Gg: Acq92OEl43Dk04K4nKpwOLLhAltBbwnXlfm8bSDiFImGBOIxHHs41llIXfRyo49S7x/
 iPKpPnTqUzMX1kZhgOxO01NjJ/yLkSK5n9GZic8rSNmiE64oCVyjelRUZwMsZ9uHOj6HPyXJSRu
 weHg5qbE/Z2EAQH5lBezcGlD2EEDLwOpt9xyGUED+oJpO3vDi++VzGWafsIDv/TPcCEZ1qNobdm
 LUTrzq691OT/xaV0esvZEscYqUIBHH8jVBdRbhD429JOKZsVyjj+Nv69f1KteiOK6L2ICk5OlXl
 eYNIFlAIwGVyCdqy66bCbB/vRRuI12esPOEWZ6EnweZAAazUpurAeFIvbEDUT/Lo7OjfZ/mrutR
 smGNUZPvQMzJA9MWk1xDiKmPtLnHQNvq/ff6CUexIkgm64M4JlsDO09FORsZaJJL8RyM3f1rVrS
 PXfL0lJheghRRTLqD660G5oNI9TQ==
X-Received: by 2002:a5d:4d0b:0:b0:45e:e9ac:42e8 with SMTP id
 ffacd0b85a97d-4603050253amr4323364f8f.18.1780663761278; 
 Fri, 05 Jun 2026 05:49:21 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35133csm25185101f8f.25.2026.06.05.05.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:20 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:20 +0200
Message-ID: <20260605124920.270941-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425211641.479665-1-bernd@kuhls.net>
References: <20260425211641.479665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663761; x=1781268561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8aDOw2V02VUEpDLu2RhXv39Zd8Qj2o7uLcGWIECgIY=;
 b=JfqENUeoFiptFChwC4s0YlCHgCKrnQFZP6zqT4hpZSNepGUldsQikjXDMZLFhFtHtH
 q8ehKrZR2PQrCoDY7dQLZoiymDbey6DvdDRAu6KiIiwuWDg/nLXMdQju6tAYO8kpQfwd
 T3M0KvT5k9lDJAZIiAE1hHiJ1SuNpuDYb+mwdGvtP85S8WnuxisvXpDkhE6lvqzjNqrx
 DSBnEFWud4h2TzmVpXcu78MRkobMC2s2SyD/MO5xAmEkyeZ8ck0AR0ov1euQpfbbOWC5
 g6otviq6/WUXmo70pCkkvD1NWjKxTYkC+JKn9GxQbb6MJOMZ/9udF31E3XlgF6cNE3S8
 IQVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JfqENUeo
Subject: Re: [Buildroot] [PATCH 1/8] package/bpftrace: remove configure
 option USE_SYSTEM_BPF_BCC
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
> Buildroot commit 305c40613ceab985bfa2abd094a96f3eb2aba5d9 bumped the
> package to 0.23.3 but forgot to remove the configure option
> USE_SYSTEM_BPF_BCC which was removed upstream in version 0.20.0:
> https://github.com/bpftrace/bpftrace/commit/ef6d9d42d3a7a87116651d6c561de3a0a2693185
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/bpftrace/bpftrace.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> index 7b1b41781a..94f7c6b4f9 100644
> --- a/package/bpftrace/bpftrace.mk
> +++ b/package/bpftrace/bpftrace.mk
> @@ -29,7 +29,6 @@ BPFTRACE_CONF_OPTS += \
>  	-DBUILD_SHARED_LIBS:BOOL=OFF \
>  	-DBUILD_TESTING:BOOL=OFF \
>  	-DENABLE_MAN:BOOL=OFF \
> -	-DINSTALL_TOOL_DOCS:BOOL=OFF \
> -	-DUSE_SYSTEM_BPF_BCC:BOOL=ON
> +	-DINSTALL_TOOL_DOCS:BOOL=OFF
>  
>  $(eval $(cmake-package))
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
