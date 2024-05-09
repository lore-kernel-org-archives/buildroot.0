Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB347C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905E980D1D;
	Thu,  9 May 2024 15:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxK-7Gpnipw6; Thu,  9 May 2024 15:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D2080DCC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D2080DCC;
	Thu,  9 May 2024 15:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8721BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA8B606C7
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpAiSg_gja3j for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 305D3606C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 305D3606C2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 305D3606C2
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:50:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24FF01C0003;
 Thu,  9 May 2024 15:50:07 +0000 (UTC)
Date: Thu, 9 May 2024 17:50:05 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20240509175005.27e09b5f@windsurf>
In-Reply-To: <20240413133202.29033-1-heiko.thiery@gmail.com>
References: <20240413133202.29033-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9+eV1APtPvyJ8Hef66v9tEqis0xUUmVW+HeN/z4tEw=;
 b=gr1p7WpxffQMsoLdh+ZRCYZuD5Yriw2HDKibAi3V7jqLiFStsz2Bcn77l/yh/zpWhpQH1r
 kuX19SJ384Fz7JqfgxAj4+dzlFoYvVT1gZ121cMOyJr1HQCiC+Q6/yLmXxYw+KkmDsF1cs
 3yAIXZQDPRlV9K8TmcFsbj7y/KUS2BmfYLtJZEEQ5QP/QU6v23yJd+K8lW4907Le/qoeBJ
 //JHWSNXFblXjJuZ2a/QhZdPTZBjmHPpgALxLRH2nrCFgFRnQeXCEfbOpIFoaqHNYYbDKk
 3ark7aIpf4mzxLQhCtxasIMV1HmiRdzetRlP9m8e4SXJrGF8Zbwg1ahLQK3D7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gr1p7Wpx
Subject: Re: [Buildroot] [PATCH] package/python-yamllint: fix dependencies
 and SETUP_TYPE
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Apr 2024 15:32:02 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> For host build the runtime depndencies has to be added. Also the setup
> type needs to be set to 'setuptools'.
> 
> ./output/host/bin/python ./support/testing/tests/package/sample_python_yamllint.py
> Traceback (most recent call last):
>   File "/home/hthiery/sources/mainline/buildroot/support/testing/tests/package/sample_python_yamllint.py", line 3, in <module>
>     from yamllint import (config, linter)
>   File "/home/hthiery/sources/mainline/buildroot/output/host/lib/python3.11/site-packages/yamllint/config.py", line 19, in <module>
>     import pathspec
> ModuleNotFoundError: No module named 'pathspec'
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Reported-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/python-yamllint/python-yamllint.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
