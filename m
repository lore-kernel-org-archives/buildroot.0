Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF146C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B1AE80D55;
	Mon, 12 Aug 2024 20:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIXEwdhEdLFm; Mon, 12 Aug 2024 20:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875DA81456
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 875DA81456;
	Mon, 12 Aug 2024 20:51:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF861BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B4F0405B5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKqskQ08fVId for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 014B6405AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 014B6405AE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 014B6405AE
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:51:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD3F21C0003;
 Mon, 12 Aug 2024 20:51:07 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:51:07 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240812225107.251d7205@windsurf>
In-Reply-To: <20240810200528.762941-1-ju.o@free.fr>
References: <20240810200528.762941-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723495868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbgfcQIYh+UYDRqH0o+GHCibKsftNWnT4SgFKbpOz9Q=;
 b=l4HOa70GhHG3zt67GRiJxAQR+cKijciDbMGeZzy6TIGSJbg7WSg0n9mD0ALkCRhXdP4hG6
 AbJfYyM9dJm/jYyDGp0XK+u3Z7SET0Ibn7v2LgkzAoaIYoUrdRL4tnp7R1MqQ8DhZJnmGZ
 EVRzQHoiD1EIf9jrE2UaUH+9g9qXkzLCIY/yNo2c/OvbIUad5obuIhezbJA9rDJ3CnG3U4
 K6pDPVpwZpWadFbTGbzcj5t7nqL7IkNqxtD/pNAEYcrG/6Mg5h5fds2L3u2oG+S0RxdMdA
 kd41yExhBYmVpSfi2R79W/Z6ApFqzlJE0pkLIxdaC4UsG4S+hMSigoadUBEBHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l4HOa70G
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuradio: fix build with fmt >=
 11.x
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Aug 2024 22:05:28 +0200
Julien Olivain <ju.o@free.fr> wrote:

> gnuradio is failing to build since commit 6b86f076c3 "package/fmt: bump
> to version 11.0.1" with output:
> 
>     /build/gnuradio-3.10.7.0/gr-blocks/lib/message_debug_impl.cc: In member function 'void gr::blocks::message_debug_impl::log(const pmt::pmt_t&)':
>     /build/gnuradio-3.10.7.0/gr-blocks/lib/message_debug_impl.cc:65:44: error: 'join' is not a member of 'fmt'
>        65 |                                       fmt::join(begin, begin + output_length, " "),
>           |                                            ^~~~
> 
> This commit adds a backported upstream patch to fix the issue.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7540345284
> http://autobuild.buildroot.org/results/4c92949ef74a119d9a70e4fdd55af05a66580b0c/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7551460731
> ---
>  ...o_signature-include-spdlog-ranges.h-.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch

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
