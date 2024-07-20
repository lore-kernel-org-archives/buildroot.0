Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A30BC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CAB3405A2;
	Sat, 20 Jul 2024 21:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4WesRJmHTmh; Sat, 20 Jul 2024 21:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 323AB405D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 323AB405D3;
	Sat, 20 Jul 2024 21:09:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBC641BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C424044B
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q-_UzYmtlkR for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77D01400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77D01400D8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77D01400D8
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:09:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 572E01C0002;
 Sat, 20 Jul 2024 21:09:04 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:09:03 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230903.460eff3c@windsurf>
In-Reply-To: <20240719212751.47959-1-fontaine.fabrice@gmail.com>
References: <20240719212751.47959-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/v4rrdbo9BH6BFuyMUuqOVRNzNoN6S1X7jSYnbkScE=;
 b=P+KHYB2Ad3/o4857tmPHS9k9eOJsgPMjPdCsS2nr4tU9qCnD7L4sD9np9/CP8ueDflWw+u
 ROOgkelS4B7N8pKhKh4oQdvC+RUODIpIQ2wWaxmkd1QcIYUVNfsn8zagsk80QH/XWMyD8H
 AiOboXgRAXtraI2YAqHC7tEnP4/jEGgpBNJXAypU/dyA3TQTVpK89/QuRs0wK9H8PHYPzR
 MiT90GdVrjMPTNI4LnEwkC6Hb891waIDOvgrBcXZv0lZPw47171FXmVAZ87LhgoRgaFHSE
 79FPqCQlDvDX58WXA7gzLIKEGYZckQSZysMm8On6mtpY0I9U4jX2UfUmcQwIBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P+KHYB2A
Subject: Re: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.4.19
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 19 Jul 2024 23:27:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/pupnp/pupnp/blob/release-1.14.19/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libupnp/libupnp.hash | 2 +-
>  package/libupnp/libupnp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
