Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C8ECD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7A84235F;
	Fri, 29 May 2026 08:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8K-qRXhoaOl7; Fri, 29 May 2026 08:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80C642362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043439;
	bh=SnqXbylJ17tt2pRYHWzoNmNshBu5BU9cRAvGxxdnuUg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GNrIJkqKfurHQMV8YDP71mMHi5BrkRCTdtrybTk9IrMgYJZiuKz1uu8U4l5TyBoUE
	 DsxIPezcgo7YSzgGf14u/6wqAV5hj6wtK4dLHlHu326tp5zMzjiAFpDHdu6IctVGLL
	 Xj6gQA4aYjIwRD/GztMN/TpXmxOgzEm+9/7kspzmesVdAiMEW1k58eBwRSI0EJgluW
	 P8RzuZCIVF34RCJV8i0QhelX272D3E0q/rjFApjcrF7sCfQjTutjyVb5NkCl5wbAi5
	 giHj4Jp7MWl/N+PATteeHBGNJblC0s/hzbNGk67R7o9R4wKofuMe7Hd4oX6axVdYKA
	 tz7K/UWT8YBIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80C642362;
	Fri, 29 May 2026 08:30:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABD42288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ACF142332
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_b-Z3zZwqWl for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97F8742331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F8742331
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97F8742331
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso117607375e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043425; x=1780648225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pGs3QIdzkPGBEJ+kLA2etEIV1Qc2WbkrJ2PQstQUc/I=;
 b=raBORKTqYMjSrbNfmDz27xjl/68P+kQmg1Bds+T6SWcvjkKqB/gPMCNMnRvtn6nn7O
 vOC7IUQedyu5r6/5FnHzmcnhWh8jEFHCPNjMqeFdILkh8RHK9XcUsvE6gXYGXzR3cFey
 xcGj1kPobIY9cehFwZuNAa4+CSJoUm/W2GctkJTATnaLi75pACXfUOZpKgwyQnuQp2yW
 vrWDuZkzY99jE2wY1fMVMeJeOPOO0aPk0HzSPyGId4xmMDcZ/fXAvWEEpmwKq4nqkBn6
 LniJbFS3qN5Su1woJNZnFt0ZqRFAtAm5+RnIkhf0zGKgDLGfOOfA8vM1eSPOpJmJhNuS
 SfYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/X0lr7llD0ItZovjjhO5lGAMEFH/IbzCwDuBXnpN54lRAfinu/09ZXrND3LGotqZLJAFyVLE9+ScU=@buildroot.org
X-Gm-Message-State: AOJu0YwvaeHN7+YIIcw8V0p5tyzP8j/tofa0lwa3Ck7z4Pw+Yn27KwlE
 ItYQ+t9ZFyztq9BDshHSGojeevcv+cJGLhxrteoZs4ZKJXoImd1DImoASDKHkUtpDBtsAwpIBKO
 fK+Kw
X-Gm-Gg: Acq92OHgqP3h9b638b7u8EYzXJPNLffpOHH8XDmlV13eSRAklaj4Nv+l5gEdvx49Dqr
 vVo61kftebSFPSLROcJmppunZ6qGFQo4MCYhp9HL+VRgQ9IZbG/0Cn+CAIRKillw1ioS0S/B6KA
 yb8hMcQcIL8jYRNzEmfjQNHNn9U7oZqu+xi11FR/wHfoHg08+cRTnwYLJQX0FzNN96VZZxCdvt2
 6JuBLkjzz100wlxB3DcTldM9J3pMa1DPzoC/M5lE3cAkBIWIhnCULzt9v23TecVy9rpghK8v6Vw
 PVpffDzuez8s1+1L2Ayo1wIxecJKsOpTW1wEGZPTjfyPhNobA7d866fSwuhKbXdmOhEMW7CeqDK
 wSDv8BGIkPEUVacz0m9i8sEPev9vSlm+51wlW+o+fCjfLb8kN3VmgdE4pVxEhJ8jsNjZ15uhPly
 ulWcBvbpLfAPb+VQapWo9PA/2r4blrgGjJcVVmEJmm/PVgYecZh11KWZLW+A==
X-Received: by 2002:a05:600c:34d4:b0:490:9e5b:9e31 with SMTP id
 5b1f17b1804b1-4909e5ba0c2mr21559085e9.0.1780043424574; 
 Fri, 29 May 2026 01:30:24 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d696f25sm32017035e9.5.2026.05.29.01.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:24 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:23 +0200
Message-ID: <20260529083023.59489-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514062942.20224-1-bernd@kuhls.net>
References: <20260514062942.20224-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043425; x=1780648225; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGs3QIdzkPGBEJ+kLA2etEIV1Qc2WbkrJ2PQstQUc/I=;
 b=ITS/XxrQHNgqUK64x1rwTQDoxR59OBezG1S38BWI0NNQ6+UdR6D2HTasVUvbVLXsab
 8fMPaQlc7UBcgIm+tBSuYXTeenH+IVYRTU4+KUai9csGx8wMBSggOqansCfc1BpCd+yl
 wIqJLY6WlRbVxWl7u6h4Zv4+Kh24gp4hqxBDy4I+XQbBLmnghnzUs1WV30WV73t0bImM
 eOSlNpGF1O7B3qL/4jB1diYRURAENRI+dfLCFWRSNiv6g1Q4N1almUT/m09BmWhYWNq4
 H2JV807isVKA+FU3JYH5gE7d8bTeTUjFOHBdKkvKx97uSXrswKxutd5JFob0yBWamJGo
 c9FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ITS/XxrQ
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20260512
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
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260512
> 
> Fixes CVE-2025-35979:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01420.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> index 588cf7cde3..bb36a52fc5 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  fcac5a08d7559a2ce4ad3b1ce5d59619c8adb364b9c51988fedd94220392bb37  intel-microcode-20260227.tar.gz
> +sha256  5a07ce745d0bd8b360a4713564d46d5e38be797316a52abedaff0761e1b02370  intel-microcode-20260512.tar.gz
>  sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 321272e10d..f6fbee54b4 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20260227
> +INTEL_MICROCODE_VERSION = 20260512
>  INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license
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
