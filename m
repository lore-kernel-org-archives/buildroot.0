Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B63C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 14:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD06040682;
	Tue, 26 Mar 2024 14:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUBmhkzgDQez; Tue, 26 Mar 2024 14:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B1CD407B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B1CD407B4;
	Tue, 26 Mar 2024 14:41:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2B01BF4E2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46451414CD
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HOfXGg314bX for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 14:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F199F40463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F199F40463
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F199F40463
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 14:41:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E4301C0011;
 Tue, 26 Mar 2024 14:41:09 +0000 (UTC)
Date: Tue, 26 Mar 2024 15:41:08 +0100
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240326154108.28f91cb1@windsurf>
In-Reply-To: <20240228145013.411919-1-christian@klarinett.li>
References: <20240228145013.411919-1-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711464070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOfxnucN+w7XF7/AHWUIcqfQnfvYSQ9zCSGZ4azpKh4=;
 b=pM65AfZitbQgwvww+9BVOShSU4QwnE+eEF27EMvDzEj+Gy51M1ebYmhazduV4uR4Nhp3U/
 8qZ/toVmlYPwSLBoip/Tt9by7eeLv1bpkzQgU+Q9cxD/zWK/iP0PRP2W4ED5swLmWMrGlS
 7pnN0DLS2R2PMajWRthgAsH2J3y+SXri/WOUMfoxNigRup3MsnLLsCMFVFOjVVjXiHdRtg
 tIyDSjVQ8O3RuG4mVBjTX0k865vI/NutlHAKxfS6smHN1BxuWhempRb3c5/6fhqikBU9fZ
 yf33z6mrF2Xt2qcUoDa+pHgk2Opske+w4wy/rwCl/DhbyUS8zcfq9SNCaoomeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pM65AfZi
Subject: Re: [Buildroot] [PATCH 1/3] package/python-fonttools: enable
 host-package
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
Cc: Christian Hitz <christian@klarinett.li>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Hitz <christian.hitz@bbv.ch>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 28 Feb 2024 15:50:09 +0100
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> The fonttools are used to generate static fonts from variable fonts
> at build time.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
>  package/python-fonttools/Config.in.host      | 6 ++++++
>  package/python-fonttools/python-fonttools.mk | 1 +
>  2 files changed, 7 insertions(+)
>  create mode 100644 package/python-fonttools/Config.in.host
> 
> diff --git a/package/python-fonttools/Config.in.host b/package/python-fonttools/Config.in.host
> new file mode 100644
> index 0000000000..641efb1cfb
> --- /dev/null
> +++ b/package/python-fonttools/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_PYTHON_FONTTOOLS
> +	bool "host-python-fonttools"
> +	help
> +	  Tools to manipulate font files.
> +
> +	  https://github.com/fonttools/fonttools

We don't really need this part, at least for PATCH 3/3. Just adding
$(eval $(host-python-package)) is sufficient. Adding a Config.in entry
is only needed if the host package needs to be made user-visible. In
your case, we don't need to make it user-visible: this host package is
merely a build-time dependency of generating static fonts from the
googlefontdirectory package.

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
