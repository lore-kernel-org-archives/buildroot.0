Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18741CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD7D284B16;
	Thu, 11 Sep 2025 19:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrGJ-hB8X28A; Thu, 11 Sep 2025 19:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E4A84B19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E4A84B19;
	Thu, 11 Sep 2025 19:28:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EDE6443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7121A6F4C4
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSzMjPGxH73E for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6153161CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6153161CA8
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6153161CA8
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:28:40 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62598fcf41aso1452607a12.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618918; x=1758223718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTu+56zxVyp3GDO6Ehi7/7DY74Fm1PBMqdOHF+bk7b4=;
 b=t1ON6//g9mWRgkiZK1ppLEzlcdcfsDpHbfKNzlaI7nZT1TtpG6uLe7JWIZcmVmjz7t
 9DiZsJ8ma159u0C61jMWffyGnKDDdBon57+EWSYsTr2JtbipJnGJFSGKS4orNKoaTNDb
 OatrqQOBsGKR2jTIVeYaiW9KccEXNaaGYmwbclYIuEyeMofpBIj3J/p4vk5uvwVqlX6p
 rrG0w9Fws+ovLgJ5ChgTJAPJtEnRsL3E2NUy/byS9VwzPAN9VSkxwCcUFxFeqP24vOdw
 yxXeJDp0UO8YmtcWc2foW9ni7OpsnubcaVsHIs9fU1Dg7z70WRIYumi1F+/8dGQMGxuv
 +UIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpP0V3z6nAlYG3bJ33qPFHo52cVb9kEhAiMhMqCSJ5wsC0KNLVBjtT2HphFrxo2H8RZH4CK24n+hY=@buildroot.org
X-Gm-Message-State: AOJu0YxwXCd64Jftzrbm+dzf5AZMmqBmhkbjVCNx6kRI4eHjb24NRW+/
 Sogz5pQwklVyMsaAicFnEhX/UFebkDQqftm4zJMDDYe6SZxjuvbFEkdjdTe+w0ZMEYc=
X-Gm-Gg: ASbGnctXp4DcERAV9dk5vj64NUPgzTQIxrYivZ8qkocuiKYzJOs8tuMipJKvltHwlmv
 /KFajzLMRGz6vY6hGgLlx7Sg4Yvwv8RxmgPyDp75smoiFUT3+vsBEu7LTD1QhVSkJZz685jgxnQ
 caumbiyw3ML+Bjgmyqoj0BVnsDWFwVDiPj76GzcTOLvU9qIq29k5ToI7oWFLoip+K0gp7BAe05W
 IqdQS0JDVFgVl51mgg49czvlnhuOKvxeCUvmRwORLb97ku2EQ8Ry5bPLNorqFDeE2QaMHJKZ43D
 TNXXtqhtm2r1XXg0D88X72/veeT6pGR/XNDKQ/4G1w426BGnAqXCNraljRO9q/cG64o5loAv4tW
 tMPLvvlvdbE0dSMWOMX8EeLeWJ8Vynh1l8RvuFkOiRNTc7bg=
X-Google-Smtp-Source: AGHT+IHHSvzZn0unGI+6L2TLEG8iwbU7xik51+4VZpSZXCn7Gc5fKXKiKP+ovLC3xMccBlMWqxI8yw==
X-Received: by 2002:a05:6402:34d4:b0:626:4774:2420 with SMTP id
 4fb4d7f45d1cf-62ed8288fe0mr680689a12.20.1757618918359; 
 Thu, 11 Sep 2025 12:28:38 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33ae181sm1820604a12.22.2025.09.11.12.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:28:38 -0700 (PDT)
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:28:11 +0200
Message-Id: <20250911192811.2673038-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829092055.518106-1-arnout@rnout.be>
References: <20250829092055.518106-1-arnout@rnout.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618918; x=1758223718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTu+56zxVyp3GDO6Ehi7/7DY74Fm1PBMqdOHF+bk7b4=;
 b=ZNzOA7SBy4IpL+DQ8Q2S6gjsjb36xeagkyDSCHr5T3nOCnMKoYp/b0tqiXfQsCDFhS
 S1khrIyRGM/yI3vT/S+5Iuh+JlaqqfdyqMGaRa75IVPgEoAtxGtu1v7vdBuFFrX1aauX
 Qp0jZEzOOX3HiSIAgzlhQ4If6cAOYzNSUszFzmPs1ZwD8uymJLy5vBNzTT6IOaiWVrVM
 63HzLL8vSX+UcK7Yg9iGfo4CNiaIAHCc5xWcN1tEYd0TaBwqBchn2gGYGgLZENbrIaq1
 Kbv7+T8/p6wsk339m4+3I1LfmzcLqoALFMcqdVvn92Vf3EgduDuZ3SeJuEWbTgEPlIwT
 emLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZNzOA7SB
Subject: Re: [Buildroot] [PATCH v2] package/python3: do build-time detection
 of non-working toolchain
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
> Since the bump to Python 3.13.2 in commit
> d63e207eb869063f82c867658676c2903beb08cb, there is a runtime assertion
> in Python when the toolchain doesn't support time64 [1]. The only such
> toolchain is one with uClibc and linux headers < 5.1.
> 
> Encoding this dependency in Config.in was deemed to complicated (cfr.
> commit ffd00280315e60908d0d317b1dfb4c714590a03e).
> 
> Instead, do a build-time check of the same condition. The check itself
> is a bit complicated, but it is localized to python3.mk and doesn't need
> to be propagated to all reverse dependencies.
> 
> Testing such a corner case toolchain is a bit complicated. It can be
> done with the following configuration.
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2018.02-1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_PYTHON3=y
> 
> It needs to be built in an environment that has libmpfr.so.4 installed
> as the pre-built toolchain from that era did not include it. An easy
> way to achieve this is to build this configuration under an old
> Buildroot Docker container:
> 
> IMAGE=buildroot/base:20180205.0730 ./utils/docker-run make python3
> 
> With a build-time check, the autobuilders could get build failures when
> generating such a config. However, the autobuilders cannot use a
> toolchain with this configuration (they only use more recent
> toolchains). Therefore, no update to genrandconfig is needed.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/issues/95#note_2348479811
> 
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

Applied to 2025.05.x. Thanks

> ---
> v1 -> v2: remove genrandconfig change (which I actually forgot to
> include in v1).
> ---
>  package/python3/python3.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index ef0658262a..1546915f08 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -315,3 +315,11 @@ define PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
>  		xargs -0 --no-run-if-empty rm -f
>  endef
>  PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
> +
> +# uClibc without time64 support (i.e. when linux headers < 5.1) causes
> +# a runtime assertion in Python. Encoding this as a dependency in Config.in
> +# causes too many problems for propagating reverse dependencies. Therefore
> +# instead we do a build time check.
> +ifeq ($(BR_BUILDING)$(BR2_PACKAGE_PYTHON3)$(BR2_TOOLCHAIN_USES_UCLIBC)-$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1),yyy-)
> +$(error Python3 doesn't work with uClibc and kernel headers < 5.1. Please use a different toolchain or unselect Python3.)
> +endif
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
