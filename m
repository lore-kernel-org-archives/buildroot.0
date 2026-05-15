Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78295CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CAE841A6F;
	Fri, 15 May 2026 13:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE4lqZ1iUsJr; Fri, 15 May 2026 13:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA4A341A50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852002;
	bh=5eiQDJzHSpvWk1HLwyLwPc2DrkwUXaS3bkriv6ouxlc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XSxYwSuM6u90GyoVhCTuKLHF3Wadl6d3Hb9xqQZohJyb7lGXYi34iT9QsCUwmU3sg
	 707/sTRjul5RT+7INbhr3iE7gPsHC9PbdPeU9yzr7VyiAzxo+wILP6EA1AyHtuTIAZ
	 ySQuCEX22MH7wREXZ9uPoX0cKD1UawvsDIFpA9Fj3knboGIg/Ie9M9rP+r8ZAQxM4s
	 Ak7GiOX3UMMd6N3D8oo9OskScMxx6MCP0+HrBcs7csUUvspKiR7UznD/hLYYaCGNcZ
	 v+fsHhqLHHQmBP2Ulne30ERAPvXNACxVHHNsdZhkXjDzWbn0rV3hSlK8FISYbLPnAg
	 nFotJXq8/Ppzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA4A341A50;
	Fri, 15 May 2026 13:33:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EEE736F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C73F40E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgznuQ9Bs7VU for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 806AC40E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 806AC40E23
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 806AC40E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so8095079f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778851996; x=1779456796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oaA8DneTheGmBBZ+iD6O2k8iFGLmb/GMoWzfoZupAUs=;
 b=Zk2DTKnVZB5mBWxc71hTirJk1dZmVND+rwCJFo9+x4Qe0Vk24hUpCrvV4FIkrn6bPX
 jJb8whw003Tq8XOnb5ginESXZLGp8fOetqNOcMZ887NjWdSqJq0i6dmDm50PjA/0xAUM
 YJLW+aJtF/X7m3j6mg21sQi0gYA211a2MM/GcMMURqChelwj5a4XKBS8v+bmBm8Ghu3H
 2cxCTbYSzvuDWTx3QBHdGmxuTHC7ajkgQgxjPEaLNiJyAWm6RPtXt+xOoWLL3fo8slP9
 kZN2mKfZVL/6pA3KgJAtwtuVLeBnDAWuIOf7Ssg6QC1NvJKtISVmwwC5GEMs2GwP+Eqy
 zUNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ954KTw0BP6D7CAt+UbH068cAF81Zldb9089dCVqNJ+81PjK+Q3RkK5H+vQDXd5wRq1T/lQ/nMXV/Q=@buildroot.org
X-Gm-Message-State: AOJu0Yyp9GM3Hnu176HeQfiGD6VYtWUvu0ddXoAa/Ur88yAO73q9jp4R
 /gfybv8H0vH/gOATroR7vdfnqvNoBEN3HumSTnrXzPK/s+Hu2sV6Julpn5B6HCqtTUKbymEGPOP
 Xp8Mh
X-Gm-Gg: Acq92OGBuOOltgchraMNxW/td6DpLztHcQSzjarWErd79BOTwtILc8UJzAjSnsIdxfP
 C6iFE2hNN3xkJ9bVfqCjV+fECW5amFz1lzDj13Qb1OOE7yt4YGPplvlBXP1cNflnT+CzOXYA+oB
 QfwcmuVtxDWs2hqfgr8tD4jAYKC7lGXkgqRd6Am7iTRteHepq9+j+mRTFoqdjjM5+gN7TkY/0HH
 qES86xzkQVYdqMY/7FabhfBTIb8AdDdB+qNwLflKTVsZvPtNKpIar7RxtjLnAcK3GWxCPP4OP9V
 7Fm0qbBCw6gOEy808EAFHoc2/E6wrSFUVBNnP7oCPPr1DqnpjFXANljyujgk/NUIKTrsqulJoYT
 O3issFXiKdb4W/l0HptY3dBLHknPeF29IHdArvN6cwXrC7Tjj3CPFcXSUKf884BzfqzIvQMfgio
 8CytDM4l3p2tGFnwLXTCIoL5sUQLZgkRb/x89aMKRdIqB0
X-Received: by 2002:a05:6000:1ace:b0:43b:3b80:6776 with SMTP id
 ffacd0b85a97d-45e5c594c2cmr5319841f8f.30.1778851996499; 
 Fri, 15 May 2026 06:33:16 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1aeafsm14508825f8f.23.2026.05.15.06.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:15 +0200
Message-ID: <20260515133315.314789-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251013175513.86276-23-bernd@kuhls.net>
References: <20251013175513.86276-23-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778851996; x=1779456796; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaA8DneTheGmBBZ+iD6O2k8iFGLmb/GMoWzfoZupAUs=;
 b=d2TT/kpM8OwmyeAG3vwYmb1aovH3rZKRLlPL7raveo7L0BkH+wiGSFkQ9/PLv9P7to
 1vYaoNFh9XFu3R3lIz4lxogQbIejA0YHjFEkiaQaWoqjAbo3oMtRhN/Y2flA5aRbDtuA
 yFYTC/+helX830hf0Iusd/y4qOhsBh2p65SDJhyX3fdIKrcaZrcxEWFZgn41Spk+4tlU
 uPcIfLlxouepEZW3+rPGSAmTH/MVeUDADQf67xljpPyP/8fVwLES/IHTsCwd5RMHohZR
 RNlFoygmH+JDp1IVd1KmLeA33yqc0xkqUUkXzj/5A23iBSIJ6D3vTW5VZmSjpKJnlepl
 kP2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=d2TT/kpM
Subject: Re: [Buildroot] [PATCH 23/36] package/python-requests: bump version
 to 2.32.5
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/python-requests/python-requests.hash | 4 ++--
>  package/python-requests/python-requests.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
> index c391d553c9..1bc440667b 100644
> --- a/package/python-requests/python-requests.hash
> +++ b/package/python-requests/python-requests.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/requests/json
> -md5  4a380c14fe0f4465c9dbf79ffacefd8f  requests-2.32.4.tar.gz
> -sha256  27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422  requests-2.32.4.tar.gz
> +md5  cb3d3c58f07cf23f12c345f2c96a6f12  requests-2.32.5.tar.gz
> +sha256  dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf  requests-2.32.5.tar.gz
>  # Locally computed sha256 checksums
>  sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
> diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
> index c782060d57..e5aa7006ee 100644
> --- a/package/python-requests/python-requests.mk
> +++ b/package/python-requests/python-requests.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_REQUESTS_VERSION = 2.32.4
> +PYTHON_REQUESTS_VERSION = 2.32.5
>  PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
> -PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/e1/0a/929373653770d8a0d7ea76c37de6e41f11eb07559b103b1c02cafb3f7cf8
> +PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4
>  PYTHON_REQUESTS_SETUP_TYPE = setuptools
>  PYTHON_REQUESTS_LICENSE = Apache-2.0
>  PYTHON_REQUESTS_LICENSE_FILES = LICENSE
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
