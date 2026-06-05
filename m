Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEF0CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FE9360B53;
	Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB7316X4QXCq; Fri,  5 Jun 2026 12:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26FFF60F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663762;
	bh=kQdp2gvXmFrsEpaXfokWZp9F75k67Bw/XGYW5G5Y2vs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CIQkyDn86igz30Nr1598dwKP3JUpdy9U20qM6GcMIfs6dJE/pFYQxBf79TfXDh2W0
	 Rtq1tkavaLjzplqrpdaO6cT+DZTFYa7lY/X5Wa64AHwAqSpqucNekTyIkOy/VjBAcq
	 c4T44d8o5fmwymkNy/fx81iSP/IPW4D5xhhYuL2bTTbVovHpPVlAHYNQpGzt5bvxVs
	 hviAh8wz56wSHKokvjlGkRD1xIGzBEEod3XXQXelN/T0uCeg/4VvQ8mzy3BnSqrO5o
	 HgKmvKsdoV58a6kd9EJIF092edM3k6dHnUy0PvHdXkXPqCd2e8a8dCsNzH3j2quolG
	 o9xCODsvB7/Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26FFF60F28;
	Fri,  5 Jun 2026 12:49:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA1FEF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A633B8215E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdY-yv1WkQF1 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AFEC820C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AFEC820C6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AFEC820C6
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so15515215e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663756; x=1781268556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qrlGx+x+afRSUFxfbAW9kta4i6u43llt9tDpNT/oS0w=;
 b=oPIj6DU9v6r6c60nKcqRZp5CM4TqiHrut1W4gTyRgxer/x/EH2/DhsUuT52uVidrQQ
 ZHkyN7u5fuXFpe2bYcLmrhp8D2cJZ6XkjANf5IaVRc6JLr1EYHc6tF4HFdVJM6/AOSmt
 aq4cMVKhck+7DTMq7jpUfeIHtkB/Z/d+8V9hgRc55PyKzGmfWnDD7Q6rNk0l3ScoDZf7
 +4ZzV66j2h2oidb/DPQGdCxRCZShJBQIYl91OR68UN2s5d59hqRHlxascKTmPzYvAmeh
 pGRFgKAO0Rzc/g5FAK0HRF/amlqIjVd7MgoSt2S2Fyows2dU3bgdKEsW8o+QDFdLmLLn
 gyUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sC4Zqup1oX5ikndU4kOOatVYtZ7HFZze4d19DMTQMoLnqrnIIfQ8Gss4/eHlV1+bhx+zTGIOo+vk=@buildroot.org
X-Gm-Message-State: AOJu0YzzylqJkKy69qYFknaTtVdkz+DTxOTvqLFykPd+YsrA5UUUHzwu
 gg4ZEsd4fmt9rqxEG0DT2SJPl8/G5Y9q82XKIlEIZ02FsKb4Q5EyuU44ykw4WHImO5c=
X-Gm-Gg: Acq92OHyfEZf0Q+8ctA85oTzhcnctg8LGGfb8ySefGG36SEg8ojavBOzJV1h2+46eRh
 eaD3x+K2BGphGUrkRAmKIPwrxoA7txvnrVAd32sQZNW+LEZK7TMKaowJ0W+lAzns3ZY6AEG5XaX
 ryj5OYEyIC+LbeTn86pXqmQmg6FSbgBtqTpRco0h1bs2LyreSDF+ASYrgfyYQtpBYlINU8EYi6x
 eDQvNQrOwCD8viNXw+hvvu64VbQZ0uzvL2xgUqyryZMn02kdPrHXev0zQHzqM96OZnPgP4YS9HO
 MhDLVK69UAT88DWXDyuTdDciLIR8nVNWQZn9DdQb6vX7xAyMmzfVymGy5n6EfGK/V8AssnViDeW
 MWCuycPm5DxX/gtl1OFBIe3ehn/4ngVmQlc9lHbFK1S/3jUohKXh/TwkdLqVuPCIsv6HbSxw6qt
 SJLgfzV6dTcArG3PfwhomDtFsulw==
X-Received: by 2002:a05:600c:83c6:b0:490:6e12:542d with SMTP id
 5b1f17b1804b1-490c25fc0e1mr58743465e9.19.1780663756112; 
 Fri, 05 Jun 2026 05:49:16 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm25663048f8f.13.2026.06.05.05.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:15 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:15 +0200
Message-ID: <20260605124915.270640-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260118133155.1910082-1-bernd@kuhls.net>
References: <20260118133155.1910082-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663756; x=1781268556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qrlGx+x+afRSUFxfbAW9kta4i6u43llt9tDpNT/oS0w=;
 b=TKh+2BVbRnFFNpsbOHvCv0wNknNv6PDF210/WJOLTO3aHOQQnM6ofCOcA26PLoN229
 tH2/8A4mKFZhuzQWwcnfiEkJf+h0+voAcAiPkwdsl+fDCCmt156QR3hM/EGA/35ihE5K
 KoKlVRRN8YcRTBN+VvZ1m3ZMA7z9qolKQJ/vYzqN1+jZgXPJ35mVQfUzqZr9vOQRJpFM
 kqEv+QAE5A02E5cKmoHH6iXiDOrLMf+WyOhIs5YKMvHvnswDYXbZ14pnd+lODevukjjQ
 GvaOkADuMLwTrIITIPRrj313+lsRrP0ims2b/U3zYNfLC/gxnm7rhZR1nJEniidDHfj6
 P8bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TKh+2BVb
Subject: Re: [Buildroot] [PATCH 1/1] package/mrp: fix cmake 4 compatibility
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
> Fixes:
> https://autobuild.buildroot.net/results/d93/d938025a881a14003c1b50065f163115e36cf33e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  ...m-required-version-to-3.5-for-CMake-.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> 
> diff --git a/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch b/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> new file mode 100644
> index 0000000000..7ddf08cd6d
> --- /dev/null
> +++ b/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> @@ -0,0 +1,41 @@
> +From 23877eaf1042b56e1bdca1883447e9a83d5e8263 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sun, 18 Jan 2026 14:26:05 +0100
> +Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> + compatibility
> +
> +Fixes:
> +CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
> +  Compatibility with CMake < 3.5 has been removed from CMake.
> +
> +  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
> +  to tell CMake that the project requires at least <min> but has been updated
> +  to work with policies introduced by <max> or earlier.
> +
> +  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> +
> +-- Configuring incomplete, errors occurred!
> +
> +Upstream: https://github.com/microchip-ung/mrp/pull/2
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index d7a3798..a0ae196 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -3,7 +3,7 @@
> + 
> + project (mrp C)
> + 
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + 
> + ## libnl ################################################
> + find_path(LibNL_INCLUDE_DIR netlink/netlink.h
> +-- 
> +2.47.3
> +
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
