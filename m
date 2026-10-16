Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EAECCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D188081542;
	Fri, 16 Oct 2026 15:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yi7bFtBfNXR; Fri, 16 Oct 2026 15:02:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 06B5F81549
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162961;
	b=pTuEJgh49GciRj6uKllKlklQdKWm+VVtiFljO7Bgm/auBgFIEb6SS02qeb+X4YdsPVv1
	 LpJ73woPPzogp6JtSPT/t/Q3uHybxZwOZIgdhJN+LUBFQJ5UqkpWvjTzE54obvIz9AFMi
	 +zEgLdmWWeigChYM9hWfnhHTugrhRc/OqplLuhzUpeyUNiYQcas0GV84IBZh117JE1CUn
	 CHnGit0nbJ9Rslbgg31aDCx2AQj3utnJ+oA+9bQ+5hO1yRoapKe+5sz4nHj1U0IMN0ozs
	 HGXOcDeBg31AYcR0LKpFupuxa8WKSX/wtrrHCep6hg8KP9f5NQheclUOReSKqHzqqqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162961;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=G1o/ntP9DoK2Yv+1UUNN6IRam2DOULEomiFDhrgssnc=;
	b=XskmEnhB5BVIf+3Gt8KwDpa786m1cvuxXodxuCzWNGiSkSWifknqEB61+9m8PNdIQwut
	 ENF6owVuEehpuvVOXlReLazOeeaSPF+ixXtoaoyr76x5dkV0zycD5VUE19edWLOKijXCW
	 /FUCAAUKcTwGZSBEQdh2rWl0qFskPiig+weC4HRvRBgoQmGJKK+urUr9sn9PPhLGDuqDS
	 FAfcTZlbcGNTX/A2kgH20bAeO5voVfHvczCAUJmGdEMaFGzootWtOtCBXSsKPRIymf7lg
	 GSGKxHQSHJQgiZTx2H3y2bWpiGo0S+QyVJPBB+EV6KyewMv1mZ+k5dIj0pVVUyDblzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162961;
	bh=G1o/ntP9DoK2Yv+1UUNN6IRam2DOULEomiFDhrgssnc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qlr4BXGmmsihRr4QLZAPePiLbhcPY31vDsQm+trdlhpzOGTJy9k6q53U3u/d7zurw
	 +uks3Nr7t5p7ySm5YoOkFqpjW8zEfSWXMOajuFbtIPQ1JIar4ISuv9bC3DzZ/XYpVY
	 7Krog0PsBgSyU2PHJ0X1SR3/EHyAlNkqybsDVicJqpD73kVxXCu6qFxrr1LyoW1Ny2
	 qE/xSAmXopz1r5AR9XLBzX6S2r2Gv1D4EXr6e6Uvik7CY/FVoiFEz7O8aJjiSt//Ph
	 RYMoBPc193q/6Elw2irJ7V/omp0V5+PIQel2tlanF/8wGiW/pXRMksqVVGo9OwFcsZ
	 yVKQQHKZsDBQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B5F81549;
	Fri, 16 Oct 2026 15:02:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2847D255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E29D81514
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMMSVhkvFEXm for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31B638156C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162958;
 b=ffOwwie4HZhgLEXc7HT3hqMvE05GfviaVd1V3VrlRebjtnUttx4Bb0hJLGFMRe4OLtei
 YhLkBVlDadQTnQmHMAnrLLXdfnLVT9VqFUPzvW1Rh23tiYyU/vbI8kJ3yZoEZartl5i1q
 Z0C3JmRb5Uzj4iBNpP6UTyOj6EUWXbPqt+9MG0Y+Xv8CwqMcYNPr8XgQgOL/4OdKF/OM+
 TD6UHlMH+BW1e7VFFbd6TYLYtsqWfnv2HZMudSwElKlg0aT+q/dc4PIMKrAAEzsn/4i6t
 4DHj4hlky0DLkU6Acosj2wGJNLXZ8FDHbA04ANfL9ZcKIUtbT9XoMoRIrq955H/qgmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162958;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Xpt7bxDChL4ednSaxPF/FBPomNVSjljwBfMbuZ+TFwE=;
 b=b9FN5dX2PxakpPCrTGYzBYYN+5rxAHUZUE178ClRIddmTydtAee+IMVVOZbfKE//q+rT
 sHmiZWJ771HMhZtU7TjEk+vQ7+GaOq2wVcYXSj84JV0SS4t8+naktG/1f2NzHbZoQhNZ7
 207tSnztLKqZN34I7O4tDAa7Hg7DzID+Rs9qtpuUsCdJke7sFJFXF2sqxBg9gyrpHIxAO
 L3XJOakRChr1LyNygHxW/6NHCCYDTDNlwgqcKkmFlTppfHIAQRA46DHL73/gC4P67titJ
 qmXjBhSPRqjNOf1iMjNIah91Mtu5dgjBf1otQc7V5wiNJpjHj+inARq4GAUzx9U0H6g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F5DFjgCn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31B638156C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso1069285e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162956; x=1792767756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xpt7bxDChL4ednSaxPF/FBPomNVSjljwBfMbuZ+TFwE=;
 b=1z47M8hFGNSAjKd7RmC3rarUOltkWHC08gGj0u9CmwhdcxCM+TGwwzZQYzctImKyxp
 6t2NC2vOtjxEBXUzO5M4Gbwe59Z9bLnwry9qvWWEy+D0eYLGKud1lgfknJbZqNHr5XaN
 PDT2M6qAkXhxbAq+Z+n1kswSXi1b6M83DzZJIh8WLGbo5yZBHZRVwQPywbzFEPUMXwU9
 JB26DEUx1c4O2y6wGU0OVsBNWReOMeU1RVhw0CxQadpnUB808AO/QliiE36yPSTcAoSP
 mufQ3CFR9ove9L/RyOqX+ub9eINa/A2vp+s/ruZmIwMWprBQX6KxBjS+DEzhQx9Kdw8X
 aydg==
