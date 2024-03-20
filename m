Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B216BC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 19:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E7518131A;
	Wed, 20 Mar 2024 19:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ms-DmQc30RJl; Wed, 20 Mar 2024 19:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FED88211E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FED88211E;
	Wed, 20 Mar 2024 19:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0D351BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 19:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CB6C405F2
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 19:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYDYl91k1QDN for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 19:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F153440562
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F153440562
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F153440562
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 19:53:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-414612cfd82so1333185e9.2
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 12:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710964379; x=1711569179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=10+Y8Oi6LeC2bvavTDO9pFYCEkFTu2n0OXIFciE7tvw=;
 b=J/FnTWrbOBSV4736Tc0QitYrVjL+SloBe/XPEq0NXJ5qnLMnfCO6cSgSdhoMFvIsEK
 m2NtyPZry9fEM9YXA5O63gyjgLkDkcr2AzEHNUAl5z/LtWsEA3hjVlbulx3qdAgVtOZM
 5U2GpYcC5BI8QTcHkyh212nc6/sR1m4IPtGSY9XgClWZgxmfGql2117NuZux4BxWRMdc
 LdKha7iaeFWtPOeZvRKrt+Vb+EGoOai4eBYHVGA2w2f1oBiJvOPwHNwDU0nO3qpSsY0d
 WnuaXoq1olVPH4mBT9qijJK246BatgnPcnAUhGha+PnxP+qPca7VUeuDNCXJFQAnDGm/
 FHMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4IQEwc+L7il9DothVN66BxLKUBqOccnhBkWuUojLxZR5SzhQvdnodec1K+Q8d4gGTdPO7YyhPyo5leIduiQW2870mJzhg/g==
X-Gm-Message-State: AOJu0YwwaeZXyi/g1a8vLdGT7zYIG9Zdg6GiDE/61QSB+GYDLeeedX6H
 r9H2sIO+D+70fbn9P5ofkT1v1384NX9qgFMAdyINJ8u1zPXg8mOsasHJukcn6gw=
X-Google-Smtp-Source: AGHT+IEyLIrAVIJDL0iHcS3mYitiyvAJdv3rzB6XpjTziX7ugumKmC29bXttZrpgfu0xww9GWKFoag==
X-Received: by 2002:a05:600c:3b24:b0:414:6467:34a4 with SMTP id
 m36-20020a05600c3b2400b00414646734a4mr4990517wms.7.1710964379305; 
 Wed, 20 Mar 2024 12:52:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a05600c1d0500b004146a1bf590sm3206654wms.32.2024.03.20.12.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 12:52:58 -0700 (PDT)
Message-ID: <2aeb2daf-fecd-4307-b46b-76ce2829a798@mind.be>
Date: Wed, 20 Mar 2024 20:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240319200646.45266-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240319200646.45266-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710964379; x=1711569179; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=10+Y8Oi6LeC2bvavTDO9pFYCEkFTu2n0OXIFciE7tvw=;
 b=d5zfxXsSxFWVSJpaIj0VE2mzPULliZukHLSquSzjvZkagH3NBQf7E5e/Jr5A8ViIH2
 4hYp1v5jiYXtnjhhLClLyn9wzINHgKEHPBwpYfjLg7sBEBamaqnog9rbBUZ5bSqlsKMz
 zn88nFqwRnVmKevAPiYDe8AgH8Nr0gFF5XKzR0t/DSHeQy1dtnZYL0Z9APHgpVwVc+/H
 kd3QbiA9E4FvE7MeRSImvx4+czVWkaVPw+nnYjgwZJmZity0h0KITJx7f662UF8eWKL9
 2wykeWydNf1ytlMidQe5h3uS2qFJmnhPmWfOCiTr2gFwSqVVEL18fAc0HqZr+MKMe5JN
 z7PA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=d5zfxXsS
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: fix arm uclibc build
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/03/2024 21:06, Fabrice Fontaine wrote:
> Fix the following arm uclibc build failure raised since bump to version
> 0.78 in commit 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4 which wrongly
> removed patch because file was renamed. Patch was sent upstream in 2021
> but rejected, even a second iteration defining AT_HWCAP2 to 26 if needed
> was also rejected.
> 
> Fixes: 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4
>   - http://autobuild.buildroot.org/results/547d1c0e8a89e1e4b601aa756d26886bfc3d586f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...-arm_arch_queries.h-fix-uclibc-build.patch | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
> 
> diff --git a/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch b/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
> new file mode 100644
> index 0000000000..f6b5fe6f91
> --- /dev/null
> +++ b/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
> @@ -0,0 +1,40 @@
> +From 2631c745f986b356fbe5e1d418cff63b46134df6 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 19 Mar 2024 20:37:33 +0100
> +Subject: [PATCH] unix/utils/arm_arch_queries.h: fix uclibc build
> +
> +Build on uclibc is broken since version 0.75 and commit
> +65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
> +even if <sys/auxv.h> is not available:
> +
> +/home/buildroot/autobuild/run/instance-3/output-1/build/putty-0.80/unix/utils/arm_arch_queries.c: In function 'platform_aes_neon_available':
> +/home/buildroot/autobuild/run/instance-3/output-1/build/putty-0.80/unix/utils/arm_arch_queries.c:18:22: error: 'AT_HWCAP2' undeclared (first use in this function)
> +   18 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
> +      |                      ^~~~~~~~~
> +
> +To fix this build failure, include <elf.h>
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/547d1c0e8a89e1e4b601aa756d26886bfc3d586f
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  There's no Upstream: tag, which makes check-package fail. Previously, the 
patch was simply ignored, but instead I added an Upstream: tag that says it was 
rejected.

  Applied to master with that fixed,thanks.

  Regards,
  Arnout

> +---
> + unix/utils/arm_arch_queries.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/unix/utils/arm_arch_queries.h b/unix/utils/arm_arch_queries.h
> +index fa46c622..5cce7f31 100644
> +--- a/unix/utils/arm_arch_queries.h
> ++++ b/unix/utils/arm_arch_queries.h
> +@@ -18,6 +18,8 @@
> +
> + #if defined __arm__ || defined __aarch64__
> +
> ++#include <elf.h>
> ++
> + #if HAVE_SYS_TYPES_H
> + #include <sys/types.h>
> + #endif
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
