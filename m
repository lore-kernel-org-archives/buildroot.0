Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CE1CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09080607EB;
	Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaQQ-A1Eg2ag; Fri,  5 Jun 2026 12:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14236611F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663863;
	bh=4+x3tni6q6FZCPVbHiTyENfMSz06aCIPC+qxzFObNtY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rzlBUQai9liJXxzeC0c9mAMV2r1cBNlI9uJ20MMTk/s8WW3hAJxC2DzJqlMIh5Rub
	 g9q+ZT1ISt4TM6YNUgieJgTp4tN73OqjjKPp1vLWuUBkVl6cg/H4kMHveR0A69z9Lq
	 i5TB6aqUcoitXW1o6IlyYOnhlulPc7OWfdikipGb/CNL3HAScLxqzm+pBB8QgZnJgh
	 MphccANiXDM93lyURpoYVFEX1GzLGC24Kb8SbbjB1A6rrsuUr0F1MGnlfyz3NM2h1C
	 bTCjRGwAcC76SqOfIeniUaIsjYr9vnQPqVOqfWReyaZmCgIuFkw8/D9p+1ar8lW/wp
	 S1HhEBCZBNVjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14236611F1;
	Fri,  5 Jun 2026 12:51:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB6B5F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD35940807
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6enOcAplmI9I for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96B0A406D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B0A406D7
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96B0A406D7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so21992355e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663856; x=1781268656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4JAHAffwh/MK2ACivTIF7Z73IwAm6WgJLofOqKN2hmU=;
 b=cdqdgSefz8rZsAKIfuY9ljiH12zlZjgFnl1fUK8apoEOTQeqHaYIrk6JT4XWXnlOF4
 qq9t3shQcDNTNm51ZP7PZGr+kKaoMrOz79z+aDQ/eEklQF7BZZRBH1t+863F8QYZ7+k3
 YDnqBviFWfQcvGMH1EqODL0ENQVCWczeolvnsvCGajQqs9ODLxFFMkMyt5Bs/IngGCjY
 U0rgMI7TXGtj4jzO3W27Gis+cNC5XTVtmcvx8TlZ6wDnD5Wa8u2Mz2Tb0eJLmTnK6TdW
 u8rpweifkVM+G0R5a5Y+Nf8megOjmxVm/EK1vE/5cTAoHqyza/lUyhStg1FBC/krzXFB
 sE2g==
X-Gm-Message-State: AOJu0YzWVQyK8mUSZWMRzUmZguBejuzM5Zn9IYeqx9wetU1IOnOVXrPT
 +RK2IM+sXTPOfq6Y45ei0Dci+LzcsY8RCAH5HuBc9nL9rzVhL/WVBo9MQljZS8ZqINw=
X-Gm-Gg: Acq92OFJQqjpUFkRmyj/nuMSCTGD5GFUaVRxIge7cgxRKHu+vThlms3F4viU42Ydh5c
 vITPGQinWJb+Q5k4t7R+FkMLXXar1QNtRtbXGzrD6BnJjD7cMvwm4T/f59Zq8z4Gx3t+5pmFbNX
 rRCbNlVh93SQBPT/sChVAopDxSCt2vEcvU1fxtY2mnU5sTDUu/ZfkVqx0/2Xt770hQzEi3Lbc9q
 U6Gcpqh9MwmA3pXBUWzFuiOXLF0q2/haXqY1D/+Tg/FH50wQNW0fppmYsUHlixaUkLlZRZw8hRi
 kaaruVOXF7dIyZDQC2AYrKTKl2mKRbudzX/9w6wttc7+A/WeGNzgn3BjfGTLMNYRu6axSk3IJ0q
 T6kdl/Rhhq9f7bHU71h2onANAhmGFGzIjs4IEbKHOWfX30h1IyY6ti9qHKthszZ822roGZ7dZAD
 4cdxSX3AoqPN97U4q4Ozw3HW1c3Q==
X-Received: by 2002:a05:600c:4e94:b0:490:9588:bdae with SMTP id
 5b1f17b1804b1-490c25e30e0mr52639605e9.18.1780663856415; 
 Fri, 05 Jun 2026 05:50:56 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2d4891csm34842275e9.1.2026.06.05.05.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:55 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:55 +0200
Message-ID: <20260605125055.274783-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-1-thomas.perale@mind.be>
References: <20260529094514.178266-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663856; x=1781268656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4JAHAffwh/MK2ACivTIF7Z73IwAm6WgJLofOqKN2hmU=;
 b=IGgVNpJ6Uc3FYV4RB2/Y0314RugMV6elg6XFLd1YqF33V2J14W/ArmZZElDZ4sWkrG
 Cp03dEoDBLfcMiKeOqdnavtANU1GS1GCOpT+9OhNAAYZfZgefqcFXTNu6iliJC0Vhq/A
 z6NuXv2LAR0hnjQ7uF8ZKNF94OigxNBGBOhqHPxqbj8zamWPRU9nJ6O8cj+uV77teTEZ
 wJTohN6z1e6pgMcJy8sw6s6e1bz2vtB+KS0CUHCYUsDMX67+QMy5I8nMiSVEosYsMa6U
 sMLDQZyFzHHmoonAQBFQBUXcsYBOhFJC5VXCWBBMbfZelB5faN6EmYtQ7ki1SQNavfBH
 PVjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IGgVNpJ6
Subject: Re: [Buildroot] [PATCH] pacakge/jq: update CPE vendor
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
> The CPE "cpe:2.3:a:jqlang:jq:*:*:*:*:*:*:*:*" is valid for this package.
> 
> See the GHSA [1] and the associated CVE [2].
> 
> [1] https://github.com/jqlang/jq/security/advisories/GHSA-rmpv-jgvr-wpr9
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-44777
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/jq/jq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/jq/jq.mk b/package/jq/jq.mk
> index b0776021fc..19a130b694 100644
> --- a/package/jq/jq.mk
> +++ b/package/jq/jq.mk
> @@ -9,7 +9,7 @@ JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
>  JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation), \
>  	BSD-2-Clause (strptime)
>  JQ_LICENSE_FILES = COPYING
> -JQ_CPE_ID_VALID = YES
> +JQ_CPE_ID_VENDOR = jqlang
>  JQ_INSTALL_STAGING = YES
>  
>  # uses c99 specific features
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
