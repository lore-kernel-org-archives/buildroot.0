Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A347C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B5E40256;
	Thu,  9 May 2024 16:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JzVK3kglCNK; Thu,  9 May 2024 16:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C77C941E83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C77C941E83;
	Thu,  9 May 2024 16:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFF471BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9F0B41D9A
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvuoVczlHvWP for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:44:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8629F41D99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8629F41D99
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8629F41D99
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:44:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC3BA240004;
 Thu,  9 May 2024 16:44:45 +0000 (UTC)
Date: Thu, 9 May 2024 18:44:44 +0200
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20240509184444.440e8d87@windsurf>
In-Reply-To: <20240409181214.83567-1-paul@crapouillou.net>
References: <20240409181214.83567-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715273086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDWZD8tpR8L+/GWm3etYPXcOvTQxu5UGsp8378CdPns=;
 b=Va4b/sbQ44M3Znf+JA3GhHwrEgE7HpncTiXAYttQ5XD98ufufx50vpV/Xs4QfRYiMvFmvK
 DC5filHNwHWKQpizPHFKWQgCGjflS+FDHVB7VnPTH6X1c+7y2kzH8Bve9dSRYSULBfBu+E
 9hDMLDgPJ7vhmXqi6yn07slvFlmLuXHmSsHJFhv+vX/2h9vO6KiFWpXVMhsEpXHxVJ8tPJ
 mkfnDnWek/R+RWjEcinYR5abpzOrOyj8VGnYtnVNDnLI06MJ9WfpJyJWO9FYVaSwJPXEEz
 EmXf/8OiJdu8SpC1lyfAPyLMDxSz7LchQoVtWm4whrBN5n9oU3SHkzaBFRNLeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Va4b/sbQ
Subject: Re: [Buildroot] [PATCH] package/lightning: bump version to 2.2.3
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

On Tue,  9 Apr 2024 20:12:14 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Release notes:
> https://lists.gnu.org/archive/html/lightning/2024-02/msg00000.html
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../0001-Fix-build-on-mips64el.patch          | 65 -------------------
>  package/lightning/lightning.hash              |  2 +-
>  package/lightning/lightning.mk                |  2 +-
>  3 files changed, 2 insertions(+), 67 deletions(-)
>  delete mode 100644 package/lightning/0001-Fix-build-on-mips64el.patch

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
