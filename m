Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B97C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C070261196;
	Thu, 21 Apr 2022 19:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zG9H90P2XdmO; Thu, 21 Apr 2022 19:12:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B355460FF0;
	Thu, 21 Apr 2022 19:12:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 166241BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0396540A6E
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDk-Uj0jc209 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:12:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B04DC40131
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:12:35 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u3so8009778wrg.3
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=4ArbL0+aFtXJ5XclS91KnBaHZXE8EakYWXOditN69w0=;
 b=YPto91YhbdtES2pkiselFWj2DaRPcmBRReXhp+k1nGhW4t0CSveBybP7hc4DPjLPj1
 jb/lf4+qNPfp5XyuLJ2iTskIK1TxB2eKZaH5Xk91JdDZt5BHGKifP9pBmw/MXZ0LlpmM
 Col3oWAxPVTqAv7Qox5Lnku7KxPPBckeidf26fiVxpMaVaXsTOuY19oifdRaBOApd0o8
 NQyRNnKe4etPlWowxjBdyy+aUIA7xqG+u1tyfRhSL9yVB8zenhue9kz8SnBDgQoJ9M9u
 hZMXXGv16Cor3Ptj2/O1wPtK0e+99zmXMQSjuSs9J6kVPc+RkjxqdlLpxVKVrYANp+Wc
 zCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ArbL0+aFtXJ5XclS91KnBaHZXE8EakYWXOditN69w0=;
 b=scCTGHkkQuII8kNCLta+wAjylySu8JnpvT99AYC1wi/dlY5kUngQQ6HyRwKDwSMjw6
 RlZcBVmcnOuxuhNThOjNHQiHL5GnOGWaSUWXYiUI42AL3/NRGPU3poEv02AfDt8+xArN
 mbS1q4bXxDue+YsGs6eZuBXBsWdYctIZ6jvEAFHuRhouheN+N+/eYRT9KKw+eCOizbJf
 rkmchQ6s7yr5V7DaQLzwinXlpdov1iJQAN15VH2UJeWEvd68smqcje0/xzxOO9y5Be9l
 62BdcZyeNpdLPBmunynaBkwiWyP39A00rZfg3bB/HspN2gLj76udiETCsEyymHam4S2k
 8ZiA==
X-Gm-Message-State: AOAM531aASpUON5tvIa7w0fgrW26tnpmTqGDUV/OPvXSaaSAvQAa3Bf+
 Pc3ju5UsqE4ep6uPw+cR3yT2Ty4wHhICOw==
X-Google-Smtp-Source: ABdhPJwiwZg2drQLIlJzF7ru1m4snQeDzl9gf/yaeIbCCdzHVhOQEmp4VsLg8Zw25kDcbzI+ZHkrWQ==
X-Received: by 2002:a05:6000:1ca:b0:207:acc8:c153 with SMTP id
 t10-20020a05600001ca00b00207acc8c153mr880635wrx.165.1650568353803; 
 Thu, 21 Apr 2022 12:12:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c414a00b0038ebb6884d8sm2938971wmm.0.2022.04.21.12.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:12:33 -0700 (PDT)
Message-ID: <9edaacaa-4a3d-bf0a-893d-12dfcfe11614@mind.be>
Date: Thu, 21 Apr 2022 21:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220416074458.1361288-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220416074458.1361288-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/diffutils: fix build on arceb
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/04/2022 09:44, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 3.8 in
> commit 1f89c80417ad03127650b22c41ec4e30d42c549f:
> 
> sigsegv.c: In function 'sigsegv_handler':
> sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
>    979 |                       : vma.is_near_this (addr, &vma))
>        |                            ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8c5b8b37eb3c2667c75666079b056df7e0023e05
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-Fix-compilation-error-on-arceb-CPUs.patch | 41 +++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
> 
> diff --git a/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch b/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
> new file mode 100644
> index 0000000000..20db798f3a
> --- /dev/null
> +++ b/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
> @@ -0,0 +1,41 @@
> +From 1957bb5113a2bf02c7ecf0815125eec04b9476d2 Mon Sep 17 00:00:00 2001
> +From: Bruno Haible <bruno@clisp.org>
> +Date: Sat, 16 Apr 2022 03:01:51 +0200
> +Subject: sigsegv: Fix compilation error on arceb CPUs.
> +
> +Reported by Fabrice Fontaine <fontaine.fabrice@gmail.com> in
> +<https://lists.gnu.org/archive/html/bug-gnulib/2022-04/msg00028.html>.
> +
> +* m4/stack-direction.m4 (SV_STACK_DIRECTION): Treat the 'arc' variants
> +like 'arc'.
> +
> +[Retrieved (and backported) from:
> +https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=1957bb5113a2bf02c7ecf0815125eec04b9476d2]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + ChangeLog             | 8 ++++++++
> + m4/stack-direction.m4 | 4 ++--
> + 2 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
> +index 1df823e..924c5de 100644
> +--- a/m4/stack-direction.m4
> ++++ b/m4/stack-direction.m4
> +@@ -1,4 +1,4 @@
> +-# stack-direction.m4 serial 7
> ++# stack-direction.m4 serial 11
> + dnl Copyright (C) 2002-2021 Free Software Foundation, Inc.
> + dnl This file is free software, distributed under the terms of the GNU
> + dnl General Public License.  As a special exception to the GNU General
> +@@ -18,7 +18,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
> +       a29k | \
> +       aarch64* | \
> +       alpha* | \
> +-      arc | \
> ++      arc | arceb | arc32 | arc64 | \
> +       arm* | strongarm* | xscale* | \
> +       avr | avr32 | \
> +       bfin | \
> +--
> +cgit v1.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
