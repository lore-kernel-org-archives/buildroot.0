Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B148E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 169A581141;
	Sun, 29 Dec 2024 21:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dW4csoCGKW5w; Sun, 29 Dec 2024 21:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B7D881149
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B7D881149;
	Sun, 29 Dec 2024 21:13:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A08072
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AFEF40194
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qh1hAASNsHyn for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:12:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A46E4017C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A46E4017C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A46E4017C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:12:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A050C0002;
 Sun, 29 Dec 2024 21:12:55 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:12:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241229221255.2138fc09@windsurf>
In-Reply-To: <20241211191630.1414970-2-bernd@kuhls.net>
References: <20241211191630.1414970-1-bernd@kuhls.net>
 <20241211191630.1414970-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735506776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdBwYWyYgrbal6CDqnEMRxVvAnrGuxvgK9/Rg8ZmGi0=;
 b=iS2f7BRLWjKRWzR0OwJCtfWclz9fdm1LVrinuyY3ojvTjWAcHVRQoEON1rOSEuow4qgllO
 p864npN6lCW/9O1jLxxa2rVVABFNDwQCvZqH8ENQ/4OvUFUWwO2cPLpmdQ6h+r603wyR3W
 OCVg8LWjqgOLhaeRIYBrr4g2XWogBks0mybR3U5vb7vc1LlKrJHmtOetBPtJMsm1HTDoq4
 Nj7VsVA64kON/QA/YmDzLNWDhPNz5MA5buPjvwgsQjgmzF+KjShDy9WGc40/W2IUQ+zCJy
 4GaAzZYvpmV4IRzni8w2JBeUzgvb5pNNSgSyhrKg92tEhhX8QFxvD+aasSEhpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iS2f7BRL
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-emailproxy: new
 package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Wed, 11 Dec 2024 20:16:30 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> +PYTHON_EMAILPROXY_VERSION = 2024.11.11
> +PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
> +PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/2b/49/386e675f2b0706083fdf02ad3666b98d0875a2e1cdcabff8df9fe641d2e3
> +PYTHON_EMAILPROXY_DEPENDENCIES = host-python-cryptography host-python-pyasyncore

I am still not happy with host-python-cryptography
host-python-pyasyncore being dependencies, while they definitely
shouldn't be needed. I know James asked you to use
--skip-dependency-check, and it apparently wasn't working with:

  File "/home/bernd/buildroot/output/build/python-emailproxy-2024.9.12/
emailproxy.py", line 52, in <module>
    import asyncore
ModuleNotFoundError: No module named 'asyncore'

Do we have an explanation why?

Adding those dependencies really feels like a hack.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
