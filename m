Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AB1CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D552C6155F;
	Thu, 25 Sep 2025 20:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ni_qUxRBUKfr; Thu, 25 Sep 2025 20:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D0D96154E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0D96154E;
	Thu, 25 Sep 2025 20:17:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 690ED1EB
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57CB4415B3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IT_fWzp5A1-Q for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B15641505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B15641505
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B15641505
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso8661905e9.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831410; x=1759436210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l/04hZD2ZP5LQvu0GR6NdD2klUjptTomt5BlKQXq7aU=;
 b=pqiAMHYrH0bb/T6QFKcrZHuIr91RHYMduSyfVyHKlw+szrQzabMST17hjwJtAA7vNW
 8EQc5e6b+mopxS9SXA4+VoNLsoWDT6X4K4ZlPRmlJYYjAWkH5FfV/elYH1JoKa5pCVOK
 bKY+4x6Bwz0SAqnkmWNQGAkBoDZO+GwTirrJ6BoIWGJdfX55gwdkoTA444v2LBKr/SbU
 0KQlSBscVAAqp1sy+M5yAwKrUuBmTXlbAnNnHG466pJUoKiqbZ8rcWR3KfTbRUlHcnYl
 ReEjFNOaIa80OfnLTwIbe3SHi2LGkPT1FxuZPoHfrp64G5S8Bl5m3x4cJ1VK3X7F0Kpx
 8jDA==
X-Gm-Message-State: AOJu0YyfXSl/yOCXww74IeTJfVKZq7KSDhf0CzJQ8dKamuO4LFyXqEJK
 YdzaTHYS0nRfPqzixXQEkr22XbKrSkwJXa7QQZhJRO02oFM8Cn84yOs/fMJP86xbkfjNsvlTa3r
 4QslYjf8=
X-Gm-Gg: ASbGncsNx8S4qaZ7hbga5zeQK2ch3Zlg2lKNOb+Nx+UeoCZd/pl6XUpnmoQcMs+umFr
 JZpDSlKut5Fsbsx8IER4tI+XMnEG/H/vsvogr4iGA/IckkD4qOpdnIIhQ4ak+Bsc2L0eyDMSCOE
 OdyXNdkeXzmbqXBmBEmLV16WOL11BSFM96mYEjjkZ2uyHZsnQtFD0KEjVTcYa/B7JAjCiwialvj
 9AHkfco2S88V+ZNhQPyq3azpLT1b77+6NBUSVkHnr2FKuT+2fuVAfX4/4zo1hWfoKvn5kiu+BVy
 eQsJiPwtkfclcTqqyEk5MMuFDi/xcz2ROnA3bn0kn3akY14xnhC2icj14Nox2nIr9sYyXhF9Bn6
 E01wdfgOJ9LXz4lc=
X-Google-Smtp-Source: AGHT+IH0dhqQ+H7DCzSVA7ywO9ryP7LzOCtrJGaq2l9QZuOv02z3U4UGYuXxi8R1w7LES3KmLV1gKA==
X-Received: by 2002:a05:600c:840f:b0:46e:27fb:17f0 with SMTP id
 5b1f17b1804b1-46e34ca1f1amr32329825e9.9.1758831410290; 
 Thu, 25 Sep 2025 13:16:50 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33b9e8aesm45365255e9.4.2025.09.25.13.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:49 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:49 +0200
Message-ID: <20250925201649.43707-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917185443.2881784-1-thomas.perale@mind.be>
References: <20250917185443.2881784-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831410; x=1759436210; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l/04hZD2ZP5LQvu0GR6NdD2klUjptTomt5BlKQXq7aU=;
 b=Hoe21HYFWkacmko8UatW22AEEIiAs9INjVAbT7R/cx21i2jdFNA/ygozJJuRZSW7TA
 km+vUuhMqQAuQWwiNv1cRry2j+psG3n/WyNqC4DFDiA2YlTGY45zYxWXwGpdHqsdsh2R
 7BFpzQCORkPY6L0KonabPaNjxIq6/ewh25F7wi7LGYhrmXea97S0AjQCD55uERwamrMa
 QP8fjCy2pwRb56y/xhFl9KBtg0LV+f3tiT27/ZxTAjeGZALwuFZ6T/AIwLrHn8e7+ArI
 5JbYUVJgzwE7OauI2rvFs+BlMmYL+wBiPCGAYF+zMRaPWG5X6YXBXGIAxPiJ+me5lcsw
 XEgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Hoe21HYF
