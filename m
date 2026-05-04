Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC0ECD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 938D984667;
	Mon,  4 May 2026 14:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SWRptNQwA4G; Mon,  4 May 2026 14:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D0884666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906073;
	bh=/FdFeQlGdfCcrowg4X63DDbELFUqwYmaBtIUreyfIlQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qMDPzwV2Rj0B+/qw2NU1ICDqJGeMsj7C2F0hFC1S3zV2Aj/4uWVtiihiSrMZBPQw1
	 WE5V5lJp94yW2FP58MYEyifebdeL7TK7eN/mnUMeNAtOlCnQPCGe8V6g5nY/IGFI+E
	 UVNr3j4F3mM0AC37GAiPvOqijfQY7B0iY9kaP83KQ0uTiMyEH02i2+yaVI5tvDzlV6
	 /Lu47Ex7Opp/2wBRSa/sNCxWQgov3ToRLQ1Q6LAkCWLnujV/STSRUKnCc56VPyoP5H
	 3N95cBb0ts0x+7Uqex7DT88xJCXX0MCVd3zrXyK7hXfj3Fy9TriA7QPpIkldXWkJOa
	 JTF/IMGii10gQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54D0884666;
	Mon,  4 May 2026 14:47:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CFA225D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B6648465E
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OW-hmTszoqa for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A5D884651
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A5D884651
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A5D884651
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso1319695f8f.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906067; x=1778510867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bj45g0Rxjl795nFaABNq3RXroqhRo+ZYMIDtdBcxIJg=;
 b=YG/DAGJZ21eGnlTouTluDz6q+oGANo3BWNSsuzbWAlt1pcYQLFKRP6x7hdL5GrvixX
 ZR10EncBIxrWII18YVh6dG2lOc6SNQYDtYIWnLG5J4+I6OZF2gFk6OhQIS9CTIYv94nq
 9BB9+oSoRYB5qVEWZqeu/KDpv0R8b05IeSYVuiP9sWdLIF1cPq75ck4oDy/wKbQWgv3T
 ZishnJ3rKj05oZZrSILm0HQxm7sDqLxgfXrN6vFyDTVvRTU5CeHp0Y/ldrWQX0QqtqHG
 4Q3cG5VZF6BDsCOpciQlvfDfTsHpmE/+aQRSHCNBlapZMKz2yDH8h7dFGcRfPcykU+/O
 knGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9YP4lCogAwSRgfSBi8y9aJzBepW24c+5xPhbd6SelLZGNibA6/M3WLrNL4HNH4p0eAjOvL0tkWGic=@buildroot.org
X-Gm-Message-State: AOJu0Yy/p8V61RyC7uL96MwxlbIEOXJtZTmycv4rg/uxxVcLWNfxwm0G
 3UTeA6ABWVXzNIHr5ao8sxjVV23il1z7UvEexBJ1MtjeNKtyvVpE0cYYni3sm8ekV7O1j+VwkaN
 4Txh6
X-Gm-Gg: AeBDiet4M5NjwpTbmW+/h30T08K+Y4mbt9n2Up3iAOlr/RhkiJ/ZGefF6XzIMaYAxUL
 NCay5JmYz5cNuoR4wrogJYofcUr3isvMIEhxWRGFzss/DZDFpoD+lx/3uctcOVv8aYX3Z2KTLhI
 s9y3dhM9TChUYp/GhN2pgL/ggmqxiUlSbyOTsVAAYYwrlJCBIU1YB4pVxmGYigghV9WILiS88cj
 iNWubkwxWsUluZ6aIl+jj4JGfucIP0F2l0nDz4kY24UAvhjdHgcl6bL8L/jgIgNNrHqdYPPxmBq
 hBHqvlMxs5AsSPyOhmNdHVMdMsXEi/iDKhJ5+k+zcgAlG1bDsl57NU9cgUrr43/1jtEBlUrCZdM
 1O0y4GtrIUzUR9qw/UJBZtjN1WSvOOA1c3nOqeGF+PFnrCMuQyQ1DISbYsTztAcwXic4041BHs+
 RiorKsIz0CuSh23B8Bq7Df0J/sYg==
