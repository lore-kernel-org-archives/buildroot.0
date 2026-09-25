Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB6C98324
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47BA160DA5;
	Fri, 25 Sep 2026 14:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrMAlDVXC-en; Fri, 25 Sep 2026 14:43:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5ED5860D97
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347437;
	b=bPyHcm8cJOUt0Klj6lef6GUqCYLf+j3SCDlCaNzo3G3zCV8QzcDs2OwNd8RJiufCNHd4
	 dDDnSwRAoz0gBMskVYENmyC9zj/KfaRuNThdYw3vr7/l+j7WpbHn+/vHLpnud55ILoEgR
	 ao9O2vYkU4gKY0RLYHfUqGqtZ/AA+Nh2MgrZSyAmdUnNLb8q5dH/+fZ5V6JHsu0HolzVt
	 6ZJNaSjBPehnzvrdv7w3Nf2zhKF/7N8cBkmWLB+HsQS5HUnEd74UQA0LE4RF/qWqP+mMv
	 0H0IZaRjKYRcDE4Av3KJAMrW2F44JwnKY015q1DW0ELGm/HUsqgyBW8SI8hOOmHHbWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=f3talheVyvuEp40ncahMnhzdKLorrAIwdeACEynZZHo=;
	b=c0TgPAp24cXGqjnCFqRSWIjFfPOamABW6aqPiahUO6YXLMuSIGh3Vve8H6vwMfcW+ssO
	 ZKwYfBT0xTUiRTnJD+FzBpHD5ATErQSOE+4Bb9SpbLxsCvJGbHqUCZ2CtSgjZ/0iWjYnG
	 8FqTcF2yIbY9NpMLU0f0zZ1uq9BqEIMbdFcVc9OpyWPXZV6Vc5b24klTRjYESxo0Z8g5w
	 jCbLlgd+Oa0HwyMgTcTQkPYdLu/UTng+csVYOeec3/7bh3JWSsPpZEn2SSQm9oDxA6qgj
	 Pepq26ftO+KL1byOHCbutYnHalonJ94VscjvKTeWND0m/ufUGGfrbf39yk+N3kLWp2g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347437;
	bh=f3talheVyvuEp40ncahMnhzdKLorrAIwdeACEynZZHo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NWKzavwC8Gs4aNd9PP84H/lhOHDBZotrfHCKRSP+nI06ijVmu/6hhR6QESU9OCyjw
	 OWT6n49mQkj8Uljbp6K5+PqP+2uoILMzFmp8jMwJki6/4z/SVXlalVqM7lL3zp1ErQ
	 OYY9DmHTQPQa4I+XCnGC1YCXWh89A2lEgaC31QyYf0cCDTAV30q88WCQUtmhCEZVvx
	 K+4SCLfDx88NY9RRlrGJsHO1i0LL5SrLoXSA+AO5/fxpDQd9EcZ36WWYKvRAxCuoCs
	 Px7E8+Jrq4athynxm6wtzhW4BqXeoToDw6fGx5P5OQETReMkXIcrLbeo55UlEEEZm7
	 npIRAa673XbHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED5860D97;
	Fri, 25 Sep 2026 14:43:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8064332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B981F60DBF
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NjNjk8Ku15d for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8DC9060D95
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347432;
 b=PFvotyKpDAdevRXDCs1oMagKUj6hBay3lrYqmF4oUm87YBHDGbhdrlBKqgcfRrTmVe+F
 uIo59YMGbkuWEwO5/8Mar7BemUkFTHv+d4AKt8bYjyjjgYmdHYmIBaGa5+qh1ZDRvVoOS
 8o2iqb3BnGm5z8DdaHuMECe0X0cnc0Z3CY/1TyGDDX0ufFjp9PIyyMQNoKvfmRPVZ+Mtt
 //CvZtUu7eMnfEZB6Yp5kqxvAhaP2WtkonnZMeJlXIb+6ZU2S11ush39wfaE8t5Ym6NQn
 euGy5AyiDAluTlIvdtaAdoUgUu8vuX/c1cWk5B97vgYf+GWpAgYeWKnVmY8n/Vhd6zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347432;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=HAEpgucp3lqXkNwmSziGrFd6786Fu/gwczLTrkstnz8=;
 b=I2t6SqMVcVtN6YPCtQ33CFVygbxw6JOtWs7f89fl/Ob16HDI11/uFZvsTWqkSnz3+g2x
 41S+gol3B+694smSCNookbQf8scp+a32Cz/J2gW6Tf+IRD9AeqXtyWt8aqyRiMAadQ3Tj
 plqUeir4/SBbwvqSVZ07IGAy7y3xkyO6xix0NJff7POk0s60qjZX/S7yxz7xAQi1wjdjS
 lbi/jjcsibu/Ex+btt+a100KOr+9iqhiI7Y4qNwRWOnEskdD6nMnoycSbocR94fWoFw01
 sw9lSCIxn1du4PMlVHR7lF/QwFV9YqlmuISgfm3wCR8E0kKtXpiQp30+sKGStNLmTLQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=amm78b8P; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DC9060D95
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:52 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843c3ea1f6so541678f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347430; x=1790952230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HAEpgucp3lqXkNwmSziGrFd6786Fu/gwczLTrkstnz8=;
 b=HmxbgXJDKa8I7fafkIzOr60boFwOQ2UEswheE5knSnsx2q2z9ZSJTT+3OusVXOyIm5
 8beEdLVr4v6MXI3fUoEsubQ0HzgZmHB3z6310WAaNcPsVYcTnmVr56R12uc36ZTk14Ln
 PHse1HujBBJkyg2sFfP/DzYO0t+8iEtlQVFwjOVHOAJznKugS0DXAnxJW/9B0mpwnp1j
 e/XNM25WFpYzhpVkLwVlyrfVI6JCFtLAhZHOK2uN/bWpeyfULu6lfHDC5nsWWTmMZXTR
 IPFKEAegy7D7nSt1sQmI8958zVOviAPFRxSBsUbZYM10ngE8kkowG6sczNU4RVLjXfzi
 Uxnw==
