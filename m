Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055A2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A911940B66;
	Thu, 16 Dec 2021 20:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpkzHMLCHEE6; Thu, 16 Dec 2021 20:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E93A440B61;
	Thu, 16 Dec 2021 20:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12D421BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1101D417FE
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wf9CU2R2H5f for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:24:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C734417F5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:24:27 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id e3so92280458edu.4
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=v25533+1aeYNKBUnCMVsnE8Ji1IoHKbm8vGgav4sauw=;
 b=WCweCcEwz0tEkgmFlatO+aHLSjWcus6Srt/5ii7oBviHscBEWJ7Pt0UEGF+ZTi7/X6
 DsnIr9qdcFXXGwiBGF70YAKK1tJ+3VOgJ8N3qk2CJu+0/q6Y/LtV8LqXHRq6fBIHxBlP
 ADO27L22gPUHeuEzYJPcFxM0Uof/VtNOF06uddRa/1gXJtjGZLCGJzKlDnyCdxWfzujk
 5ngCmlGyvZYA0mG+8NAq9veDnFw44RSwMfT36KmYJBsO00t3/5xBXE/yuHs9WRzCpPJQ
 6ZXKFxAGUqTiFsDOD1wWiW/a/EJvwVL70mIUKkFUXVDKl2S5xH7s8zqU8odDABAgycDt
 JLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v25533+1aeYNKBUnCMVsnE8Ji1IoHKbm8vGgav4sauw=;
 b=UCVsjKuHpqdrg2D7dlXp201QHdWB5DVyWVJJbddiMW6lmIgDlXBqkM7LcC6Bltf+yo
 jn0Quvv7dJWKlHE17+3tsMI/QafhOToGAvqlWDFo4kQOk0nXVamVfDR/ELid5tcv3ODB
 LrrdvQ80mwNpbhvkPkvti5wHNtA4J+nskv6cProh41UMOwYeiNeGa+Y+hUoLBn5b5hYD
 XENQotpB5FwLA77FPu9OME9LIV6tagzWQGIoOFCePHaS7qQiMYNLKiW/qjtoM4/BwgDv
 gS2W9CYfjYRmToNxEq28RLjs8Y0IzfLpWPU813B0aeEiG4TsYCQwH5b44JRytAE1U8Vh
 0ZuA==
X-Gm-Message-State: AOAM532skEbvnjFMQn7uP/5s8+r5eFXtS1GMjs04KbLlEQJEJplse69S
 k0p9XwXNZ2QbQ3NBVnbk8q39Eg==
X-Google-Smtp-Source: ABdhPJyZuHp9wN+NoZ1odbkmXSoQBfdkMQjJWrDverGg1qHoRKUTb/Ku0DUqvE1e6/izJz6zay9Qow==
X-Received: by 2002:a17:906:f890:: with SMTP id
 lg16mr4684081ejb.757.1639686266230; 
 Thu, 16 Dec 2021 12:24:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z26sm2409138edr.11.2021.12.16.12.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:24:25 -0800 (PST)
Message-ID: <60305586-b9e1-1067-0488-641cd5876da1@mind.be>
Date: Thu, 16 Dec 2021 21:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Anssi Hannula <anssi.hannula@bitwise.fi>, buildroot@buildroot.org
References: <20211216164522.3877446-1-anssi.hannula@bitwise.fi>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216164522.3877446-1-anssi.hannula@bitwise.fi>
Subject: Re: [Buildroot] [PATCH] package/icu: fix build failure due to a
 library clash
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



On 16/12/2021 17:45, Anssi Hannula wrote:
> ICU build scripting adds some host libraries to LD_LIBRARY_PATH by
> using constructs of the following form:
> 
>    LD_LIBRARY_PATH="custom-path:${LD_LIBRARY_PATH}"
> 
> If the original LD_LIBRARY_PATH is empty, this causes the last search
> directory be an empty string, i.e. the working directory.
> 
> ICU build runs some basic host commands (e.g. "rm") in $(TARGET_DIR)/lib
> under such an LD_LIBRARY_PATH, causing target libraries (e.g. libc) to
> possibly get loaded instead of host system libraries if they are
> compatible enough (e.g. arch matches).
> 
> Since the target libraries may not actually be ABI compatible with host
> system binaries (e.g. target has an old libc), this can cause crashes
> or other errors.
> 
> Observed errors include:
>    (1) rm: libc.so.6: version `GLIBC_2.33' not found (required by rm)
>    (2) sh: line 1: 1362670 Segmentation fault      (core dumped) rm -f libicudata.so.65
> 
> Workaround the issue by setting a dummy LD_LIBRARY_PATH when it would
> otherwise be empty.
> 
> https://unicode-org.atlassian.net/browse/ICU-21417

  Normally, it's better to patch the source and send that patch upstream rather 
than working around the problem like this. However, it seems that upstream is 
working on it, so this workaround is good enough for the time being.

  Therefore, I applied this patch to master, thanks.

  I wonder though why we don't see this issue in the autobuilders. I guess we 
don't have autobuilders where host and target don't have compatible libc ABI. 
Could you give some details about what the host is and what the target toolchain 
is where you encounter this issue, so we can make sure to add something like 
that to the autobuilders?

  Regards,
  Arnout


> 
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> ---
>   package/icu/icu.mk | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index 2c04c3c775..c5d0c3eefb 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -50,6 +50,17 @@ HOST_ICU_CONF_OPTS = \
>   ICU_SUBDIR = source
>   HOST_ICU_SUBDIR = source
>   
> +# ICU build scripting adds paths to LD_LIBRARY_PATH using
> +#   LD_LIBRARY_PATH="custom-path:${LD_LIBRARY_PATH}"
> +# which, if LD_LIBRARY_PATH was empty, causes the last search directory
> +# to be the working directory, causing the build to try to load target
> +# libraries, possibly crashing the build due to ABI mismatches.
> +# Workaround by ensuring LD_LIBRARY_PATH is never empty.
> +# https://unicode-org.atlassian.net/browse/ICU-21417
> +ifeq ($(LD_LIBRARY_PATH),)
> +ICU_MAKE_ENV += LD_LIBRARY_PATH=/dev/null
> +endif
> +
>   ICU_CUSTOM_DATA_PATH = $(call qstrip,$(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH))
>   
>   ifneq ($(ICU_CUSTOM_DATA_PATH),)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
