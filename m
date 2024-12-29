Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F37E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59051811F5;
	Sun, 29 Dec 2024 21:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsnGvXb3rS9x; Sun, 29 Dec 2024 21:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6110C81205
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6110C81205;
	Sun, 29 Dec 2024 21:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD8ABC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB86C8120B
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4n-9JBCoG1Gl for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D52F811F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D52F811F5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D52F811F5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:04:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F0AD1BF203;
 Sun, 29 Dec 2024 21:03:59 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:03:58 +0100
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot@buildroot.org
Message-ID: <20241229220358.101af9bb@windsurf>
In-Reply-To: <20241208081538.1245226-1-br015@umbiko.net>
References: <20241208081538.1245226-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735506240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWXDwmB+v8C3fLqcyQEKBQVKdkxG6tJ6HH/G4vixfeQ=;
 b=dq+RjPf48FW/1DoOIcphl5zsG6lXoiYr5DgDxj3iD4FXl0fg+UwOp291FK3HxEZq2Uglqg
 6MYQYKPL3iEG7rXi4UhvBBzazyZdETsJccyV7CDpAJ1bQYTcLs6o5WHkmV7orLBZGsqVof
 FF1PnrI8d3Sd/X/WSs7L2nLehQp1IA3jrrxKZPOF3k/12c8QjZBYlO1ltEAwusRaob8bXH
 +x6UdCh71AuHsd9N+02/m+BKKJ7gn6F4Mmy1iKtq+wrBOqbTCL6BKBJPbOzuPVOLnAMTN8
 oAjBCGhKraJBpA5+p6IahO/W8Q9FwyvZaIY/jZqRGXX5zay/qG+L+vZ/tgVUOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dq+RjPf4
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.23.16
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

On Sun,  8 Dec 2024 09:15:38 +0100
Andreas Ziegler <br015@umbiko.net> wrote:

> Version 0.23.16 change log:
> 
> * database
>   - fix integer overflows with 64-bit inode numbers
> * filter
>   - ffmpeg: fix for filters producing no output
> * support libfmt 11
> * support ICU 76
> 
> Adapt 0001-src-event-meson.build-add-atomic-dependency-for-spar.patch to
> silence check-package warnings
> Remove 0002-lib-fmt-support-build-with-libfmt-11.0.0.patch, changes were
> applied upstream
> 
> $ utils/check-package package/mpd/*
> 916 lines processed
> 0 warnings generated
> 
> $ echo "BR2_PACKAGE_MPD=y" > ~/output/mpd.config
> $ utils/test-pkg -c ~/output/mpd.config -d ~/output -p mpd
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                              arm-aarch64 [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  ...build-add-atomic-dependency-for-spar.patch |  6 +-
>  ...fmt-support-build-with-libfmt-11.0.0.patch | 93 -------------------
>  package/mpd/mpd.hash                          |  2 +-
>  package/mpd/mpd.mk                            |  2 +-
>  4 files changed, 6 insertions(+), 97 deletions(-)
>  delete mode 100644 package/mpd/0002-lib-fmt-support-build-with-libfmt-11.0.0.patch

Thanks for the patch. You had forgotten to update .checkpackageignore
to no longer ignore the check-package warning on the 0001 patch, so I
did that when applying to master. Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
