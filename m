Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E23CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634D641703;
	Thu, 25 Sep 2025 20:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUzRUpijYir2; Thu, 25 Sep 2025 20:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADE8416F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADE8416F2;
	Thu, 25 Sep 2025 20:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E728212D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE65B41275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqpOiKlYsRIb for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D14BF40066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D14BF40066
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D14BF40066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so11592935e9.1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831417; x=1759436217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uDorMLPpaFcneDd2htJ/il+CcRjcdb+5ePwXb8UXORM=;
 b=ZV4CLyopV5WkSNZZzuXit5PEVQ4nGbXFRoXeOp/tPBhaJRKta7a2nKfNFxP7LP2gqc
 sju2oQtJQA+mVzWlJ3P2cJiUd/9eprJnaLgTk2kxKxgfgoUGx5dG/1mhRXoMZ5hzz04o
 T/Q3aqEldDIYOKwR4VW5Rr8wGNwCCKieYjQcLFCGBMxXjcZPoluVdmECOME5PKeNw8iD
 jyG8ft+FjhuaCMQGqwdhUgUkYJ0dUoSDNMpoWrRIYYy/Df/IThiH4/q9zNC+D1NhcHvS
 lBPjCt9FQC27mhH+Sd0eNLXiVxepdBaYNnbQTnghHi9cwTYVMBHEI5wVHNAkMUG92GJQ
 utGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsuLDsEQRqpzb5EsaOhYyyfXmy65e38D7KG+kT7etgu+6LXTxYckuJgcR2WHfnxQfylFulqhB46oM=@buildroot.org
X-Gm-Message-State: AOJu0YzhR81mnkDhlr9tVkmdgXQmTGYqj/Y6wmja+Z7FhbV7iAbkottb
 qQP5cZFBagyn1pDEnSr17XXrdG51OGtJeGO/Aj/i+mw0ElHRP0iiYMjLeE9D8qnZ6fE=
X-Gm-Gg: ASbGncuZiX3b29187uAUWo8z9fygJ6d4Dh3eMRqd/xdYrk9hhEFyNKBa078UXFwixq7
 3u7oNFFP2TqiIn8mmx5FjHpLi/RfmM34rNllPJcvqGy+SDk+4FUGaXGHHMRBAysImN0ySaByG+Q
 PPgdel/aH/ft/cAG+M2eDNUsmUe1LAVvapPJo+t1LaOXeI4BVnQL+seb9bCkvdxu+2O0IOmGLJf
 rulRe9Y2J5WyAARft1yepleheIYLF/rvkaTMkWbtJi2KAlCAb303BtBgHgOhbDfspE5FPLLPr3K
 oV82aV0Jua3KUswJc8QlngNYMq5eDTQCIPnXZlyTqnPxb/EenUtptWS7wAZKt/por8zFkts3ah6
 QphXEaB1CTzlDWedQlyTiGkOZkw==
X-Google-Smtp-Source: AGHT+IGA9YH7L0L1Sv+A+K45TMcEEvzaSnOhzkZHnOR1jC9yemgxG9T53iFbYeFDp5PYfPgQUQsO8Q==
X-Received: by 2002:a05:600c:524b:b0:45b:9a7b:66ba with SMTP id
 5b1f17b1804b1-46e329b5a17mr45079025e9.14.1758831416869; 
 Thu, 25 Sep 2025 13:16:56 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc560338csm4320699f8f.41.2025.09.25.13.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:56 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:56 +0200
Message-ID: <20250925201656.44080-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aMuoZp7b7IWmRRXs@waldemar-brodkorb.de>
References: <aMuoZp7b7IWmRRXs@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831417; x=1759436217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDorMLPpaFcneDd2htJ/il+CcRjcdb+5ePwXb8UXORM=;
 b=efBveftPkWJlFA8Ky5E4Zty2r/nKiShpS+hlKmaN0k7hc7wF4Cv3BIAPd6rcfL+RSa
 dWRvEV5HXtZkFTQ48Q3gdfh32CpD+duRePqBtXbteX0+kbCTh9N1xBE2G6xuZR9kMmJ8
 l/J1kVql4SwzybWJxEHfF3tQmxSHDDa6UEPTA8Vyc7czxc91NOeMtUVoxq2cEamb23oU
 zUi/qZ7PrnpEebdZThynzQCpR78SCuLtxFasrqUwGZBK2KLzsRA3SQGju+5/jYZWV2AZ
 pXncTPV0xrwrERHb0JafS7bCb2p0E0uL2ZlUu4Yd07P+6abgHIrgsfRmBYTM+hHrQZFY
 nZaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=efBveftP
Subject: Re: [Buildroot] [PATCH] package/x11r7/xapp_xdm: needs libxcrypt
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
> While doing a per-package build the package is failing to
> compile with this error (gcc 13.x glibc toochain):
> make[3]: Entering directory
> '/home/wbx/buildroot-2025.02.3/output/build/xapp_xdm-1.1.14/xdm'   CC
> session.o session.c:146:11: fatal error: crypt.h: No such file or
> directory   146 | # include <crypt.h>       |           ^~~~~~~~~
> compilation terminated.
> 
> Fix this error by providing the needed glibc dependencies.
> 
> Fixes:
>  https://autobuild.buildroot.org/results/b75/b75ad8f1159613656dce482992c800545d60ae69/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/x11r7/xapp_xdm/Config.in   | 1 +
>  package/x11r7/xapp_xdm/xapp_xdm.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
> index 1ac15ce368..adeb3ce0c0 100644
> --- a/package/x11r7/xapp_xdm/Config.in
> +++ b/package/x11r7/xapp_xdm/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_XAPP_XDM
>  	depends on BR2_USE_MMU # fork()
>  	# Runtime dependency: can't start an X server unless there is one
>  	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_XAPP_SESSREG
>  	select BR2_PACKAGE_XAPP_XRDB
>  	select BR2_PACKAGE_XLIB_LIBX11
> diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
> index 035f2e9484..2a343b55e2 100644
> --- a/package/x11r7/xapp_xdm/xapp_xdm.mk
> +++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
> @@ -30,6 +30,10 @@ else
>  XAPP_XDM_CONF_OPTS += --without-xinerama
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +XAPP_XDM_DEPENDENCIES += libxcrypt
> +endif
> +
>  define XAPP_XDM_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
>  		$(TARGET_DIR)/etc/init.d/S99xdm
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
