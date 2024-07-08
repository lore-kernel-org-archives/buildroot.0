Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10885C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D26B460BB4;
	Mon,  8 Jul 2024 20:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9ZIPwR7B7Wv; Mon,  8 Jul 2024 20:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E0F60906
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3E0F60906;
	Mon,  8 Jul 2024 20:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA441BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB5D060A38
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXdhak657Wfw for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:26:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 747A660B75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 747A660B75
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 747A660B75
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:26:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4FED1BF204;
 Mon,  8 Jul 2024 20:26:04 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:26:03 +0200
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20240708222603.01ee78f6@windsurf>
In-Reply-To: <20240708123346.45938-1-thomas.claveirole@green-communications.fr>
References: <20240708123346.45938-1-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xJn6xcnp+WSlIz7xjvJQRgf99N2MfcOea+3adusuRQ=;
 b=gjUIbZiIHRF9noJ1uQjljxUp5rJQOPPrADEUu/n/7i81JpQErEOiTqMvpcJ1LrcPH4Q8x8
 q34u9IPH7AQRWMINi8Tl4QwR8ICqCSog8KbHT5Hi5h6dnfYKCWVcszDIh0ckJgSyU4X8eN
 FzgpU/QBAz6mEY6EZ89sPq2XbPZNYyHFDfGPVeAytL79tIKmJ1xtxfCLPYjhBt4OAq2D9Y
 vdUa+rm2+LJEgRXQnen6kXcZ1lQTFqtlqnv4vESw3gQNW7fw6gqY9oYdIQgF2AWMam0I6e
 jhneQNBbWy42cdOwKFd4oEv07v28k6bKlwQ2JkFEeaSMkfhIS3WkYZxtGoMiHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gjUIbZiI
Subject: Re: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.4.31
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Jul 2024 14:33:45 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/vuejs/vuejs.hash | 2 +-
>  package/vuejs/vuejs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
