Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4900C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 762B460034;
	Thu, 19 Jun 2025 13:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhFI2PJPV377; Thu, 19 Jun 2025 13:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89AF0605F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AF0605F0;
	Thu, 19 Jun 2025 13:52:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56858E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47EED80558
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTauFmMJHgwg for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13A10801ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13A10801ED
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13A10801ED
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so791447f8f.0
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 06:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750341152; x=1750945952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4WPKYG/MG4m7dfLFFq43mHpYTD7I5LOPRtH3vubpw4=;
 b=Rpvd6X4/g9k/SZK3eQQ0Ef9jRHEmJKyD//34m4iTzyUsy6h8QSt190uRb3vdcJPnWz
 CnCNRNxq0023OXLD1GpardiI1cQo7sP5ANgReNd1gRTjQMbAgxNTD19QkDbhokWY73w1
 dOjjaDf3FYQ/eHcFSgyesBu6UIIOHDTLwjVGL1ZK7CRh6MIaLPq/nuy+YiVpK72CUWBr
 txIV7gGTK2/kuajHI4NfFiVQXw6fkXuAW0N4lWwUv/heLrE1VzUdWBF2/+nLyXCtszOD
 JtmJNgGMP5Dy8I7Tmsx6BssPLqkhj0wfPRbQz6EVu/RiRvfJGpRUgBR1o+JCoUKcXvhe
 mc6Q==
X-Gm-Message-State: AOJu0YzXeJehKBJRk5IMoZAcqxcChZh5j5i/A4dQRTI8xfqwDraL2k5Q
 122CUUJq5l6JU0IZF3ShsI02TROzIKqecRPWcNniA1oVBCMQzl6OCzW26UTzpN1l8Fv4ytHUv81
 Wrim9
X-Gm-Gg: ASbGncs+YgKE0fhhfdOJ93WcT7EHfc0As8FPvuZfp+IfeHlQN62TC7tT8OqpW3PYXGm
 Mcqn97lfC40C5KsqMOdPTH/3lU/88kBNkP3smj+7ZKZgdOeKhXnY8puVbH2RJyPQq/ini9HotLH
 E3XEc8imJzstIOJyJ4E9FEOkCdusHmHuq+b5sYbTpwtquCMC5W093aJHBYGyLIMwVHP0cGxVpUE
 MrHruvClzuOrXisV4JnkecC6q23TBvcbdRrARbBTbT5qQ+eKOpkaJVZxfeI1IhT2ml+TEr38A9V
 k6rqQlD3f+T6fsfJ/nWtnTx+aX2APZZbbgUqWirfDRrtYLfHVcwQLwDW6C/SLBqwYZVUiUdM9DO
 Z
X-Google-Smtp-Source: AGHT+IFEfRbmHdDL48iRCudc+YLPBgBZjdQWF6IpPArigyXE8qd/akFQmX6QgwjNBZrenUnsMwNTPg==
X-Received: by 2002:a05:6000:288a:b0:3a5:27ba:47d0 with SMTP id
 ffacd0b85a97d-3a572e5737bmr17832681f8f.56.1750341151647; 
 Thu, 19 Jun 2025 06:52:31 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a578510edcsm15530235f8f.8.2025.06.19.06.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 06:52:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 19 Jun 2025 15:52:22 +0200
Message-ID: <20250619135222.405589-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610150527.96508-1-buildroot@bubu1.eu>
References: <20250610150527.96508-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750341152; x=1750945952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4WPKYG/MG4m7dfLFFq43mHpYTD7I5LOPRtH3vubpw4=;
 b=K4UlMm4BjYyhh79fUFUQGnjz/0iwR40tlW5Cfu3216uLSziBSuyBzgwesZX0ZPl/7U
 sL4/ZqX4ypl6L2RuTw5z+JPe48QSc5LyuS5vPoCEO/+tEcVEenGN03081LL3/Swm1sft
 y/mLbHFNfNzJuYPn/Ae1mGBSQpbn+db++x/QFKTkqV71IEW97dobLyA7+xGqXkgaHFHR
 DTpY5Ma3sG1TOQxnx4DbWJOONDcjOpqi8FSHB8wuGhx5enrXSk23rYRDhhKQWthyqGr1
 9QyHpMWYebeDLhUCe+/s+ZWbp4IWOeE4Gw95gLoUaUotJv2OwXT4HiZZEyFsAYOy44Dg
 7mDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K4UlMm4B
Subject: Re: [Buildroot] [PATCH 1/2] package/python-requests: security bump
 to
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
> Fixes: CVE-2024-47081
>   Fixed an issue where a maliciously crafted URL and
>   trusted environment will retrieve credentials for
>   the wrong hostname/machine from a netrc file.
> 
> Release notes: https://github.com/psf/requests/releases/tag/v2.32.4
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x. Thanks

> ---
>  package/python-requests/python-requests.hash | 4 ++--
>  package/python-requests/python-requests.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
> index 2764a0f2d2..c391d553c9 100644
> --- a/package/python-requests/python-requests.hash
> +++ b/package/python-requests/python-requests.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/requests/json
> -md5  fa3ee5ac3f1b3f4368bd74ab530d3f0f  requests-2.32.3.tar.gz
> -sha256  55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760  requests-2.32.3.tar.gz
> +md5  4a380c14fe0f4465c9dbf79ffacefd8f  requests-2.32.4.tar.gz
> +sha256  27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422  requests-2.32.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
> diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
> index fc8f51fd1f..c782060d57 100644
> --- a/package/python-requests/python-requests.mk
> +++ b/package/python-requests/python-requests.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_REQUESTS_VERSION = 2.32.3
> +PYTHON_REQUESTS_VERSION = 2.32.4
>  PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
> -PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913
> +PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/e1/0a/929373653770d8a0d7ea76c37de6e41f11eb07559b103b1c02cafb3f7cf8
>  PYTHON_REQUESTS_SETUP_TYPE = setuptools
>  PYTHON_REQUESTS_LICENSE = Apache-2.0
>  PYTHON_REQUESTS_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
