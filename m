Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256CAC7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6E760671;
	Thu, 26 Jun 2025 19:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoOb5ZWd1NYG; Thu, 26 Jun 2025 19:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17EDD60692
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17EDD60692;
	Thu, 26 Jun 2025 19:52:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C440154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21FA260674
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7UrmZ5MUQLM for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 299F260671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 299F260671
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 299F260671
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:52:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so8137805e9.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967551; x=1751572351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYy5SpMq0GsYSpNYQRO1WpJbqGhLtXOFNxEKThoZ+fs=;
 b=BLYeeAItbiEnA5QhLXqoMW8rN7le3BlSygQVIfDDA8t/dJjFk0TqRraKn0x0M00v86
 I8WvwITlB6JKsBAs48/Z8kIExdy7ZmtMw1K4lnUKdUxLyBzMCJYzI40hIgfG0o80x+x+
 i2IERaYgb0Fa3yp3eg6ieLbcuztJVuIg8dDNDEcMHT94kP3xNH7HMfqOPywaCYpREuV2
 N0x57YB8ap/Mhn/6YNiCBCdumV0le63BSLBfJbtzWtzC+97snDBYkFfxmiSUE0NqguRA
 pBPhoBa2RNDxmUDNAwdUTBg2xMVxaqP+TRRqrbgiEf9l73gjOvCprxqffUJ3uOXsrb16
 u1cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeeQBSAllEJz45K3EwtVajL3xXmwYIj5NI+OMF0vDBhx+ucZLPwMmnRSTqVG9geXilZ0/0w1VwqM8=@buildroot.org
X-Gm-Message-State: AOJu0YwU8ClZlol+jwe98YTdtMeF3NxbyArPsVThF6pRAbWtGJfP2RjJ
 TBLY1CccZ8wK0rJvhmngmK55HtTJzUFNcc9zO8atGy90XXnH2g/YWDvhAmKZXwNo1OE2U4FaOtd
 msWNO
X-Gm-Gg: ASbGncucIJ1v38q2qeXKqtAVa8/jLjnk71s2viEdP+yXIj8iZjcUAIGKm6hjbr1ZjrX
 F7PpRlcWY84ArSdRXxvWXlv1OdzBG/6oc4r2GyW4Gzw43VzQ5vOvT3/3jyGxNOjNgEm9MbFd+PW
 24zZvPHi6Li4iNbgyHsDWp5yb8aQ/fEeB3EVJxvPTYEpIMlQvh4KeGmBPFrJ/9lV1ah7tSZ1lBA
 1NPmcCk62YxzdGVuTqSJcvnvuoIKHDQud4X8O+8d5oxI1LV5Ob2TJwbbiFPr3BGQQELBMPccHsj
 2kcJvMiIUA7djcWPveJ1MsKh4jWD0tg8wfUe1GjRePbdamsZEgiCP9Q6FpYLAwydJKE4K92DBmy
 76KY04ixUwuVZd0QPe7AVaXj72+qwt/zJ
X-Google-Smtp-Source: AGHT+IH8R1xhGDYS0FNjkcqM3Gire0zUycchnzhS1TClEovFVTyGd6eRyFCYiOXEWKwMl/9U5Of8lA==
X-Received: by 2002:a05:600c:3ba9:b0:451:e394:8920 with SMTP id
 5b1f17b1804b1-4538ee85666mr5419105e9.27.1750967551080; 
 Thu, 26 Jun 2025 12:52:31 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390d3fsm29401755e9.1.2025.06.26.12.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:52:30 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:52:22 +0200
Message-ID: <20250626195222.14667-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610150527.96508-1-buildroot@bubu1.eu>
References: <20250610150527.96508-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967551; x=1751572351; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYy5SpMq0GsYSpNYQRO1WpJbqGhLtXOFNxEKThoZ+fs=;
 b=ZMxHiySaXcYpmvXzNAoOdrokQiWkIFlHTkSg/TOpTsS81pw1+Rh0Q2aAaqkFjDlysh
 X1uEHpP68OruMqZdMLDMfEkmzZttqcbQ+XowX3Qspfy1SX+EC//MWF1kXCucDW8brd/S
 nGicUiwokL/gqmxaxl9X2nF3MewgeiTQtfZbSbMgnZbAHP9Pc/81KEM90h5vXC5OzkIy
 pB7dzMvWBRbZeW1bB5mi+vqL/xS948Qf6CMN1nHyt9y5YsmDJFMAcmmmQv2ZjLfH7vJL
 95aJhI1nrTVgHWs0j4g2w9vP9WuxA6TqgJR2pRO97vkuzN+BVTXrQ2F7/2wG/dQmSNvq
 CcDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZMxHiySa
Subject: Re: [Buildroot] [PATCH 1/2] package/python-requests: security bump
 to 2.32.4
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

Applied to 2025.05.x. Thanks

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
