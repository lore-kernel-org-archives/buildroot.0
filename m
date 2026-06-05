Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBC8CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E0082DD9;
	Fri,  5 Jun 2026 12:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RCJ9UEUE_jZ; Fri,  5 Jun 2026 12:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D0582E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663852;
	bh=pTsVc30+Tt3xheiEQFb7crHru3xpgghUt5Fg6Gr8Nfk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ej28YtdSVlsN+UjFMgR7qOWoOwO5Y/NEbpWilFo2SvegiHwogI4dyJ2anF6ISlk+p
	 fUYLtEa6Konyu7mqxnV60C0XMyDf21DuE7NByd4pzE07EfH7fvkMOS24pKoHIArAFu
	 So8VaLRoeTWctGDVr5PH8jBFz9u1gAn0ofNvibpof74dBcVJWD4J7ubRKRC6QXgMI8
	 fwz+9bd/+/9EBnSGaR5IODwhh05sJE+Aw2uYHOph1/siCwbA62ic96jLW2U4nOQ6V2
	 U++1MwW4wuw1Kl/iy+diSBwh7Mb+ZqCKmn6EogSQjn/4DYISkpRWPCK6zI+SyjVr7q
	 GFzsshxM2xeug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D0582E95;
	Fri,  5 Jun 2026 12:50:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19384388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E13F261144
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4DqLNxwwv3C for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC30B6114A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC30B6114A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC30B6114A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so23311465e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663845; x=1781268645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MTokW2vPKSy3itZt7msdpA1gfEaVC1QQDkv2QWYXQsA=;
 b=SyfQeCbUcw7xfMp2XhmfmUuFEhZ/WyMo0U6g6shLHLg9DbcgKn42STrmPgusaK6uqI
 10/dSfzLX94gUpDl+OKz30RC+hBdzTfCKe5OxD/1oq0GeiYUv+ittSCURAVvCEGFxLWT
 w8oNurKEKe4M+TKCBWOIq07ofHtfhXAdixuslp0Dj5/J2VYLsBoKI28ZiV/mmQaNxvzT
 Wo2kBIar7IQtZlD7jnifSRXJ2aN/1d+PECMhq0ywpfLiRP9SLw8sbqhItCyPZzwthGvH
 /5LXloqL/v3gkWFMRyqq7LCOg5sApn6adBSrvfWaZiZLPS3eCBJacOYhkV1un+fQ4wdH
 nu0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LaMFtW2cH/3tW/zL/B44MHjcUMIwfLu1xs4mUmTtmqbUxISpZJVuOThNmSdPMs/kKrzO3om2VJuc=@buildroot.org
X-Gm-Message-State: AOJu0YxbUPKY6HKBHts/fxmkUICAUGl/C5WH9NVcumB0SKxuYT5/3GE7
 d/4oMY3Qe3eoyT10op3yCc5idotVACX0F5lcg+6zfnMslf3LnidzyOkvXB9/5QvvvbQ=
X-Gm-Gg: Acq92OEO0qG3WBqUu6RFmJgXraX8HblcQFqN3r6KDWuNpwSAGW3nFii7onOM20RjAY4
 G7/1zNRLW0wwWznLPGfe7txzU45/CEGbZrOKUibwLCKkILKnRWA/TTATZZjUgY3x0blNWR+XrhL
 emjpzF+n3j/SebGh/RiELbPnOEhkhU8bE38tEZcB0aT1WIfT7/cEtvkgvq48on9UPGQLMEbUxES
 XkNeYKnNmZbYwCrUz/pCSjRD6/d4cFlRvocPpLFPSsITmLcCzgLn3IXw7tWU+2m0wRpGPmiqRma
 OdBPiO/6uCQ59ghCTUZTcEef+ojPs7aOjkdbfY/CtOxPD05/RYnzVbW6xqw9zeioMUWAMoL3qJ4
 1DpvwGBHgxg0BH2UDWsIFSg3dpdHFMZ7aEMOwgOw4tvrY+HJ6cVAFOWhOTi9TD2kKycRQSAHJ9m
 oChxT8vsZ+0BCCmZDKSFcYOE+ERhC7Pim9Heiz
X-Received: by 2002:a05:600c:620b:b0:48a:53ea:140b with SMTP id
 5b1f17b1804b1-490c25cf45bmr50265605e9.28.1780663844849; 
 Fri, 05 Jun 2026 05:50:44 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2eadefsm25782946f8f.11.2026.06.05.05.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:44 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:43 +0200
Message-ID: <20260605125043.274265-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526132827.216542-1-peter@korsgaard.com>
References: <20260526132827.216542-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663845; x=1781268645; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MTokW2vPKSy3itZt7msdpA1gfEaVC1QQDkv2QWYXQsA=;
 b=ajvjgMXKm4aeQMjTLz2GNYgolaTUxIFHrOHa1IZbCx31DAWU/bd9u63vP/uzuL7df2
 kcnJjINgZsLWqfuO62M4b9bcYxxnyWRkyBAft+y31HBh/aObXLkqRyc6+ZTR4bHwEUZV
 6WoEvf2SJIUUD8Y7Bdrs5f+0G4xmrjEO+sTwVEx/b5dKC2bKLN/4CXXNTC2yh5vuYl22
 Vwetnt07WslA3dc8PZCfJTeiO87eUa3dTO3YeibTDlMloESVkD/UGAPQP8o/7R0ZNnBT
 yVlgMwSfLbou9pAfI7yHwaHUccwVUuBobAFL/3kWZsykXOjm4/1KiGUd+vOWPjwUG9kx
 DznQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ajvjgMXK
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 version 2.7.0
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
> Fixes the following security issues:
> 
> CVE-2026-44431: Sensitive headers forwarded across origins in proxied
> low-level redirects
> 
> https://github.com/urllib3/urllib3/security/advisories/GHSA-qccp-gfcp-xxvc
> 
> CVE-2026-44432: Decompression-bomb safeguards bypassed in parts of the
> streaming API
> 
> https://github.com/urllib3/urllib3/security/advisories/GHSA-mf9v-mfxr-j63j
> 
> For more details, see the release notes:
> https://urllib3.readthedocs.io/en/stable/changelog.html#id1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-urllib3/python-urllib3.hash | 4 ++--
>  package/python-urllib3/python-urllib3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
> index 858b8ca3a3..92425d125b 100644
> --- a/package/python-urllib3/python-urllib3.hash
> +++ b/package/python-urllib3/python-urllib3.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/urllib3/json
> -md5  2c381874816fe551f50a2551abae62b3  urllib3-2.6.3.tar.gz
> -sha256  1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed  urllib3-2.6.3.tar.gz
> +md5  e79707b798a66c8165c9c441440f4e80  urllib3-2.7.0.tar.gz
> +sha256  231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c  urllib3-2.7.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
> diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
> index 7f7f0b03d2..8e598818a1 100644
> --- a/package/python-urllib3/python-urllib3.mk
> +++ b/package/python-urllib3/python-urllib3.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_URLLIB3_VERSION = 2.6.3
> +PYTHON_URLLIB3_VERSION = 2.7.0
>  PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
> -PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3
> +PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953
>  PYTHON_URLLIB3_LICENSE = MIT
>  PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
>  PYTHON_URLLIB3_CPE_ID_VENDOR = python
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
