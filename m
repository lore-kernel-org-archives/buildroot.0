Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F96C02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0889280CCC;
	Sat, 14 Sep 2024 09:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr083VsY7_Yc; Sat, 14 Sep 2024 09:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2415280D3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2415280D3B;
	Sat, 14 Sep 2024 09:31:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31D681BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D7C680C98
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gi30jr2j_SGp for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 185FC80C25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 185FC80C25
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 185FC80C25
 for <buildroot@busybox.net>; Sat, 14 Sep 2024 09:31:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FA951BF203;
 Sat, 14 Sep 2024 09:31:33 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:31:32 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240914113132.39e9a014@windsurf>
In-Reply-To: <20240911075552.3455745-1-francois.perrad@gadz.org>
References: <20240911075552.3455745-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726306294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fexzRskf/hVHdMr2cUiQgtyNbYlP7MJltyZ5C/HtfQ8=;
 b=d+yUm8NqliF68FxhEzzINComz2qqDetYH0dmo/G5cqSlZu3R8kvhPc9QxF0+HKQvp9lXR/
 Ma+kiYq12TR0zA+Lr4Dr3p2s0xpDCE3G+HI59uEDVbSEHZdbx78ZegQst9oyt98rz7JCgP
 4na9Jm/4zBKpj9VaxeS+jjDNAfMyNWG6kocwsASb2p9tywO+1tmqeIgKysTEICOarQmqbZ
 cyatYbWYaaQgQtGOch1BDnkkzYZjAcj3NYHyRZragiJrXarzx8NVYyIgeLbompC/6Q5+xZ
 WJEKUk7m4PZYkJoeJYKbQUtXLq9sFpOMpWmd43jBbMBXZBDgzsodyA/+OyeHYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d+yUm8Nq
Subject: Re: [Buildroot] [PATCH] package/perl-libwww-perl: bump to version
 6.77
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Sep 2024 09:55:52 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> diff LICENSE: use "The Perl Artistic License 1.0"
>     see https://metacpan.org/release/OALDERS/libwww-perl-6.77/diff/OALDERS/libwww-perl-6.67#LICENSE
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-libwww-perl/perl-libwww-perl.hash | 8 ++++----
>  package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
