Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58324105F7B0
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C29360FBA;
	Sat, 14 Mar 2026 07:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSqLc1Vhj5nz; Sat, 14 Mar 2026 07:54:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C740460FA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474846;
	bh=DE7FHgJU/bIsiC5v13Qz0DFusjjtOUZVrOqVVp4NJRQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UMK9OZmgHUKf1jstwdkVdmgbHkCm+iEz5tseISDJMU5/uA/uE+ybCIYu4I79Qxg8v
	 RMyIAUu0ahFuHG114L8RCTF/HhB8U+ZldtIaEhcvIkXrO3yRw6Y7JkfqX7llEtpSi7
	 VHWSCW0LzNS+LxVDRbQKrlKg812GHpcKv8X0SWTfc+BRejyzQocCFqiWJ6e3o0E6XU
	 9fdm42c3L6zkIlOz7AVkmjsiUvLfqoG2If+IoL+biNHMloehX4eYIN8t0NGGvod2Cg
	 hL5TTNg6NhZ0CAtJ0IVz3BHVs4S7mPmzGGprGakzGTPKbi7zZ1QMTljHPw51L/qlkZ
	 W/CXyeV3b+b5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C740460FA1;
	Sat, 14 Mar 2026 07:54:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B48651B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A63840135
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YexWfAlP4OmY for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:54:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75EDA400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75EDA400A2
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75EDA400A2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439c9bdc1eeso2995937f8f.3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474839; x=1774079639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Yg4oLCCjLunz275eG0GlXniBxYqctWkBKDt5GiaiIE=;
 b=czsgivj5OO9hNBPpFq3rjH/ptJisbns/dJMrS9mTeIr0aWtyZnQB+5ETyhV4dJYvzZ
 oT0g7tWNRcwAg9gpD4T2k8gGnYK2zOJmFhikq2VtiDWyrbIyU4er5exJdBHQ8ssaiyYf
 M+lyiFbg/Be7mCJyXba0hFLifW9fZNlhhXtDpA9oFLJLF6Ip7KJTfl+DAbA/BIctRRh7
 c8KlcfpbjIm/QT3R95eto83WKWLYThVXZsjb5/cV30Kbe8EZhQEf0wpNtM0KlA5Hcao9
 dtb748+apoO9op/t8BPhuiiC3z66+gsopBKRcZkKvyBXQAPhqNQnco4gq9/1Ds5J3ZUr
 wgxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX20gBk9xlRRNwMnjQLkuwTIuF827FTnQNImRJ2jglYDZ2n+2vJ3h2JGhV51CUD8QQMoX9obRBxdLY=@buildroot.org
X-Gm-Message-State: AOJu0YynHd8KbR7m+duT5YI0vBaHXWc+mL7TlE5OLgT9oiFKM1/IX66k
 TykWlbizuHI8PBv8aD7S5BxFiF7EwSdI2vB2+9U29aaVd3laF1RRO34uBwhZHJf+Lpy5qe+CE4V
 ETiLk
X-Gm-Gg: ATEYQzwThKyIq8cN8EqMlA7R3ODi5QoVf+3gkov7OkuwVPxlxQRdflcqnmiu6kd+Cvf
 EIl45eG1VLeUfApPa4UB/T6OlcUWlUk2Cz1Rqrw6dsPgBeBpsKQO2I7vO2+u5aIeWF1iaGVeeZ9
 OJpGFVTrLOWrQZc909feAzHqWhVPmBfzeEQinb9zuswv62kRIJ9ITHLpiRQ22Xi/+6aRYQINiKt
 hC0uw6WieAjrxLZd5gHtKoPo7IkA5jmSCOkDWjR6TBZorhKUeQgpfCuj2w8lohqXO/3lwzEfZBd
 FoQGzu2Y7dbjUjj2zA+Z68/miz1dZUxb9qEl1pEa3C68djTUWZ2J/hbwk19gtAmRvs+O1RfPnln
 AMqCk8KTv+Qo16cYiz9YqfnMXkE4lBwZ6peKop+wO/nnZXunlEc5IE0fPyB5sKmz8w7c29WbKgk
 T9rujB4NQcRRG2A8M=
