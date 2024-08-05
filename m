Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FF1C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 21:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B9D24022A;
	Mon,  5 Aug 2024 21:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id py1bFbSjw3nW; Mon,  5 Aug 2024 21:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4646F40233
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4646F40233;
	Mon,  5 Aug 2024 21:50:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4B61BF2E4
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 482F280B3B
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRleblgkXLkz for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 21:50:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18E8E80AEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E8E80AEA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18E8E80AEA
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 21:50:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCAF040004;
 Mon,  5 Aug 2024 21:50:24 +0000 (UTC)
Date: Mon, 5 Aug 2024 23:50:23 +0200
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <20240805235023.45377983@windsurf>
In-Reply-To: <20240212034757.99951-1-kadambini.nema@gmail.com>
References: <20240212034757.99951-1-kadambini.nema@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722894625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iU44i4W5FFyw6ZOn544cjlAHTGOqu2LF7jte/HQ7BDQ=;
 b=eyPlk5rU7I/k2FGLNS0CVqrqJryaSVxbyzpDrtL4cvqs4VwpZeQTEJTxbf+sX3SbUMx47Y
 XBhw8FWT2dgt/LwPb5kNLaic/MMTaEzBmr7hHllytpyR1trGWxYJq03jClLWr2JzVLixVN
 ikirDDmWv8YC/1p/bDFQxHpaDl05Xq22HRbdeAoVMRaCmCuYJ7hJvoAuX+ZBsbDOFbVazj
 dS4UNdmp280zMJPRtuLAaUX+Svr52XkVCfE6Nta7PvMdoex84rTMx7XqQJHaniPObfOjUm
 88Qza7La3HVUxfIMmLqMaIx+oEgO3SE9255beXXV+l5acL9VaKTzE+jEUi4m3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eyPlk5rU
Subject: Re: [Buildroot] [PATCH 1/1] package/atop: bump to version 2.10.0 -
 Added a new dependency - libglib2 - Remove
 0001-atop.h-include-time.h.patch. It was applied upstream
 (https://github.com/Atoptool/atop/commit/03c5c4dd29bc7590baccb55a36d61e7f4b39c1fe).
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 19:47:57 -0800
Kadambini Nema <kadambini.nema@gmail.com> wrote:

> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/atop/0001-atop.h-include-time.h.patch | 41 -------------------
>  package/atop/Config.in                        |  1 +
>  package/atop/atop.hash                        |  2 +-
>  package/atop/atop.mk                          | 10 +++--
>  4 files changed, 8 insertions(+), 46 deletions(-)
>  delete mode 100644 package/atop/0001-atop.h-include-time.h.patch

Thanks, I've applied.

There was an issue in your commit log: the whole message was on one
single line, while it should have been split. A proper commit message
had a title (reasonably short), then an empty new line, then one or
more paragraphs of additional explanation. Check all other commit logs
in Buildroot.

Another issue was that you forgot the host-pkgconf dependency, which is
needed as atop's Makefile uses pkg-config to find glib.

Finally, the duplication of CFLAGS/LDFLAGS from atop's Makefile into
atop.mk wasn't really nice. So instead I cooked a patch, submitted
upstream, which allows atop.mk to pass additional CFLAGS/LDFLAGS
without overriding them.

You can have a look at the final commit at:

  https://gitlab.com/buildroot.org/buildroot/-/commit/beb54d8126e7b0fd2e1090061aa96e6487c4b697

Thanks a lot for your contribution, and sorry for the huge amount of
time it took us to look into your patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
