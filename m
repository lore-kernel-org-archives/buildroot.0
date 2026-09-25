Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E9CC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 287BB60DB2;
	Fri, 25 Sep 2026 14:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwEgZNY1aRg4; Fri, 25 Sep 2026 14:43:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 21A5060D90
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347424;
	b=ZQC+/jzMbMbeNR8eEYBfRyqcUEJ+b2tMMmOc797NKNYkhtefGTe64HvVt5K5On+TMuCR
	 Hmq9i6wggHFQhhShHz44+ArWRB7hpktOXa3vhWGbOWzVrMZpFuCdnB1SEQsZveWjP1bUn
	 RxL2whUneHxSpe7+I5bSxvHJvdb3LcjM6Z+p5Hklu3DRZlrLDA01hdHG1UwilFPXAPTnr
	 6ANlrAKlKiQvJr9/n18k2LNLCpAcJYu/kyWac+mO0KESufi394r5VAU2daIEtUUyFymQS
	 +yCBXyiTBQ1YSuTQtTTMnjcGmvIi1Wzyq5U01vGm7gEDI8XRkxiGD9t59HRkHGa8VzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347424;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yU/TdbzBCMbTBS9fUiytWnHdOGylGPP68RJBLzxe804=;
	b=d69038qmW/apXVrs9ccSWCft0p6uakNiAImvB8Yw2mhMirqh9PFDUlBlBkVVzAewwRSj
	 shfSDcdybvg8N3a9NRP67d8CNI1fqZHSV3LSaGA8pX3X/f54I1cLEAmxK7hNr1FUFPVos
	 g+SkkoMggpkXSnW7IVahR3f2f7rOaZZGDnD0aQULON7ftlOJk/6IVvSlUqdJOArxNRUIJ
	 3D487Uw+m8bntRHVwUTuawg5kTa3W4pHvGT2KJxyWGjyXjTE2GI6T/aXq+mBV1KAtojdM
	 5gergRXINNRrOoPFJ5/HMqE9T7dn7N0vixFqWsGR6kOCT+uxJ6cWdZ1F4K6aXmUarGA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347424;
	bh=yU/TdbzBCMbTBS9fUiytWnHdOGylGPP68RJBLzxe804=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q2se1xVFdYAu91VnCDKTa1DLk6hKVy0Iz1jVl0mCAOZSLiJenmGVyCT7fGJEz+epD
	 R7NSA8W74z6bS4WXWWMAUGcK7bH8aoBlLCLo7lPmuTCCpUAW/8lm1jwa/qckILz4Xf
	 N5tfpIApoKCGLVzUZfgQW2mMRUgq+jT4FJh6X2D/E+6pLpKsoDQXK9GCCNGtbSsYIU
	 K3OCqVMf4TjX9JOArojJIt/XXc1Tv+n8gvfgdzfupFXeArBb7nl2bzc3QfLPmbQA8Z
	 da62XuKLKOVdsop4NnAghdTxmfXuoofDi6CCZX4O1JUDfLcmVT4y5+dOotYxo6pfd4
	 Ip9TR9k27W+oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21A5060D90;
	Fri, 25 Sep 2026 14:43:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBC9E332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D184A40475
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3PaLpK_qqUs for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C7DFA4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347422;
 b=LN6KfXcyLPhsYh9NNOw54Glb27iRi3RbGSOLFMNgVQXuQ+NZv+KUNrnCk+cTU7bCca5C
 9zvG/vARhRBJUYLzs5EVB0HCooO8qtED3v3IKpghUDru1AUbVJop59VQtQUYMYhNcXwd0
 v6F+OO60K2guo28uhxppnfgANg1zLqfQSF0Vc+DM26ZMVxwolitqZY2pgLapJY6Y5b76l
 Z6w43WPKMRwozaEe+ZlEzUBn8mxEVSNtJeAoaTpASBnrLfyDCqe5zkO2TVAyX/T91lkNP
 zElKVTFHi60L9kj/U0KmTNLsGkuNXJOMfO3LU7ztcAgCiQ15ak2sTOYI+qEeuQHzoWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347422;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=UIvQiPneV3RQVAsJ04nHgNLfRB9bVYKI+OgXR9n+Jxk=;
 b=QCEIaNsbYQTePphEmujFB7RUmGZPObRjvOC0bohttBrsJoSX0dtA/Di5anE2oGqoD/lJ
 N7iqrX7nvcadxoelO7qW8o3GxUm+reokAV/57mFQwiK8CmV3SeHawWchZhT5MXlnHPvvP
 JpHgLkW7Bg/Jb5guDHsljARE3sewvXPBqwLv6qRzB1delQFfw19eQw8Z0GcSTh1IBfKnO
 uICuo09kCrqlJ7iZu10/Ko71Ew3mNkCWNNiF+plHJPeuG076BqEjEfDgb6pJgdwbOKXcY
 /QvxHH4DJt61OSE7cghjxXK0MW02qdc1DrZWfB65F9oRvjVNwbbZcJRozbcd9P9Umhw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YmcKkYmj; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7DFA4016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:41 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so5907355e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347419; x=1790952219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UIvQiPneV3RQVAsJ04nHgNLfRB9bVYKI+OgXR9n+Jxk=;
 b=uC0lqKrk3GhLZW86cv6algKKBfe3JNWON+Dynb6tnaFeipjn2MYm4AiIvaTjUW2Kx6
 dBv4sOOniRGD+UiUOcSIP/rytkEvqSdHZAxAodEIGdI1jJcG2RyOjhvu12BcLauQ6GW0
 TlWOxfo+Ay1zJOic4P5g9k0GwlIjO3YTTC5+uF4vH6RTwhapCVhD0mZ8Vx54lPet0HFn
 PITl080OSOurTTvAnb0fRpf1N9y82FZ2RRhYNQ71KAmW/ZPoJGfnhJEcVVINNmk+IlRN
 kefd/9rIB416Tmzy1AuJyleBKKHhQHDPj3lfPKzdOSOATKaGD/883PUfm7g9jXMovubg
 xLWw==
