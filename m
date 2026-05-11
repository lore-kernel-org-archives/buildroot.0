Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F973CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 15:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 143B483D1E;
	Mon, 11 May 2026 15:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63oniinbF1sB; Mon, 11 May 2026 15:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F069183CF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778513970;
	bh=fphjNUI4Zkve72ZRFCYXZGXX5kOwQDDpvSYN8cMQ5Lc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CzNn99X5px07RGPnGJe9/qN1XAPTQHWkHwg5Qcx4wrXWJJcRElCU0YtWmUCkOBbvz
	 wIL3LjIVuf8Im1f51YN/meQee2ztLlw57zbk0Ri642hV+Zf51TonTrGabm8xUlJZ9B
	 uWPpCeyQzqzu5QEl1uhq5lfIa0QuS1ZnL3i1KqVDmiY4F4sGpW6mCb1fEZG/ui06Jp
	 6VHS5bHYqOuL75w344p7pVhpCK7NGRYXCug/Tm0Iq2BMX/NhnZgYNbUMMlMOr2h/Vx
	 J/9F02gXuCGfN/AIKv9/kP1RTCjhfO8M99RHzZ2KfXOVMHfOzzjU3SeJPwwq7e8GKj
	 0tHWEJ3PIBqWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F069183CF5;
	Mon, 11 May 2026 15:39:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48EF8223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AD6D6066D
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOfvBY1WvQ4G for <buildroot@buildroot.org>;
 Mon, 11 May 2026 15:39:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E05606066C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05606066C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E05606066C
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:39:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso2595302f8f.0
 for <buildroot@buildroot.org>; Mon, 11 May 2026 08:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778513965; x=1779118765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Pcidd9ITMsjhE93JiSkPueq1ZX2MzRENuywJt9IJHY=;
 b=at17iF3QWAhSPtUDhD14sNkOrgooTjpEyT8rocQ1191QpSx1wb6ESA3bjhoW/y2OKi
 z+4TB9RcbTVEHSq60iBgZ8HyhzrP7SHRt9UKufuszz7u5dwkc2U3ATyOFo7g5qguRhqT
 zmkqz5mXlT/u/rzGboDKRFHh9hys1ZJnoJSSXYCVxTTeMAZcomKWjc1BhF4sEo63zX2x
 +24V9JdHTBAUfe2XwkiHZVBgKWMEQwRAH5QeprGHHDiPd656FUXCKI+QyfmubdzQbxKd
 8SixCsd1hGaqobG0DLMWGKu9Z9Y4i5RlqcgU8ruWSyL1QkI9Xk42xvrAzmODEQO6Vvq6
 wV0A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wqglctaEfoIJFXRpGnhY7BBwQ+U0vzPLgXBxJdUK/rwzaIO0z4UVHGPOjoIu56XyRJilXgqMg9vU=@buildroot.org
X-Gm-Message-State: AOJu0YzeB1jewaHk21ksiJwI/5m9uV0zegH2mTGWmV05YTnpSswDKS/u
 VHQIRzPQhBDiW4K65Kvtmz9o4v2g6zwStbI7YNI4VWK8MELMSVnNc/s/rf7uqifzogG8Lp60NzU
 IQVIO98Q=
X-Gm-Gg: Acq92OFJRtmCYRKCVU3kSMIO/g6ZgqmipwddKETg6U2sK8vC3Izn19HRoO41Gxv0nJa
 9G8kHA8Ff4EIoYEMCe1jVKa0xQ/02g8engpFZYN71oK1FRhDg+puwnVoKbkpnd1BFISm/uYKVWc
 dXjnd0s20owteJ6C6/p/v13p5XCsSj74SEIYk9sCSiE4y61BQssAXBRRR8xSzr6QL/tDuYzictf
 ZhQmWwXHEISZ4/oFqqGiinBbg+N7w6Ttobx6EkWIaBC7dN+LDXHPhy/PcnTwZawSgRHtFyh50fQ
 1jbHaTv7fd9jKMFu9TJ1mQQ94dCmDRTuV8zslR/ez51Zj0mH+FdfqBoC0eQrrs2ly6FnIwFY9yo
 z19PDlewEH1YjcRlkjOEsMmlsDff0Zk2wL7nNMQ2YR9A9kpJ/dxGAXWBgzMmfs5/qjYMB4/XiO4
 OQ4cHaf5/TtBoy2MjdHVXLJVL4qgQU2BHW+LWhJWraUr+O6NdooC/JWes=
