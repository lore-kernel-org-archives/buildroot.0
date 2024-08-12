Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C5C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCB260814;
	Mon, 12 Aug 2024 20:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5Dm3oLmhHBs; Mon, 12 Aug 2024 20:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5592360818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5592360818;
	Mon, 12 Aug 2024 20:22:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A25FA1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F55E60818
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6wUgaFZ2Nkq for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7163C60814
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7163C60814
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7163C60814
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:22:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0402340003;
 Mon, 12 Aug 2024 20:22:03 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:22:02 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812222202.4b8ddc88@windsurf>
In-Reply-To: <ZrhlT1NAkvCmXNAS@waldemar-brodkorb.de>
References: <ZrhlT1NAkvCmXNAS@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723494124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0bRfecUsJDE6rkgprDaAadJxp6ztGi4VO2weownfHQ=;
 b=cH7rUEEUfPPa5stn9R4BhTud366L9NL2q/0+m1lqcTpjtfWCY1GUYGryU3uLGLP3IHhepu
 DFbLSBELGWRkqPGEpowaBz3y3JMQEYM8PZvhRV0N12WsUfeRomIH+Wt0hhXo13AxmrzQBZ
 af+qYBUZiYUmgeaHLrhp2EbKy6qXQIEGHzKUBXFQrPnZ7NLEca54pjnTV2bbTVy28pGCNX
 G3fCXryGHPtxFZuQjYyzhqQwa+eaR+SbmC9tJfhwzQ8l5u8CF4nXCUoWulsxz/dqlZO509
 K6SIgOFxZl9eWkhdga9xYy3aqzzJMOUQUBK1EWF5+AHG8bLR068LVLJYA3Ek1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cH7rUEEU
Subject: Re: [Buildroot] [PATCH next] package/bird: update to 2.15.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Fabrice in Cc, as there is a request below :-)

On Sun, 11 Aug 2024 09:16:31 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for a changelog:
> https://gitlab.nic.cz/labs/bird/-/blob/master/NEWS
> 
> An uClibc-ng based system needs _GNU_SOURCE in the CFLAGS to
> provide getrandom().
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks, I've applied to next, but I have some comments below.

> +BIRD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

This seems to be a workaround for an issue in uClibc. Indeed, I don't
see in the manpage of getrandom() anything that indicates that defining
_GNU_SOURCE is needed to get the definition of getrandom(). Why uClibc
is guarding the definition of getrandom() on _GNU_SOURCE, and not glibc
or musl?

>  # 0001-configure.ac-fix-build-with-autoconf-2.70.patch
>  BIRD_AUTORECONF = YES

Could you work on upstreaming this patch perhaps? Or maybe convince
Fabrice to upstream it? :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
