Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A74C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30CCA60586;
	Mon, 26 Aug 2024 16:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9itiipH4ZuI; Mon, 26 Aug 2024 16:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4EC605E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4EC605E6;
	Mon, 26 Aug 2024 16:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0650C1BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6C6A40297
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F0D9xS1vKUY for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 939B5401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 939B5401FB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 939B5401FB
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:55:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB21CC0007;
 Mon, 26 Aug 2024 16:55:26 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:55:26 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240826185526.52a21c90@windsurf>
In-Reply-To: <20240825115239.158016-1-ju.o@free.fr>
References: <20240825115239.158016-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724691327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhmjW5L48g2/jRhB+mb4EW9NReupmkn3zsydHRK6zWA=;
 b=E957PQ5mMq+NKy+Y89BghYERXNYSQD+g6prTr3QEqRGY5F0pmfGnito5xtuhzjcfsMvpq5
 Twfs7D7cUCiJKRtMfKUq7xmPV6P8NykmKjCFpHRbAuazC6ZHrnQEfP+fnxyPDTwAiPoOrf
 +xEYJuuxHQSDTntTIII3o+V5c6lfcKP/Fl9C7z3qh1SEr83GqZiTY/fSJGQvgujCIc8VxA
 NzyXU0cis0UgjOBYzpN1sylYfpYsoxgZ8JSFhvVL5Ev6HXHTXxrSwa0wRw4O+f+8lwFKUv
 0iOQVC+IK5HY8CNfc63xuVYfEaitNxw6ISSnpiCynVLkc1ql3U+0wOFr8ph3ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E957PQ5m
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add parted runtime test
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

On Sun, 25 Aug 2024 13:52:39 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                   |   1 +
>  support/testing/tests/package/test_parted.py | 107 +++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 support/testing/tests/package/test_parted.py

Thanks, applied to next! Just one comment below.

> +        # For each partition, we create a mount point directory, mount
> +        # the filesystem, copy the reference data file in it, sync the
> +        # filesystem, and compute the sha256 hash of the file. This
> +        # sequence will exercise a bit the partitions and filesystems
> +        # in read/write operations.
> +        for part in range(1, 4):
> +            self.assertRunOk(f"mkdir -p /tmp/MyPart{part}")
> +            self.assertRunOk(f"mount {dev}{part} /tmp/MyPart{part}")
> +            self.assertRunOk(f"cp /tmp/{data_file} /tmp/MyPart{part}/")
> +            self.assertRunOk("sync")

I wasn't sure whether sync or a umount/mount cycle was more appropriate here.

> +            out, ret = self.emulator.run(f"( cd /tmp/MyPart{part} && {hash_cmd} )")

You could have used "cmp" instead to compare files. No need to compute
the hash ahead of time, no need to parse the output of sha256sum, etc:
cmp returns a 0 error code when the files are identical, a non-zero
error code otherwise, so self.assertRunOk() would have worked.

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
