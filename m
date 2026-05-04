Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A44CD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF0E410D0;
	Mon,  4 May 2026 14:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUEt7Z4uDrIu; Mon,  4 May 2026 14:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B26E41B37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906059;
	bh=Bn70e8DpK1KDJaGwlFwH3RTWwcAhn3z7v08yftcYJcs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LKOzluXK+V9vIfMWv9zLK3/OO0tOxOKMhiGh64gF1B8pfOm04u1rOoZ8TACRFyfoy
	 0+h6lJccpeOT9nKlyyoXufGBMQHawiwaQOA1tN+jgNU3EUuhsrSYIUzJC9HJupbdxA
	 5NabiJG0PZLJw3hjXiUe2deeu0si43FHO6xWyRGE2cxhjI4iDmJPiMQD3jZzUslhCK
	 A6c/j6YCkZ+eSbDa1yg9EeByX9j0avAr5r85BjwwFfKPXvD8MbM1L4vlrBOY+UFB0S
	 BY1G3bN2CNBg59HXN5323O1YmJqz/E5RC1xT7Nkr/eGxV4YMS/W4xxzMxaNOV5DHTL
	 CwaxelKPJ5u5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B26E41B37;
	Mon,  4 May 2026 14:47:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0B8A190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD898614FA
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RWjRjuAlFml for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEDE1614F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEDE1614F3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEDE1614F3
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4891f625344so44358835e9.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906055; x=1778510855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VYXVGbuKE0M6a/rdFDijFDf3pqaj84L3SqE0tCauiCw=;
 b=JeYSA2TQWusqqmV9sI6aiNTpw5TsrzpisJMuT/DllsVHKBpTkYKslHsS4+86JfvSDa
 KpWN3HBD6GjXaPl0wmHwCdAhCe8JVks5j1okLeLeTN+XWUm+yX/UbFNXeaeIaAiqrrc+
 eaUyrRtQBGThVcnEqGCs9L4d/VelfiBcMCvkbo5rYDgl++KUHXQX/L7EhnVu4RjfRCA5
 Rja/INkcQ4zt34kdPcPs0/5o2TDBC1vwZQ5XGsclJ7HaOrDwO3PG7mpf17rptkZFHP+v
 B/e0i57ae7NBmoa0K7HQmBULZv1HAqQnNPfVx+yIu4CL/B6kOrqxafUfACKy7XcDIL5P
 YUbg==
X-Gm-Message-State: AOJu0Yw+bfNko3xizvaqyzk8AC7NhUc2BEwQYmiSogO2VBeAHNpzDwK9
 ON56TrKRasps/TVk/B6DAj6fwzLvWVgZKYvpRmvB7CaGEREhWvfKg/wkt2tW9vADX45ovdxUOqO
 yU4zV
X-Gm-Gg: AeBDiesbWX2Fb4qlOzEi7A/dDjD9e6lcEgRTB4bBNZTOn6xhzJ67EHVgWk70fIgtT2s
 /jL4Fp2D35jnwBJ+uUjrY3KkO0mlSe0zxOCFNVDBXxDZ+Ow8TqvqE45aOWZ6EdD6ryl5DLb2iSe
 D4wyt09yFVpnBeylxS6UdAFZn29XXqHlJG5UfwziJA/B1AxAEOpeKo1N7zWhcIQN9CBvzzkZdZC
 W2Vp93py6+aQKnyIFO0WxRvb++DCsFJg+yz53SycwQzlOUdbm3pbuDiwpkSs5tIqo5UeOw0u1Sl
 NLE98NF3yqYAlwQI4uxX6/9fTtRValtrNBYz+vXcVC+oqjIR9K2RuV5cdU33bp9lQz5a/zrWFo4
 vT045/DuDlinDHzZLYRaqfnsP17j5bsae2iUdXZb8CkfSwdj7L13ODsW15GwIgzlYqrDoS+8v1O
 cGZTRnY2xs4mId61neNFp6A1lkjw==
X-Received: by 2002:a05:600c:37ca:b0:48a:534a:eed8 with SMTP id
 5b1f17b1804b1-48a970989fdmr166784305e9.1.1777906054591; 
 Mon, 04 May 2026 07:47:34 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb3427fsm460269385e9.0.2026.05.04.07.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:34 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:33 +0200
