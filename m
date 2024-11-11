Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE8ED3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48180402B9;
	Mon, 11 Nov 2024 20:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txYPVHTs00Bo; Mon, 11 Nov 2024 20:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CF5E40302
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF5E40302;
	Mon, 11 Nov 2024 20:28:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3F1E0D
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC92D402C0
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01dMhZlq_PH6 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBE6D40131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE6D40131
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBE6D40131
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A99C60005;
 Mon, 11 Nov 2024 20:28:05 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:28:04 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241111212804.25bd7c8e@windsurf>
In-Reply-To: <20241111121656.237340-1-ju.o@free.fr>
References: <20241111121656.237340-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731356885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPdrJjwBmp4pXWzO05LTnD3muqSqkjxcTRX0qnRBKAE=;
 b=F+9QmQpzMTgG4Egj8FkQsH4WL1pvuDxyjxvRfIDf/EKxWeiDpZ7v6B+c0kbPZm/cyeV2uk
 ShNmXWAIQPgis1NbNAgbkdq+Es7b36Sl8L4lOLWeAMAME6+not30Q4IE/ATslW1/MyN+lC
 aybmF1VZnJ94yBH/jSCJbRUc0kGafGgxMaJSPOo31q7NuKcjq3aBlfc6ck0/d0R2QCBWDc
 +rsEemdTcyuRn83o1A7AQjAJ0IvESByh8exWXtsH80aRdgzYRFvzhYnZgNFUqk+KzXooGx
 yap0as+SeUKjPmDoMZqcVAuysQEpgIwg7fWKdcfTdsaXReFP1GpAYgDxljL6HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F+9QmQpz
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf: bump to version 2.2.1
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

On Mon, 11 Nov 2024 13:16:56 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see after the file list at:
> https://sourceforge.net/projects/iperf2/files/
> 
> This commit also adds a package patch to fix the build with musl
> libc toolchains.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1536373099
> ---
>  ...cksums.c-needs-to-define-_GNU_SOURCE.patch | 53 +++++++++++++++++++
>  package/iperf/iperf.hash                      |  6 +--
>  package/iperf/iperf.mk                        |  2 +-
>  3 files changed, 57 insertions(+), 4 deletions(-)
>  create mode 100644 package/iperf/0001-checksums.c-needs-to-define-_GNU_SOURCE.patch

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
