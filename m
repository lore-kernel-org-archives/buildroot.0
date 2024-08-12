Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13617C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35EF804E0;
	Mon, 12 Aug 2024 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNFqy9kGrC_W; Mon, 12 Aug 2024 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 071D1804F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 071D1804F9;
	Mon, 12 Aug 2024 20:58:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C46DF1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDB5E804F9
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zaWaYARF2kW for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2724804E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2724804E0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2724804E0
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:58:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BB6FFF802;
 Mon, 12 Aug 2024 20:58:46 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:58:44 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812225844.161f0c86@windsurf>
In-Reply-To: <Zrmdc57gS6XDpKzt@waldemar-brodkorb.de>
References: <Zrmdc57gS6XDpKzt@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723496326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVgOF2xxFbHAfAgDBPLLynlKBgXxidBcR0q3PwdKxgI=;
 b=IknE+Q7YeJtKiBXoBa4eUbHpVQYMdM5zGeOdyE5q6DvnUPyyU7PMQ1qoA1wKCW/G6eKmDi
 pbrYEAqh4SHbr9US0v+bjcVXV7MurDZvEf6lEIFjaOWr4QnNzkgIhWbqs12kYLmxXAaGVM
 tjbd8qTXikrCdc6dj/OnGL61370LHrVqEok6s+ME12AhmO+mzEBYN077ANa7sYDCK07Obx
 T77B1yXMOGgRm/opVyJ5iYxJT3lbyb58zNb2TyRsA6v3yfpEw/6zrYyDs04JWdJfx+94Nk
 5XINwau7QvkGVwzQxPyjfp0/ulbKiS4V7runQwS0RlnLl2fMDPIUZ2EIwE2eyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IknE+Q7Y
Subject: Re: [Buildroot] [PATCH v2] configs/solidrun_clearfog: update U-Boot
 and Linux
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 12 Aug 2024 07:28:19 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

>  .checkpackageignore                                    |  1 -
>  board/solidrun/clearfog/genimage.cfg                   |  2 +-
>  .../clearfog/patches/linux-headers/linux-headers.hash  |  2 ++
>  board/solidrun/clearfog/patches/linux/linux.hash       |  2 ++

Did you use utils/add-custom-hashes to generate the custom hashes? I
think it normally creates linux-headers.hash as a symlink to linux.hash
if they are identical. Could you do this here as well?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
