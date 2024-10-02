Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34672CF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE0FC40190;
	Wed,  2 Oct 2024 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3Cjc8CXWa75; Wed,  2 Oct 2024 21:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98018413F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98018413F3;
	Wed,  2 Oct 2024 21:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0E411BF31B
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC192413F6
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YagEz9wCRJhq for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EDF740190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EDF740190
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EDF740190
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:38:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B8CFC0002;
 Wed,  2 Oct 2024 21:38:45 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:38:45 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Message-ID: <20241002233845.709e0e6d@windsurf>
In-Reply-To: <20240922150554.1348962-1-thomas.perale@mind.be>
References: <20240922150554.1348962-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727905126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A90DT9ByxesZMPLiSBJ4J3TgCYWYBxm+pQuSm6lkoPk=;
 b=YDEdMe6qubB4wFTDj0CyFdmyXkTIwYxp8srvuVmoEy+Aue8aI74mCvAZncpkcCN3B2EWN+
 TQqWS5w6VbP/Q/6oyHFQ9WmyCTA3bHUHBfPW3I8inCHr/sf+5PvXPOZwm2zZFVPyKq1rKG
 wr+C1Us0Knpwzo6Jq4hhyN4BOQKUYAp6vaFzRkYKaVvqfrK1ehzAaJS6tWB+J8t321xYgq
 qG0Okx6DqA6X8OIu+OqPk+RJSJAX9WpOnIBoR+JF3Fq0FGYUmKTzY8yqrwrQMMmJ8ELHKP
 5y6dQXrgUZwi8R1ru0pQn+/tSpFpMA3OOL1x8bDPirtBPP3shwtMo7xLyty8UQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YDEdMe6q
Subject: Re: [Buildroot] [PATCH 1/1] package/aubio: fix build on big endian
 arch
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 22 Sep 2024 17:05:54 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> Fixes the following error happening on builds with
> big endian architecture target and libflac enabled.
> 
> ```
> [ 75/243] Linking build/tests/test-pitchshift
> /home/autobuild/autobuild/instance-16/output-1/per-package/aubio/host/bin/../lib/gcc/mips64-buildroot-linux-gnu/13.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: src/libaubio.so: undefined reference to `SWAPS'
> collect2: error: ld returned 1 exit status
> 
> Waf: Leaving directory `/home/autobuild/autobuild/instance-16/output-1/build/aubio-152d6819b360c2e7b379ee3f373d444ab3df0895/build'
> Build failed
> ```
> 
> There is a missing definition of the `SWAPS` macro in
> `/src/io/sink_flac.c` file.
> This patch adds an out of tree patch that copy the `SWAPS` definition from the
> `/src/io/sink_wavwrite.c` file in `sink_flac.c` to fix this issue.
> 
> Fixes:
>   - https://autobuild.buildroot.org/results/b88/b8895a81411dc7622b0aba9f2f0eaa0aef5a1a10/
>   - https://autobuild.buildroot.org/results/bc7/bc733f5192b354cb960b6a4726efb597be4bb06c/
>   - https://autobuild.buildroot.org/results/ea5/ea52dbcc14c2bab300277053f0b9599a8e82294a/
>   - ...
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  ...1-sink_flac-missing-SWAPS-definition.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/aubio/0001-sink_flac-missing-SWAPS-definition.patch

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