X-Gm-Message-State: AFq9FYL/BXeCUtDe1CwBdXq7navUJD9LHWhUviSDhSTRmbpB+dTJ1UB4
 V44L6q89CCOLWwEzSfi8FuAmdelgyxmSLCLvV3AC5ETw29ER9+MB06UMji/UCRVGSy3XaITOGlV
 691iw3UY=
X-Gm-Gg: AYBFou2qgbRIzYxkVb7Eb+CYrDc8XDYXBeGrj6nOnSUhYHfLX9Kldps6g56kn0tM4uM
 PIyxyyWFLbiSu5AT1W93eHnfVrMKyknnTObks6vJUV6yrW54R7md+JyVug+up8r3b2MGdsXmtai
 psLqvIvBMTFGYL79ygpzQVkJJi9AgIWsrTXUWAqnJxQ/Zo0C57AvMwi7zDEUOR6Br0FEufymoA/
 d06oKnc1Xnrwh59GgHquZ4Z7AzQfMkQXm/GAilFKntmpuuZiyI5A2pKWYFaBjWYLvQ1zoHZTf9j
 bvNB39sFfC2Aqd8vt5cHJrCsaTtYPTVblrh3xXB16Me8eERzTfsn20s2a5E4PQylM3NxtxtpVig
 pUq5ja1kikBuYEvBQj3o5YK2DMDZPSuVlndA/NnWOkYOtaB3KXJeknld2sWe4yyrW/vXOzbRggP
 WTQginJ1VajLzvfnsNvcfz2pOWz69SQR06uEjmsT0KchCxxyBNbdVnfqGFKwyaKietAZ7l5BVMz
 GnXrHaF1GwX0uqku0lKbqO+/HaU3PFjD7+5FcGwnA==
X-Received: by 2002:a05:600c:630d:b0:49f:c5aa:9ef4 with SMTP id
 5b1f17b1804b1-4a1d75fe0fbmr1427755e9.8.1792162956170; 
 Fri, 16 Oct 2026 08:02:36 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ac4c70sm50588565e9.2.2026.10.16.08.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:35 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:33 +0200
Message-ID: <20261016150234.60620-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-2-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/9] utils/generate-cyclonedx: make
 urllib.error import explicit
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Commit [1] introduced a code block that reference
> 'urllib.error.URLError'. There is not explicit import to 'urllib.error'.
> While this is not an issue in practice, linter complains that the import
> is not explicit.
> 
> [1] 17c9deb115 utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index df12ee84c0..e337770599 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -16,6 +16,7 @@ from pathlib import Path
>  from typing import Iterator
>  import urllib.parse
>  import urllib.request
> +import urllib.error
>  import subprocess
>  import sys
>  import re
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
