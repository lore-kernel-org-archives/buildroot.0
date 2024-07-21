Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6195EC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338F860812;
	Sun, 21 Jul 2024 16:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t56d2tqYZxij; Sun, 21 Jul 2024 16:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE6C360837
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE6C360837;
	Sun, 21 Jul 2024 16:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A081A1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DDDF40120
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GGu5B46eWyf for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45F1A400F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F1A400F3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45F1A400F3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:36:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D10D20002;
 Sun, 21 Jul 2024 16:36:10 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:36:09 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721183609.66f48e25@windsurf>
In-Reply-To: <20240721150116.1438024-1-fontaine.fabrice@gmail.com>
References: <20240721150116.1438024-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L67aY+fjeTicXewhXL6n+jaXz/lQ47+pFMxBOiiBhcA=;
 b=o6ThSvXYK41ARhddDVgZMjqGkUlaTTfleopSrP+FLfeQfLHSsXKWaYo6P/wZ6bl42yWMVk
 7xGmLGj/W5ALMhrpaHHqoZh8132ZGnnbsUwMRaDXJWKBfG+jV0Uracww3KgEaJVtMC9tt4
 aQhF+/+WV7UJQQ8jbwMAZ8cyt5Qov/gjd2VoMwrReEKsqbi+5N1AJ6xCiX6oPwINoIfjt8
 Z46ay5S5OStNA2Cvji8BkumVJP0NWNvHxdArQOMdBJiVLgcr0gnawiKpE89ggB2j1yji6x
 ssGZH72QEuNDXr0yV8XB6da+hIjdZHWm0igbyvARpwXn07wsWEerE2eQ66jCXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o6ThSvXY
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: security bump to
 version 1.20.0
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
Cc: Stefan Ott <stefan@ott.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 17:01:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This release has a fix for the DNSBomb issue CVE-2024-33655. This has a
> low severity for Unbound, since it makes Unbound complicit in targeting
> others, but does not affect Unbound so much.
> This security release also fixes CVE-2024-1931.
> 
> https://nlnetlabs.nl/news/2024/May/08/unbound-1.20.0-released
> https://nlnetlabs.nl/news/2024/Mar/14/unbound-1.19.3-released
> https://nlnetlabs.nl/news/2024/Mar/07/unbound-1.19.2-released
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/unbound/unbound.hash | 4 ++--
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
