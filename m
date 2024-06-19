Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD960C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 475AF842C0;
	Wed, 19 Jun 2024 20:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vk86uVdyxaUN; Wed, 19 Jun 2024 20:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A3478421D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A3478421D;
	Wed, 19 Jun 2024 20:33:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0858A1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 023AD4029E
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUA1uRRfEgmZ for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77B6940279
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B6940279
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77B6940279
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:33:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3621ac606e1so860506f8f.1
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718829217; x=1719434017;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=reI8ux6TPVL2UqjDLdc3bC5au8UnYNz1jWeuoEvcItk=;
 b=bLznWEkIqZ/Dpu0Xo6RLja+/DKLVxO4DeKfwsILEE8jdiCC797+hV/oLMaZkFKmKxj
 EiOAlq5lFeJQ5juGxUpkV05CGiph+WsQmeIL9Rq6WXlJQS6W8pjXQ8MMTQekBK2ZPkg8
 qQKwYi8ZIWs7Ns//UkYpXA/m4ze+2Wt0/Zeg1jdntiEjtx8ROKSnJMLuJYyOmGCiYqec
 swbvrjiI30prHzlVo6EjjzguiqQYLHfz5DA9E/6236xcjtLp0J8uDv2XDMEK9ap/RteC
 ZK2RTl6dkYGQvhrLj+7OBE9bZbWYFzq1K3e0Xr9ClCg3jRjYmFp1NWq1dxuNTHdEh188
 kzUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNmZSR5gDOAcOxioQBoEh+MwocZxpFsuXE1m0IuHfcp5TPefRcnSwEZCs8+NDOhl/C3VgDp+qO0qPWxeFnggGPqEdirJ85Yw==
X-Gm-Message-State: AOJu0YyP2Lk/sTf1GgzKy5E0l2GraftQJrCq1ivAglrvlhe83agIP2i6
 wGs5ilAzs4zi86JgbCZZ/WX59KcIvTXJp3179xc115YZXunzaX0OKYWq/xHzjX8N6PldVYA6NV2
 f
X-Google-Smtp-Source: AGHT+IHBnXZ+0YKYc6Bp8+8z+4tZRsDoxbUnral5I2huTSaAuVEoSrAkKDZZd/ENDFvFwIroo9wA8Q==
X-Received: by 2002:a5d:4e87:0:b0:362:862d:f7b3 with SMTP id
 ffacd0b85a97d-362ff0b2cf4mr3519197f8f.3.1718829217191; 
 Wed, 19 Jun 2024 13:33:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c9absm18056807f8f.46.2024.06.19.13.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:33:36 -0700 (PDT)
Message-ID: <1436214b-0df3-4ce9-8c8d-c07816cb2bb9@mind.be>
Date: Wed, 19 Jun 2024 22:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20240606182124.4069700-1-yegorslists@googlemail.com>
Content-Language: en-GB
In-Reply-To: <20240606182124.4069700-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718829217; x=1719434017; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=reI8ux6TPVL2UqjDLdc3bC5au8UnYNz1jWeuoEvcItk=;
 b=UshS8na+k94IaT80+Z3cIMhUjQqMurXnbsoIXA4ORHeYh7AmoFa5MYFpTLL0SQhKR1
 U3mW4Z/Z5lLwkzCJeKRHDfIA3kamIDIaTf88+KGrGDOn6Lj7xi/JDLAiOnvLa1GojTFN
 bXZx4IslUexZ1yczh8MCCmZVq2OyYiiwFNGcrvUP50iuexWXtZyJ1vS6oLXsu9VMVWFV
 3AlMss+gwFPI/BIiLwh88ZvPcqd7qzFhyaIUPpuJdmsvGdN9hzyzRkC22hWY7uaaoCc4
 troH1Kbv5tJblY9sOo/0E4IMSQPPPaShFpW5Ohg9lhRY/3tMESzgpZygMK83gY2gtfsj
 PzjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UshS8na+
Subject: Re: [Buildroot] [PATCH] package/ntp: remove the obsolete patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2024 20:21, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> 0001-nano.patch: both MOD_NANO and MOD_TAI were added to glibc
> on 2011-03-30 in commit 83fe108b0a9bc4f2deb14695bb0c8b2011e79f28.
> 
> Renumber the remaining patches.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

  Applied to master with an extended commit log containing all the research Yann 
did, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                           |  3 +-
>   package/ntp/0001-nano.patch                   | 28 -------------------
>   ...patch => 0001-ntp-syscalls-fallback.patch} |  0
>   ...ch => 0002-fix-pthread-detach-check.patch} |  0
>   4 files changed, 1 insertion(+), 30 deletions(-)
>   delete mode 100644 package/ntp/0001-nano.patch
>   rename package/ntp/{0002-ntp-syscalls-fallback.patch => 0001-ntp-syscalls-fallback.patch} (100%)
>   rename package/ntp/{0003-fix-pthread-detach-check.patch => 0002-fix-pthread-detach-check.patch} (100%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index d0bd179a5c..a7d353e7d8 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1118,8 +1118,7 @@ package/norm/0001-protolib-drop-linux-version-check.patch lib_patch.Upstream
>   package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch lib_patch.Upstream
>   package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch lib_patch.Upstream
>   package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
> -package/ntp/0001-nano.patch lib_patch.Upstream
> -package/ntp/0002-ntp-syscalls-fallback.patch lib_patch.Upstream
> +package/ntp/0001-ntp-syscalls-fallback.patch lib_patch.Upstream
>   package/ntp/S49ntp.in lib_sysv.Variables
>   package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
>   package/numactl/0001-link-with-latomic-if-needed-again.patch lib_patch.Upstream
> diff --git a/package/ntp/0001-nano.patch b/package/ntp/0001-nano.patch
> deleted file mode 100644
> index bce3478261..0000000000
> --- a/package/ntp/0001-nano.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Fixes issues with glibc header files, see
> -http://bugs.gentoo.org/show_bug.cgi?id=270483
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -Rebase to apply cleanly.
> -
> -Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> -
> -
> -diff -purN a/include/ntp_syscall.h b/include/ntp_syscall.h
> ---- a/include/ntp_syscall.h	2015-02-11 08:42:37.794576469 -0500
> -+++ b/include/ntp_syscall.h	2015-02-11 08:43:03.216957279 -0500
> -@@ -10,6 +10,14 @@
> - # include <sys/timex.h>
> - #endif
> -
> -+#if defined(ADJ_NANO) && !defined(MOD_NANO)
> -+#define MOD_NANO ADJ_NANO
> -+#endif
> -+
> -+#if defined(ADJ_TAI) && !defined(MOD_TAI)
> -+#define MOD_TAI ADJ_TAI
> -+#endif
> -+
> - #ifndef NTP_SYSCALLS_LIBC
> - # ifdef NTP_SYSCALLS_STD
> - #  define ntp_adjtime(t)	syscall(SYS_ntp_adjtime, (t))
> diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0001-ntp-syscalls-fallback.patch
> similarity index 100%
> rename from package/ntp/0002-ntp-syscalls-fallback.patch
> rename to package/ntp/0001-ntp-syscalls-fallback.patch
> diff --git a/package/ntp/0003-fix-pthread-detach-check.patch b/package/ntp/0002-fix-pthread-detach-check.patch
> similarity index 100%
> rename from package/ntp/0003-fix-pthread-detach-check.patch
> rename to package/ntp/0002-fix-pthread-detach-check.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
