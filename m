Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1898CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A744C8460B;
	Fri, 15 May 2026 17:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIBpaX1d2eAP; Fri, 15 May 2026 17:46:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A5D84574
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867166;
	bh=Z6QUDT4qsWguRJXFPpZmKUcV4EwiFLmmfw1ZxiKTFno=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZSBYq2/kBCK/UTcY0W7Zs8KiP9GGhLYOcSM40ZBt/dONl8oHkLr5QQqUEtbRSU3aM
	 yw7gnColnEFth3vuiS7VrOEa9Jzc4AK34yNE4ZCyGuPI2NZa6xiVE58lcuFRj7po9W
	 uqrSHAefX56DUgdlfPJELu2Sn8J5Yc82TsSnijSWG9+d9QvGa5oKFnXZ6M2mNO/jNw
	 IvfkMLUvjV3oZ9oJ0SrJweo6K0IjsSug24E6fVamD9tmhSXu/0aSaIE3JmWJYVNfCS
	 h0u+zqMJd/++n4UfHlh+pdAiI1K/5l6FVR5JwCiLJ4rarAmgzW8MQtB3UW4tSdTkrn
	 OXkrsJeRmS3wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A5D84574;
	Fri, 15 May 2026 17:46:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0D7023F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDFB140F98
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Up515sz-qIqO for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 346F84027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346F84027F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 346F84027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso950415e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867159; x=1779471959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NYrOg8UfkDpjqUOzZgSAUCFvcis19W5PdKk29+mD0YU=;
 b=pdwzM4crPGfYOLhy1Q4f0vvLtOiElUpFqedS66k7WMqDCXZuSgeMPYNsJYQ8VfiRoT
 pBM1AZeRdoa5U7zXTn1fk4kqde3Vh18mIL2lFsJc281PYQSnts6Bsoz8b72R4VrGiC98
 TUB6/QyVnNItj/mVgOOpU5m3BaG9J5zwGn9wyfGY2VwRs3ThcGFxwqk/xDT+dmHfSowD
 zmggZutpdJMTO8ED0ghhfAuNf6gs5sheZ8fE1glyqPs7C1HOBEyrrqWak2nazHN8/Hpo
 9Qka8CvJGztbVWN3CTMSF1JiCqwfCAVHEyKfkMdynNrK5k6tdVNmS7p7eB+FnxiLhu3n
 q55w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nkgOlwNx3JNwLBnDr66tT++vMnkGJe9QVNN20f1EwJG5dwje+I2KZitLVLVlO0/VK8Wzhj9a/yiI=@buildroot.org
X-Gm-Message-State: AOJu0YzfgbsH6LUYSJA6j6PlQ+dh0AN34eKRATJF+iO/94T0Aju/IdaF
 J3jmrLs93UYV5B9tfPvUuM8q0YBqD57TbZ8hzZ9BnyO2LxDtqiDJqYjo1WodT3x4Xug=
X-Gm-Gg: Acq92OELVafdXwGFo617oHIwgD6as1jYu718UkUg6smFqNgLKRADZ6jzMruWFPFaXkS
 stwyEE09vm5wm94B1iHmI6k82C7j9UP2V7IkqZv2+F8KJwf6sm1HxE3DH000oyc+/wLde/QIk1m
 GFfQBQVOgC4Nlwxyo5qEeFHpGQDz+My42cOmhP90qFHi+deRvsXm7WK5IPHs+8so02DKx2Uw/de
 f4qc1Cifq8JSHlWq0XwzbHNqF+jpMYooutyIhxrb+Jw58n0plO/BMNQI6N4moRnIghWAOAHsRSL
 rW/c+6/9FqVxGJikM98ZE60M2QFL4/Gwnh7vfqVqIDj/zTzouts9EIHG96QghsGqG8kqpXP8PMW
 EQIVhYcVhmDgNFKECFyjfRUm9JpHdbFRpazSKVvpZcFsYT7lcmBmoLRhTYI3CziC1VX7qHrzdwf
 d8bzDLj111sjYAHv9VFPP7t13ZuYbbSSK86DSulu5VuPph
X-Received: by 2002:a05:600c:3104:b0:48d:35e:82cb with SMTP id
 5b1f17b1804b1-48fe651b2a9mr68656225e9.28.1778867158492; 
 Fri, 15 May 2026 10:45:58 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4862209sm76843015e9.0.2026.05.15.10.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:45:58 -0700 (PDT)
To: Daniel Houck <Software@DRHouck.me>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:45:57 +0200
Message-ID: <20260515174557.529246-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503235637.637991-1-Software@DRHouck.me>
References: <20260503235637.637991-1-Software@DRHouck.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867159; x=1779471959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NYrOg8UfkDpjqUOzZgSAUCFvcis19W5PdKk29+mD0YU=;
 b=Z8/iPtAzE8tas+bNzDpogBNOfsi1V3hnXEHoUlPQT0hQ1CHH4o470a15NhBKs3HFcA
 1OM9DfXe4VraVmWD7xSfI5fxKy4uvVRtyonvor/8KwUBqkAtRIO7ooa5iURVXy8X2bXk
 jA2zxyqTIDHFWyqdWb7wcG5EbYMCg+F931J46NeuMNp2VyXq3kP6/ywhgvi01SwxQwh4
 uYKaMsG1YrmFckgrrVJJnwJ5Xl381fLv+VZ0D3tcXIeL3/XWFAYjRMFrv8hNhvZE4uKq
 I/QtDiOqc+mXtt048eLpjH0TCWJgbA4YpM9nX3sGS4BunuYjSkMrmJIG5PD3Q9VwrR4i
 4WGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z8/iPtAz
Subject: Re: [Buildroot] [PATCH 1/1] package/make: fix build with musl and
 gcc-15.x
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
> It builds fine with glibc and gcc-15.x but conditionally includes code
> with musl that fails.  See eg. commit 999fb19d4b.
> 
> Fixes #176.  See also https://savannah.gnu.org/bugs/index.php?68302
> 
> Signed-off-by: Daniel Houck <Software@DRHouck.me>

Applied to 2026.02.x. Thanks

> ---
>  package/make/make.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/make/make.mk b/package/make/make.mk
> index 1d1a976eb4..7120548bcc 100644
> --- a/package/make/make.mk
> +++ b/package/make/make.mk
> @@ -14,6 +14,14 @@ MAKE_CPE_ID_VENDOR = gnu
>  
>  MAKE_CONF_OPTS = --without-guile
>  
> +# Make doesn't build with C23 in some configurations; see upstream #68302
> +# gcc-15 defaults to -std=gnu23, so we force "-std=gnu17" for gcc version
> +# supporting it. Earlier gcc versions will work, since they are using the
> +# older standard.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> +MAKE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
> +endif
> +
>  # Disable the 'load' operation for static builds since it needs dlopen
>  ifeq ($(BR2_STATIC_LIBS),y)
>  MAKE_CONF_OPTS += --disable-load
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
