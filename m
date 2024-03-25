Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AECFC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 21:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FA281BE3;
	Mon, 25 Mar 2024 21:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OnBfcdqWuSc; Mon, 25 Mar 2024 21:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9260481AF6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9260481AF6;
	Mon, 25 Mar 2024 21:12:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04EB51BF2CB
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 21:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E49B24058C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 21:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4cQ-dTEw47k for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 21:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA2C640589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA2C640589
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA2C640589
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 21:12:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 756E0FF802;
 Mon, 25 Mar 2024 21:12:00 +0000 (UTC)
Date: Mon, 25 Mar 2024 22:11:59 +0100
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20240325221159.238bf5c2@windsurf>
In-Reply-To: <20240227120123.405763-1-bobrofon@gmail.com>
References: <20240227120123.405763-1-bobrofon@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711401120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zl5f96hlc3vOhz0y8NOtj9ZwqT55Fz7X2/1DDTzWNuU=;
 b=Xj64j0DLtGr0mLIWEroO1h/SiPdFjlM8EnjkryaN70SF4yWim2w/eFCDqRDaiEVdd31rv1
 w/pcRSeyZHSdRWhQ+5XhmpM9c0d4IxluN5PSxyTdIpV/ldpdFIh9FzBXTgf8/o4w9D9kWu
 DNBCvbv5jPJFBYhYYpOczoygo4p1Qx158k9O4xcW/0tKpBRUawLPeIlr0iC4PGzQijZvmT
 oMTiB0HTX202eaTlY1PZb+ByhtjheDOPClh+pJRUeOUcA13uBShHQHcuAhRc/FN0VMkgKg
 jb/Naek+SxdH8pPKkSSbIOgGYACnJ0nVaK0r6O8EuAjEPbP7ZrzlfEzLnKLXJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xj64j0DL
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.5.0
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

On Tue, 27 Feb 2024 15:01:23 +0300
Sergey Bobrenok <bobrofon@gmail.com> wrote:

> Changelog:
> https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.5.0
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> ---
>  package/sdbus-cpp/sdbus-cpp.hash | 2 +-
>  package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