Subject: Re: [Buildroot] [PATCH 1/2] package/jasper: add patch for
 CVE-2023-51257
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
> This fixes the following vulnerability:
> 
> - CVE-2023-51257:
> 
> An invalid memory write issue in Jasper-Software Jasper v.4.1.1 and
> before allows a local attacker to execute arbitrary code.
> 
> For more information see:
>   - https://nvd.nist.gov//vuln/detail/CVE-2023-51257
>   - https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/jasper/0001-Fixes-367.patch | 46 +++++++++++++++++++++++++++++
>  package/jasper/jasper.mk            |  3 ++
>  2 files changed, 49 insertions(+)
>  create mode 100644 package/jasper/0001-Fixes-367.patch
> 
> diff --git a/package/jasper/0001-Fixes-367.patch b/package/jasper/0001-Fixes-367.patch
> new file mode 100644
> index 0000000000..11dfb5672f
> --- /dev/null
> +++ b/package/jasper/0001-Fixes-367.patch
> @@ -0,0 +1,46 @@
> +From aeef5293c978158255ad4f127089644745602f2a Mon Sep 17 00:00:00 2001
> +From: Michael Adams <mdadams@ece.uvic.ca>
> +Date: Thu, 14 Dec 2023 19:04:19 -0800
> +Subject: [PATCH] Fixes #367.
> +
> +Fixed an integer-overflow bug in the ICC profile parsing code.
> +Added another invalid image to the test set.
> +
> +CVE: CVE-2023-51257
> +Upstream: https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/libjasper/base/jas_icc.c | 16 ++++++++++++++--
> + 1 file changed, 14 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libjasper/base/jas_icc.c b/src/libjasper/base/jas_icc.c
> +index 905b823..2d1e91e 100644
> +--- a/src/libjasper/base/jas_icc.c
> ++++ b/src/libjasper/base/jas_icc.c
> +@@ -1295,10 +1295,22 @@ static int jas_icctxt_input(jas_iccattrval_t *attrval, jas_stream_t *in,
> + {
> + 	jas_icctxt_t *txt = &attrval->data.txt;
> + 	txt->string = 0;
> +-	if (!(txt->string = jas_malloc(cnt)))
> ++	/* The string must at least contain a single null character. */
> ++	if (cnt < 1) {
> + 		goto error;
> +-	if (jas_stream_read(in, txt->string, cnt) != cnt)
> ++	}
> ++	if (!(txt->string = jas_malloc(cnt))) {
> ++		goto error;
> ++	}
> ++	if (jas_stream_read(in, txt->string, cnt) != cnt) {
> + 		goto error;
> ++	}
> ++	/* Ensure that the string is null terminated. */
> ++	if (txt->string[cnt - 1] != '\0') {
> ++		goto error;
> ++	}
> ++	/* The following line is redundant, unless we do not enforce that
> ++	  the last character must be null. */
> + 	txt->string[cnt - 1] = '\0';
> + 	if (strlen(txt->string) + 1 != cnt)
> + 		goto error;
> +-- 
> +2.39.5
> diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
> index 45b9c49558..dd0badbc8f 100644
> --- a/package/jasper/jasper.mk
> +++ b/package/jasper/jasper.mk
> @@ -15,6 +15,9 @@ JASPER_CONF_OPTS = \
>  	-DJAS_ENABLE_DOC=OFF \
>  	-DJAS_ENABLE_PROGRAMS=OFF
>  
> +# 0001-Fixes-367.patch
> +JASPER_IGNORE_CVES += CVE-2023-51257
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
>  endif
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
