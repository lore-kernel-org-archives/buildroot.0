Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B765C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 19:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 624D840026;
	Tue,  9 Jul 2024 19:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKeP0tVuzcd7; Tue,  9 Jul 2024 19:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E15F840453
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E15F840453;
	Tue,  9 Jul 2024 19:44:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B573D1BF5DE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFF3260AF0
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QM3H0rT1LoVF for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 19:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FCD26076D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FCD26076D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FCD26076D
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 19:44:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDCAD1C0002;
 Tue,  9 Jul 2024 19:44:32 +0000 (UTC)
Date: Tue, 9 Jul 2024 21:44:31 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240709214431.7007d4d7@windsurf>
In-Reply-To: <20240709101841.1145134-3-fiona.klute@gmx.de>
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
 <20240709101841.1145134-3-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720554273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rozfp0IYPe7QHeCWYlNyayx7F+rQGhCJrHOTZ9em55I=;
 b=bkd5u2vds4v5enQ1/4EzWK8DaaF6gLol9iBs+vX8lXB8AEWGa2pmbPtyksnu5QoQcXOR8M
 tnhQChQE4aZRKO6vN7xBvG+iPxynQrPp//8x6eW5gxJ+3nLoszThd+gOD5BV+96eSWqw9j
 IMDxnT6B809zsA/AB1biYqa0U6Ez++OjSorCHqGXeR147drhW/+4DpmEa0b9ifJ7N+3TIK
 PCjyeeOBeWQ649RrYNSzyKpst6FRBA3iIBsGl4jBT3fzvKMaR6bwNCDZAu5WcP4+H/jMdu
 5jOUbu8GRC/mJk7lVdvl6SdYvIQOFSwHsZ5FlBGMMgD34SjSgI3jJ1znGgH8hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bkd5u2vd
Subject: Re: [Buildroot] [PATCH v3 2/4] package/python-pyasynchat: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Tue,  9 Jul 2024 12:18:39 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> pyasynchat is a compatibility package that provides the asynchat
> module removed from the standard library in Python 3.12. It is needed
> to support fail2ban without a bundled copy and should be removed as
> soon as nothing in Buildroot depends on it.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

I've also applied with some changes, see below.

> ---
>  package/Config.in                                |  1 +
>  package/python-pyasynchat/Config.in              | 11 +++++++++++
>  package/python-pyasynchat/python-pyasynchat.hash |  5 +++++
>  package/python-pyasynchat/python-pyasynchat.mk   | 15 +++++++++++++++
>  4 files changed, 32 insertions(+)

Added an entry in the DEVELOPERS file.


> diff --git a/package/python-pyasynchat/Config.in b/package/python-pyasynchat/Config.in
> new file mode 100644
> index 0000000000..bf11cc5b39
> --- /dev/null
> +++ b/package/python-pyasynchat/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PYASYNCHAT
> +	bool "python-pyasynchat"
> +	select BR2_PACKAGE_PYTHON_PYASYNCORE # runtime

So here you declare this as a runtime dependency, which I believe is
correct.

> diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
> new file mode 100644
> index 0000000000..8bd87af5c4
> --- /dev/null
> +++ b/package/python-pyasynchat/python-pyasynchat.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pyasynchat
> +#
> +################################################################################
> +
> +PYTHON_PYASYNCHAT_VERSION = 1.0.4
> +PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
> +PYTHON_PYASYNCHAT_SITE = https://github.com/simonrob/pyasynchat/releases/download/v$(PYTHON_PYASYNCHAT_VERSION)
> +PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
> +PYTHON_PYASYNCHAT_LICENSE = Python Software Foundation License

Same nit: PSF-2.0 license.

> +PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
> +PYTHON_PYASYNCHAT_DEPENDENCIES = python-pyasyncore

And here, you put python-pyasyncore as a build-time dependency, which
is inconsistent with the comment you wrote in the Config.in file. I
assumed it is a runtime dependency, like is the case for the vast
majority of dependencies between Python packages, so I just dropped
this line.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