X-Gm-Message-State: AFuF++kGTX25lGtBKUFO2kneRLi3+iunv8CSvbsN2e+7wYvMmS4AxoaQ
 elE+QFeL3+gvr19Fgc0VmqzeRYEbsqe3SGiySMh0aE+2NIt42tRCi+SyInmAZ8Bdlqn0Od0lZZA
 E7PCCdSCvjw==
X-Gm-Gg: AYBFou1iNErKFvIi79QKb9DOQIujeIKNeyxqrEp+JvA798eLhKNFH6sAxsoa/1uaaCF
 dAmDcqVTzcTYnjq+NYf/a5/p2V7avzoCCKD0vctDcD/TSync+Zy4OyQzbya5HcfbXebSIMyr+D6
 Qup4iZgI0zjjvRp+/+3q9hXqTsKZg4XSLC3/GmLqqS73MxML7VRxHcUDB8AP7xzimSyYKCp3iet
 1YNk3wpF2sizst9twvKP1W0kdLhPWEzHHDpTOIfJ66ifqbskWiTxgHIE1qMwOS/W1Q6B8HC7j2h
 cHGWx/zGVSgbZ3VuzZYpQg0Sezb7CFRESeQnvYk4B5ez9OgKl+epiF2CjWwiMDxNX7HdQ3tNblr
 28VNFbyDOSM4y+xSzsptu4wgtHBaXV0tZiZ4si/y8lyQ5rgMdWW7OpAVupu2ymbA99Q4ERTKf4h
 39S75ytHqsufyspABT92fgL/hWFwUhHctIJubVrjsChIcU5HqYmWlrxLsQGr+v2GCkV4rguIYDR
 uDFzU4Ob7+kocU9WJ9gp5zfIC/pO02cc5sxVH3r3Q==
X-Received: by 2002:a05:600c:870c:b0:49e:6050:9fbe with SMTP id
 5b1f17b1804b1-49fe66d76camr109686415e9.15.1790347419225; 
 Fri, 25 Sep 2026 07:43:39 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5df44f9sm145232885e9.11.2026.09.25.07.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:38 -0700 (PDT)
To: buildroot@buildroot.org, Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:36 +0200
Message-ID: <20260925144338.4094943-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825074344.74193-1-sebastian.michel@oss.othermo.de>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sound-theme-borealis: add missing
 license information
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
> Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/sound-theme-borealis/sound-theme-borealis.hash | 1 +
>  package/sound-theme-borealis/sound-theme-borealis.mk   | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/sound-theme-borealis/sound-theme-borealis.hash b/package/sound-theme-borealis/sound-theme-borealis.hash
> index 575cf31c8c..336c039892 100644
> --- a/package/sound-theme-borealis/sound-theme-borealis.hash
> +++ b/package/sound-theme-borealis/sound-theme-borealis.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  dd80a9c6317de29d42786ba7d95b114b64d06ec6c0c17dd18df853a5c668e727  Borealis_sound_theme_ogg-0.9a.tar.bz2
> +sha256  b21ac6d124efc0a25c1f9eae9cab321fc1a41979468eb9293c1a9218a5493e9f  README
> diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
> index 9242837bec..f37b54f5f8 100644
> --- a/package/sound-theme-borealis/sound-theme-borealis.mk
> +++ b/package/sound-theme-borealis/sound-theme-borealis.mk
> @@ -8,6 +8,8 @@ SOUND_THEME_BOREALIS_VERSION = 0.9a
>  SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
>  SOUND_THEME_BOREALIS_SOURCE = \
>  	Borealis_sound_theme_ogg-$(SOUND_THEME_BOREALIS_VERSION).tar.bz2
> +SOUND_THEME_BOREALIS_LICENSE = Artistic License (non-GPL/LGPL commercial use prohibited)
> +SOUND_THEME_BOREALIS_LICENSE_FILES = README
>  
>  define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
>  	for f in $(@D)/*.ogg ; do \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
