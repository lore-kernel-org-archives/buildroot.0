Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC1F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 155C081A5C;
	Fri, 17 Apr 2026 15:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMRGAFpE22Sg; Fri, 17 Apr 2026 15:25:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14776816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439514;
	bh=d4E2fojK6DL686STZ/xzibloF6sNQukTAaXJv1cGxms=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=og4c+2NhDsjv/iY3XKqRVhgqDU/iWLkaJ9xpAxZTMNxS39YlqHBY8t+ZgzDZkbBJj
	 BjRdA0EyGd1pOANYKGN7auoC2RcxTn+08WZe6bHYcIAz+wiNo9k8fbRqt9GZ3sWLZM
	 DcCXMQR/u21eZKC6mRbwiDEkzMgDKf5JI98NBQ8VT/OIn9nfIUMa/OIP7/f6Dg9XrT
	 zOemIUYuW7OYHNlniXc2bQYQ1kMSlSkCe+pecWjPPMc5NsUvGTyy2xGdR3HdluJSen
	 I4h32STrsqBLD7c1HdZDs+FBg4q4db83f2gCQPvEa3hCnpbIPGuiGWxnJO0HBBAfKG
	 F/f5yPHDBRkxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14776816A4;
	Fri, 17 Apr 2026 15:25:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B89F396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3183460E69
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWXJJ3b2iFIj for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 230BA60E3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 230BA60E3E
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 230BA60E3E
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so645380f8f.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439504; x=1777044304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rJ8x+1nz2rLJCE1WYQaPkVl24YRsuYyD2kZGPIK1ais=;
 b=YTKGMUT7M04c3wYCUKU23JW7fHCjaS59tFFlqsWz0hno09O1j+IfKN7wnZLdCI+Qd3
 qB3Qc4JmnsQzbp6n8pONlrUq8o7C083n7+pFls6yjUIBsTYLxTu1VphsctLdVgSZvOIJ
 XK6OCrY2r5O4zTIxHaiCWFkmL4pWbV6BqCfeTmQN/+zYqL5uu4iYkjzcaCE6mWE9Die7
 WOIDQx+Q2mCk12arAzqNa12pZp9s9S5yvsWE9kIWljh2xIiXn7+N2vQMM2ALRBJx+gKB
 FnkkzWEw+lfRGerB5s3LBEqpEM5Q8OGqFlDmMnRirsfK7/jSUB5J1EhaUQZGO01Iuudu
 /sLw==
X-Forwarded-Encrypted: i=1;
 AFNElJ92Ue8togeWAbAqVglN1S67Y4PBHRNrHru6dzKETQGAi/l4ycxpH+RbtLbq7qWITDnrbjVC2fuVMBA=@buildroot.org
X-Gm-Message-State: AOJu0YxdoY0lpfCspwSEH6dueyNIvcoGqnADoOzumbn73ASagHLsMfL6
 iGsUNb2SCGAAs8nJhEPrIatC3sAFEt5r/68oIEjsLUBtU10tkMryPyxJAOoAYCjMRXHXZllUneq
 bM3rJ
X-Gm-Gg: AeBDietxC5whmayV45wAStSRHMBrGmtRQKiQ9wTWVs+acRHvYc0kplBOei7l13MA54P
 oYqNvgklX3Gaslzdgke5qrZL1ei3mpAogznRZyF3+ljzdlGqAn09A53oVeLHgwVcIPSBMiL2nfT
 CWlpCq19rZqi+P8r5iU7PHnQNwhZhe5AT0zzdRt0/4M7vOTVVgz63VznGmFqcFyNaQuXaiYIzo9
 DyPMoWcEiMghUHbRbxbzkHHsSukczjomtd5F9AFq6neBli14g87UP1wQSqGEdMq7GiKvBdCarul
 lmMeBlZ6/CvCQXSu/03+/XJ2pr5FfG6u8hTN+tT8dT5NAmMI96HN1khgbnLh8e/WWZlioqbuikG
 u/oNdqX6xfwRLL/UnS9dWzaR/ctjzvYTALVp0zUpp8qajBp9ke/jnwpZATmDWUDs5VDBJ/hNuov
 y+wNbze0IaSvuu3yqKHj0ouWkPwD0=
X-Received: by 2002:a05:6000:1863:b0:43e:a69b:d818 with SMTP id
 ffacd0b85a97d-43fe3e0ab5dmr5416346f8f.38.1776439504042; 
 Fri, 17 Apr 2026 08:25:04 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4eec9sm4939171f8f.34.2026.04.17.08.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:03 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:03 +0200
Message-ID: <20260417152503.313858-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410125648.2980692-1-giulio.benetti@benettiengineering.com>
References: <20260410125648.2980692-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439504; x=1777044304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJ8x+1nz2rLJCE1WYQaPkVl24YRsuYyD2kZGPIK1ais=;
 b=K75nuHlfSoScU1ThfraV2JHVbaq51KYCGSoVBAwuJ3Ov6C48fLBr6Ml1QsBogIJBR1
 nk6At1d5L2He9M79PZXE4TMSDo/yQohNAl42BxDD98DsHM+yAWvDlQJpT7YiaMILY7iZ
 MYAhl3zbECvI7gSNC2ZtcjZv4tpnlRDRaUgdQxvcWkGt5ukP3nLdaaPYQoxXRsl6fkNi
 M/KFLfvpehrodjoNZsmxdzJLvk1tJkvyF8a+Vpq3HtzjwmrMlEsHLRWtKOv9UQyvmK5N
 hIUCTYoDH+SOmvjsbRNDvuat1XER/BnalnPc6b8QqgkXQ5kwHcd/5UOYXEzg3r4DFsx7
 NGdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K75nuHlf
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.14
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
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.14.html
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-3201:
>     USB HID dissector memory exhaustion in Wireshark 4.4.0 to 4.4.13 and 4.6.0 to
>     4.6.3 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-3201
> 
> - CVE-2026-3203:
>     RF4CE Profile dissector crash in Wireshark 4.4.0 to 4.4.13 and 4.6.0 to
>     4.6.3 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-3203
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2026.02.x. Thanks

> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index 87d5781eed..7572ea8b52 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
> -sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
> -sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.14.txt
> +sha1  41536d8ba1fc977d0832b509af6ea65056c6fe1d  wireshark-4.4.14.tar.xz
> +sha256  c9113130bd2b37919fdcf575f710469ce391960baaff31911e3288469e6a8e8d  wireshark-4.4.14.tar.xz
>  
>  # Locally calculated
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 196ac63271..d58fa7a6c5 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 4.4.13
> +WIRESHARK_VERSION = 4.4.14
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
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
