Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D92FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03E7A61482;
	Fri,  6 Mar 2026 19:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7uJ9qqnjGQX; Fri,  6 Mar 2026 19:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7298B61486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826793;
	bh=fPItXmAIa+kZsIZvzUqrE0aAZtJ85yIWCQmkl7JBo6g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sJWavoQhMWE3tXERKJoqffIiQH5J/BQx/+QBljG1D/DU6XJZ0s/NUuHZ1sRmHVtiw
	 fR+3Ljd6gLZk0hbGbAtGvts7rylsxvDhG4dqXsYnychW3L8dQrEkxHrYPFzbYt/oqz
	 DcUrynbiUFw5k/ZtuzR6yN/FXIRzEgpvARbIUA05htlEEtSaq9ik000ae85I/b9ZgJ
	 ixY5eY827WF6ip6Nwq/wgdUvAldtUdXrFHd4rQxiLMCKXXISI2XZhFPBaXFL0XlSgR
	 KBGpIT4vURbbbcglBNO9IpKSsGqIXUUVcrtgL+8diljPX8O0cQOB6vd3K7O/HhdM+f
	 iSdxPtO1YOiOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7298B61486;
	Fri,  6 Mar 2026 19:53:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C6025B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8563B83D75
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqATNWpCNtTa for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4759D83D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4759D83D65
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4759D83D65
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-483a233819aso94851845e9.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826785; x=1773431585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ImQEee8w6+vLT2ki+5VmwU0qm55VG/7tLIRUa7LDkqQ=;
 b=MpSCd91/1SlzDsFYyAZkr4maA4TrBjHtuy8XuEbLObnPxmy5RpQ2FDTbZ1qIf3PNQY
 fVwutKB2k2gWnv0g5D2bH4cy0xO2BxZjfqb+lNKWpWV9D1g7p8qJT6U8SjdijHfmRFDf
 DT8wDVNNahvA0hhqTUOKSBID1ePLBayBNI+Znhb9Wtwioc1HaQdimKFiaCxcEYOz0UWC
 tD961YxCOZpm3+KxtO9PYHpFfYuzPaxyvk8Ji5P4c/okkm9DsbEOnVvAnlFNova4kXRz
 X+z5hL5p/WINYdSjQJD9F6W0FJ98ZQ5ZMjBSngAOWbuaLfVIcdVPTvEHvd90qlAMHCaH
 L7Gw==
X-Gm-Message-State: AOJu0Yy57AZhn/ykUVPWcPtesn29Obf2Yu/F9EbNy10oIiiDl37yAPO4
 a4tlNV121ZHRkn8ezwZ3CtloF5t6f5W51iQTm7/zWuDgqGttiVD7BLIXuJlCZjqeca0=
X-Gm-Gg: ATEYQzz9awQ2K3stQlnaghdepMnS/FN7TU8SPgqcLWIjk0kmXpgopyMTzM5OhwVnVmD
 EYexem920sYCv9vdEYBJpKJSWWlNTy18H1EsYRicU+JKp7hspt3P4SkB3ScxtoVfc7dH6WPVtru
 XPS+5U+hCABjpMDLLLX/kZQoNDYYD64Urx2SfOpxmUFNqfrLAL5mPgfPjXkNhfDbmfMM7vsSUK/
 K6NFs0nT8kc8pDNYi73dAuwK6mMmJjygUJQIayh/bMbzePiPoJehzqCoegHgsypTIyKBAxCatbk
 lWt8f/Mm9Qlno0UPUeVkv3qPSBTHNSx+9Ms8XWU8a1516oVl2KBJOViXy83580Js4ZYsCRjH6GY
 EQVDc0Ve6zLJJl8ajhdp/kB5bvcCxIBuCgIRo6Wj4x4HXWXtukK3Putr0GY899DG9rNnrbRHh4o
 zQjMBkeNNlHgi26zo=
X-Received: by 2002:a05:600c:45c6:b0:483:c35d:3662 with SMTP id
 5b1f17b1804b1-48526957c37mr53360295e9.18.1772826785231; 
 Fri, 06 Mar 2026 11:53:05 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48527686fa9sm73058705e9.8.2026.03.06.11.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:04 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:04 +0100
Message-ID: <20260306195304.7437-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225202847.385468-1-thomas.perale@mind.be>
References: <20260225202847.385468-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826785; x=1773431585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImQEee8w6+vLT2ki+5VmwU0qm55VG/7tLIRUa7LDkqQ=;
 b=btlDiwXgPHFeZc9If0ZH2u5KrU09KOjxtz7ujPFGHyJLp6LuKzyiYY7w4Qot3h7W0P
 rnviIHPUZcDueef+AEsFnyEuTyEac91FUrxRUiQxltpbJLLraqiQ/YGJ/rrWdZwGjGp3
 jx2jRx6PvYgdxa0dzsmKBMfCj0RVkwhJv2DuokAr6tpRxPx9YoX9d3Ce4R8hF6NmxwZz
 vAMpbBNv3QnR6mgY6FtovyBSMYeEyRhuQQra/x7Qz6akmLCUjZc/txhxf5Y0zEgYBcLH
 Z7Q9MmGjBezDlRXAhTZ81KglFa7kwttT09Pd3ZvS5FZdQ95WMjQh5qSwpfYUFM9ySrUN
 pHRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=btlDiwXg
