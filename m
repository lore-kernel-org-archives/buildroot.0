Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E14DC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDB4060780;
	Mon, 29 Jul 2024 18:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhYufXS3xWjA; Mon, 29 Jul 2024 18:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B7C607CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1B7C607CB;
	Mon, 29 Jul 2024 18:33:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 769801BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64873607CB
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOe7BhlMf2Fz for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DFA5760780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFA5760780
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFA5760780
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:33:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B5101BF205;
 Mon, 29 Jul 2024 18:33:26 +0000 (UTC)
Date: Mon, 29 Jul 2024 20:33:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240729203325.3560903e@windsurf>
In-Reply-To: <20240727202340.1484781-1-james.hilliard1@gmail.com>
References: <20240727202340.1484781-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722278006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mm6NJfRi2O6aft9AlUxvrTUh/aXns7A0W/OEzxIJ1/c=;
 b=N7bob2UAnmqKUKb6OrZe5r1ntJa0M/3Lijxqeul6xVAKiTDAPW9ZxG2IuHa7befCaqYrbY
 u/MuPzPb1o6mcN8vmYbYcxwBwjGp9jFBGnn5YELmd8ZizsM85PpT943oEubk6GrvSmBGxa
 OITo5y9m81BACS600ZucN3pU1f/AQmbBUIwO9jW9d6iaNNio1iT4+7z085D6uHqgl4euHv
 KhCky2aCq4pri4C/U7PvLvcCJ98v9V+PoKzrzCGwRQxNDi7be/tWoN1xeJrkI5ehmWKI9l
 fTURuwg7FomwOFB1qYa2mr2qr0wwlWQfgR66r+miPZx9aRmVwimYMzK1SbXF0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N7bob2UA
Subject: Re: [Buildroot] [PATCH v3 1/1] package/tailscale: new package
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sat, 27 Jul 2024 14:23:40 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - set required CONFIG_TUN kernel config option
> Changes v1 -> v2:
>   - don't set GOPROXY
> ---
>  package/Config.in                |  1 +
>  package/tailscale/Config.in      |  8 ++++++++
>  package/tailscale/tailscale.hash |  3 +++
>  package/tailscale/tailscale.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/tailscale/Config.in
>  create mode 100644 package/tailscale/tailscale.hash
>  create mode 100644 package/tailscale/tailscale.mk

Thanks James for this new package. I tried building it, but it fails
during the download with:

verifying fybrik.io/crdoc@v0.6.3: checksum mismatch
	downloaded: h1:Awi+v+URtj5DvPr0LLdVrW2Nn9/G1Y7aGpUPG1IATE4=
	go.sum:     h1:jNNAVINu8up5vrLa0jrV7z7HSlyHF/6lNOrAtrXwYlI=

Could you have a look into this?

Also, could you make sure to add the entry in the DEVELOPERS file?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
