Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85818D3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 21:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 292FE606BB;
	Mon, 11 Nov 2024 21:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huEOddJgOP3d; Mon, 11 Nov 2024 21:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCDC160702
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCDC160702;
	Mon, 11 Nov 2024 21:12:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3814DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5D5580CF7
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeKEmtxxHYY3 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 21:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4C0580CA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C0580CA0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4C0580CA0
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:12:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9D5EFF802;
 Mon, 11 Nov 2024 21:12:28 +0000 (UTC)
Date: Mon, 11 Nov 2024 22:12:28 +0100
To: Brandon Maier <brandon.maier@gmail.com>
Cc: buildroot@buildroot.org, Niklas Cassel <cassel@kernel.org>
Message-ID: <20241111221228.211b7a61@windsurf>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731359549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCkekiMmdc60/p4tRO+sjwfvR3xLeYnydTMKZiC5BhU=;
 b=CMjmaUB+MJEiWC5HBhajJc5l5+hrl6U5R569/NGYvNP5POwD0uEMqJ7jnFLMrPLIN1BYyO
 8pOcpL9bMfFCsc3MtNa3zKiqBnjl8KkeAJFv6NDGJJMwTrHuCS70uhWGZlgZlaQp7Jo+MH
 hX93uGyqcLkO0f9ETGbliov6YL6mVQlCeiVrNHbf/o+5r6VviBOpxdVb2zR1VJlGM6onps
 f3wLfD8ZzP0DjuCCL3REJbWzBLchb80RIGn8h0DHstEvO7Zbl7QOd8/JofOjd7Z54pW+Vr
 voPpw6JGGJiQwIRCn1K0Xh3evsDyt2+7NwW5iUuBiv/AVqI9aj3twNAXjpj/zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CMjmaUB+
Subject: Re: [Buildroot] [PATCH 00/17] board: cleanup genimage
 partition-type-uuid shortcuts
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

Hello Brandon,

On Sat, 09 Nov 2024 16:16:14 -0600
Brandon Maier <brandon.maier@gmail.com> wrote:

> Buildroot boards using genimage's "partition-type-uuid" can use either a
> full GUID or one of the shortcuts defined in genimage[1]. The Buildroot
> manual recommends using the "L", "U", or "F" shortcuts over a full GUID;
> but does not specify how any other GUID should be defined.
> 
> This series tries to bring consistency to partition-type-uuid by making
> shortcuts the preferred method. First we update the Buildroot manual to
> say shortcuts should be preferred when available. Then we update all
> boards to use shortcuts.
> 
> This series is partially implementing Thomas suggestion to have
> consistency when using "L" vs "root-${ARCH}" vs full GUIDs[2].

Thanks for working on this! However, I'm slightly confused as to what
the goal of this series is in the overall process of making things more
consistent.

With your series enabled, some root filesystems still use L, some use
root-*, which isn't very consistent. Is your series "only" about
replacing full GUID by shortcuts, for the moment?

I'm fine with going this way, but then the PATCH 01/17 should be
accurate about what's recommended nowadays. Because saying in the doc
we want L for the rootfs, but many genimage.cfg use root-* isn't really
great.

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
