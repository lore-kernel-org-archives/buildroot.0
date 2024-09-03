Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1740BCD37AE
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8489402D5;
	Tue,  3 Sep 2024 20:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2pQK1v16_jI; Tue,  3 Sep 2024 20:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 221A8404CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221A8404CB;
	Tue,  3 Sep 2024 20:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 256EE1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123C780EB9
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oe_tU-cl6wTG for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E68DE80EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E68DE80EAD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E68DE80EAD
 for <buildroot@busybox.net>; Tue,  3 Sep 2024 20:40:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D41471BF205;
 Tue,  3 Sep 2024 20:40:46 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:40:45 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240903224045.0af9882e@windsurf>
In-Reply-To: <20240902203714.2650246-1-francois.perrad@gadz.org>
References: <20240902203714.2650246-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725396047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4K5sTeq5Nux1LnlFs/WpnJV3luCNscdTpj2s3yy37EE=;
 b=kneT7Uict5IItuiNJqCV9xWF3UXD+rVUET66y11utTCY2UyyJeFkPEFnHDbrzY1IYgkESO
 NgWgVz13ip8FeI/tRJJZ3r6aNMmupLKUvC0td5R3cjKuZ77K1HOXMgzY7NejFkwTZEXSGI
 pwJ5ZrjAO8qn8mBDGeXppoKOUcsejHGhznsnraZNE091TmQO6UrGoL+t0OwPxUdFulTiS9
 lZBovul/zbjhY7/qnivyO196p6ZXvGRXouO686/oU4o3IuF9mKLyD01raHwj2zlw7DWpbU
 EW2Jy2gd2PQRpYlRa5oJ7eRc1gYmW9dCZVxkvvfo5zrfZ94e1CKuroQt7NbrYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kneT7Uic
Subject: Re: [Buildroot] [PATCH] package/lz4: bump to version 1.10.0
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

On Mon,  2 Sep 2024 22:37:13 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> remove merged patch
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../0001-build-Support-BUILD_SHARED-no.patch  | 42 -------------------
>  package/lz4/lz4.hash                          |  4 +-
>  package/lz4/lz4.mk                            |  2 +-
>  3 files changed, 3 insertions(+), 45 deletions(-)
>  delete mode 100644 package/lz4/0001-build-Support-BUILD_SHARED-no.patch

Thanks a lot for the patch, but you have forgotten to update
.checkpackageignore, and more importantly, you have not explained the
change of the license file hash in the commit message? Could you have a
look at those small things, and send a v2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
