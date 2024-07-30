Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BB2C3DA7F
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 21:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF6EA40B9A;
	Tue, 30 Jul 2024 21:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsFvtCKCU-GS; Tue, 30 Jul 2024 21:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA8040B9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BA8040B9B;
	Tue, 30 Jul 2024 21:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB6B1BF3FB
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78D704032A
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-IBzrLCa8Fs for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 21:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B40B140321
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B40B140321
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B40B140321
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 21:20:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 663CE240004;
 Tue, 30 Jul 2024 21:20:03 +0000 (UTC)
Date: Tue, 30 Jul 2024 23:20:02 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240730232002.0019c9c8@windsurf>
In-Reply-To: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
References: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722374403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skV7HA/jJjX6tWSuKTJKBXfTAAYav2TJu0MIRnWIa7w=;
 b=EC1qjyqpTDUNTN1qZ9+zN4AjqghBAwaGYudqIQ+mD6twiJsYuWleKNDMABhPc+Z9BnP4vz
 MkwXXgm5GNf3F7E9Hf8mljbW/JpSjcW62RhzljdnSBkVy4mnn8A1GyeO3QRkcg4mNXy8S/
 zed8tiHliR8A1jnoX3QdbEnFBRzTUYWlmYmetwxtzMC00HBNB1b3oeIqXuOU9Mw/0M+Ol8
 X7ODyaRuOg6/r6GuJz+s2nXUasrHMt0hIl/Rkkcg/AmyGbQlg2w3pUATX1KqcRWpUEK+8x
 VMBylUpSECmQHjR8NzRqkT9fhwYZC/HGhjgJJ4p3lEhxQlYhUmeFIa8KVjO5QA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EC1qjyqp
Subject: Re: [Buildroot] [PATCH 1/5] configs/beaglebone_qt5: bump U-Boot to
 2024.07
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
Cc: linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 22:16:55 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps U-Boot to version 2024.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
>  configs/beaglebone_qt5_defconfig                      | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

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
