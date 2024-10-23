Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA61CFA462
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6562811E4;
	Wed, 23 Oct 2024 19:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uolp6PMVRKe; Wed, 23 Oct 2024 19:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1B7811E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1B7811E6;
	Wed, 23 Oct 2024 19:59:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AFB74960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 082D140462
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7byZMPl1a0IT for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFF854017B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFF854017B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFF854017B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:59:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B809560004;
 Wed, 23 Oct 2024 19:59:16 +0000 (UTC)
Date: Wed, 23 Oct 2024 21:59:15 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Pierre Floury <pierre.floury@gmail.com>
Message-ID: <20241023215915.7c23d3fa@windsurf>
In-Reply-To: <20241023170447.778547-1-giulio.benetti@benettiengineering.com>
References: <20241023170447.778547-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729713557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXVAoDkVJiwEsK5SMtOBS1pGWspKKtKY+ssrZsRMx6Q=;
 b=FYkLYHX+YUixfj47arNLrUY/hdWCHnNDrQ12uQAJ2vDOqQAk/Huol8iauhPFAGl92VN/9N
 xtMv4vyQSG1fl4B3H+rJZgLXJqDUDszWR2PsRDx/YcYuk5d32FyosYGz+CSiBGvkVBuNIV
 EDMo4xwpfBoGzCUFZGh7TGEHi6We/fnWe5RXVTfhzv0gNK2hI9HIZ2QqvGSbZTQUzkZrlA
 QeEJo5gn2VkNqpcowWY5T87r3OCJQDsCsmaGXilTSdKYmxzqBQwBKgjuPvyk4ffYg98BJx
 mSjPKtSHbEVEWSueszawfYxauM9TABpnAml2swvmlOErpNQj5cL75LtMpvtUPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FYkLYHX+
Subject: Re: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.4
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

On Wed, 23 Oct 2024 19:04:46 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libtraceevent/libtraceevent.hash | 2 +-
>  package/libtraceevent/libtraceevent.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I wanted to apply this series, but at least today, it seems like
git.kernel.org has an issue:

wget -nd -t 3 -O '/home/thomas/projets/buildroot/output/build/.libtraceevent-1.8.4.tar.gz.ApJr7e/output' 'https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-1.8.4.tar.gz' 
--2024-10-23 21:57:02--  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-1.8.4.tar.gz
Resolving git.kernel.org (git.kernel.org)... 2604:1380:45d1:ec00::3, 147.75.193.91
Connecting to git.kernel.org (git.kernel.org)|2604:1380:45d1:ec00::3|:443... connected.
HTTP request sent, awaiting response... Read error (The request is invalid.) in headers.
Retrying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