Subject: Re: [Buildroot] [PATCH] package/patch: add patches for
 CVE-2018-6952 & CVE-2019-20633
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
> Fixes the following vulnerabilities:
> 
> - CVE-2018-6952:
>     A double free exists in the another_hunk function in pch.c in GNU
>     patch through 2.7.6.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2018-6952
>   - https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
> 
> - CVE-2019-20633:
>     GNU patch through 2.7.6 contains a free(p_line[p_end]) Double Free
>     vulnerability in the function another_hunk in pch.c that can cause a
>     denial of service via a crafted patch file. NOTE: this issue exists
>     because of an incomplete fix for CVE-2018-6952.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2019-20633
>   - https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...-Fix-swapping-fake-lines-in-pch-swap.patch | 33 +++++++++++++++++++
>  ...emory-access-in-context-format-diffs.patch | 30 +++++++++++++++++
>  package/patch/patch.mk                        |  6 ++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
>  create mode 100644 package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
> 
> diff --git a/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch b/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
> new file mode 100644
> index 0000000000..6fd63dff53
> --- /dev/null
> +++ b/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
> @@ -0,0 +1,33 @@
> +From 9c986353e420ead6e706262bf204d6e03322c300 Mon Sep 17 00:00:00 2001
> +From: Andreas Gruenbacher <agruen@gnu.org>
> +Date: Fri, 17 Aug 2018 13:35:40 +0200
> +Subject: Fix swapping fake lines in pch_swap
> +
> +* src/pch.c (pch_swap): Fix swapping p_bfake and p_efake when there is a
> +blank line in the middle of a context-diff hunk: that empty line stays
> +in the middle of the hunk and isn't swapped.
> +
> +Fixes: https://savannah.gnu.org/bugs/index.php?53133
> +CVE: CVE-2018-6952
> +Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/pch.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/pch.c b/src/pch.c
> +index e92bc64..a500ad9 100644
> +--- a/src/pch.c
> ++++ b/src/pch.c
> +@@ -2115,7 +2115,7 @@ pch_swap (void)
> +     }
> +     if (p_efake >= 0) {			/* fix non-freeable ptr range */
> + 	if (p_efake <= i)
> +-	    n = p_end - i + 1;
> ++	    n = p_end - p_ptrn_lines;
> + 	else
> + 	    n = -i;
> + 	p_efake += n;
> +-- 
> +cgit v1.2.3
> +
> diff --git a/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch b/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
> new file mode 100644
> index 0000000000..5ffe3699ef
> --- /dev/null
> +++ b/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
> @@ -0,0 +1,30 @@
> +From 15b158db3ae11cb835f2eb8d2eb48e09d1a4af48 Mon Sep 17 00:00:00 2001
> +From: Andreas Gruenbacher <agruen@gnu.org>
> +Date: Mon, 15 Jul 2019 19:10:02 +0200
> +Subject: Avoid invalid memory access in context format diffs
> +
> +* src/pch.c (another_hunk): Avoid invalid memory access in context format
> +diffs.
> +
> +CVE: CVE-2019-20633
> +Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/pch.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/pch.c b/src/pch.c
> +index a500ad9..cb54e03 100644
> +--- a/src/pch.c
> ++++ b/src/pch.c
> +@@ -1327,6 +1327,7 @@ another_hunk (enum diff difftype, bool rev)
> + 		  ptrn_prefix_context = context;
> + 		ptrn_suffix_context = context;
> + 		if (repl_beginning
> ++		    || p_end <= 0
> + 		    || (p_end
> + 			!= p_ptrn_lines + 1 + (p_Char[p_end - 1] == '\n')))
> + 		  {
> +-- 
> +cgit v1.2.3
> +
> diff --git a/package/patch/patch.mk b/package/patch/patch.mk
> index 6f83d2418c..9272449159 100644
> --- a/package/patch/patch.mk
> +++ b/package/patch/patch.mk
> @@ -23,6 +23,12 @@ PATCH_IGNORE_CVES += CVE-2018-20969 CVE-2019-13638
>  # 0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
>  PATCH_IGNORE_CVES += CVE-2019-13636
>  
> +# 0006-Fix-swapping-fake-lines-in-pch-swap.patch
> +PATCH_IGNORE_CVES += CVE-2018-6952
> +
> +# 0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
> +PATCH_IGNORE_CVES += CVE-2019-20633
> +
>  ifeq ($(BR2_PACKAGE_ATTR),y)
>  PATCH_CONF_OPTS += --enable-xattr
>  PATCH_DEPENDENCIES += attr
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
