Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E470CE7A9D
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A9B3400E4;
	Thu,  5 Sep 2024 20:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLA8IAnSNi89; Thu,  5 Sep 2024 20:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 290BE40391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 290BE40391;
	Thu,  5 Sep 2024 20:47:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A53001BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9157681E35
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vf6WH-PeQsKs for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:47:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B82581E2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B82581E2F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B82581E2F
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:47:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FCB1240003;
 Thu,  5 Sep 2024 20:47:46 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:47:45 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240905224741.4577ce9e@windsurf>
In-Reply-To: <20240901171338.GB1275649@igalia.com>
References: <20240831120707.471306-1-thomas@devoogdt.com>
 <20240901171338.GB1275649@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725569267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6E2l3O4bFmps3YFiKecHHNSF8oW5fMuhnSEZKJ/ueRw=;
 b=Anx4Zsi/iQ459ZHUaef82bEvUcu6d/k+m56JkOYjHfkgXj14qjW9Fw09nCCI9hxndCPyOX
 NXJy2raoHllIHrcE8q1nYZZJSOQ1ZEjH6qVGdFFcZmvHQdU8l4PzhfKOlJ3R2LYBpANJ0D
 UTHmFsixZI1bYHYzkATBjVdsb+6eUN3VrZnNWcJm3ezWn/5XeFkzDkfm9OfMnuf8jleDh5
 RKpUSkJ4gt6gJvcACJ7rQK3fz3kCV+F/BZ79G1SLyH5m9jQ2SSszqbFOM11Jq6G7MNMz+W
 t5BtZhuQzM+U5rnb+tRdpMLvdxYYkfRnGF4EGQc7V6VFXqf7Pz/BlUJey+6GGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Anx4Zsi/
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to 2.44.3
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Sun, 1 Sep 2024 17:13:38 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Alongside with the announcement, we found a couple of issues that need
> importing a couple of patches, both of which are already present in the
> webkitglib/2.44 release branch. I sent an e-mail to let packagers know a
> couple of weeks ago:
> 
>   https://lists.webkit.org/pipermail/webkit-gtk/2024-August/004002.html
> 
> The two patches you would need to add are these:
> 
>   https://github.com/WebKit/WebKit/commit/9140ce712aa87091613874d802787ab476be0e39
>   https://github.com/WebKit/WebKit/commit/4854b944b345990e4100319662777856fe8ea4aa

Thanks for the heads up. I think the second patch isn't strictly needed
in our case, because we don't support building with Clang.

> Also, another tidbit: I am planning to release 2.44.4 next week, which
> will be the last version from the series, and in a few weeks more we
> are planning to release 2.46.0 as well -- just a heads up in case it may
> be preferable to wait until either version.

Let's update to 2.44.4 when it's available then!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
