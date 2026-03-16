Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FCCF013C5
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9417260F1A;
	Mon, 16 Mar 2026 08:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bty2u4sBgpfJ; Mon, 16 Mar 2026 08:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE1760E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773648570;
	bh=VNhlWbzoY36LKrvfW3SPZk3ceYwaYwKOKRawhuNP0gA=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=e4eYk62id73EieFpcqt5KBHryznOrOUQnpgchZbcg0vBQaYVQfSL3vjMy1BuojWD1
	 8Td3m4NvZQltO07DyyQZ4s1PEZYamt4x42QgVmduMOzq2wDFyRbKjayLOWdKc6vxpI
	 ZWGvI0PBVKqcSDy8yXlkj0LpaQQilgu57amTPrevbtDFeEHEPkW4bBuwuaz07lIlDZ
	 9Q/nSW3POBKoDqc1eobhUNGG8a5JR29Vs34W+vvhZy1jQwZ2TfAM6ezf6nS2cgap7i
	 67eKu/NUqRzJAy3hrhJX+t/ZYLUQcH7z0PXOSEGWlfAsOLO4NDazBN6aHgOdALB8HZ
	 Zt/xBLEAn4uIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CE1760E69;
	Mon, 16 Mar 2026 08:09:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09B87D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3B47407EB
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZ-n-cmbAh31 for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1539405DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1539405DB
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1539405DB
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:09:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43b3cfc38edso1534856f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773648566; x=1774253366;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CkqOrHI0pA0aa9c4wVceDBxDBQs3wiDzTQkv9mKqqbM=;
 b=Dnsy9KmEPFuljdqj5ArFWJqS5XISNBWygCy/S8I3C5JFOMXkGUmmz75Fnrdl79fF9+
 RBGvWgAH1fB+x5oXQo3BZkK5UcR4pjH0XRw+JJzke/ilrtwoja2vN2JCwhTy6GAQXCEe
 J7aE/L55SeKhp/XqL3xvW2FJwSgC7bhk6cnublCMHbzVGIC7yLptHLplxh12P7uPxORT
 FgDmhHqgAMzMwHS6fYV+n2RdyRNIrFvRi+F6M6UqLBaspIAcc0X01mlsdkrGeuEj5qAQ
 1suc4OEPWkGubDSJ021sM3jnMcQKtA0XhIoCTvyGxATwL23oppHNTgtXQcwYwoJO8lfC
 xlhQ==
X-Gm-Message-State: AOJu0YwYTyK9Ld2rlNjnjm2R1tR5Am6ugDSHELosXUrBvikER++Ejd20
 Apj5+9exsFs2uqy11bazkbzUt1JWtlgAoTjY1iFRW7IS0iXFiZpT3LwzM4jaCwaL
X-Gm-Gg: ATEYQzx6mDahxfU97iTS7tGbpaDJww8XqpZ1I5TVgfkOCZtW2TJVQ7zoWC0AmIA+5+Z
 a52+RDjSmfJZf4zIrYi9k+fXufNA70eeXDsBnwGUTne5OfVyeWJ6AdnjRXkr469XxBipYTVZwaT
 Md7BI8dHyuoFZCoZyF1k3WWLzY5uNWEV2jp3VQEKx3F27tOm0RsRBG5ARHRNRg2HuTkQBBmoSbo
 fI5uPc1imdlSex4CKkp6C4tlm1OK0w1MXOmQ8+Ro6eOSgTA+798xViGuK709dsepUmEit10W3+P
 7av8Zcp+EtXIw3LgSCppOv/NE5cfjkxVemRuU/hv9NrHlgbNwuklNGLp00OfvxdS8KJV4308Bi2
 CbylbvPJpmlKmySghvtwmMMiGK9Mg/GNGXAF+lPhlReDyFiFT1uyxdv3Z4reyiETcZ1Njzhzkoy
 OG6KJw/TFzI8vkqUsW0CshmmGrQqgYp3PU14NyUNjxdTCQqc453q4n0pYg+D5q
X-Received: by 2002:a05:6000:420c:b0:439:b3d2:3766 with SMTP id
 ffacd0b85a97d-43a04d87c82mr21848991f8f.19.1773648565520; 
 Mon, 16 Mar 2026 01:09:25 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3a09e453sm18528323f8f.0.2026.03.16.01.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 01:09:25 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:09:22 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20260316080922.GB288451@pevik>
References: <20260203224414.192218-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203224414.192218-1-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773648566; x=1774253366; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkqOrHI0pA0aa9c4wVceDBxDBQs3wiDzTQkv9mKqqbM=;
 b=Zk1NLUxLMD6ToEfkaZ+4sM2YTs3FtXJ05+YczCy+b+lHvlhpikOqQhSObCQqXhS1bq
 47jXrsXVxvVWJl1kV0NY5LXKsfG8eYwXqNLOuSDMc1QTJVpqPaJn46Yzl7MBN9BMt7TM
 wZ7v7ogu5LOoEiMJI0hiOiqoWdJRHxj0nmhdhglLkOuHMumAz7YCZ37jQnbSS/5UImwA
 GQiJ9Wj9mNF1Lu2imrYVhbOx63UBiN9ZjkIT8rP4d/281G4DOTXnOcdBRO8XufRIO2zT
 J15GY9SOZ7CP/L+rgx+jDzbuxHjvsmH/TahE7vZLK814PmCrEiD6iINNWjUAHrQJsoAo
 GpcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zk1NLUxL
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: Always require
 host-pkgconf
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

> Require host-pkgconf only for libtirpc is not enough because libmnl
> requires as well.

> Upstream added it since 20200515 commit
> 553ca8ea3b ("net/route: Add netlink based route change tests")
> using it in m4/ltp-libmnl.m4.

> Later, in 20210524 in commit
> 6e17e2ba13 ("configure: Improve error message on missing pkg-config")
> configure.ac required it explicitly:

> m4_ifndef([PKG_CHECK_EXISTS],
> 	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usual dependency), see INSTALL])])

> This fixes error:
> checking pkg-config is at least version 0.9.0... ./configure: line 7419: br-mips64r6-el-hf-glibc/host/bin/pkg-config: No such file or directory

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi all,

> It fixes failures on these old toolchains:
> * br-mips64r6-el-hf-glibc [33/35]: FAILED
> * br-powerpc64-power7-glibc [35/35]: FAILED

> Although both removed in 8bab0acff6 and 573a113edd it's a valid change.

Gently ping about this commit. It fixes build errors.

Kind regards,
Petr

>  package/ltp-testsuite/ltp-testsuite.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index e4e3ff8717..12db8f2d3b 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -11,6 +11,8 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
>  LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
>  LTP_TESTSUITE_LICENSE_FILES = COPYING

> +LTP_TESTSUITE_DEPENDENCIES += host-pkgconf
> +
>  LTP_TESTSUITE_CONF_OPTS += --disable-metadata

>  ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
> @@ -51,7 +53,7 @@ LTP_TESTSUITE_CFLAGS = $(TARGET_CFLAGS)
>  LTP_TESTSUITE_LIBS =

>  ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> -LTP_TESTSUITE_DEPENDENCIES += libtirpc host-pkgconf
> +LTP_TESTSUITE_DEPENDENCIES += libtirpc
>  LTP_TESTSUITE_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
>  LTP_TESTSUITE_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
