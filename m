Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83410C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23ECC60E31;
	Fri, 25 Sep 2026 14:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XYHWiUHg0yB; Fri, 25 Sep 2026 14:47:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3380560EA0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347661;
	b=XjeAlJSelOIsW0wVOvlGMpKwRPI8HM7ct80YUsX+UFpCyrGREX9u3B+/yR7sDSpKfqWO
	 GUMnsIqKfhF/3uSLpDR4kZ1kxBIJO6fxd7gdjxDWiIB8lnEvJT658aO+sR7sCN9NJG3qZ
	 CzF4I6LvCKJQr3n5RJkzub4VA7scIly1gaMS9tYU0yPWYdHBnm9lwbL39KXI6NhJ5b0V4
	 rCDK0qY9rp6aA+6qoKXv/n5XDp5jLQQQ6d7dAgAq4OmNOEUI/w1JdxsPleQL/pWLadkV0
	 FXq9u+ZJLoKdfDQgLyat1WXFd4aIX2SYJgHlOXjsaZtDilF1fBfzDqUEzwlc7xd+q8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y2E41jYLiEq9dv/ZkzKtMcxDdMFMT0r/Kgs+uYRpP40=;
	b=nM9z3RdiUaG6Du5YI9rgcU9QLWegXQllRMW2Dhwim0vS2kqtC/nWkkrZnOY4zVaRe3eP
	 0qT5IRuUOETMVCpvI63iAeX81UiKmGCYDWW6pVcBpv5pmMHt9HtYPKLJxHoz5tsrkYDtu
	 FSBcyOXElgBcc7d4tgEL1wXiwGZgQR3X4ubRa7nLAFHn7ormrhXFyshP1ouuoJqaA4ya+
	 Ypor7JVO3uwdcXdJAvcimzsb+B5FE848J0KfKjAdL4MlpMevGbMnVm4HeIDcF29TS0dVB
	 9+ZSj907XmhbwvMeP/Qp/+41b73nip0Pw//DQljdKLHIHcU4GZx6qDpwY/vS8b1CURA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347661;
	bh=y2E41jYLiEq9dv/ZkzKtMcxDdMFMT0r/Kgs+uYRpP40=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kfOsr1g73HGLNsjeSRT/d9/q+/F0TebsLnxFqwotkfSCflGoBcrjclSo7xgjvEFmH
	 tLMRfX/UhtlysVLkNiu/W+gDqF4am15MPEOxnuQhEL0jZXAlcS/Q51Fur1MdUmZwcm
	 d+9S4/XTdR1mLAnSiCtVLJ91OCA0wORB4vgXXu+Gn3PlAGjATlF7tSMvpIKRBnOP8a
	 y49RSyqSIQ678tEZSdZeSnLDVsWdwYu4//0YFXsY7h0IrXOrdCJMCdAm/s8oMRTIsd
	 hM6pgJ5ztY+rpkC+EJrG0GSaFLq0ZxlvSjLUgk9IetO9q+mSzLLUwruUuPW11w9DqI
	 LF25RMcxOrmGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3380560EA0;
	Fri, 25 Sep 2026 14:47:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8713A332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D6B140181
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFtolH4tM0nx for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5D9B74016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347659;
 b=WfbM9SdsN5qo8HDxm1/FKSbOxPR8C9Am4bIGkTBGHeRaXRIAmpCLnKLiM0pSgJ3Ye48W
 wyn58pmqDBMpF23MibpJAYuEQl84EjtJf/27HYGrkoRQQj8yHO0XTzVac85UQ6dAn1znE
 EOqs5IlANk5SYQxc97i0SmHAKTJ6RWa46bzSGjZ/nGl1IW47zsL+4fGxM6bbGY6KLelYP
 EdXVX1OeG+Z2o3nliE+nlMRuEAfMO+Up7rS0/omcJT8LP6nzzPzg62pJp77KJTk24j4nY
 GbC1CEussx7a027DH+fAW6H7UbxYxUZUzdbrJ/0j5UKqKUWzob8AvJb5hFPNHgbYXyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347659;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=xuYwpQ7c4X16WYn1OT9errk+DtejakVu/6//KI+8O9s=;
 b=dgMPRd6u4vXWfIqXf+ZDy3mda8DgUG+d6fflSyoMF30zkvzS6T/kmMwpjtn10lesPWqR
 e7ccB725h3qDtx+2wQSbhTp9kw+Ri+lxZcZVl9dxDfK4rFYiBXu7qLmzZ5VhTjtcUj3X/
 +jmgWlD4Sxcf+5xVUWClGcP3uqbmLJ+D6kmCbY6+9r1m3UHgXNou2hUWmY7Nlw27ImhZE
 neUA5BwGUcCQR8sN58LElGBCSi2Kh70iAQ5nXk8O3FNt2wS5x5osrQCq/OuA71k+Yfo7L
 RDNsD9d9m80WPvl7AeWzH4JVROpR3j3RFIpcuWHd3oswwtXWeQ0Sc8vLq70Expwo3bw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fcAuHdUy; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D9B74016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:39 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so6906295e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347657; x=1790952457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xuYwpQ7c4X16WYn1OT9errk+DtejakVu/6//KI+8O9s=;
 b=1Oxv9vW2pGWgHp0JZlu4Adj/yc9CDEtcTlSAK96PuUB6uwHktn1oS1JOJGHJUTg0ET
 4k1A5tXgnaMilxltJ7c3LbByD1GURPaX/m4ZUErEoeo+SH6HbfMIjJuiW8FQI/w6VV94
 AMXWEqHoESH77vC4j/dX7HZVoIuLDqpNnnfjK2P/QmtQO0w7OyH1bZv9pPTxoJUChvct
 o563UlZ6gAAGI/v8XDakwbB23VyvUTjVszJ7RcdtYUb5dlPrhVkBPa8D5LjQZoScbxE0
 ifXSkfIR3GMWzUH2kzcmgOgyOBETSV4BRD+q1yIexc5vDmazrI+/V6dcl8cHQSdbFWFP
 Jvxg==
