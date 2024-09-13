Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43529FC6172
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09BD040822;
	Fri, 13 Sep 2024 22:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOOmdbtrCTSn; Fri, 13 Sep 2024 22:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D22F04091F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D22F04091F;
	Fri, 13 Sep 2024 22:22:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5DE1BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BA6760DDF
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gy_YSG_2tp9Q for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:22:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7579A60749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7579A60749
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7579A60749
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 22:22:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 128CBFF802;
 Fri, 13 Sep 2024 22:22:44 +0000 (UTC)
Date: Sat, 14 Sep 2024 00:22:44 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914002244.00b6852c@windsurf>
In-Reply-To: <20240911205647.1841244-1-james.hilliard1@gmail.com>
References: <20240911205647.1841244-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726266165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4ILZG6Wr08a2hGLCYoi9AqOfDll0xc3Fzb3cPybpDw=;
 b=QQkciohAxMtGeP1OwV5bqlgalgMDrgpy29Ffp/XEsrunxZkd8KJM8R06Pa4e/vu+VIDOtH
 TyToqWCKArDw416JLdHyQuzPbAJ5HPxJiwT9D/MPHtZ8rhtSAWKYxos6NfBQ0LD2QJDaIs
 5g8TUfzCOdaeuS5nbJgVrMqEOv35oILE3fSCSkltyOYsCI9RnRkHSfZm5Xuy7gO9LwKgVI
 NbG/xhHdTJKxqKLRya7F0pYI3I8c3dujhxL7judI8dbF/PUa0A8g2fsXbZ6//YZrXUy1BT
 PydSoVWs5iYRCE+DRonMKx8apiT68vy9JO68SE3WMB55DDSAy5LMEEh2e9fdPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QQkciohA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 1.3.0
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

On Wed, 11 Sep 2024 14:56:47 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiojobs/python-aiojobs.hash | 4 ++--
>  package/python-aiojobs/python-aiojobs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
