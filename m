Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5638C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BF874070F;
	Mon, 22 Jul 2024 12:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ret__jM-R3by; Mon, 22 Jul 2024 12:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED395408B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED395408B7;
	Mon, 22 Jul 2024 12:10:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 142A31BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EF798115D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vq1MdIqnqDEh for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:10:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB9E181159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9E181159
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB9E181159
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:09:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00513E0005;
 Mon, 22 Jul 2024 12:09:57 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:09:57 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240722140957.50bae481@windsurf>
In-Reply-To: <Zp4XKwrMN9+YZC/B@waldemar-brodkorb.de>
References: <Zp4XKwrMN9+YZC/B@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZK6wU3jPHxT/4I7635EF2J/33hLt9OJV05GHegtaGBM=;
 b=GLoHmR6yTqpm1inFqqcdKGxSRfeq+5FKv4R6kSFRAhlnuxQAaWmDvTj8NRqyt8c8FDrCLR
 mh9tntfN9qAmejG0Mm5GibzYeBlEa8q6aI3MhdB0zgSSLk1ygCGUC6uFg2gHpuX75QyDjG
 3WfIWdpHDggl0To58nDXSLg79oUsaSbwP0A2/eJN4oajXaQAbfSpOlZYQcqiJIe511KcvH
 +WxLFkmjFIFJB1ZlqnLISuVR/T8BoZ2wBReUySCV1RqLngJkBpgh2tzK7/kp+UyWnVveLH
 Mlvmk8qXB05xNpSlt6ZTBVXOLGxGnE3lkdGOANltfHQHj7LNHTa8n/Em7d9obg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GLoHmR6y
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix compile error
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

On Mon, 22 Jul 2024 10:24:11 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fix compile error with older Linux kernel headers.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/dfa46b243aa6e289333cbd98e3162d62ee6fa865
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...-compilation-with-4.x-kernel-headers.patch | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch

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
