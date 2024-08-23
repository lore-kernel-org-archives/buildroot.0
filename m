Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0FBC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D85F81497;
	Fri, 23 Aug 2024 17:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACdoZG3mVkk8; Fri, 23 Aug 2024 17:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FEDC840C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FEDC840C0;
	Fri, 23 Aug 2024 17:36:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 633921BF3F3
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E8F9612ED
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhhVoFORmd7e for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1330C612EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1330C612EC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1330C612EC
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:36:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A01440004;
 Fri, 23 Aug 2024 17:36:30 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:36:29 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240823193629.6814c1c2@windsurf>
In-Reply-To: <20240822095953.524686-2-buildroot@bubu1.eu>
References: <20240822095953.524686-1-buildroot@bubu1.eu>
 <20240822095953.524686-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxeNUzXOLyESt3tN8L+lYA4QzR4qlLwGatxBA4NSmgQ=;
 b=clvJALQ3M70HwL1ueZ9k6BfFqnV4jmOPxun+KQF7hyTYAfc5kZoYqztd0nEeqp3jJeSxZP
 yZZ/54w+J+xvbKxnW2sFSV823+WfgCAtx+1UYY2bkG+vI8wn/XR0c0iDEuQbvwYOIgbe9c
 mWyTuLzSfLHF3oL0BQ84O0BNmDXLPdbL+FILbKsLPf1ZRqLRiTEeU7Qn7+QOzkEQXGE65E
 gISW1YdyDTDQUqtrp7yzfYFa1U+RlmKjx8nn6pH+t3oE7o6+q4ja8+g9yMgVD6P/wwXPE6
 ibIL9GKI4rqaTvT//EK8qDCuczR4HYGDmACDKfli3Ar8RC57NzL/r+dUXZ74EQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=clvJALQ3
Subject: Re: [Buildroot] [PATCH 2/2] package/python-can: add option to
 install the viewer tool
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Aug 2024 11:59:53 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Enabling the option correctly select the python-curses module dependency
> of the viewer tool.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-can/Config.in     | 7 +++++++
>  package/python-can/python-can.mk | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/python-can/Config.in b/package/python-can/Config.in
> index 61955a2b00..36e25b8764 100644
> --- a/package/python-can/Config.in
> +++ b/package/python-can/Config.in
> @@ -11,3 +11,10 @@ config BR2_PACKAGE_PYTHON_CAN
>  	  Python.
>  
>  	  https://github.com/hardbyte/python-can
> +
> +config BR2_PACKAGE_PYTHON_CAN_VIEWER
> +	bool "python-can-viewer"
> +	depends on BR2_PACKAGE_PYTHON_CAN

We normally prefer to enclose package sub-options into a if ... endif
block even when there's only one option, so I adjusted this small
detail and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
