Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD75C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C2161407;
	Fri, 11 Jul 2025 10:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-pEVrsO-VzC; Fri, 11 Jul 2025 10:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08DB46145C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DB46145C;
	Fri, 11 Jul 2025 10:44:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 725381E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F59940251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3SLsSx4awW2 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E12540094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E12540094
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E12540094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso1318858f8f.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230678; x=1752835478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0ylL71dYKghMSBkOQnpeXCfoDFyKwZxh/OX/3nMx3c=;
 b=mzoKfMBtoa0KMB/WLcWii18oYd6PLyJf5cBVNxpx9zdurcIhg/CR1q5ZNZPsWPrXrH
 BSbxkN3B9ZApFMvDO7K2O0+jP7hJMyxn0x4L8o7h9Q1N+Hy6tCMYYEi5ppHFyQ8eWgg0
 eGm1YIay74fYhPQiBUatPcM5FIyYAHY9SMUMtnfHHIYz7oV4VQgs3beAtE7DJJcj448l
 Z9yyP/5BtO/db1d6zFecigXmDVp/lh/nJT3jVtt28C5QwEllO9KiI9tvMfpXKXHE0jEv
 tQzlp3PCAu/HBiM2cyig/KtkZaTP3wUCHyjUaZ+q0B5uwVgU9SuWUBAjF0OYS+2cAQRA
 1IOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBuDsMf2Bdc2GXaHBN5Y3xaPl73MAEW0RTPGt1GOU7Blab/2Mck64ksN4F9KAwKiwMqBY8FjSSd/0=@buildroot.org
X-Gm-Message-State: AOJu0Yx10QAv69gWlp9mWui0oJPl9dbAouKMVgsjjgJlT0hNO1ROzcEg
 YBI4vNaOgX8AnmQmSZVPzrWq57ZvfWW84Cj63yKJ+AJnmuuIGyz3I1OpWBM2F23uLF8=
X-Gm-Gg: ASbGnctAUntvygCIiGkfCJ9gaPyvXvxknUrhaE8MYUY03ySCvxoJtWCsPaz9DhLRh7o
 nAQC7VebvUxV3mZbsBPdxOZLsB9x7sf572C/6sTFtJao6S2WHHRR+YLBAw8Ay9/i/gD5kan2qE0
 9gcyqct8jAaaK80/fNkRwsWnZtgqA61YPafMhXryphsnCKphidenSmfcgLWFHigNJCUZeu17JNV
 AkxM6yeIguGSCBo1AIxqcTV8yOnOxKQFTyPMForeID3Q9qLhXE0WYmf7DHwTCdgauHqqI9dsgRl
 psnhwFQ3LibroECR6UReq02i8q78rxPzR+4kFx2VRyk1aSFIMHMoVf3acKCDjiCuUiJ4eRKkLV/
 JbXix//IUtDwrFQbBIUPEBSRK
X-Google-Smtp-Source: AGHT+IFw512q7XyH/0ZDryhliJNnLBlHSPMZ+lo/m0r3mOudia9rHF+L8Ut46XCIR6yKlgqr1f8zBQ==
X-Received: by 2002:a5d:584d:0:b0:3b3:9cc4:4bc0 with SMTP id
 ffacd0b85a97d-3b5f2e1bab9mr1761970f8f.32.1752230678441; 
 Fri, 11 Jul 2025 03:44:38 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc229asm4143334f8f.35.2025.07.11.03.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:38 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:37 +0200
Message-ID: <20250711104437.823439-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701160635.1271205-1-titouan.christophe@mind.be>
References: <20250701160635.1271205-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230678; x=1752835478; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0ylL71dYKghMSBkOQnpeXCfoDFyKwZxh/OX/3nMx3c=;
 b=UL+oXl3S97BRMBdg1U3abrwlg/EnwU7TByHtU4D61yQ4aPa1tvR5KApFX/GVFfHNBh
 Fn2eHCrnGeJglwI/5dlyVHLB3Jsnqor9GcUA2juM4tc7dxnxWh63vhEk/aARIZalgOjR
 2MKemE0w/xEapfUM38yY/KntWCG8Fp6Q8MoouvXjfA20yiaBjadeTe68MQ644cUiGw1R
 4Rh4wBpvfKMenBMCbZb+7E7SB2JzuEDLLDnfzMIiPyd8VtfTek/C67JiUZqm+ldxymlU
 7tBOmRRPcNjnN5idUQY1BDpfcyy4uXY0Bc+jlOFtdGH0bMU2CK+yQuAWxwkbHmpH2Vh0
 kEag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UL+oXl3S
Subject: Re: [Buildroot] [PATCH] package/tinyxml: add patch for
 CVE-2023-34194
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
> - CVE-2023-34194:
>     StringEqual in TiXmlDeclaration::Parse in tinyxmlparser.cpp in TinyXML
>     through 2.6.2 has a reachable assertion (and application exit) via a
>     crafted XML document with a '\0' located after whitespace.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...e-assertion-via-crafted-XML-document.patch | 33 +++++++++++++++++++
>  package/tinyxml/tinyxml.mk                    |  3 ++
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
> 
> diff --git a/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch b/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
> new file mode 100644
> index 0000000000..802d964e15
> --- /dev/null
> +++ b/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
> @@ -0,0 +1,33 @@
> +From: Guilhem Moulin <guilhem@debian.org>
> +Date: Sat, 30 Dec 2023 14:15:54 +0100
> +Subject: Avoid reachable assertion via crafted XML document with a '\0'
> + located after whitespace
> +
> +Upstream: https://salsa.debian.org/debian/tinyxml/-/raw/2366e1f23d059d4c20c43c54176b6bd78d6a83fc/debian/patches/CVE-2023-34194.patch
> +
> +CVE: CVE-2023-34194
> +
> +Bug: https://www.forescout.com/resources/sierra21-vulnerabilities
> +Bug-Debian: https://bugs.debian.org/1059315
> +Bug-Debian: https://security-tracker.debian.org/tracker/CVE-2023-34194
> +Bug-Debian: https://security-tracker.debian.org/tracker/CVE-2023-40462
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + tinyxmlparser.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/tinyxmlparser.cpp b/src/tinyxmlparser.cpp
> +index 8aa0dfa..1601962 100644
> +--- a/src/tinyxmlparser.cpp
> ++++ b/src/tinyxmlparser.cpp
> +@@ -1606,6 +1606,10 @@ const char* TiXmlDeclaration::Parse( const char* p, TiXmlParsingData* data, TiXm
> + 		}
> + 
> + 		p = SkipWhiteSpace( p, _encoding );
> ++		if ( !p || !*p )
> ++		{
> ++			break;
> ++		}
> + 		if ( StringEqual( p, "version", true, _encoding ) )
> + 		{
> + 			TiXmlAttribute attrib;
> diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
> index c6150b13fe..2f57b8a4f1 100644
> --- a/package/tinyxml/tinyxml.mk
> +++ b/package/tinyxml/tinyxml.mk
> @@ -17,4 +17,7 @@ TINYXML_CPE_ID_VERSION = $(firstword $(subst _,$(space),$(TINYXML_VERSION)))
>  # 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
>  TINYXML_IGNORE_CVES += CVE-2021-42260
>  
> +# 0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
> +TINYXML_IGNORE_CVES += CVE-2023-34194
> +
>  $(eval $(autotools-package))
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