Message-ID: <20260504144733.9340-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420195520.191853-1-thomas.perale@mind.be>
References: <20260420195520.191853-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906055; x=1778510855; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYXVGbuKE0M6a/rdFDijFDf3pqaj84L3SqE0tCauiCw=;
 b=K3xeY5h1L1JNmBprmp3bjGj2Maufkrh9XT1a/FvzgFwIip1HlsNi3pTOHqTEAJ0J8A
 3F7VlVZ8ux3yT2PUls5gK15qeM8VQLxfAwmXvOosUzGCBJK/u7OrSEf2CqPOL/NBkMa5
 JCDybrg1MfwuCYaIyGjp76FOvGgjpNGWTbheqZGWLdVTeF3XyXCRLPD8MY5bWF+fv8lG
 pfd9h8lrX2ta2mgW4OR3S/U47BebK/N2c2vvPoSf1DORiK5OSVzzdjC8OsunIfE1d/Rz
 rQUJwWQ5oyuYJiuS+L7cRTqClJWkoxsxzJrPD6qgt7zQnoSHGU2R2q+LYDyzS3s+OSh2
 voSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K3xeY5h1
Subject: Re: [Buildroot] [PATCH] package/cups: security bump to v2.4.17
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
> For more information about the release, see:
> 
> - https://github.com/OpenPrinting/cups/releases/tag/v2.4.17
> - https://github.com/OpenPrinting/cups/blob/2.4.x/CHANGES.md
> 
> The new release 2.4.17 contains the following security fixes:
> 
> - CVE-2026-27447: The scheduler treated local user and group names as
>   case-insensitive.
>   https://www.cve.org/CVERecord?id=CVE-2026-27447
> 
> - CVE-2026-34978: The RSS notifier could write outside the scheduler's
>   RSS directory.
>   https://www.cve.org/CVERecord?id=CVE-2026-34978
> 
> - CVE-2026-34979: The scheduler did not always allocate enough memory
>   for a job's options string.
>   https://www.cve.org/CVERecord?id=CVE-2026-34979
> 
> - CVE-2026-34980: The scheduler did not filter control characters from
>   option values.
>   https://www.cve.org/CVERecord?id=CVE-2026-34980
> 
> - CVE-2026-34990: The scheduler incorrectly allowed local certificates
>   over the loopback interface.
>   https://www.cve.org/CVERecord?id=CVE-2026-34990
> 
> - CVE-2026-39314: Fixed the range check for job password strings.
>   https://www.cve.org/CVERecord?id=CVE-2026-39314
> 
> - CVE-2026-39316: Fixed a printer subscription bug in the scheduler.
>   https://www.cve.org/CVERecord?id=CVE-2026-39316
> 
> - CVE-2026-41079: Fixed a SNMP string conversion bug in the backends.
>   https://www.cve.org/CVERecord?id=CVE-2026-41079
> 
> Also updated patch offsets.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch | 2 +-
>  package/cups/0004-Remove-PIE-flags-from-the-build.patch        | 2 +-
>  package/cups/cups.hash                                         | 2 +-
>  package/cups/cups.mk                                           | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> index 30c3ddb48f..3c00bb1b49 100644
> --- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> +++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> @@ -18,7 +18,7 @@ diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
>  index 613f01ddf..6f1bcb07e 100644
>  --- a/config-scripts/cups-common.m4
>  +++ b/config-scripts/cups-common.m4
> -@@ -462,7 +462,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
> +@@ -467,7 +467,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
>   LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
>   
>   AS_CASE(["$COMPONENTS"], [all], [
> diff --git a/package/cups/0004-Remove-PIE-flags-from-the-build.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
> index e4081d0e07..82251d0fec 100644
> --- a/package/cups/0004-Remove-PIE-flags-from-the-build.patch
> +++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
> @@ -23,7 +23,7 @@ diff --git a/Makedefs.in b/Makedefs.in
>  index 0d8df733b..2560c0c36 100644
>  --- a/Makedefs.in
>  +++ b/Makedefs.in
> -@@ -156,7 +156,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
> +@@ -154,7 +154,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
>   			$(ONDEMANDFLAGS) $(OPTIONS)
>   ALL_DSOFLAGS	=	-L../cups @ARCHFLAGS@ @RELROFLAGS@ $(DSOFLAGS) $(OPTIM)
>   ALL_LDFLAGS	=	-L../cups @LDARCHFLAGS@ @RELROFLAGS@ $(LDFLAGS)  \
> diff --git a/package/cups/cups.hash b/package/cups/cups.hash
> index 7c08a68c10..e421c6457b 100644
> --- a/package/cups/cups.hash
> +++ b/package/cups/cups.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated:
> -sha256  0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d  cups-2.4.16-source.tar.gz
> +sha256  89c703238de210d4f4f4e5d4269e3d60c4b2f487aad75a8a1eaecd659e4d0b77  cups-2.4.17-source.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>  sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index d3e6094c67..f79e3846df 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CUPS_VERSION = 2.4.16
> +CUPS_VERSION = 2.4.17
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
