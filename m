Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5B5105F79E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D2D760EF4;
	Sat, 14 Mar 2026 07:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUfbe0otMZO4; Sat, 14 Mar 2026 07:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41DC760F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474809;
	bh=3XH7alry+O5TTayjcJvMODWQ6ao3WTy1Crxoxv96yh8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R7r3DSVk5qZpFp5qglbPG8ZG1nbCiaO49jW7CBBVmd1J2RDWvi+PYAqNWcYgizkjw
	 D3bMkPYD3kBwmc/ROycI/OVXSFP/Uj2acg2T1Hk6xQE04tfn1YqPjO7fqOZfY+DApX
	 jFmwJFQcoPUOTbIgavc6eOlQPhg7QIUUMiHY6M4c0uUw/QHSmRFT+F/AmY5zPqyDkf
	 hC6cr7CB3pFknP4OoALlDWsJhfqHO4pk1xWHJGk1Sg8M7cg2qakZ60H9Uo/r8RtUCs
	 k3YYlF1VoQig7z1eggU/D3abeX1OC8Fv/kjckpdhGr0ILvW5cNpfQTQ2591TBaF25n
	 /Q2Q8ZgO49/pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41DC760F1C;
	Sat, 14 Mar 2026 07:53:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA67A201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C02E8229D
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ku5WFZOr5NsE for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4ECE28229A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ECE28229A
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ECE28229A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439afc58ac7so3398589f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474802; x=1774079602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YDWaMbaZTWTgHg+t52OjcoSFnezsvAjoox/EAvbM2q4=;
 b=Xbqr3pIetBsyDrmiLqMM0Z3166XXrG5C5e/HtTT3bD1uy3NBYX54var38RyQWT1pXC
 iKHELVhv9OB+yMF4SDjVNsFRXB6172YFeM4YLV6KMFWbkXfz3T5N64qeBX/Bd0nhGqy6
 PZYZd42LDlL7lSiNcCT/7S6kZD7Aotm3dwgOL63PZUY/W7IyFvQSBSUakZHIAehCUQAa
 N/+5ZERNoA3GVo1Ato480V88iIGP80qevqtN/SmvISSByjMiR3VXekfAi9KzvazR/Y/0
 ey+dQgCmPIYOoF7nS4pjLhygiSmG8LVy2mTBlY2IMH9UkmTW2QH6oRsaBi1m3KahpYdL
 6QOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPvviGra2il0AZOKKfKMNvm8uxMLenqf50WGrG6v3jjaDn7ooHO9mvAJbm6k72AHheO10uke/bejk=@buildroot.org
X-Gm-Message-State: AOJu0YxIkfavYeFVEdexdqh3IJQZyrknHXgNOoodGy2G/bdfbF3ZY+ej
 JPhm5rTOtjKn6ADvpBb075IqOqNvaeOiFlItXtvjOXl0dd1OGQBgR25N9Mmwi0sOLCQ=
X-Gm-Gg: ATEYQzw5vJLCyBNboDOkf1tC3a4sDHbO+QBu94fA8K6JJFiDgciN8dDS7yPKE8VZeus
 Lu4d6LoA0nSEQyti6bvfEUGJCYfWWmSJtefRRC3xrif68eu3obzxxEMfPb+LMm24yL1h3lWEF58
 YlGnIxwJAKV8jrOpo46baBmwRbUHLbcAwWoJEkpjn/TfOKssodGVvu4v9lx3vfWM8Rd5F/hV6IK
 XMsUxARQbRbHJpqSjmC49xC0AIiX5tOkpvdzgFY2tkqdhrIdC8sCsH0GHablmmSQirBzPZkC3fd
 sFLtbPDRv6rY4xgecuFv8cxNFdon31uaPRhhdWIok8ZbDaoTciM7/bFo7zcUqt3WCG85xw15Fm1
 qXlmLWa/THnKH3m0SKAUijM7Z7R1VBaaMhDP/gMEuZN+Mn+2b39MuRQzjl/a5bQ+oAC4wcGFtaq
 EjTFZzl5CYuZUdwzg=
X-Received: by 2002:a05:6000:2dc5:b0:439:905e:1236 with SMTP id
 ffacd0b85a97d-43a04d83c58mr12510875f8f.2.1773474802134; 
 Sat, 14 Mar 2026 00:53:22 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43a0b2db487sm7958664f8f.28.2026.03.14.00.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:21 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:21 +0100
Message-ID: <20260314075321.14610-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304190143.3481181-1-bernd@kuhls.net>
References: <20260304190143.3481181-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474802; x=1774079602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YDWaMbaZTWTgHg+t52OjcoSFnezsvAjoox/EAvbM2q4=;
 b=Gz8MyodLUrvKttM6VqL51hZZWAI9aw3SLpkQHdMQHDFtHJViXkqmJugnkAvwhawARN
 iIB9svIQjFBJoW/hpyGf810x/zm4w811O/zgfuJbsXYOhGtZbIGuuGFqZH9geM8QPF+i
 QjlwrQlDq6zkCUE/+hno0DHQK4fwopxYASxyKyP8EKiRgOO/BrdehOAQOk+L0CD6sYHn
 JyyFAODtYjTpEIkuhVOlWxCPKBmp1QMamsNs/fl0f52hEo6dBwQfx0B3+cTRff6Fuy5d
 +BoxM+Ig1nOB4naseEH8WP4MbhfWQPbSIGq8SHm7SH0aCxvaE+nz6qOqzh35y+FHeIA7
 xTpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Gz8MyodL
Subject: Re: [Buildroot] [PATCH 1/1] package/freetype: security bump version
 to 2.14.2
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
> Release notes:
> https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
> 
> Fixes CVE-2026-23865: https://seclists.org/oss-sec/2026/q1/253
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x & 2026.02.x. Thanks

> ---
>  package/freetype/freetype.hash | 6 +++---
>  package/freetype/freetype.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
> index 2c6ab20e19..520e6c2bcf 100644
> --- a/package/freetype/freetype.hash
> +++ b/package/freetype/freetype.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/
> -sha1  20f7a9a3e2996aab82b0648e82d49a78e8813bab  freetype-2.14.1.tar.xz
> -sha256  32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc  freetype-2.14.1.tar.xz
> +# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
> +sha1  28200b8f8df5a524f476bdacb20f05da1c33280c  freetype-2.14.2.tar.xz
> +sha256  4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1  freetype-2.14.2.tar.xz
>  
>  # Locally calculated
>  sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index 00743fe358..fbf9d13235 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREETYPE_VERSION = 2.14.1
> +FREETYPE_VERSION = 2.14.2
>  FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
>  FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
>  FREETYPE_INSTALL_STAGING = YES
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
