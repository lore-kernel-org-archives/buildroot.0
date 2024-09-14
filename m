Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2C3C02186
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3D58456F;
	Sat, 14 Sep 2024 09:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qd55fhqK3w4; Sat, 14 Sep 2024 09:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D75684712
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D75684712;
	Sat, 14 Sep 2024 09:04:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A499A1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FFD1402C7
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alcwnmWUrZXQ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 442754023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 442754023E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 442754023E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:04:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 017F4C0002;
 Sat, 14 Sep 2024 09:03:59 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:03:58 +0200
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <20240914110358.12264404@windsurf>
In-Reply-To: <20240911130407.2925548-2-guillaume.chaye@zeetim.com>
References: <20240911130407.2925548-1-guillaume.chaye@zeetim.com>
 <20240911130407.2925548-2-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726304640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NYjTo5G7mia0fWnG1PlrrYyw8KGXsY577DLoME4POUI=;
 b=aH4Q///cxjnomRpVQ9HtCdivPkYbXLpIf4wqo0vWwLnd3oOVBxLMjzvQddEEeitIRlG3Bn
 zPFDUQ8BrdxmKhY5/l1ejjdSEYYbfEz389VR1NMOsqM12MRVaDk6R5ZCbsUOTdCD3ZAKA2
 aLKOXItn1jGbLHO/GWn0hG5hFYdmxfMQFoGhLZ9tNBTrbYMNl70MmHGlo6i2v8Vc4S8SWs
 Fz7d0JWD/LF1HG97bnC4QWwvAIVgIjGgcS+f+zQxmG9jtrF1rjwenI/yyHhFSBZDJC+hfZ
 0+Or44V+Vi2sdmgu09JhviGhACoiyc7g30nuTWN6kAQzpVThUJZIHAUfylSa1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aH4Q///c
Subject: Re: [Buildroot] [PATCHv2 2/2] package/librsvg: Add support of SVG
 in gdk-pixbuf
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

On Wed, 11 Sep 2024 15:04:07 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>

Thanks for the v2, but for a change like this, a commit message cannot
be empty. What is the problem? Why and how is your change fixing it?

Also, your commit title says "add support of SVG in gdk-pixbuf", but
the patch seems to do the opposite: add gdk-pixbuf support in librsvg.
Could you please clarify?

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