X-Gm-Message-State: AFuF++lGj8TeRTd/Yn0YBZUDUY8HuXHmOTs3h5vkdOa5n8g3eOBvzsHW
 3+4R2Ms3C/uBit7MqHjgwLne6HGGngBb1IXZ1GYpcMnkYeXAk7A3Tx41HFVACb4bvqvt0qqyycV
 1kJgvYTFTpw==
X-Gm-Gg: AYBFou0uuLIGwa2/caRzf9LDD/rpZEwVrdazROJkHU8aGhHxo1DaneBZ9OjBqXsmLDn
 p/RY86Zp2YFkXC7ZThI1auUno5X/P4Tf8V4DIYG7BY/2Z5zQI8CvuvW+yyUodBynp9qeoYIM5j9
 Jx29EqNpoOnCOBlYjGr3tZ8Y9/cGXQ5R3QgepeoWmRTwztznNAnQ2CRaIGkaO05TsWDZYkMf52z
 ofxsoKXcsGeMt0jZlUWSKRZyIY9IgpMVa1NgVE1pDr9e6PW08fDRyp2AwuDhIdoyI9J37ZHlPyV
 UeC+HSK6eQX3Q12c4lrvWOpBzlU6VsO4BBsDXqChYw/4Chv1MN/uol+wmNt70IxhXWcThVpA0P9
 M0FTYBhytfIPxL7WJ5TIn8edra8x/NJK9JJ1HZXJ1Utzx1dH7AabKpi4Ed/iZGFnOZ6ie9CgbcA
 n5WVSr430BPPiSuoLlU5toROhcylZIzjqF6zwtA/0xozEBP2YjI5cvgxr73vzAOP8ZMD9jyIq5p
 UD8qi5IcoITSLfVM/bZyRWjbnlgc+PWLjRC7lboGA==
X-Received: by 2002:a05:600c:4f4d:b0:49c:dadb:18a7 with SMTP id
 5b1f17b1804b1-49fe66cbb21mr124025225e9.10.1790347430199; 
 Fri, 25 Sep 2026 07:43:50 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4c8dsm174728505e9.3.2026.09.25.07.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:46 +0200
Message-ID: <20260925144348.4095216-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906105309.3690634-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/exim: disable valgrind when
 building with thumb1
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
> src/valgrind.h contains inline asm not compatible with thumb1 so we
> disable valgrind support for thumb1.
> 
> Fixes:
> https://autobuild.buildroot.org/results/720bfa00ca926a398e901366e7ab20d08cfa9a81/
> 
> Inspired by buildroot commit 26013972ce568e55a121c21a55afce45bc0675e9.
> 
> The oldest build error of this kind dates back to 2022
> https://autobuild.buildroot.net/results/85d/85d8e725a31bc1a3c41b2e388a17ff439274d437/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/exim/exim.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 5e9746af4d..482c7ca2c1 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
>  	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
>  	$(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))
>  	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
> +	$(EXIM_DISABLE_VALGRIND)
>  endef
>  
>  ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
> @@ -154,6 +155,13 @@ else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
>  EXIM_CFLAGS = -DNO_EXECINFO
>  endif
>  
> +# src/valgrind.h contains inline asm not compatible with thumb1
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +define EXIM_DISABLE_VALGRIND
> +	$(call exim-config-change,NVALGRIND,1)
> +endef
> +endif
> +
>  # We need the host version of macro_predef during the build, before
>  # building it we need to prepare the makefile.
>  define EXIM_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
