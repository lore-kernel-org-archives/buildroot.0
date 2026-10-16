Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F769CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 07:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C96F860ADA;
	Fri, 16 Oct 2026 07:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQhdmqV9n1VK; Fri, 16 Oct 2026 07:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7F4F5607D8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792134787;
	b=oR6BST+W8ERYNSvruR6BpGaeqQplVxwaAJBhDFzPg4axmjntiBCLV659TEkLYnBCU9kw
	 ScD9rsidrrj2UQsS84fd63IolxK10Qur9JypUJc2yWzrTYJkKevqBowwyttljlremZAKm
	 XjjY0n56xW83y0/Mf7frgAU8kLWL070el6VIA0wJwg9LJzVhbkJMMKi6ReiEkVwb0Y9v3
	 Ic8BRpCDXl/M/IGT0/Gi0mFv8qeC/oSkR0ce3ORyixP025O8yKCtyu6YgRhNNk2KOidJy
	 d3dRZfOEQkmq31b+ij4d0n4OOfFMhBn+LkrYXOdMwLcNQwwqvYcOFpIPQKf84Ck4LwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792134787;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rO/MrGfF+3yz30dwr2STDbzsNJ/jy9kZVOLik/VVJuc=;
	b=mDLiRpIpYbsODAZd3+J7K8n73l/ukeEXW1cyMZFdjo7zwe5gGBvpKo/H8PrqPr2pVTTr
	 1OpzTV9QGm+6Q9iAGLEXN0vaz7UsD4rk5aFLTWD0UnVg/DD7zKjttA30tqm0bFp2n7xi6
	 8UWQJA+EsueGKPnfF/NmBSU+/fr/rC/heDh7xqd3m/xNzK8Ql+79B3kpPRW4KlBWmQ8O5
	 qY+mKKFSjBihCQeYEU5kFIuDsaAtMpWePdXXMwiBCiOTfjWwnrtjo7IWzqWMlrD80bLD3
	 //5btig2GDQBuUfUFapwJqPZ3LxwCD6nxP3bOIjuZLwj5CY/DWRkt8IYAjmgBo+Iwqg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792134787;
	bh=rO/MrGfF+3yz30dwr2STDbzsNJ/jy9kZVOLik/VVJuc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jnsHGr8A3c/F2VJR9OYBfN+lOeMET5mybs9zxf0R8mH7fpMPbWhBpz7PhZfSQOhb7
	 /Jx9raw9U6FGn07aG84stff6DWn131olahMMfvVvnhICPMPx1hygyaOSGvPV7dgJdJ
	 fYTHYYcWNqnI/keoIFYKN3lMLKVoiEY1HTLr4eXf47gunsyI9l5gzdQ0B0zoZptsse
	 7N77+iDyxwiR18is9uRCO2KHteLkb59hsIgm0dBVW4+UYfy4k57nX+mUt3KcxriBK4
	 jrk1kT9Sj7I9Qd6hCCTIjifyV1XMTN23qR8cBOPGYekjuL2fgIioyh8PtM5HMD8lup
	 uA0s+Xl6ls0yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F4F5607D8;
	Fri, 16 Oct 2026 07:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DDD51DE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 131F34098F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzD6carCprHu for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 07:13:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 959DE4098C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792134783;
 b=FV0uVtVNZ4h6MoIQTT8tz7NOaH/LTLx6N+S5uLOQtBgpHnRwrnIPjNnlD+i+mjVWm2eG
 Dk7W7cQqkl/qjokkzxx7N5DnCe4HjgA8pDDO5F5fZ5mjdQMdboWIwxkAH5Z8hpeimO/2S
 wmtXjRim3NVhhd6x56Zi7QiK2vqh7PPfRXQaM8VMy6sjF5GGmsoePgcBLniRJ/B2Tf2xW
 HXqVLpzKkLarei1zGLPQKnWfuLsg4q+wZ8+Zb29Qx4E2MGv2FWbvY6K0FUMEyUHXYPiSF
 PxUHLTzqMbJz0Ufi0+mUG8LPaAyqxJo84QfOcdierr33ptM0PJs8ZCvrolV3JnuoGrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792134783;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=aE8VjFPrIBRQKHCNH0tCeQ34Yu+IQCfeMG//f5wd0jM=;
 b=O3BHaPnp0Z4umoK9ZMp5q3+G5KjGG+/ACGn1WsEBx4F9e0o4wzJLEHdwU8EhwbAQbFs0
 iDNI+78DmWHS4obN5tl0k4CQykkF2Z1gn9SQESsAIGBrTlbKkZYfMGdbc96kzZUCfSKuq
 Zn/39BiB578dp0VhAzpGD4fzJxJnSGutEeYTo5RJ4srzSwQBkeN9u2U6HFvwHXWEEQc7R
 W3q9WznA9FGT41WiOuvUrm1dJgyDQM0PcmN4PoB67In4jNy9hUwW6p5Mfo5jJRdj0v49p
 SlRmfL+O5KZ3MG0/rsvBk/4bZGBA5PempY1GOb52tLnr6X3iT9CeNxe4Dhq9PYs0bQw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fXC61ynB; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 959DE4098C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:13:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CA6FDC6220F;
 Fri, 16 Oct 2026 07:13:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E97346075D;
 Fri, 16 Oct 2026 07:12:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6CAA910328D09; 
 Fri, 16 Oct 2026 09:12:56 +0200 (CEST)
Date: Fri, 16 Oct 2026 09:12:55 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <atHOT_RazysRZX61@windsurf>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014164625.1474866-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/libtpms: fix typo in
 HOST_LIBTPMS_CONF_OPTS
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

On Wed, Oct 14, 2026 at 06:46:23PM +0200, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> --with-... arguments need two dashes.
> 
> Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Thanks, applied, after adding the commit title in the Fixes:
line. This helps me understand immediately that it is a reference to a
Buildroot commit (and not possibly a reference to an autobuilder
failure).

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
