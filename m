Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B434ED0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB5E82376;
	Wed,  7 Jan 2026 17:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jxhGFbjQe1q; Wed,  7 Jan 2026 17:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9F982377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808232;
	bh=mmrpEfe5kn1oLK8UqxWVTi6ShkIBeErOQ6IolSQTL0o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G4kmjRHYfB1KXVmIKiHOU2mQxTY7nKa3B6yu59s5mmjD90yJhrfph4Thx3c7USGrt
	 0c4pcm6FJ15uS8WmQiQ/lHCUk6AHEjRdKmCraQEJEwv3xID9XSTN/oS1B9yOtkKcri
	 FOZaEbY2zQWnyhdbAFOTR1RM0eqkv5UTMEiYnChl5L7LC5Vm2aOLBDM3QgIagoiiA1
	 Fl04kg0+/FXVoDhDTYIYEAbHvfK16RBxhsVhBXw38IA3y7wDbPldOnrP488GlO1Qaw
	 HKuBjX6ElSqxpMgW3zDpOcEPdlT5FS7gmEcZ1iJiUshjvXxQMi9v5XnqPbb9I1476J
	 7e+TkDNtV8pIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9F982377;
	Wed,  7 Jan 2026 17:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF6125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B45181E26
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3mhxnFC_kh1 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74BBB8235A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74BBB8235A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74BBB8235A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D634B97A596; Wed,  7 Jan 2026 18:50:27 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:26 +0100
Message-ID: <20260107175026.226409-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-17-bernd@kuhls.net>
References: <20251221223441.185169-17-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808227; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=kLtBlfqRErMK7UCXsZ51m+nQ1QExdXyrWnSfATrXwsI=;
 b=QbqwMZWrbs9eGQojInygyvv4DmJQL3Vh2FzNiD06b0grvu3v6gHOhEcCtKsMkf3u6kyHtW
 UP7NE4yNL5RTDRvVWp7FZdO0ONRivmRy6XAXqP3mt1yrpYhvdqDfGIlFPR6q1FNKTK3+sM
 FR8sd5lik6k1dQM9jtZ9Jh3PWb0Vgix+iu8NwPYccvHb/QHQmSJiS/v1Tfrm8g7FJY1Tkt
 iGERE65qtGj7yXxBt3T5gBDH4LAsHGsX1SCcJKvisq0gpiByobz5jmK97L2RBN0vjdP7ge
 uBzjPuRf8jT7GVfY+Ud+we04OFtZeV3FmbNuvjYZLmCIf7Sqw8JKK2R8t52Llw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QbqwMZWr
Subject: Re: [Buildroot] [PATCH v2 17/23] package/python-pyasyncore: update
 tarball URL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-pyasyncore/python-pyasyncore.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
> index 4b1e3c98b6..d86ac2cad8 100644
> --- a/package/python-pyasyncore/python-pyasyncore.mk
> +++ b/package/python-pyasyncore/python-pyasyncore.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_PYASYNCORE_VERSION = 1.0.4
>  PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
> -PYTHON_PYASYNCORE_SITE = https://github.com/simonrob/pyasyncore/releases/download/v$(PYTHON_PYASYNCORE_VERSION)
> +PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/25/6e/956e2bc9b47e3310cd524036f506b779a77788c2a1eb732e544240ad346f
>  PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
>  PYTHON_PYASYNCORE_LICENSE = PSF-2.0
>  PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
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
