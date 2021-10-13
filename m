Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A77AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:26:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 606F5610E8
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 606F5610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A94C60D5D;
	Wed, 13 Oct 2021 18:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9AxNGbQ4rcM; Wed, 13 Oct 2021 18:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 708FF60C33;
	Wed, 13 Oct 2021 18:26:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5271BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C9FC60C33
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tn8MzIejLg_M for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:26:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0481F60AE8
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:26:28 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g10so14074706edj.1
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PjdY2j6R+1C5+2ogymjn4o3gYaHZKBa/tVhtZBq2iAg=;
 b=TdxBWvifq+XsZmiIPaZrN3LYmR2uVIPhhx2aSO83q6zyDd5HXOk1rctyJYi3nbYN84
 sedy3ipQyN2bzzat0ftsG/CzhgbLyNtuZhuzq+DYYJT1TpilHB4AmGt21DenX++uqCqk
 4hF5ZqVfBBqtPJHoovAzV6HHUADbCxrvY+0Phd40LoCNeEdF8ZsOxexcWKD2NtxrIpq5
 em3oNBl3e8iFK69HpJkciKC31gJtXMqT/GYRVIq5RK4Nu7YqZOKnZB1dKwH9ldRukxSN
 BxostcAE+8YgQbxshv3mjhiFWAkk543weOypnGngBTvS4jvV957OlmPcHWdLZjOkTAck
 ttzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PjdY2j6R+1C5+2ogymjn4o3gYaHZKBa/tVhtZBq2iAg=;
 b=C+J1Ugue2cr+IElGrpMvBANGw3GPrCW8EdECHJkMj0oxr6NI4uj740Jh7ABwAbRMrx
 Cg/vN2NatIrWfMUbXDJMv88jkAOVwvh4wgD6s3sN29kHUjLuVlkiAmnViECcs44+XJdA
 JNprjO0M20IyHliymhkxrLZPHgQTU6cKGeLaCrZASdYT0OQaDs8A9M+mITv+e3vNw9NR
 Pfc+t5baug+7FPRmVcA9QkhveuW8M9BvUgrece+WR/gPEIm++MChxSo00TAOeXnMvYrR
 dhD/B6wMqsfQ5cAFKbvfaA1vFTAZBwYC8IokDc4xzf9bRcdeyTg4iB08vtvHd5CGEKbm
 9G4Q==
X-Gm-Message-State: AOAM533jH+ApKIQ12pzJwWDGdbuCc1lxcHBIAp5XMYHWeTkHezR1E60y
 ls0l2zMS0vWbtdSxumHLBLCa5w==
X-Google-Smtp-Source: ABdhPJxsDnMNv8nt9KL4vsPFHTgwyOxi+nzKhBe9d1yCAgRsuMlpUV/MEVsbGZ1NfuhWWLGltBz1CA==
X-Received: by 2002:a17:906:a08d:: with SMTP id
 q13mr927159ejy.465.1634149587221; 
 Wed, 13 Oct 2021 11:26:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z1sm295545edc.68.2021.10.13.11.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:26:26 -0700 (PDT)
Message-ID: <962dda1b-66bf-693e-af53-3bc6c455ea75@mind.be>
Date: Wed, 13 Oct 2021 20:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211006154236.2243657-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006154236.2243657-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/apr: fix build with autoconf >=
 2.70
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 17:42, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
> 
> configure: error: could not determine the string function for int64_t
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/640bbe5b19d6e046cebd5208b37293e03714cd21
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../apr/0003-Merge-r1887279-from-trunk.patch  | 69 +++++++++++++++++++
>   1 file changed, 69 insertions(+)
>   create mode 100644 package/apr/0003-Merge-r1887279-from-trunk.patch
> 
> diff --git a/package/apr/0003-Merge-r1887279-from-trunk.patch b/package/apr/0003-Merge-r1887279-from-trunk.patch
> new file mode 100644
> index 0000000000..444b9d2b06
> --- /dev/null
> +++ b/package/apr/0003-Merge-r1887279-from-trunk.patch
> @@ -0,0 +1,69 @@
> +From a15958a37a06f71c42c690278f9c958b93b7ee20 Mon Sep 17 00:00:00 2001
> +From: Yann Ylavic <ylavic@apache.org>
> +Date: Thu, 11 Mar 2021 14:10:21 +0000
> +Subject: [PATCH] Merge r1887279 from trunk:
> +
> +build/apr_common.m4: avoid explicit inclusion of "confdefs.h"
> +
> +The failure is observed on `autoconf-2.69d` (soon to be released
> +as `autoconf-2.70`). There `int64_t` detection fails as:
> +
> +$ autoreconf && ./configure
> +checking whether int64_t and int use fmt %d... no
> +checking whether int64_t and long use fmt %ld... no
> +checking whether int64_t and long long use fmt %lld... no
> +configure: error: could not determine the string function for int64_t
> +```
> +
> +This happens because `./configure` always stumbles on warning:
> +
> +configure:3350: gcc -c -g -O2 -Werror  conftest.c >&5
> +In file included from conftest.c:31:
> +confdefs.h:22: error: "__STDC_WANT_IEC_60559_ATTRIBS_EXT__" redefined [-Werror]
> +   22 | #define __STDC_WANT_IEC_60559_ATTRIBS_EXT__ 1
> +      |
> +
> +It's triggered by double inclusion of `"confdefs.h"` contents:
> +explicitly in `APR_TRY_COMPILE_NO_WARNING` macro and implicitly
> +via `AC_LANG_SOURCE` use.
> +
> +To fix it and avoid having to define `main()` declaration the change
> +uses `AC_LANG_PROGRAM` instead.
> +
> +Tested on both `autoconf-2.69` and `autoconf-2.69d`.
> +
> +
> +Github: closes #25
> +Submitted by: Sergei Trofimovich <slyfox gentoo.org>
> +Reviewed by: ylavic
> +
> +
> +git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1887485 13f79535-47bb-0310-9956-ffa450edef68
> +
> +[Retrieved from:
> +https://github.com/apache/apr/commit/0a763c5e500f4304b7c534fae0fad430d64982e8]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + build/apr_common.m4 | 8 ++------
> + 1 file changed, 2 insertions(+), 6 deletions(-)
> +
> +diff --git a/build/apr_common.m4 b/build/apr_common.m4
> +index 297dd32cf75..b67a8608abe 100644
> +--- a/build/apr_common.m4
> ++++ b/build/apr_common.m4
> +@@ -467,13 +467,9 @@ AC_DEFUN([APR_TRY_COMPILE_NO_WARNING],
> +    CFLAGS="$CFLAGS -Werror"
> +  fi
> +  AC_COMPILE_IFELSE(
> +-  [AC_LANG_SOURCE(
> +-   [#include "confdefs.h"
> +-   ]
> +-   [[$1]]
> +-   [int main(int argc, const char *const *argv) {]
> ++  [AC_LANG_PROGRAM(
> ++   [[$1]],
> +    [[$2]]
> +-   [   return 0; }]
> +   )], [CFLAGS=$apr_save_CFLAGS
> + $3],  [CFLAGS=$apr_save_CFLAGS
> + $4])
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
