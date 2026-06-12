Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5E8CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5127B60F76;
	Fri, 12 Jun 2026 11:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-gZ-Js7CsRg; Fri, 12 Jun 2026 11:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D30060FAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264221;
	bh=Wzq0njDiqDecMiuiOQ0lNBiMRsVlETNmQfd3g3d9dhc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R3kx+qa6ikHVPleobnh6qRQ73jhTovaPTL/Ca8ZsovwqIdmM79fcJ+xWKydbwOoNJ
	 KeILs/LIohs7WdVK9T/Vjp8/Dmn8BvCyrJvgCEnbfStr8M0Pgw6R+Rh5SzOEy2m+L/
	 8C2uu+SaRtcNBWFaesDRqwSJ1cvTu1X9w8lcxcj8f1fw2u7PYsSIu4Ux4Nvia/5h1P
	 hx3Qxz20DcNX8RjFqTG6pOJ0+CiXiC6lLjlXwnHEd473KxqwEa7pjuoQnHIvoRJZMW
	 0QZLo8xbrhURUWXrg56S7+6bKmPoNQ0dZvrB49FJ1De4QysoHcdgYYsn6/rQ+InZc3
	 tO3LCy7Sx5maw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D30060FAC;
	Fri, 12 Jun 2026 11:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64A10237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54B5F411AD
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gslhho5uaRuQ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50CA1411BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50CA1411BC
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50CA1411BC
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so9133115e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264214; x=1781869014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ee8UYETB0ME74cLFKlpahqsUKLtCjRwQlC2pdSOl7H0=;
 b=Z1CkZ0B8nK56XWH/RW+EaT0Q0CfN1qGmJ8RZXz+u7pVXPo/QC2deUfefU7BWCJ/zbZ
 BKRvPz/z91Rw5OTTC55S7mR+jBNNHsywhr9wzEp3ziVdhDU+e1ulfqlh6GNmpmYtDTzC
 rDopPo2X971T4dU8Nt+W/wq/WnDtwduqpebG1eOndVZLQbxMi4Zpo/rcXnZLwZIW3ttp
 QjxdoC3q3ed4ddBB0/fuRN58aS5T0KxpD8SLLqbStEeWJQdqrk7n6Lgn0NSSK0Jp3Cdh
 n+4fo9fnOoE1puogbwVmudScgepv6NhwTqzeilTqhf021ISjS7hodqmo7PZZQBGkfHD1
 I0rA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9QGzYZH3OMMVbp37yYJ9ycRb8fKb8ZzCUHaKngmOjtGe2McSIZrc7DUVHwcK6pJ2gLyDTGFkgYNEU=@buildroot.org
X-Gm-Message-State: AOJu0Yxomm+Yr9NqbpORhhYFr95/XRtDTVItafL1vDtzgaNJD3kbHX+7
 wBjviCwQGoRrCmRI4PNfZROMw4kW/E4psv0dKzDAe/Eex8vnnkWvp+tA0Q41SRxOYL4=
X-Gm-Gg: Acq92OGBoAwc8fRkVuMl5XZGIDz7V53m4SZHE8XM7kBpk87My0gA5KczAsd6pqjv2sn
 BEHW31meagLT8dlKWFN7x4kqaxMHLYmBYOJsOffK4JBeNorTETo7i62Vu+GA7v6FuSRFpzlYhuH
 TI85O4UqRxD5zkWoTucJUS13yPPVDqRvXlXTpVT6zYKkTaGWAktyYSL0kUFSuXlISdzsFk4k2h/
 4IrRgZgBLn9CFBavwLAVWfMlM7VbJ3S+4fgTZl0KfqW7oWY3q/k4Rp2WebYO1u8gud/U9anxLEJ
 H5dfkI5MhXmMyTMTIeCan2gVWTrS8G2SWNNoFg3WAihwNfdif5E07Pp7/Rnb+i9X0eJuWq2hkMy
 LDisUg428k3woFkZpuFDOx9coUcYQvkk+dHfV5QZO0UI9Cf3XjvEqhYqP2g/xUXlNcCe43WV0DI
 c7P5JYNOovM70U51M9J/viGZ8zmQ==
X-Received: by 2002:a05:600d:8498:20b0:48f:d612:3c59 with SMTP id
 5b1f17b1804b1-490ec4b5ab6mr22486625e9.9.1781264214031; 
 Fri, 12 Jun 2026 04:36:54 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d0fb23sm141612605e9.15.2026.06.12.04.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:36:53 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:36:53 +0200
Message-ID: <20260612113653.250942-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608212054.902018-2-titouan.christophe@mind.be>
References: <20260608212054.902018-2-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264214; x=1781869014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ee8UYETB0ME74cLFKlpahqsUKLtCjRwQlC2pdSOl7H0=;
 b=WuVEWqApF1+VeQdbJ4AVPTZcomYf5dbt5fNqc0Ehb3OZmZGJYq2cFEvH8lRa4hkANW
 h4BJen3ZbmjKVy2b54U1UliBkqHBxWoyatHmP1jOjulV5SLJSO7KVBPiISLivyzz6UgL
 uV0vHFFUEsIqmMgwf/egoS6vhfViplypL+Uzgn66YXvYLPC3NAFgDA4e06NNpMC1iErE
 ehJz77JRCal+XIkhryt4bRQUv3Ok3JzvhdxnaIfbS0UyPj4+F9qnm4N/t9HZuwshpfXv
 7E1BfAPcP6DhoLb1xmE+GzFNrijcoxgBzxCKtWoIC6OnJSXFNg7YsjVGSn2uCUU+8PJJ
 VzAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WuVEWqAp
Subject: Re: [Buildroot] [PATCH for 2025.02.x 1/4] package/python3: remove
 stale IGNORE_CVES entry
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
> Patch 0013 was removed in Buildroot commit
> fdfbad13cad9d7f5640d3bf0aa2abc1c6016fd92 (python3 security bump to v3.12.12),
> as it has been integrated in Python3 upstream.
> 
> However, said Buildroot commit did not remove the corresponding IGNORE_CVES,
> so remove it now.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python3/python3.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 60ab5b0cbc..7336c09ae8 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -13,9 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
>  PYTHON3_CPE_ID_VENDOR = python
>  PYTHON3_CPE_ID_PRODUCT = python
>  
> -# 0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch
> -PYTHON3_IGNORE_CVES += CVE-2025-8194
> -
>  # This host Python is installed in $(HOST_DIR), as it is needed when
>  # cross-compiling third-party Python modules.
>  
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
