Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D39FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDDB1421D1;
	Fri,  6 Mar 2026 19:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9OLoDv88FNR; Fri,  6 Mar 2026 19:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 365D342172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826837;
	bh=FaKrxl8t0n2tfUFOeIWYw1wRcss+pvzl3Ah2TrVbqkA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jd6zEjvi23suqCXEN4Uj1r924CK5qtnM1JwC4YE1LDniyztJd/Y9ut2lLR/NbXZJW
	 hnUUUqJ/W0A7yHAGW8eN4vAMmjoSnpDXKmIrZaS8cZChbzWUw5S0sfGQDvMG74SM5i
	 jCjDlZ4cvHmwZHHAHfmXbOPO0H2hWHy1d5sUJvzc8Frt/RTtOgugNeqoQ7IbiDMpiy
	 yxySOWseletyf6fCZiyJqDAJylopq9+HYLlrVBMSagdSGlqoHhXu5LIh9L+cwfgYCj
	 ZqSgpipqXsU/b6hypm8/1IcW9YOCzHuGr97q2xWcdgWZ7b1nGcdqLcMQiW2gxMUWzx
	 Zy9SkIa+RqEpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 365D342172;
	Fri,  6 Mar 2026 19:53:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19582223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 099F541E55
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPM0F9ADzWLM for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DFA442184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DFA442184
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DFA442184
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso84886105e9.0
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826827; x=1773431627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KRmqnUMlu3PSe/UKjYsXREtTS5btYE9cD/DQErAszjs=;
 b=X/BfwohkEjMPB3Dbl+bghQscmShzfyRMHgrT5pwulmHWPuRGtN3GsiteXB8dRGImfG
 aXelOcf6Jh+AlKeiQ9nCImbVxl8AjBlHPf2R9Rj5DolxIIwpcFPWfTG2V45JOC588hse
 EzTCf3xkPRlM6EAzgYwz4JpFFrCOlt77xYdsZMc17kahnsneRCx7tZfhHWTzWnpqr0EU
 l6NzezY6sANmD5if1/0m6aezt/DdZGGkv2mZ+xIae44hBK/sdVk6v1ZQFJa8troE0BdI
 zfzUHE1LzRurOAl/ywM4DsmdzG5RQwLrZZge5PGPMIiEUvLmO16w3/9IIyzBw6dGqqpu
 gOhQ==
X-Gm-Message-State: AOJu0Yzai8cS0VzVJX4AZ7R0RdYuWEoukLfbWJC7uL6SLXK3z18JBieL
 MYulf40xacUyvF9KA7pbKknoe74R/wgXQYaXU3OKdwWnxYIuiTNJhWNCAKr7z1n27I/icVOUlUs
 RAosw
X-Gm-Gg: ATEYQzxktNewXUvykIOIZHKxlGmRaV0+6cn45dmDYmUDovHwXoHfaHsg8HcucEqpay5
 HN361y93VWsnCZv79MNUWvgmLFR3XiMdm7ZpLHbEivXIAr+NOlxBl0+lYKTd4GSBsmrZ1RvWl+T
 4ovkH8Vmy0iPPAdub7dOcSn2pR72cHwwLYoyCNJ8cj23GKX5gizSxUtBAaDi7apdLosvctLWOWX
 DL+lZU43r3cK4NlS4MX7UMU+hDxtUoxWD1PzLMR4VqBqTxBIiY5P14+Re/lR8IEpbxfb2iI1aWx
 clPE1kjIMwY597Nqkgu4tszfMeMiiaWZEJVAB3XoHXVoVt0DB2P4EtVl71N+Y3/BNa/zDjpgD+2
 QdLcOtZ/2JSyb+mXS4j5rZZD/mrUOpA3hGM803xplyEHQ5kjQB7mJ/hvALKnMIDfVMRt/DTIm8V
 u90zOHE4fh4SKJ/wM=
X-Received: by 2002:a05:600c:1e85:b0:47a:7fd0:9eea with SMTP id
 5b1f17b1804b1-4852690f58dmr55311605e9.3.1772826827241; 
 Fri, 06 Mar 2026 11:53:47 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm5399846f8f.39.2026.03.06.11.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:46 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:46 +0100
Message-ID: <20260306195346.8887-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225091006.238395-1-thomas.perale@mind.be>
References: <20260225091006.238395-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826827; x=1773431627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRmqnUMlu3PSe/UKjYsXREtTS5btYE9cD/DQErAszjs=;
 b=VFNnzBUlRMDYHyOZ6cAAHMWsTqxv549R5+sGCoA23to5rPZIZqXuo/CChiACQFdr+Y
 2Uv6ELEoXujeYpH8rvdNpcW2sSPQK9j+y80UUOFhSw5ybB6c1QHj+AOmpA65CwDzN7Jo
 BIqVG3SsviZy7fpeZdJdbBBr3dqaEfdWEmmRNp0RW0mY6GFMqzJak7ImgjRVyhe3NrDS
 xpK4X6ADI4/0+vnFUoCkdcrNeVlGbuqnSzS+esSrgqfu8XQ4wQuu77AsOUmKOVlJlqs5
 R83Ltw8d60/RZYrD1XLnIJ4AIyQ46PsL+IR3773BxijI+r1Y4sRmDDRvC1YbgdyRgU5R
 3soQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VFNnzBUl
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.13
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
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.12.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.11.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.10.html
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-11626:
>     MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
>     4.2.13 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-11626
> 
> - CVE-2025-13499:
>     Kafka dissector crash in Wireshark 4.6.0 and 4.4.0 to 4.4.10 allows
>     denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-13499
> 
> - CVE-2025-13946:
>     MEGACO dissector infinite loop in Wireshark 4.6.0 to 4.6.1 and 4.4.0
>     to 4.4.11 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-13946
> 
> - CVE-2026-0959:
>     IEEE 802.11 protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
>     4.4.0 to 4.4.12 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0959
> 
> - CVE-2026-0960:
>     HTTP3 protocol dissector infinite loop in Wireshark 4.6.0 to 4.6.2
>     allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0960
> 
> - CVE-2026-0961:
>     BLF file parser crash in Wireshark 4.6.0 to 4.6.2 and 4.4.0 to 4.4.12
>     allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0961
> 
> - CVE-2026-0962:
>     SOME/IP-SD protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
>     4.4.0 to 4.4.12 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0962
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.11.x. Thanks

> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index 88eb7ef494..87d5781eed 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
> -sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
> -sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
> +sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
> +sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
>  
>  # Locally calculated
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 9ccd8f9a9e..196ac63271 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 4.4.9
> +WIRESHARK_VERSION = 4.4.13
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
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
