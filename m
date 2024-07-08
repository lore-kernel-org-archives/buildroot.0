Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C8CC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C8460A5C;
	Mon,  8 Jul 2024 20:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNJqUkOuG4jj; Mon,  8 Jul 2024 20:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E92060B3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E92060B3F;
	Mon,  8 Jul 2024 20:22:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3041BF42E
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B76040511
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXLnp6J30M5C for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2813404D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2813404D1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2813404D1
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E70D31BF203;
 Mon,  8 Jul 2024 20:22:17 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:12 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222112.7badf0d2@windsurf>
In-Reply-To: <20240706142050.3693937-1-dario.binacchi@amarulasolutions.com>
References: <20240706142050.3693937-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DatVJQiEfwswL8bujntStcn4EWNh8uJw7IuJFRqjto=;
 b=R4zq2XCAq8RuMOL4LcaQtijlwpkHcVXRNvz02Awue+ck2W5TS7poLKd8RzltEi2M6RkS5L
 /K7/IKYIenZYeaeyzlin+ceNQlBPDZg3TSoJmwG5/YylDstGgtxGBM1qgIJbLsOm2lyqtG
 7xOpXtk6NXjjt82lYeBFQpSMrs9bHypw4GKBKX4GzWQ7bS6UIjeXgYSiiXDjLusN/JRiRb
 ihFkz6LayGEd1MeF5pj1nJ20i/U90WMBfLDElXl6FrL3iMw4yw953gyBxNxapHyxlfZ4dc
 S0+FHeEa5OTQbYiYwQFd5KS2vqmb7OoIgvPm/va3hi7sXPLVnP26mSJWfqAQgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R4zq2XCA
Subject: Re: [Buildroot] [PATCH 1/1] package/yajl: update the patches to be
 applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jul 2024 16:20:50 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, yajl fails to build with output:
> 
>     Applying 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch using patch:
>     patching file src/CMakeLists.txt
>     Hunk #1 FAILED at 37.
>     Hunk #2 succeeded at 52 (offset 1 line).
>     Hunk #3 succeeded at 79 (offset 1 line).
>     1 out of 3 hunks FAILED -- saving rejects to file src/CMakeLists.txt.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...isable-shared-library-build-when-BUILD_SHARED.patch | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

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
