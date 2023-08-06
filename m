Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88C3C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FBE381E6D;
	Sun,  6 Aug 2023 12:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FBE381E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J06rckVtI5Vi; Sun,  6 Aug 2023 12:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A025A81E53;
	Sun,  6 Aug 2023 12:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A025A81E53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57D9C1BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31FA381831
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31FA381831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeSRPUV3ckOn for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:11:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7D40818A7
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7D40818A7
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFCAF1C0002;
 Sun,  6 Aug 2023 12:11:32 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:11:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806141131.3a019654@windsurf>
In-Reply-To: <20230802181215.807175-1-bernd@kuhls.net>
References: <20230802181215.807175-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691323893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GTo5UL9159Fg53bGEqN4gFxfelabT4Dvx4DFFhn4YE=;
 b=Kwde6bCuhU0CnpKs4x5cNnN05EqaBmDgWsPn4j+uT9yuj2TSpCNbQ8zmqToIkAk/DneYDE
 aa/HDDOefLYH45x361kzToza3yhaLO406OiKDz84HUIR8TnlsMuxBP+HrPJnBhH684r90X
 v3YBbeiVo7A6RJBZK5dNNMDw24iMWxAlFofshYQtidvQCHrzqLuyNtMmpNM/P4jZTj9b3+
 70cGus78Yomv0MGE2x5yXZS6bDnQbO0GqCZBP3C8cu0d0zWvafIwLS/zPq35RBiDdsNr9S
 KSjr7SwU+yIx0jQjSXmE8H0fYy7TzYglWUgQ0dBWbpWs2i/irY3qMfQHW4Zy/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kwde6bCu
Subject: Re: [Buildroot] [PATCH 1/1] package/liblo: add upstream patch to
 fix build error
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

Hello Bernd,

On Wed,  2 Aug 2023 20:12:15 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/c98/c98c21093714542d4c0546a742fdcc48f3f07d04/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...x-use-after-free-warning-in-server.c.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch

You forgot to explain in the commit log when this build error started
occurring and for what reason, so I updated the commit log with that
information: it started to fail building since the merge of GCC 13.x.

Applied with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
