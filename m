Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0895C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A65B240B79;
	Fri, 30 May 2025 19:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oj1eTvkz8YYC; Fri, 30 May 2025 19:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCF5740B71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF5740B71;
	Fri, 30 May 2025 19:41:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C35F236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DFC160ACE
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHzsOvkcpyMV for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37A6660AE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37A6660AE2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37A6660AE2
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:41:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C1361F433;
 Fri, 30 May 2025 19:41:51 +0000 (UTC)
Date: Fri, 30 May 2025 21:41:50 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, James Hilliard
 <james.hilliard1@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250530214150.3bb4581d@windsurf>
In-Reply-To: <20250523121521.380704-1-fiona.klute@gmx.de>
References: <20250523121521.380704-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleekjeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduieethfeftdejvdegueeuudehiefggeelheettdevvedtkeevieeutdehjeetheenucffohhmrghinhepghhnohhmvgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgm
 higrdguvgdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhonhhtrghinhgvrdhfrggsrhhitggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748634112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjE1tO+AQGtsf1Vtbl2GUpVM2+OnwS/G+WZ+BTpS7t4=;
 b=ECpkRKduWGU39FKSkdTBeYd+MwtwIe+9YmFdRqALM66LQHLWhJ/8pUV7UCG3rjY0vdE7L+
 bmEcBDdgwmo51LYWh+3Y9aAxWlqcL/UQ5nih+bwIkYqjcGGcoo65maHzy6sxsBBAeBCMJk
 H8ws/dAXaCZsXH6ApP2IPimzPckYxGetfdlbIV8bedYYiEsh+JQcvfpUy2/Vsvynr7SREh
 1pFQG4HY5A65pukgst+tbw1m7w0HCWNGdkWBFJaP03i5XtIgMCYObqpTYIBTpN9XPDRgSl
 O59UV2pQSrG0wjP9hqcCzAjaxp/ht5pVxVMTnl0jlqcEw/tK+KPzzBXKbeixsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ECpkRKdu
Subject: Re: [Buildroot] [PATCH v6 1/4] package/python-gobject: fix event
 source registration with Python 3.13
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

On Fri, 23 May 2025 14:15:18 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Since Python 3.13 BaseSelectorEventLoop.add_reader() and
> BaseSelectorEventLoop.add_writer() use the mapping returned by
> selector.get_map() to detect if a file object is already
> registered. This fails with the implementation in gi.events._Selector
> if some calls use a file object, and others the raw file descriptor.
> 
> Full upstream bug report:
> https://gitlab.gnome.org/GNOME/pygobject/-/issues/689
> 
> This bug breaks package/python-aiomqtt, because its client object uses
> file objects in some places for the connection socket, and the file
> descriptor in others. The result is that the connection attempt times
> out because source registration fails, and the Future that marks
> successful connection never resolves.
> 
> This commit adds the fix as backported to PyGObject 3.50 [1] so it can
> be cherry-picked to Buildroot stable versions using that version.
> 
> [1] https://gitlab.gnome.org/GNOME/pygobject/-/merge_requests/423
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Change v4 -> v5: Reorder patch before version bump to support backport
> to stable, replace patch with version applicable to 3.50.

Applied to master and cherry-picked into next so that I can apply the
remainder of the series on next. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
