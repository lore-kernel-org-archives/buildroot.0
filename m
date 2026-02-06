Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A778DEB28E4
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4252F611AB;
	Fri,  6 Feb 2026 08:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTYQh4C3_OWo; Fri,  6 Feb 2026 08:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21F2611AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365500;
	bh=xaFSJS35IWJqxCrcnc3xfPOey7mk7xhlCwSnDEEAw+8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MTicSwMpB8FNXPqO7Z2D5ph7pWaMmUFjQhcm+GO+q1kb0cyBrRk+h748WtuvcYal+
	 psQ6bvNGvniZ+a6nQEshLgHp3OxJ681F8Sz+zRys5j6KieGw+g8NjXLvc4QIAOxY34
	 cikrcM8KBvql1MJruJMXzucHQNZdTrcJJ43JHJ0g+4hycx4p9H4Rppvfcp5/3+z7sV
	 LHj8S7DD+HypI0mH4vPueeFCkdaa3+DGdCorEPpsx5+1o1schQiwNInKHvb0p9r4pm
	 dXEcvFVHIWafCioYUV5FHsVsMPoI/jpGS3kbPpj5I++x5/6hr21zExyGUW9e6302Hl
	 Kc68V3yXJmzjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F21F2611AE;
	Fri,  6 Feb 2026 08:11:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 779F5219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 598AE408E9
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2u0KkSnrR0G for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18575408D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18575408D4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18575408D4
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so17072065e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365490; x=1770970290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JnqTSCDdi+vX79YeUSfWFFSMdZ3aX1WqyeMZzEIUqIo=;
 b=CrQl/ggofpGb/pI63K6ZnoYLm2MEmQRZ0FZpoQJ7/7fT89cn7Xdb5sOvjzwHHJu8FD
 RAc39bsFmb6u/fqsNoRy9EKn1gTGnjZoCrgveut6bfYQA0oK6hpiIH5wOqkR7/OUPEXD
 6KDP1B/TEBY5+KOKIkoj84xYZiPAzu933f6GA4Sg6mlMm0bPqj6aTwfF8H/eP8Jh1oIN
 k5pCtoM9do4qhdwACr4NbP6wW79lMLeNE8CjD54GQ5ld/pk8mxnI6pJz2Gf8Ne5Epp4O
 riOY3PykrkJk3VUlomSawVGc/ZzI8vCoRFfRTTej+LI9Hl0gzXIBuUMUh0mn+MuO2DCN
 wvNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz0pVsgj4xIft05QBBhlJecN3VHy8wk04jB6FIJWQ1Y2ZiOtXeM2yhP3oQgTTUxflnTDscsNJ4bew=@buildroot.org
X-Gm-Message-State: AOJu0Yzm1vHZp9on+jMOCLVN+PFfFloy0zOK8donZ/H9np/v5xwONRhN
 2PuP8GXmTh2RQr37Wc2iPeNjfBCEo9SUqyBNAkrfhkyMX+sER2UHL+npSf2ii/OoQrs=
X-Gm-Gg: AZuq6aIoa0qT6CZr9dJMk8CNoiVfFNpKBfIKydUhwB23RbFDCAn1ciFP143ZvfZGggR
 qo6veiAFY6Kb1L9Fo03Kv8ymZkON/9cOqkov6AQ6h3Z++3WYgPmYFlYeu7vqOOygsUynKwgnAua
 heFOckO9d1bVbCxrFhDKE+2ysXt4Agu6+UHUAHC49gJ1PvBC9JjTPf6cAyeffnNFlYGy7R0AlpO
 wuP7u7D2ogOS9snttll0FdCRTS6jYySwV4uTl3PTA47AHUeu4GMPbOeKCrX0qoMEfnPSCXpFx6d
 KLWLYATpfxGktzMl2OcRCJakNTR4ddhT1NzX6QUH0pdRDlAIJKHH+SjY+sseSy1V6s3gX3SEzo0
 ZRWbn6SMpjGTvBIHk9Tnd8cGbOu3hmUyhVdPyU2YOgRW9VdieIEkP3nfISHRo1EjPrULKYIHK/5
 pHn2M=
X-Received: by 2002:a05:600c:8505:b0:47e:e2b8:66e6 with SMTP id
 5b1f17b1804b1-483203d5affmr25112345e9.14.1770365489993; 
 Fri, 06 Feb 2026 00:11:29 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483228ed4f8sm20519765e9.0.2026.02.06.00.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:29 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:29 +0100
Message-ID: <20260206081129.31701-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123222945.15544-1-bernd@kuhls.net>
References: <20260123222945.15544-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365490; x=1770970290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JnqTSCDdi+vX79YeUSfWFFSMdZ3aX1WqyeMZzEIUqIo=;
 b=Iruqs1nE4yCQ9+uMSy5yrfDiiVTI4hB55eofugk8v5l2lOviWYk75mRJ1DlzAz9reK
 CpcSkTnRx41QlVngAoD6DR0FkmpRDRCjSCTA3GXpiRyX6Nea8oPtHGdv1kIxSnN4dKP5
 b8YLkmmvZ9C18riVgmUkN+BhAq51aj1lbW4hSU0wMl9ke3DIyIB6ejm/8hdZe8vZ4Yz3
 ONttNgYTffELanR6bimebVbGcSPI40Vka8eWYdj1BiJmofnJ5iRddhv0DAxgn2T1cQV2
 pTNk46jz97ao28Q5ZFUInlFoHuszXPoaXrg2Tbd4YZFG4L3nE1bTB6WeYBLXM/K+/apf
 R17g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Iruqs1nE
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.5
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
> https://www.samba.org/samba/history/samba-4.23.5.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 363c6c26eb..cc07b2527b 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.23.4.tar.asc
> -sha256  af429d078a86f1ce16d0d1ecee35c42a3610790b47b84468f31284a8c4060140  samba-4.23.4.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.23.5.tar.asc
> +sha256  593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f  samba-4.23.5.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 7976e9ae05..5d9eacef90 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.23.4
> +SAMBA4_VERSION = 4.23.5
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
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
