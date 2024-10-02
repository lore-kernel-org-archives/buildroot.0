Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F58DCF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39F514140E;
	Wed,  2 Oct 2024 21:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSc77aH0kIaq; Wed,  2 Oct 2024 21:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E206241428
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E206241428;
	Wed,  2 Oct 2024 21:11:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A187F1BF97E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEFA281F95
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mahlF3xatqdj for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:11:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCFCE81F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCFCE81F91
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCFCE81F91
 for <buildroot@busybox.net>; Wed,  2 Oct 2024 21:11:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17FA440003;
 Wed,  2 Oct 2024 21:11:17 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:11:16 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20241002231116.34c854db@windsurf>
In-Reply-To: <20240925133735.3899867-1-francois.perrad@gadz.org>
References: <20240925133735.3899867-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727903477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3BsFKboKtiikKqD8pSDTFtsk3A+egC0tz/yaxVNIL4=;
 b=lGTLbxncu7dQdPXR9S+SbjQxMCjfgOf7qW9GMfnk2ti3sP6+m3kmWLwwDbXQ59lCob2//o
 UpVE/GcdoQCBcr8H5klhKxCtDFRO9c76HGmLYdNtwIiLQKhDDx5fu+ERwf1r9XMCrn13/l
 +nHn7P1yAWc88ky4Frj8kqytTkIhXvrA9o3iUoJNnMZ+VT3SZ2mWZzYmf8XiDI2wXeZ7zy
 5JVnxd+4NJld6twq4nZJTcgoyOe9cyVlXxALAuGDuB14OAmc6eld3VC58KxQcsO1ktJ9t8
 UiFkXWYKpaefCjFp3Clpeupoj+v/QPXX9arMwL+GU71FO5yvTEYJ5xIqZVKMVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lGTLbxnc
Subject: Re: [Buildroot] [PATCH] package/libarchive: bump to version 3.7.6
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 25 Sep 2024 15:37:34 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...1-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch | 2 +-
>  .../0002-autotools-do-not-add-iconv-for-Requires.private.patch  | 2 +-
>  package/libarchive/libarchive.hash                              | 2 +-
>  package/libarchive/libarchive.mk                                | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

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
