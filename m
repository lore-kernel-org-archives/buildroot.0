Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6953EC001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F8A6101E;
	Sun, 30 Jul 2023 20:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F8A6101E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bvfwa93bubqm; Sun, 30 Jul 2023 20:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0AB6103A;
	Sun, 30 Jul 2023 20:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0AB6103A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68E331BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4286D81A2B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4286D81A2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viM3W0TChhOc for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:44:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55FA681A29
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55FA681A29
Received: by mail.gandi.net (Postfix) with ESMTPSA id 277011BF203;
 Sun, 30 Jul 2023 20:44:55 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:44:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730224454.3e1977c6@windsurf>
In-Reply-To: <20230730161002.1511077-1-bernd@kuhls.net>
References: <20230730161002.1511077-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690749895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=se+d7ICw8BxYsLartbZeuc6p+wGP421lDCjQ37OOI1E=;
 b=Wo8CsIcfT0kH3hIOV19sAdJ6hb/CVvv/AJuRXctVkWYLrUQARQR37u31fEAhS5xSYCUtD3
 N+bzo7EOhvBanu3kXW/oPc8Sj31K7mipZb3LGsTDsOJfBwX9SN3VOiN4fkLpjBHcyNeFJc
 lcXu4qDNvVA5i8PE3GmWc6A8FwS26AYOvoavek9ZUzuMQy3mF5NR60MH1KICAIlj/GlJW+
 e5k3w1nLsvZFCLaQkJOj8WiHgu5wmiyVizzy/Nb876jiobusTpolfj+QqUw1qv1oGCUGz3
 TVlmqL3FlCnU6mSfzZVm17JX2zYR0Mpoi8zH6mPfFnvZy5HGBHLeNN6+A1MgUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wo8CsIcf
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: fix build with gcc 13.x
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
Cc: Fabio Urquiza <fabiorush@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 18:10:02 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/8ac/8aceefdb71814c48163d7b171783172b6e1fdf27/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...includes-to-fix-gcc-13-compile-error.patch | 48 +++++++++++++++++++
>  ...efactor-add-most-of-src-util-to-iwyu.patch | 34 +++++++++++++
>  .../0004-src-util-string-h-fix-gcc13.patch    | 23 +++++++++
>  3 files changed, 105 insertions(+)
>  create mode 100644 package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch
>  create mode 100644 package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch
>  create mode 100644 package/bitcoin/0004-src-util-string-h-fix-gcc13.patch

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