X-Received: by 2002:a5d:5e01:0:b0:439:abcd:b2fb with SMTP id
 ffacd0b85a97d-43a04db4e26mr10760894f8f.32.1773474839101; 
 Sat, 14 Mar 2026 00:53:59 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe2273d9sm27346645f8f.34.2026.03.14.00.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:58 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:58 +0100
Message-ID: <20260314075358.15114-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306074106.124068-1-bernd@kuhls.net>
References: <20260306074106.124068-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474839; x=1774079639; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Yg4oLCCjLunz275eG0GlXniBxYqctWkBKDt5GiaiIE=;
 b=YjlHTTQNH7PELgye2ZNBVRGytC7d2pwgkDknd3YsRZdXL8UyKCIZWigtS3253eJ9b3
 zqSovnM2ee594zDl9CZhbbYVCCP33TpFQzrzseC0X8AtMvWWE+pzgO0sXaeBs7r+o3II
 8b99mG6P2arkxOEEPSOnkfY84BdTWRajiivgmiE1WkHo6+ZHVQSaKYQsHpjVNvuN9kdY
 W61qK+YgXYe2huLA0YoJ24aqjvt2SCRtEtNH9SXWaL5zQdN8xQqr0LMHG5jYmI5wwtn/
 F2pZ1oBpVJj95qyuUtuGXvwn2QL6H7ryKFr8tzvEyI3JyffwXQpoupMFaqx1T4Wh2dE5
 NmBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YjlHTTQN
Subject: Re: [Buildroot] [PATCH 1/2] package/libtpms: fix build with host
 gcc >= 15.x
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
> https://autobuild.buildroot.net/results/7a6/7a6ea7c513e8f1dcc32d868108bfb2a907d6fe85/
> 
> The previous change to src/tpm_library.c dates back to 2024:
> https://github.com/stefanberger/libtpms/commits/master/src/tpm_library.c
> so a backport to buildroot LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.11.x & 2026.02.x. Thanks

> ---
>  ...ilation-error-in-TPMLIB_GetPlaintext.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch
> 
> diff --git a/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch b/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch
> new file mode 100644
> index 0000000000..02c4df9668
> --- /dev/null
> +++ b/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch
> @@ -0,0 +1,40 @@
> +From fc8820cfaa8b5e17328f731df93911f6ab92443b Mon Sep 17 00:00:00 2001
> +From: Stefan Berger <stefanb@linux.ibm.com>
> +Date: Fri, 2 Jan 2026 11:37:31 -0500
> +Subject: [PATCH] Fix a compilation error in TPMLIB_GetPlaintext
> +
> +Fix a compilation error that newer gcc versions may complain about:
> +
> +tpm_library.c: In function 'TPMLIB_GetPlaintext':
> +tpm_library.c:441:11: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
> +  441 |     start = strstr(stream, starttag);
> +      |           ^
> +At top level:
> +cc1: note: unrecognized command-line option '-Wno-self-assign' may have been intended to silence earlier diagnostics
> +cc1: all warnings being treated as errors
> +
> +Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> +
> +Upstream: https://github.com/stefanberger/libtpms/commit/fc8820cfaa8b5e17328f731df93911f6ab92443b
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/tpm_library.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/tpm_library.c b/src/tpm_library.c
> +index f48f4fd3..7b2ea687 100644
> +--- a/src/tpm_library.c
> ++++ b/src/tpm_library.c
> +@@ -435,7 +435,7 @@ static unsigned char *TPMLIB_GetPlaintext(const char *stream,
> +                                           const char *endtag,
> +                                           size_t *length)
> + {
> +-    char *start, *end;
> ++    const char *start, *end;
> +     unsigned char *plaintext = NULL;
> + 
> +     start = strstr(stream, starttag);
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
