Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04498C3DA63
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 06:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C9940B7F;
	Fri, 26 Jul 2024 06:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-LFaH86Neev; Fri, 26 Jul 2024 06:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91BBA40BE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91BBA40BE7;
	Fri, 26 Jul 2024 06:45:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AD831BF83A
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6454086C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bTblV2vEAyJ for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 06:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EDDC407C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EDDC407C6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EDDC407C6
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 06:43:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FC2240005;
 Fri, 26 Jul 2024 06:43:39 +0000 (UTC)
Date: Fri, 26 Jul 2024 08:43:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240726084338.5728d4b2@windsurf>
In-Reply-To: <20240725195218.2966267-1-bernd@kuhls.net>
References: <20240725195218.2966267-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721976219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rw6hIET+14edBxp5iS6QVTZLEUFBtOPZi7KVigPC+v0=;
 b=Bqr6UymotlL8BF7DTmDqyxEtjNxZgV93wWlI4m4lQCOAFoCZPqx1mnT9FGpIF9MS/uSWcW
 iSXFVSJA/Jb+HPm9sc+YDWcPfWW2zHF3tMxeFsZMLBoPpDDYGBc36rCBo+nl+IuUQrR8rC
 U0byflMjY/DRhjARP85NSiZ9fmgB5di2EkUdKx+cgppcFCRPeLo+Pfu6AU/l0Hhxp7ne7n
 BeFfMhwM22j5r0EfZI32WpkdvSgb0yjTjODjHvTbJE70wn6qumi7Evm3gEr8UNoySBQjOA
 GeG6a0e9kGT8eYYc5BqO8qHR1voHY4g7t+/E5zIuTOtI8jJ/N0FkVDHJDgouuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bqr6Uymo
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to
 6.4.39
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

On Thu, 25 Jul 2024 21:52:18 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://sourceforge.net/p/fetchmail/mailman/message/58797299/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/fetchmail/fetchmail.hash | 4 ++--
>  package/fetchmail/fetchmail.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
