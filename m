Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316DCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB86884061;
	Thu, 21 Apr 2022 20:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4u_sMsVkhwO1; Thu, 21 Apr 2022 20:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC19B82978;
	Thu, 21 Apr 2022 20:57:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B05531BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABAC760C19
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 086dTeGJrGlu for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:57:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A49FA60A74
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:57:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h25so2257753wrc.13
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=qtSWjgtnbvEMHv1jl2O/czWCsrjLHI2hXK0IxD3bpsc=;
 b=BJ18m9sQ17gC3FVQzxb2Z+LXK+/Wf+egu33q2f/Tm0DIL6FieJD9mhZYP1rV5oEbnL
 MD+HtdxLU5RtHTyYx8cI/RhXYGgnSeocAJthqgkbCpoSsD6WeAZZyJCFkDlPcT/UqQVN
 nE95Ky3mIffG0mwYr35KnGb70znI4fNGjqW5y25V9VpqfoN6cmJaWOvwSpK10s/CE3AX
 siOG8IJ500J6h+Nly9iyX/Npn05M0LdYZoLEiiYq7BbM44rgsB83lYbRVA8T0+XyZ+QT
 V5ZDmkMv+tQHFVup66TYCXo+V4enErHxnbiEsduNRNjn73YgfaYDegjGWO5ukTWiTY7U
 drlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qtSWjgtnbvEMHv1jl2O/czWCsrjLHI2hXK0IxD3bpsc=;
 b=0thIUhN/oZxjt6o8S/OR1ptPyP5NwFChJpnbsHH1iJlExg/652AuAw7N7TU3BmdTi6
 pym/gPhPJvXFiC9Dh/+nkrhYEfrxVfg1tp+PVVLs4ZxVu1aipquFTfUKcgYcCZzpuv6C
 TkhGMUZnSpdqazBMjJAEk/almBaRlvuVvlUpdAwEqZrhmhdf+rvHC74lP5F5YwzEp5kq
 KD+S8hf7il9d6t0G7RcZN0KmHzN6EyNFatTM+A0zDU5Yek5e3p23td1T6r4jSoJ9MueX
 iE7sF2h9Ks9ABjESOIV1hsmnEF4XPXkX5a2NXwSXvt4BpMoiVYDjmYefiIQs7wTncSSN
 rldw==
X-Gm-Message-State: AOAM531PT4F1mmVJR9EWJ9tfhHsYUskBk5rasifw1DspWx1YjFcIW6Ya
 BUGLvyF2CPT8jlPFByTvNnT4/Pa3haJByw==
X-Google-Smtp-Source: ABdhPJx4S+3ynJ0vzJZlJIVCegJtvHI3VvGjNAUoEk4PnWzCcs7BZbs/3ddtSmjURvgFpNn3EkrIoA==
X-Received: by 2002:a05:6000:1ace:b0:20a:ac39:82d1 with SMTP id
 i14-20020a0560001ace00b0020aac3982d1mr1065343wry.457.1650574657705; 
 Thu, 21 Apr 2022 13:57:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b00392ae97b948sm2763186wmo.15.2022.04.21.13.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:57:37 -0700 (PDT)
Message-ID: <d9fe8c22-7d11-e0bb-886a-235890893a29@mind.be>
Date: Thu, 21 Apr 2022 22:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220417223514.3080791-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220417223514.3080791-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/libnspr: fix build failure on mips
 with musl libc
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



On 18/04/2022 00:35, Giulio Benetti wrote:
> Add patch that uses Linux <asm/sgidefs.h> instead of libc <sgidefs.h> since
> musl doesn't provide it.
> 
> Patch is pending upstream here:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1765100
> 
> Fixes:
> http://autobuild.buildroot.net/results/61743bf5ad9ddc69786ae854ed4ab58c59f64dd0/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-1765100-fix-build-on-mips-musl-libc.patch | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
> 
> diff --git a/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch b/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
> new file mode 100644
> index 0000000000..10bf74130c
> --- /dev/null
> +++ b/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
> @@ -0,0 +1,33 @@
> +From 00e5b818f2d9f3264107801fc2fcff33a9355a78 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sun, 17 Apr 2022 23:55:26 +0200
> +Subject: [PATCH] Bug 1765100 - fix build on mips+musl libc
> +
> +This patch fix build failure on mips with musl libc by using Linux
> +<asm/sgidefs.h> instead of the one provided by libc since musl doesn't
> +provide <sgidefs.h>.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> +This patch is pending upstream:
> +https://bugzilla.mozilla.org/show_bug.cgi?id=1765100
> +---
> + nspr/pr/include/md/_linux.cfg | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nspr/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
> +index 23b160fd..dbc0d40e 100644
> +--- a/nspr/pr/include/md/_linux.cfg
> ++++ b/nspr/pr/include/md/_linux.cfg
> +@@ -499,7 +499,7 @@
> + #elif defined(__mips__)
> +
> + /* For _ABI64 */
> +-#include <sgidefs.h>
> ++#include <asm/sgidefs.h>
> +
> + #ifdef __MIPSEB__
> + #define IS_BIG_ENDIAN 1
> +--
> +2.25.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
