Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BF0CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE56B4089A;
	Fri, 16 Oct 2026 15:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmW3MHsuT2lZ; Fri, 16 Oct 2026 15:04:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03A5740AD3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163098;
	b=RrlStAm+XWbtVqCNH+sT3Wdkc7phLF232lUs+4swVZk1BzFEayn85Rf6DgZvIzQosFMq
	 dko5Ga3BRQ3Ridg8XGchjd1/GpfWK1I/d0GH043q99p45OjR1p1UOItST1/lHmvhDia3V
	 kq65cvQ0F5L9k9zewU/+LXUi4DVprm9QdiFbTH74pE1eUnhv7mewVzjikSXNpQsCxCksZ
	 gYKjsw6hQCslrj0L/SG3U8q1ApscfLwBx2NwqYN/Dyn2qNqCKJuiGXzH7JydoWCqYFN0g
	 chky1rtLmnxdqVH5Ftaa7eb6TVojuzUHOVpNnSyW7eJH925kG2DpmhYMD9R30kLmq6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163098;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1uN0G+GBNL8umMqk0TlzWk0K+8P9n47nPbPmZn6y2pE=;
	b=qQM5ABYtR2rcdcrQtOYdqDmceahLwsNdVv439sRPt6RxjuqGTEckYpB0bIq1COMIK2Nb
	 Wuryg/i4E1FKPxuO3tqCTcMXmtg+XfQ8a6tnxJLxzUoy/ArKveqlJ2x8T8A92Kf4RMONy
	 OnLvDIFB+6jrAkSsXUgcywUt6ZL+Tqb+xs52kFhGeav3B5wfo8vzMmSEBYOHQWz+p/mII
	 ces45b8mmhCdUwj4Xb2czBNGQhDbYK1AT6+yy8LhZkWMxBHqQMlW3dFycuRl1cqzOUOl7
	 gO77g6o9GTQZ3yz5oCYlQkNZz7n5dRF8egXPq4Z4GW+/H5aOsRYlf5dWVLlNDur4bow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163098;
	bh=1uN0G+GBNL8umMqk0TlzWk0K+8P9n47nPbPmZn6y2pE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lErdX3L+6+kRSvKDU+Ao0ikv+FiFBa/dOqmcE8jRnfXScDIef5Kkxsixy9VRVQDDC
	 jDyJNMSLuqI5yOb/1F4PIaEfk/UVllFQtBtAW0AMvWHfO5QXcbE6c0mtJeioRf2znc
	 jhI69+KcA4luMWCErxCQ4QYP1Cz7+GEJ+0UQeOZ1J8f4ybmzfcXYB+kK7VBoKUWfpM
	 czJbOPRe4vPtARh7v7Zf9d+gONkw3L/TToLtkfRZUcUhjDe+O59YZ8yHMR9O3V2dLz
	 A+jxixlSrcn/FQFeiQ4meZlXHYb3KIWPrI4rz4ZxngBZWy/7Ip0AktUyQx47ngVXim
	 6yOFi6kyesy5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A5740AD3;
	Fri, 16 Oct 2026 15:04:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6CBB7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD2D4816DC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUTtlW1ydAOk for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 93A4D816D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163094;
 b=Q+x7xY6B2wOIyiSU8qkqMF9zfKOtHr1YFsRbjXLHxLbGOrYzsjv0ue9IcuxDDvm/E+Yj
 3zAvwDP9v3XENjfmKBaSaasZWSVKfoQlpQONEoGrA+TS/+T+r94a6Kgd8c5+78XsYQLmG
 spYU2Q9oJGLVvQyhBAV+CJx553WtuG8JDaLCPe8TX6O6RR+70Blab7nBTpA7ytipOPiEd
 rvz1Rw7Ti7vrx3GlPt6reqbaqRn9c5BDxOVe2oK1WpZHKVwdQNG9n2AU5LkKnA7Djby4n
 wvi6bXP6zNl1u6T/Jg18581FC8Ztkwl6+ejTtcRM64oLrMornw+1LpxYqEEnmcTL8RQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163094;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=xpPMrN5cGcrI7vYTYdvQs51Wj0ojulsXeCn6iZiUL4o=;
 b=mPDpybJMsUo6lagafN44TBagiMsIpIwICcfeAIf9nQCHYwE/5iV3zx9qWIDXXhpzoCLV
 3aFtSSmfqvQYqvqlSKkQAjWgKdxP/QiIGE8PRDsIQtWQnumRxcRfQm9JTCv9P+ZjJVpLo
 EZ1y+xLmpTsbLIgj0tZpkic+/KizurMZdRS7uU3fsEypYpIRJBhMVufzOREDasKkfU078
 LHftksJsDBqlyo6zD1UMSgcDF7hOkIGNZ1TIcVfZkXM/tHQKeG5eDIandap+YXCXscoxg
 qNNPtdAifiecCeVG9g1NbMGgMvWT4tzn9sH8k941gA4iKozWteC3W2EA2ECOa/BK+DQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PkNbbtuF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93A4D816D6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a171b677d2so495855e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163091; x=1792767891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xpPMrN5cGcrI7vYTYdvQs51Wj0ojulsXeCn6iZiUL4o=;
 b=eVflamo0Pwd23dtFVYgeNNudyP/4eWnkVLeWUarv0S3hRcDHtgObpDNTcVbqgEEPib
 UvYfAGpbMAw9e3o9lA7HfeRG3RVBXSw12dPkaWkpR4hGnXLtwIMukpPxM/V28nQGwq/0
 MLw3CkkhxvVWOaamUb8HAl6fMHT8yYzlwZ6DiCuaynvW2NC4yehOV9j9xNdDOLRhp43G
 4wo4fhyIhnVe8J+HtOoIgA/1ZklIK5r7YWip1HYLhuruz+F4/Q3v2c0FDR0/cb2YnyKl
 Gv8lPVASGvc2mraqAqr6ihiQaExeB9nAunV5VBoTlUrGB903ffJjUasFKRX0qS7MBTQR
 iDsA==
