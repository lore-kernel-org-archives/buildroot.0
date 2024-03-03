Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0004BC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C3374079A;
	Sun,  3 Mar 2024 20:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsnBln0Qoyas; Sun,  3 Mar 2024 20:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E302407A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E302407A8;
	Sun,  3 Mar 2024 20:12:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 355C01BF340
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 230B260692
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJYjw16a83J2 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 20:12:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0937E60680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0937E60680
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0937E60680
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 20:12:14 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so42546601fa.3
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 12:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709496732; x=1710101532;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Ak+Ff5pylmDgHWGOdgN0bnR//MXHmvAsHfNIfIsOxc=;
 b=Ydsz/cndWuOnL18BXUmQLXhKe8WEqDs/7vvY062/n5ZiAW3aQmXZina8qG4BF+5sLj
 TQ13Bo4niYgMIaikxEFsYbz4BlPP0VvBexq0QQJ4BKKkQ+UuZLnu4CL/rGOxM2I70VVn
 0eRc1BvkTTtyNUkU1DAh0+FImaksiIuOy0RF83tLROpm0PdEULhhlzeTVkTNpDfTFplz
 w0Uzp0+fK0NgI3WuoPybXVXQYjrSvxHTfZtznohlsgzzDZLi0CdD0rY4CF7chXyHA+9L
 MzgE2ZMV+ZFTkoCheKHjQiTDPa/I6tb+m9jJYUSkRYbxeeZgPnJnPRtTdx1uQKqgxz/r
 mXJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXceI1IQkYRSEp2Rk1XmepqcZLfliGGycD1DkSWdtOlrkv6ztb2ctpXKK6iO175Zx3UbZjlxt6I4ucfNb+axZq9MzKGQqACaw==
X-Gm-Message-State: AOJu0YysonIc8hRtP5Fj1+6qIZVTKuQQVcb2vcYrlZfLY/74I/ZHlFy7
 PKyEVKcYOibNtNV+7XomDUQfFAo+/954NGlQYo/prov9ME+ppk6oV8hKol3Jd7U=
X-Google-Smtp-Source: AGHT+IGQqNDyAF68yzr8IvmXJVZaWHUsvJaniyJKhs6T6FAZu5PeDrxv+ckK0hMFqNnvmj3T5it68w==
X-Received: by 2002:a2e:a4c2:0:b0:2d3:827f:5db8 with SMTP id
 p2-20020a2ea4c2000000b002d3827f5db8mr2191532ljm.8.1709496732066; 
 Sun, 03 Mar 2024 12:12:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 dw2-20020a0560000dc200b0033ddfba0c67sm10278235wrb.41.2024.03.03.12.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 12:12:11 -0800 (PST)
Message-ID: <5a7d1019-d1fb-4466-919a-8053d5015324@mind.be>
Date: Sun, 3 Mar 2024 21:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231030133833.1102839-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231030133833.1102839-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709496732; x=1710101532; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Ak+Ff5pylmDgHWGOdgN0bnR//MXHmvAsHfNIfIsOxc=;
 b=QKjGSIYDdPmipAr4pHwUSr9XNII1yWefzg4LYyDKWFffBzGJBnuAXX6aG1Ll1EfxNM
 3fkztCh2Mp0VCs4i2sUVSNMYtcH6WaZ2nsQ0wsxm3rh4kNvpHkMClXo1F+OqzjhSINE4
 GkQt7Y/zfmuLL8pWqCzkqwkCm5JMQmNg6qPGongoh7EkN7UxFkoXxopP7QL/s9OWhAur
 L9GaCZ1gGJz7N3j2u0GKRkh3lrYbllJRPGlrk2NHMpN2lbe5HfAyhB9SPSgDXXnfIs/l
 BGIH+burBqqCpLl4zz4SoCLGqTKtHN7Xm4q7/fzsjNJF0OmA7LCgGJwwqeuVvgF0cj6Q
 tPpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QKjGSIYD
Subject: Re: [Buildroot] [PATCH 1/1] package/tar: fix NLS build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/10/2023 14:38, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 1.35 in
> commit d4d483451f0a305781b94b96c15a6cf4b489cd84:
> 
> /home/thomas/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: buffer.o: in function `bufmap_reset':
> buffer.c:(.text+0xe8): undefined reference to `libintl_gettext'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/99b05d4b495b6337c6a48ea5a551a3a84c6d2e6b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tar/tar.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index 8a612b6f45..5908b9ec3e 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -19,6 +19,8 @@ TAR_CONF_OPTS = \
>   TAR_LICENSE = GPL-3.0+
>   TAR_LICENSE_FILES = COPYING
>   TAR_CPE_ID_VENDOR = gnu
> +TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> +TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>   
>   ifeq ($(BR2_PACKAGE_ACL),y)
>   TAR_DEPENDENCIES += acl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
