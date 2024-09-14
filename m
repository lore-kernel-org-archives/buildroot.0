Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF8DC021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D27640BC7;
	Sat, 14 Sep 2024 21:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pa6PZ2xVprMM; Sat, 14 Sep 2024 21:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F371406D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F371406D0;
	Sat, 14 Sep 2024 21:54:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29D261BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FFAC607C1
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vESL-9GxX9-Z for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:54:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0F8F60645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0F8F60645
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0F8F60645
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:54:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC0A160002;
 Sat, 14 Sep 2024 21:53:59 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:53:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914235358.7516573f@windsurf>
In-Reply-To: <20240914214001.1321654-1-james.hilliard1@gmail.com>
References: <20240914214001.1321654-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlkxNwPB3KgDkWH6zsZSsGTs620exDpSfcjk7WigNiU=;
 b=QHcggZ5WcVIUdTJan/c3p1wI6gJi76W+TZ6BVEfa0BNyIbCEKsbLgopL6nEn1LTkOV2ikS
 nv/W3K2cOwqzDPXDvVaugZmjvggnMEEHHxk9JN26UGfZ7WRbxkkFWQ4GpLx00xxKcvC7vm
 /kq3Uke+e8BDLc63Fccku7pS4E3JkeDcKI/fh9fgngyfsaC7stuHxq5OsU7z6Ru0yOYn0a
 hAOBQclHJAB91xwqdh6FRqzEAoTGFoAU93hRABsXcdzPs+X5V3HAU2dVLltzV9Pdl9wk+9
 O6nvXKHj+vDRjFSKLl4wWqWe7mOZ1283hYaPvIbEdHzcIu/jinckVCxQjn7ing==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QHcggZ5W
Subject: Re: [Buildroot] [PATCH 1/1] package/python-augeas: bump to version
 1.2.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 15:40:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-Use-CFFI-in-out-of-line-API-mode-49.patch | 101 ------------------
>  package/python-augeas/python-augeas.hash      |   2 +-
>  package/python-augeas/python-augeas.mk        |   2 +-
>  3 files changed, 2 insertions(+), 103 deletions(-)
>  delete mode 100644 package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch

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
