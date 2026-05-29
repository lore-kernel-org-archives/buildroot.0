Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10507CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6A278433D;
	Fri, 29 May 2026 08:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQypdsHTW-ry; Fri, 29 May 2026 08:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AB884332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043438;
	bh=9pmAIKaUR1FJU3KQaC692JUBsx+90Lz4zVbp8iYUAXw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ref4n2RTzbO9GEaR6Vc4KUpXRcZbAio3HFNaJpkgFsEQ5Ycy8J2f3KKizNEgX9x3t
	 0CB/3H6MSdB0YAb/nCZyN6Yfmt8ubGeAL/rTaiGnRpPFUTyt5PBmVvQ+/7T732NVSu
	 pXBuVlCdleyblc/ynO2W2Lgf8OCnWWEsRD8z1XywDD25wtOli3uMKBbGlDc/Nfs1SU
	 IZm/fgLnx5PiIuW5htcahgDSkCqkJamdfD7L3KVFOiNpj75zPyQsM7hCpzaZBP+FtQ
	 oFvYB9cwHBGV1pSrtKIdOvBXAARE/0QZiE8u0DpRne3T1sH/I+wGcsJRj9boxQiIlF
	 YjlN511mZpFqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AB884332;
	Fri, 29 May 2026 08:30:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D2AD288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6754161596
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzWe621rX89h for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46EA7615A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46EA7615A2
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46EA7615A2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso8249354f8f.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043422; x=1780648222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZMWpGtc/Atubz8R7XRmq6OPHbclshjqaiKDxLgXnCHg=;
 b=Wljs5RwcedCqUVo+bjrd7ZzzOuTKBBXYfqi7Z6nW09isRRDIbwk5jMKtCPGa+6s6QQ
 xD2VhYDM5aItHSP2vMvbemcuAQxUpu7zrFvzUdYl20MzYvAZIg73sL1X+tOm36Mjt7IT
 /4+wx7bVOJP4nJ+4pUvlUiI/lLRYhFO4ap3HuAhdKGdH9EaEJMwLksxPA0VUgUW2vPhp
 bUFB153NxIreBmsqArV6u57dOD7c2QS2Jm1wt9OXnumVOU+SDh9QABrY/oIqHJXkNvur
 nE3l//2czfsQZUukztfO8Lc43lMfR2NRv5HQNlvLa3GDKphpVl6PAuFkV6Ds+WHCreKm
 6fjg==
X-Gm-Message-State: AOJu0YzOdybzb93jQpK/AX/pYKOaVtN8Z2meswUG6kpAjOaS9nVFcpYJ
 ccSUmlURZKb+SCnV2kOP5MtL40P34D2QnYN48yP4K9OSBQCBGm/q03FvlvKHFl6Ya/s=
X-Gm-Gg: Acq92OFkVsrrbOv3NmcdKwB15aeEtloiyWQ63+Hov5wPX+D12EkUYgxyd4zldhIJP14
 UkLBCUxroVBbB2Tz1yhYrJiuJnCgCmdIEV5+YM1Pvb3A0gkPwjSNj8Iea5Cz1VIj4qlvf9yUHL6
 4G9JSYaNk1vmjZdsv59R87SG+0s2HFIcrUhCcymskzyg8JaJxXR0x7hrLgxckBv7iq1BmS+HmzV
 h51vExCgEiQR4F5BpMxFZY696ygf3F6sWxYe369F/ifMdt48W7NMl1/PKGkSXe7TVqxBdbwW9Di
 iZ+cwjoOalRyshZRbWw2/jZpiwWwbPIgUy3nfs9Og7j21NmMyBIGJmTk0nlXxntq1eayzO3f4jr
 5fjoZB17i5O4s3emOslkzYkldt2s4ZgUAngGq8C0MUfDw4R/vro4Z1Qjic+0oi+V8KUWcqX+962
 BosTONOrewrcyFOawJP4+LH+gXIayVJyEXMcGyMMi0goCrkScUXMmLqy6mcA==
X-Received: by 2002:a05:6000:2002:b0:45e:ea9b:edfb with SMTP id
 ffacd0b85a97d-45ef14b1b2fmr3601226f8f.39.1780043422171; 
 Fri, 29 May 2026 01:30:22 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef357635fsm1749547f8f.33.2026.05.29.01.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:21 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:21 +0200
Message-ID: <20260529083021.59384-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513165017.551670-1-thomas.perale@mind.be>
References: <20260513165017.551670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043422; x=1780648222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMWpGtc/Atubz8R7XRmq6OPHbclshjqaiKDxLgXnCHg=;
 b=CMLv6d7wcG0tTpYYBGNzAwBJNbGpzeVoxNkD26SV+kMI0EcOcj3e14jCjkXGZDs3Eo
 ClwFOaRoF/YyesLim2W+tp0R9nh7Zkll3WCVXIc5oq3u1Ed4uLVUekOahvssB76nSocC
 fJdR3ETicUivF/A43A5TvP6sYKztlVrz/Z3NpIzIfAOoLR3yj/rXHB13ZXJ3NDLod6H4
 f5PwddMelEXQ7NkWNVoUpXWBxjmrS8hAccw7Pf/pE8E01AFmFrNC3UDGHsg0DNpcsPhA
 9jnEw9IpsSg01yUv2O8Oa6Dda4ydvW1KOx/nL8prN5NfSNZtL7XlRpgBK5967A69ZajH
 yskg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CMLv6d7w
Subject: Re: [Buildroot] [PATCH 1/1] package/mongoose: fix typo in CPE vendor
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
> There is no CVE assigned with the vendor name "cesenta".
> 
> The CPE ID introduced in [1], correctly reference "cesanta" as a CPE
> vendor but introduced a typo while writing the vendor metadata in
> `mongoose.mk`.
> 
> [1] 3d632c941f package/mongoose: add MONGOOSE_CPE_ID_VENDOR
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/mongoose/mongoose.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index 432c20a54c..8250751eb8 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -8,7 +8,7 @@ MONGOOSE_VERSION = 7.21
>  MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
>  MONGOOSE_LICENSE = GPL-2.0
>  MONGOOSE_LICENSE_FILES = LICENSE
> -MONGOOSE_CPE_ID_VENDOR = cesenta
> +MONGOOSE_CPE_ID_VENDOR = cesanta
>  MONGOOSE_INSTALL_STAGING = YES
>  # static library
>  MONGOOSE_INSTALL_TARGET = NO
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
