Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D5CFCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F11D241F78;
	Fri,  6 Mar 2026 19:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6vyQmb--Rqr; Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A94AE42089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826795;
	bh=KZXHW05M7PmXrKB10hZR3HfpjZ2qspoK60qljr7wfuo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VIvmn4QLaMKJIXvx0joXCfhcaTdlRj2eqWZWov3MiXoWRBb+1a09DnqNicMbFOVLs
	 T2gxW8zwGvlTsvfT4rSHZfO9fGMIPH02YXyTnyA2B5sbqaUbR/OkkhLWRt2C6GBFQ5
	 0PUNfYHNm7bLcyaGG+2oikPdvzQtwJpQV6SzCxfdWfTJcfjtinmZoghx2hrWR262qc
	 BlHcZqphmEdF3L4rlJnbg8uh86Z1iaj9Fx3E3MKcyY0gRrjHUbPH1dXRrYc/PRgVNA
	 4wxWYPTeaCtH+qD80nRQwbbo4xgBcFv1qdzEJGGgCLAUi8WI5L5VwKGaMCivYhOFTW
	 vPdf49iwNbajA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A94AE42089;
	Fri,  6 Mar 2026 19:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1BAA223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B5140767
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-Pzq1P3X-tp for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B1D740455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B1D740455
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B1D740455
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so63383485e9.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826787; x=1773431587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Om/QHdbkcd657KAcHP4KHxpvpRWrUor6tHXNuN0acfU=;
 b=TnZNvD13YwjEeSS2iInyiG/bKTVkwyOQNqyfFlMSk2d7i1Jy1n2VEha25ZuFkZASOt
 eiDcPbbP/tlqbRx3gKGJzS94PeLJTtBy3GlCBO1+N4t3T86NnfFaQnsVhRyV1C4S8O/B
 IGYzKy8lABd1V7pCU8T1Sv5AZUX5Q/vMtV+fjlrhmfIc19ZMqtJXXchs01Ro1P0kXFU/
 nq51iKXkYfQaglkc5CeEh6blsDNM1IVPzsaGEboOJ08hkZn+3Z9xemQWqZPwili//6Jy
 M8BrTtKbpWidPA9JCxyiRYji/CHPflEAPV8yKueVUBc3er7bsZDYhonrarEToNlnWFTn
 KOnA==
X-Gm-Message-State: AOJu0Yzr1GueHweCRf5SQgnHN+kjvzOhRNEuVBVB29UxmCqgovrBUqbB
 QTnwBTiL9aIlIeufwtdfdLv3wT0E/FdBshOP0XC2nZZU5BZcPwdI79kiLANXeEpIBoXNgNWC7OK
 Bmoi1
X-Gm-Gg: ATEYQzxGJ26WmlRV65pby0y6iLoT7CiPPGLXqRQ+ycUcWJxYDOjlsNfcxtBSj3NnLV4
 Zm8w/PuIExAlDsUEKvc3YohP9BQMzszc1opmNceVnE6ssarmPlUSrArivMaNi0rscPM4tuBgntT
 hbWnz5Cw0yWNt54qD1R7JP0uvHTfzmmtOTSkecG4fvSxddHeNPqIlLfBQiYbJiS0BIp/oYwBPo/
 yxLCY+HC4fnswSZY2zenI3c8ESPhFUaq+4bnt25JHiTKUgiyTD0GPjsvooJtwilwvLPGfNsuCjf
 5bSh02K8nxSQs4dLpkj1J+VadhfXsSWjmZsUVvhu4uibVGEPVAckCC205h2ZQZ6XWjaY7pSMo9B
 t/NjJ+C0jB1glzt06dgS7PA2CsHzu9Exdpfovjef0lMOe212K4UwthQEbDJzAnxRJBhiODFf2kJ
 52NRG0exl4dp55FN4=
X-Received: by 2002:a05:600c:821b:b0:477:89d5:fdb2 with SMTP id
 5b1f17b1804b1-4852693049fmr54810055e9.14.1772826787370; 
 Fri, 06 Mar 2026 11:53:07 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852767d8e4sm53356815e9.2.2026.03.06.11.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:07 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:06 +0100
Message-ID: <20260306195306.7535-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226084454.59339-1-thomas.perale@mind.be>
References: <20260226084454.59339-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826787; x=1773431587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Om/QHdbkcd657KAcHP4KHxpvpRWrUor6tHXNuN0acfU=;
 b=VlJqcz7xvet0A0jdc+BvQ5/ZRbnM0FRIRvBXgNC5GuwRO1ah+6UaDfriXbT5aSoXDN
 6Np6cKY25tni80cMb5BqfgO3xvoq4bFzerEh7t4WgaB4ZEeTrHpqk10WCUdzUfIC8H/B
 M7T5vGdj8werQiwYbXyBxR5+gMdiKEDkvrGU6Lg2Onr2YHtc0KUl5zYT36a/30uC8F1+
 IaWITLQ/a0nqA7ZK5IQltEUPCS9i9rHF/Q+gWu3P6sy1zI9C3zWBnI8YCt4f3uqc94Ry
 O9sveaeDAo633l2TDnMTemFoCYYh4q2pu3K9xF6yyJopOm3m+5oCErb19Dg4nZLN72vA
 qIsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VlJqcz7x
Subject: Re: [Buildroot] [PATCH] package/cups: security bump to v2.4.16
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
> For more information on the version bump, see:
>   - https://github.com/OpenPrinting/cups/blob/v2.4.16/CHANGES.md
>   - https://github.com/OpenPrinting/cups/releases/tag/v2.4.16
>   - https://github.com/OpenPrinting/cups/releases/tag/v2.4.15
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-58436:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to version 2.4.15, a client
>     that connects to cupsd but sends slow messages, e.g. only one byte per
>     second, delays cupsd as a whole, such that it becomes unusable by
>     other clients.
> 
> For more information, see
>   - https://www.cve.org/CVERecord?id=CVE-2025-58436
>   - https://github.com/OpenPrinting/cups/commit/40008d76a001babbb9beb9d9d74b01a86fb6ddb4
> 
> - CVE-2025-61915:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to version 2.4.15, a user in
>     the lpadmin group can use the cups web ui to change the config and
>     insert a malicious line. Then the cupsd process which runs as root
>     will parse the new config and cause an out-of-bound write.
> 
> For more information, see
>   - https://www.cve.org/CVERecord?id=CVE-2025-61915
>   - https://github.com/OpenPrinting/cups/commit/db8d560262c22a21ee1e55dfd62fa98d9359bcb0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/cups/cups.hash | 2 +-
>  package/cups/cups.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cups/cups.hash b/package/cups/cups.hash
> index a200a82deb..7c08a68c10 100644
> --- a/package/cups/cups.hash
> +++ b/package/cups/cups.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated:
> -sha256  660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699  cups-2.4.14-source.tar.gz
> +sha256  0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d  cups-2.4.16-source.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>  sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index e6de671174..d3e6094c67 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CUPS_VERSION = 2.4.14
> +CUPS_VERSION = 2.4.16
>  CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
>  CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
>  CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
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
