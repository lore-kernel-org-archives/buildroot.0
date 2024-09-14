Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59509C02190
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45B360651;
	Sat, 14 Sep 2024 11:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMenjVt4_1k4; Sat, 14 Sep 2024 11:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9656067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9656067C;
	Sat, 14 Sep 2024 11:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6E021BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E02AF80B8C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfQSP-lX4P7E for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26F4080B61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26F4080B61
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26F4080B61
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:21:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01D001C0002;
 Sat, 14 Sep 2024 11:21:44 +0000 (UTC)
Date: Sat, 14 Sep 2024 13:21:42 +0200
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240914132142.22afe629@windsurf>
In-Reply-To: <20240911131230.2299474-1-christian@klarinett.li>
References: <20240911131230.2299474-1-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726312905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=suedyVq25LugE3UWLC+ZbfKCumOOogDo7HdGNlh2jOs=;
 b=a5wt4rx7uLKKhWiaBveeKjfFkP6MmC5ycJHbBx/eEFMg/XrFOUEq78rQBZiYOsh+0VedV3
 7Jb87z5hvaRyn+3zoSfJdR5hGIFJydV0e3+okxwPWoKgbKIGcKVcI9HgZW6m2tD/JIQncb
 SdlsngJURZaZYaWSy+x2lWgnHtBstWlUtHpRNprhqPP0NNI/RYJFs7BrlIiWq/OriaNxEu
 rIqriz/K2XG8CbYLbrtnxoldgnTfCrwkLaPuohIEAak3NS3FvjoTh9CGz5nbJ2Xbc4ZyjQ
 Vs2U0nZnk4AXQejrDWELhKU7kcK6PqDd7x9b0YIku11ywuseYrOZJbSgwLRTyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a5wt4rx7
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6connectivity: new package
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
 Christian Hitz <christian.hitz@bbv.ch>, Jesse Van Gavere <jesseevg@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 11 Sep 2024 15:12:29 +0200
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Thanks a lot for your patch. However I'm afraid it looks like you have
copy/pasted qt5connectivity... but a number of things are not the same
and not correct due to that. See below.


> diff --git a/package/qt6/qt6connectivity/Config.in b/package/qt6/qt6connectivity/Config.in
> new file mode 100644
> index 0000000000..1ddd4a6ad0
> --- /dev/null
> +++ b/package/qt6/qt6connectivity/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_QT6CONNECTIVITY
> +	bool "qt6connectivity"
> +	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ5_UTILS

There is nothing related to neard support in qt6connectivity as far as
I can see.

Also, I believe bluez is not mandatory. I've done a build of
qt6connectivity with neither neard nor bluez5-utils and it did
build/install Qt6Nfc.

> +	select BR2_PACKAGE_QT6BASE_NETWORK
> +	select BR2_PACKAGE_QT6BASE_CONCURRENT
> +	select BR2_PACKAGE_QT6BASE_DBUS

Concurrent is definitely not needed.

DBus doesn't seem to be mandatory either (I tested to build without it,
and it built fine).

In order to package this, you need to do some minimal testing: build
with qt6base, with no other options enabled, and look at what is
*really* needed. Don't blindly copy/paste qt5connectivity, as things
have changed (or perhaps some things are also wrong in
qt5connectivity?).

Could you have a look into this to prepare a v2 that is more solid in
terms of how it handles dependencies?

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
