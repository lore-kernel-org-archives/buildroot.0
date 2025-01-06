Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6433E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 21:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58E7C80EE7;
	Mon,  6 Jan 2025 21:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0B0z2zmgNaq; Mon,  6 Jan 2025 21:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BD9D80EF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD9D80EF6;
	Mon,  6 Jan 2025 21:11:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E23F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64BD680EF6
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4l_gr3LT3Qlf for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 21:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DCA880EE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DCA880EE7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DCA880EE7
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:11:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACDDB20005;
 Mon,  6 Jan 2025 21:11:32 +0000 (UTC)
Date: Mon, 6 Jan 2025 22:11:31 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
Message-ID: <20250106221131.4abdc790@windsurf>
In-Reply-To: <20250106203459.2875914-1-troglobit@gmail.com>
References: <20250106203459.2875914-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736197892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xaJEOQzDs2cpcPBcpCp0XRB1hZ8/1/w5AN9cMg68tU=;
 b=JNY/FckrbTudRPLmkqLNANqEXLsd9KLFDL8cof6Vd0WizONxn8fsHmWZc9BkHhawtLOTxH
 U/A5nJ2tuLz+PPixcpN2ylr9AWSxjzrIYUByCKCUvofYJAbHyKdSRHu788XY34C1e9LzXS
 0pfAl1dXY3uxgVq2cUJMMmP/rOIoDkOG4YNt3wZoTdJ99t2BIO/n+2mbi8CGYGFolUPlsV
 Lz2xXPVjAwV6E5MFNL78y7ti5uIlnJxa7fksoUNYr5o3MKgrS9Wf3DcMrpvyK7cHBGtoMh
 fkKyGNnFLqg28apxhFu6pPohumyali1EZSEeo44aVz7yRRGZ9Ct5jqtdhOZRIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JNY/Fckr
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: make vtysh group
 configurable
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

Hello Joachim,

On Mon,  6 Jan 2025 21:34:59 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

I am not a big fan of this, because we frequently use a "sane" default
group in packages, and clearly don't want to make such a "sane" default
configurable in each package. We would normally expect people who need
to customize things to do it in their custom post-build script, but I
admit in this specific case it seems not great, so I don't really have
a good idea.

But my main concern is really: do we want to allow config options to
set the group like this for each and every package?

>  # Do not enable -fplugin=frr-format for production, see doc/developer/workflow.rst,
>  # it is only intended for FRR's developments
> +FRR_VTYSH_GROUP=$(call qstrip,$(BR2_PACKAGE_FRR_VTYSH_GROUP))

Nitpick: spaces needed around = sign.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
