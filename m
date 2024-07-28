Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFCAC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 20:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6950A81063;
	Sun, 28 Jul 2024 20:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xsjir0G1BjnR; Sun, 28 Jul 2024 20:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A04981028
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A04981028;
	Sun, 28 Jul 2024 20:09:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8519D1BF47D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F6D34030C
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PpN-1NJMn7n for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 20:09:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1002D40303
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1002D40303
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1002D40303
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 20:09:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD048240002;
 Sun, 28 Jul 2024 20:09:06 +0000 (UTC)
Date: Sun, 28 Jul 2024 22:09:05 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240728220905.3dce609c@windsurf>
In-Reply-To: <20240727165715.716640-1-fontaine.fabrice@gmail.com>
References: <20240727165715.716640-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722197348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulPxbcnZQPiT4Fju7VopreQTBzn7iQvCG4FUkhLI284=;
 b=neafiRU3c7iVjKrauRCx5MKUa2ePnwOHBFgImwHzpl3G77QQOv50/nOTuUFMAPHOVaviC9
 /40dN71SYY6ieoKG0l41BS5QfbpXRXdcZoCZzFSxw65XhZhT+r7aK/t3D8dggs8NPrd4Tm
 OHYWdPTYxOXNfeF9r9y330IDRMk0iMg5ElEJFB5hyga2aj+jnCQ7Bv1JDXocmPzmIkDL0I
 4+6IXj54I5CDCu7fVl9G+O6sO8kfz7fyLEf65+hRCiufqfhaGN6R165vhhX9b+aJrxVExd
 6MnWp/jRm48miOXr3+5XoaFRRU2PNikYibUV3hOC3WB5ZtJj+ixmcYPxAi7/eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=neafiRU3
Subject: Re: [Buildroot] [PATCH 1/1] package/open-iscsi: open-isns is
 optional, not mandatory
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Jul 2024 18:57:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> open-isns is optional, not mandatory, since bump to version 2.1.9 in
> commit 2314928cf828ff02939b9c0041964c3ee2dd907d and
> https://github.com/open-iscsi/open-iscsi/commit/713524df809396e11f42d7691bd8ead2ffc1ca6b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/open-iscsi/Config.in     | 1 -
>  package/open-iscsi/open-iscsi.mk | 9 ++++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

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
