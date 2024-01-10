Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104ADC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9165437A1;
	Wed, 10 Jan 2024 21:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9165437A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WF2Kby8d0n8J; Wed, 10 Jan 2024 21:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91F644376A;
	Wed, 10 Jan 2024 21:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F644376A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D07C1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55CC161515
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55CC161515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAxbLxw1XP97 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:08:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33EBA61063
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33EBA61063
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B9AD1BF204;
 Wed, 10 Jan 2024 21:08:03 +0000 (UTC)
Date: Wed, 10 Jan 2024 22:08:02 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240110220802.349862b1@windsurf>
In-Reply-To: <20240106133919.1586012-1-fontaine.fabrice@gmail.com>
References: <20240106133919.1586012-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704920883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2KBQKaMwHA3M3vwKJy1RlCDQJ43VD8ZTEpW2FBQ/mA=;
 b=dVtl3lz+FZywJPeJZ0xhMt6MzE48bYIrAqfXkx/wI7NvCpiUANJjAKYsIYlKLKlTVJ9vkB
 b9msM0l3eD0g3mxXK4RNGigiNhJsKwPxTnueZXrIAl5HBfLr0AMp/axYMFXuxV5T5JK4ag
 sHibr9zbtbEevTzzRXmUsMZIBdHI2kel81rdWtPeT6PgzfSL6TbGeo0plKi9tQFCJdTvDI
 yYLMWGmxzDhJJ3cTLd9tzEgXkzqQ9aBGzmXYQompjTSPDzf/tSL8zOOgaxWzGA2etPap4H
 OPP+eUMNP8AseL6ysoD+pmtwqtHpOfWPthi4J9gMntEpzzFuHAb6dylLA55X6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dVtl3lz+
Subject: Re: [Buildroot] [PATCH 1/1] package/nushell: fix sparc64 build
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jan 2024 14:39:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure on sparc64 raised since bump to version
> 0.85 in commit 470f0fb1ec0bd2ba03340f2aea34891ca8d7739d:
> 
> error[E0308]: mismatched types
>    --> /home/autobuild/autobuild/instance-7/output-1/build/nushell-0.85.0/VENDOR/uucore/src/lib/features/fs.rs:121:16  
>     |
> 111 |     pub fn number_of_links(&self) -> u64 {
>     |                                      --- expected `u64` because of return type
> ...
> 121 |         return self.0.st_nlink;
>     |                ^^^^^^^^^^^^^^^ expected `u64`, found `u32`
>     |
> help: you can convert a `u32` to a `u64`
>     |
> 121 |         return self.0.st_nlink.into();
>     |                               +++++++
> 
> For more information about this error, try `rustc --explain E0308`.
> error: could not compile `uucore` (lib) due to previous error
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f9f0287a8e39c65895014ca513ed25071f020add
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-uucore-add-support-for-sparc64.patch | 57 +++++++++++++++++++
>  package/nushell/nushell.mk                    |  7 +++
>  2 files changed, 64 insertions(+)
>  create mode 100644 package/nushell/0001-uucore-add-support-for-sparc64.patch

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
