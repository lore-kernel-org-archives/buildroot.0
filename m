Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B10BC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 12:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDFAA40259;
	Wed,  7 Aug 2024 12:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zn2HKMK7gwlG; Wed,  7 Aug 2024 12:25:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9987B4034F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9987B4034F;
	Wed,  7 Aug 2024 12:25:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD74F1BF342
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA848409B3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1x-K0GWXBmS for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 12:25:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 728364024F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 728364024F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 728364024F
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 12:25:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D36251BF205;
 Wed,  7 Aug 2024 12:25:07 +0000 (UTC)
Date: Wed, 7 Aug 2024 14:25:06 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240807142506.45de55d8@windsurf>
In-Reply-To: <20240807105813.3844985-1-neal.frager@amd.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723033508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsrtEBslE3e7EDjE8IeBCCR0jCANi3I1hxASy9Ko2OA=;
 b=jBCtBHAhCqzZnBN+qj60MijnOypMsSxj1DwYWq+502oETyyQLcw26g2/BUgNYbxZVhBQjN
 ZssbuNt/Z8QtEXdgJDetP6RbY4SQ1Wwi/JJofoRPi/jRqEvagMQz52S1JSDjINwjV56npv
 jk5SqV5LIk/OdbErrb8DOh22WORZfMDPaAmLAO9aDfr6fa//8vBdcB5Zd/8Jcp3TuELY55
 cLe71xrS0XtncdQYPBfVSuVjZrG/owIL+mqtPdkflvOHrV9TISvVmY2/Wba3OXHAwbYK+p
 1b5ko0FSwVJXW2/l6ixQnlW0XsYdlkOxAbB00RcScaHy09gmBIkaqB5U6c4IZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jBCtBHAh
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add
 linux 6.6.40 hash
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 7 Aug 2024 11:58:09 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Add the hash for the Linux 6.6.40 release for Xilinx products.
> 
> The release tag was missing a patch, so it is being added here for users that
> bump to Linux 6.6.40.  The patch has already been committed to the linux-xlnx
> repo.
> 
> Upstream: https://github.com/Xilinx/linux-xlnx/commit/5365c13a86998da06d845c918f849b30b8735538
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I'm not sure I'm a big fan of the approach of doing this addition in
PATCH 1/5, and then changing the defconfigs one after the other. I see
two problems:

- In PATCH 1/5, you're adding a kernel patch, but do you realize that
  with only PATCH 1/5 applied, your kernel patch will be applied to the
  existing defconfigs, that use the xlnx_rebase_v6.6_LTS_2024.1 kernel ?

  It turns out you're lucky, as the patch applies fine on
  xlnx_rebase_v6.6_LTS_2024.1, but in the general case that would not
  work.

- After applying all patches, you still have the hash of
  xlnx_rebase_v6.6_LTS_2024.1.tar.gz, but I don't know if it's still
  used by some other defconfigs.

So I see several approaches here:

- Don't use a shared board/xilinx/patches/ folder, and use one per
  board, like is done in board/freescale/. This allows to update
  defconfigs independently from each other.

- Update all defconfigs that use board/xilinx/patches/ in one single
  commit.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
