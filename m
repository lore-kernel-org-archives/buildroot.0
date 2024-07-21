Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFCFC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7DD605F8;
	Sun, 21 Jul 2024 16:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4s1h6vaXgsjK; Sun, 21 Jul 2024 16:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF8D60638
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF8D60638;
	Sun, 21 Jul 2024 16:21:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 587D51BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4688480E4A
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ynqKSDNhtWv for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECDD080CAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECDD080CAD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECDD080CAD
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:21:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04FC21BF204;
 Sun, 21 Jul 2024 16:21:10 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:21:10 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721182110.03f3e2a6@windsurf>
In-Reply-To: <20240720213347.1740848-1-fontaine.fabrice@gmail.com>
References: <20240720213347.1740848-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721578871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfOx7gNhdKkmLlJlZLOOB1ouvS8sRk25CbL1Q1Yb2To=;
 b=OmGlq97EW7iDfqRWhsLMmnctCZDVf7fxx9nF5CzIlAPH6xDATLYNxj0lY0ZZf54tKV2c7b
 RxXD4DpE8N/hj7QeceQFmbVH5xMOC/A14ff4kJYgsBFNDeCDWs2uGeX8iT6WFFXhd0GySK
 6DEv/xIadmWZyE1yCmSwrVqlpjtcFIr0bzTSTsHUtpwhMRsX2+0HD3R8GupIpcrmuPRTna
 SmPlW+Te4TNizK2QDipvmdMGL4PPXi0s+cMVJ3jGJPEm4MGqSN+W94z1JrH7CmubK7t5tK
 fydQ9Ytmmnh5lMw5I3wXb5IylAFcZjSXo4euZL+/KaYi5ot3RDL10TUUQev0sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OmGlq97E
Subject: Re: [Buildroot] [PATCH 1/1] package/gengetopt: fix patch fuzz
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 23:33:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use upstream patch to fix patch fuzz and avoid the following build
> failure raised since commit 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
> which reduced the fuzz factor:
> 
> Applying 0001-configure.ac-add-disable-doc-option.patch using patch:
> patching file Makefile.am
> Hunk #1 FAILED at 18.
> 1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4cfa513e024ea2cb2058fde4ffdd727bd379dae7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                                 |  1 -
>  .../0001-configure.ac-add-disable-doc-option.patch  | 13 +++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)

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