X-Gm-Message-State: AFq9FYJ/+DT5UgOr71feAEhl0zObnMjrsA97QZWyCWn/9ScCGMqFB7S6
 QV08HTXYD6qcKEurXLDNCA7PnST/SwMgyYemfoXKEukXPnalYyvwmpROwXYZmteT9vCloIZhPrO
 WAtwHuxI=
X-Gm-Gg: AYBFou11z41Y3S8yLu9xJr3izfguq88nYj6lmnQVVaFNbvBeZImdvhDrNc/6gkCQEMN
 23da6MuQoDeF7Nw64RW95tixZ+gJjTGGygs/cTpQY+EYbFbqmd8/bc8Q3FggaXcG+9JQvF+SWmP
 XJ4ihWoh3tKXNiLOzpxHCD1rQKCqeEDcxapm1ouB5VkKjHToUpUmhgnotdimVnGD5qdLbqNhx++
 9VPx0kUAucvGCW8J/4IKZRE3xR6qlU+MFvdYxzvB7H2+N0jSZ6FtWUuwDYiXTKsmjuhid/bJFN7
 GVDKtzg+P38hXc7mc0x6vOH8K3M8fAIFFGjyQjNcM8wYsw+XTKhefbLqiyVMYHrqdEiSxzpYrHG
 QOizdEIKB7GdpNTwNZ5bSKc1l6jO6KRXwZLIG391cNvaQMdfq/A/UXzPxZo4SSoeDNdeeDAIMTH
 +7GtiQm/dmV7eSHX8E8qQrDheh9+e0dwPQdQmhPBg+BOLCWWEVfxC7r4M8pS01htQdSyUTz0q36
 DGUK5Y+dCVzSLyWvjTtwrQJ0iXcHAbR4BoyEHjW6w==
X-Received: by 2002:a05:600d:82e2:b0:49e:6861:50f7 with SMTP id
 5b1f17b1804b1-4a1d75f2bb7mr2036795e9.5.1792163091385; 
 Fri, 16 Oct 2026 08:04:51 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8cfesm5030596f8f.37.2026.10.16.08.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:48 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:43 +0200
Message-ID: <20261016150445.68841-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004180224.1782750-2-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: remove 2to3
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
> Upstream release 3.13.0 first included commit
> https://github.com/python/cpython/commit/ae00b810d1d3ad7f1f7e226b02ece37c986330e7
> which removed the 2to3 program and the lib2to3 module.
> 
> Buildroot commit d63e207eb869063f82c867658676c2903beb08cb bumped the
> package from 3.13.9 to 3.13.2 but forgot to remove its handling.
> 
> Current versions of Kodi do not need lib2to3.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  Config.in.legacy           | 6 ++++++
>  package/kodi/Config.in     | 1 -
>  package/python3/Config.in  | 5 -----
>  package/python3/python3.mk | 6 ------
>  4 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index bb6257f532..9ba6ab243e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2026.11"
>  
> +config BR2_PACKAGE_PYTHON3_2TO3
> +	bool "python module 2to3 has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The python module 2to3 has been removed upstream
> +
>  config BR2_PACKAGE_LIBCPPRESTSDK
>  	bool "libcpprestsdk has been removed"
>  	select BR2_LEGACY
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index d64a6fee7e..16b86f3fe5 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -95,7 +95,6 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_PACKAGE_LZO
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_PCRE2
> -	select BR2_PACKAGE_PYTHON3_2TO3
>  	select BR2_PACKAGE_PYTHON3_PYEXPAT
>  	select BR2_PACKAGE_PYTHON3_SQLITE
>  	select BR2_PACKAGE_PYTHON3_SSL
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index f9d3d3aaa2..c362c52ab3 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -41,11 +41,6 @@ menu "core python3 modules"
>  
>  comment "The following modules are unusual or require extra libraries"
>  
> -config BR2_PACKAGE_PYTHON3_2TO3
> -	bool "2to3 module"
> -	help
> -	  code translation from python 2 to 3
> -
>  config BR2_PACKAGE_PYTHON3_BERKELEYDB
>  	bool "berkeleydb"
>  	select BR2_PACKAGE_BERKELEYDB
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index a75af82ce4..6c9fe2178a 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -75,12 +75,6 @@ endif
>  
>  PYTHON3_INSTALL_STAGING = YES
>  
> -ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
> -PYTHON3_CONF_OPTS += --enable-lib2to3
> -else
> -PYTHON3_CONF_OPTS += --disable-lib2to3
> -endif
> -
>  ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
>  PYTHON3_DEPENDENCIES += berkeleydb
>  else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