X-Received: by 2002:a05:6000:144f:b0:44d:67f7:e1a6 with SMTP id
 ffacd0b85a97d-44d67f7e2f6mr10396771f8f.20.1777906067412; 
 Mon, 04 May 2026 07:47:47 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a98b76eddsm25564833f8f.34.2026.05.04.07.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:47 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:46 +0200
Message-ID: <20260504144746.10396-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422135456.3109434-1-titouan.christophe@mind.be>
References: <20260422135456.3109434-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906067; x=1778510867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bj45g0Rxjl795nFaABNq3RXroqhRo+ZYMIDtdBcxIJg=;
 b=SJTlYITL+2ikI6RgVob08e7uaBi+mSBWemo08wiN8Fmw7mfkvqXDRreSvcZd/dYCPZ
 DlOsiPFebEHKti+TZgGlIXxTlB2U8GTE8+zZ+mElEF3plAMPvKkLnCH9QN3fhE6mOiIT
 cBFyKsFP6P8+xnMoGBsFQp4TJCMRsmAURCf13KUH0nvr774DVNd2Pe93OFwRGIkRqWCW
 I+Z8BpqRxz5/i2Klv3EuRIKqex9j3rNc5ZkSSIVKckamEKkWvyNUwA4VjzUmt8+YeuBS
 gH9EKWTdl2+oQgctzc/UBrg/DeHznL5bfdFMb1U59QLm+mXfEEPIlEGrTCH/E2NJcpyK
 ezWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SJTlYITL
Subject: Re: [Buildroot] [PATCH] package/log4cxx: security bump to v1.7.0
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
> - CVE-2026-40023:
>     Apache Log4cxx's  XMLLayout https://logging.apache.org/log4cxx/1.7.0/c
>     lasslog4cxx_1_1xml_1_1XMLLayout.html , in versions before 1.7.0, fails
>     to sanitize characters forbidden by the  XML 1.0 specification
>     https://www.w3.org/TR/xml/#charsets  in log messages, NDC, and MDC
>     property keys and values, producing invalid XML output. Conforming XML
>     parsers must reject such documents with a fatal error, which may cause
>     downstream log processing systems to drop or fail to index affected
>     records.  An attacker who can influence logged data can exploit this
>     to suppress individual log records, impairing audit trails and
>     detection of malicious activity.  Users are advised to upgrade to
>     Apache Log4cxx 1.7.0, which fixes this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-40023
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/log4cxx/log4cxx.hash | 4 ++--
>  package/log4cxx/log4cxx.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
> index f6770e287c..af97ebca18 100644
> --- a/package/log4cxx/log4cxx.hash
> +++ b/package/log4cxx/log4cxx.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.apache.org/logging/log4cxx/1.6.1/apache-log4cxx-1.6.1.tar.gz.sha512
> -sha512  6ee406314bd7ab02a46c98cc8a0d5ad5aec8928a23716a81a152775ca315cd3b950d600b2e221d5b4a88416ae9bbda1215fae43626107feea4df2f3e074303ad  apache-log4cxx-1.6.1.tar.gz
> +# From https://downloads.apache.org/logging/log4cxx/1.7.0/apache-log4cxx-1.7.0.tar.gz.sha512
> +sha512  0e94946457423689af6d85074ab97b717e0cec85a4f548e6650b060e8f98b780f980b7d4a7780410fa64681376fb4bc62fab6ed9068fc944e07f9f32ac0413af  apache-log4cxx-1.7.0.tar.gz
>  # Locally computed
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index 57f9b1e844..ea47073d3c 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LOG4CXX_VERSION = 1.6.1
> +LOG4CXX_VERSION = 1.7.0
>  LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
>  LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
>  LOG4CXX_INSTALL_STAGING = YES
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