X-Received: by 2002:a05:6000:4007:b0:44f:f454:8a4d with SMTP id
 ffacd0b85a97d-4568c19b209mr15166022f8f.23.1778513964626; 
 Mon, 11 May 2026 08:39:24 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454919c13c9sm26015067f8f.27.2026.05.11.08.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 08:39:24 -0700 (PDT)
To: Jasper van der Neut <jasper@isotopic.nl>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 11 May 2026 17:39:23 +0200
Message-ID: <20260511153923.339582-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507161230.1986411-1-jasper@isotopic.nl>
References: <20260507161230.1986411-1-jasper@isotopic.nl>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778513965; x=1779118765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Pcidd9ITMsjhE93JiSkPueq1ZX2MzRENuywJt9IJHY=;
 b=W25aGtZpph/ho/tPO1+X/KdheI5DWuUyMAzcvjfcIYXAfV0jWtTk9fIcrkrq8xQuzG
 zfcVQGCxKJsnYr/bDTIJn6csc0UiD1m67Tb0K3ODtyQcZ+AhmASH6/ZDzTpEGlHIrfZD
 MDdJyH2GsoN5qYEpQpFpaBAnvS1sclmmn/pHw7Mz3YhHvnZCTOaPxnMg+Bkrrt8iZ3kU
 pAHNgL19ZaSk8t8FUzL5h3DTONdbK0SlfKmydDt08eiwCjUCWeftgHGtycgH05BAOJsS
 LcOVHkwwapmkF/cnMhLYnMpNuUzAeiTQpzcjRUS+GvX7gAPesQFF0kqxkaisg1KOiLOC
 9r5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=W25aGtZp
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/util-linux: fix
 loopdev-fl-nofollow patch
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

Hi Jasper,

Thanks for sending the fix. I applied [1] which was sent before.

Best regards,
PERALE Thomas

[1] https://lore.kernel.org/r/<20260507135455.980874-1-buildroot@bubu1.eu>

In reply of:
> ul_canonicalize_path is not available in util-linux 2.40, so build will
> fail with an unresolved reference.
> 
> Signed-off-by: Jasper van der Neut <jasper@isotopic.nl>

> ---
>  package/util-linux/0006-add-loopdev-fl-nofollow.patch | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/util-linux/0006-add-loopdev-fl-nofollow.patch b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
> index 21b1e2596c..228c570554 100644
> --- a/package/util-linux/0006-add-loopdev-fl-nofollow.patch
> +++ b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
> @@ -8,7 +8,7 @@ prevents symlink following in both path canonicalization and file open.
>  
>  When set:
>  - loopcxt_set_backing_file() uses strdup() instead of
> -  ul_canonicalize_path() (which calls realpath() and follows symlinks)
> +  canonicalize_path() (which calls realpath() and follows symlinks)
>  - loopcxt_setup_device() adds O_NOFOLLOW to open() flags
>  
>  The flag is set for non-root (restricted) mount operations in
> @@ -28,13 +28,13 @@ Vulnerable Code Flow:
>            hook_loopdev.c: setup_loopdev()
>              backing_file = fstab source path ("/home/user/disk.img")
>              loopcxt_set_backing_file()       <-- calls realpath() as ROOT
> -              ul_canonicalize_path()         <-- follows symlinks!
> +              canonicalize_path()            <-- follows symlinks!
>              loopcxt_setup_device()
>                open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
>  
>  Two vulnerabilities in the path:
>  
> -1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
> +1) loopcxt_set_backing_file() calls canonicalize_path() which uses
>     realpath() -- this follows symlinks as euid=0. If the attacker swaps
>     the file to a symlink before this call, lc->filename becomes the
>     resolved target path (e.g., /root/secret.img).
> @@ -82,7 +82,7 @@ index c72fb2c40..3d2274693 100644
>  +	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
>  +		lc->filename = strdup(filename);
>  +	else
> -+		lc->filename = ul_canonicalize_path(filename);
> ++		lc->filename = canonicalize_path(filename);
>   	if (!lc->filename)
>   		return -errno;
>   
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