X-Gm-Message-State: AFuF++mD/lJLNdTpOxonCyuITAfkxDdVqVOro0J/FUPwLYhKDy3N7w33
 XoPMSg/L1hPE+WAdo/AF2+Rdj1UPIj7dGwD9rih0IwfcsOBwfinBA8EDRuqCYy7qxDS0bMcXJdo
 rwXJlpZqvhw==
X-Gm-Gg: AYBFou2UHg59Pkt86G1iazBdchzF791LWBCpaORLXB4PSyXRRTNS+piI74Q6Yo39U05
 stM0G4zP4owoyqIEhwItFwsRLcO79M9lGcKklzwxrL+72AQ3wT6s58eCVqK3CaKAFAx1fxWc/6E
 Lh99Xdlu8DBaAKkCGcVCNuBbB/qHXrfkev0W+il+yzXgCvxpheSoUp1u2u1C/tqAzjaYIAmUqsy
 i4NCVK+iSZi2h3VlfXgxHlwDkdj62ljLIA5eKHMwiL/ByNI7j66nTPVyAVfL+s2WvkWH7Lt/uAL
 /W75szJjXu9ULYja6EnINK1YHKHbiLOqfMSfIMb3rW1DhrpbD69WEykBd4JJx6i/Vdim2jAs20x
 VtYjwUk+TI9FJkMFemxmqEBlkaMYnMc8DMf61OxNfP3xZUz0iylvJ9u4AJgIH3xE9rbal6Wypfm
 4vd7nuiUYBJKaYCv6XI4PqhXbWMmIxyXJzXYt4c76yj341ib3DBLzX4Yxl/Kg5qgn9mAO2lm7kL
 +3Gp+zduXwduEWHHXNq3wxJzb7L0NxjXLYlpt2qykcMal1rGbl3
X-Received: by 2002:a05:600c:1546:b0:49e:7a00:b9a5 with SMTP id
 5b1f17b1804b1-49fe66bdee6mr104066445e9.4.1790347657112; 
 Fri, 25 Sep 2026 07:47:37 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a355d96sm8500575f8f.17.2026.09.25.07.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:36 -0700 (PDT)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:33 +0200
Message-ID: <20260925144735.4101421-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260921115925.117991-1-titouan.christophe@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/{glibc,
 localedef}: security bump to version 2.41-163
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
> Fixes CVE-2026-8674, see
> https://gitlab.com/gnutools/glibc/-/commit/c97fdd483232a831829aaff458a212307f1bf4bc
> 
> (alternative to commit 7162c4daa58c7881d0866f5a64c525bea1c58867)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 2 +-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 0243dac049..b4549549a0 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  987c4f5951a25dbdcc0b76deddf4fcb97a122cc4f505d351fd44863936e7d903  glibc-2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e-git4.tar.gz
> +sha256  b369d2b38357104ba1b3848bfe4139c6a4dfdaea28ac31b3cf2a3985fb008a93  glibc-2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index dfe599b912..34a6175855 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e
> +GLIBC_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index e812ce36a7..3412db3c58 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e
> +LOCALEDEF_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
>  LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
