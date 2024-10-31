Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84664D767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552A560B1D;
	Thu, 31 Oct 2024 18:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAShSWH9bXzS; Thu, 31 Oct 2024 18:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69CDA60B2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69CDA60B2C;
	Thu, 31 Oct 2024 18:26:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A65D5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C1B180BFD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBFMoaXcsWhF for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:26:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEE9D80BD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE9D80BD4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEE9D80BD4
 for <buildroot@busybox.net>; Thu, 31 Oct 2024 18:26:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C11231C0005;
 Thu, 31 Oct 2024 18:26:49 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:26:48 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241031192648.73bfcaf3@windsurf>
In-Reply-To: <20241030085829.912588-1-francois.perrad@gadz.org>
References: <20241030085829.912588-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730399210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0OYmGbxCIWDlworOoixPVggJoze4kLyXxMA0PEWm1kg=;
 b=lQlBOoUkcWPLCxwLxw6040L5B76zDTe/fW+GUMLWL+jHxZkjUJXcMQw+1PSL5k5uUCn+J6
 2Nuj1ZAgfK0eR7+89AjxCSPN/ul/yETyOZJ0IXDDTAdE3i/fL261AoH5oOHBKgccMHojDW
 wsLs5SNE9IAu3rNe+rxNjWS5sDOuUEa7SyYvJ8hES2e0CPnFagcPVH5uqHyfPUxMr6nwCB
 3v7RVzdie33yIH2MBeZs9yL0FLcePnESiACLInRIFNQaHUwRMfsrLejveLrF5wF5D6tRHB
 YQ1iuAjL9guQ+ESVaCiBLEtndiRBzdSU4tc0K/NsQiTOqow5sQIYC2yA4CqjOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lQlBOoUk
Subject: Re: [Buildroot] [PATCH] package/lua-livr: bump to version 0.5.0
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

On Wed, 30 Oct 2024 09:58:29 +0100
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-livr/Config.in     | 1 +
>  package/lua-livr/lua-livr.hash | 4 ++--
>  package/lua-livr/lua-livr.mk   | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)

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
