Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAA8EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5849400D3;
	Mon, 10 Jul 2023 18:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5849400D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueAHpYuUhXAO; Mon, 10 Jul 2023 18:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0A91417F6;
	Mon, 10 Jul 2023 18:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0A91417F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2290C1BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA213417F6
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA213417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tg1BvZAtIYaq for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:39:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B921400D3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B921400D3
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:39:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C20B840007;
 Mon, 10 Jul 2023 18:39:29 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:39:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710203928.66108038@windsurf>
In-Reply-To: <20230618183105.2474342-1-bernd@kuhls.net>
References: <20230618183105.2474342-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689014370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IMW9n7SaRzLq/FTJU6eHwORHl2i1HQ8LpVnG/m8D+M=;
 b=KPgza5jsOHQ5IW++5MDBM6I1uv8BSYhTg5ynnowg7VnbNrkEYddJ4pu6hY7PYryqcUqxAN
 JCmBTKggIQZoJtp7jcNHGrisNExCYh+aJ0Vk/s2pJmGmTttdnps7cwqxCAxn2OImrvkN01
 JiMVwLNa6IEdpmvxro60IbZ7Q+Sa2wZNmPpD8JRFrm+o+DtCcPofrvIFOV3d42AtosaiLk
 FHOlFhOETKHrvKIqIaBYwmrlOMory92ASVNGcRdJ/lrMZYi+Klp2f8FVq/zHG5Sv9zgFfT
 CM08Psu0cEyjY2SMXw8HLLctkvztovdYdOFmgAobeDe8CWLlY+p4tSjZ1EwizQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KPgza5js
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-meson.mk: disable staticpic
 on Coldfire
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Jun 2023 20:31:04 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes build error in the upcoming libdisplay-info package:
> "Tried to convert PC relative branch to absolute jump" as described
> here: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101971#c11
> 
> Since this issue not only occurs with this package, see
> https://git.busybox.net/buildroot/commit/?id=2a48a6ee9d6b81c804182ff0ad6e0f7c850f6839
> we add the configure option to pkg-meson.mk.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Suggested by Yann:
> https://lists.buildroot.org/pipermail/buildroot/2023-June/669138.html

I've applied both patches. I'm not a huge fan of the conditions on
BR2_m68k_cf. I would prefer to have some better hidden options such as
BR2_ARCH_SUPPORTS_STATIC_PIC or something like that, with a clear
understanding of which platforms support it and don't support it. But
oh well, I don't know if putting too much effort into Coldfire is
really worth the trouble...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
