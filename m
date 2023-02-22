Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F67CC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 21:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C81861769;
	Wed, 22 Feb 2023 21:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C81861769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dzYLSFM7vgz; Wed, 22 Feb 2023 21:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 819EF61765;
	Wed, 22 Feb 2023 21:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 819EF61765
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 266621BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E93DD402DC
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E93DD402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqvU9ND_12Rm for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 21:01:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6B640135
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF6B640135
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 21:01:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 10E2940007;
 Wed, 22 Feb 2023 21:01:20 +0000 (UTC)
Date: Wed, 22 Feb 2023 22:01:20 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222220120.5b3f3d48@windsurf>
In-Reply-To: <20230222182210.2539248-1-fontaine.fabrice@gmail.com>
References: <20230222182210.2539248-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677099681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qDr8OHkJ76AqwAfpXZBaXdpsiEsnj9g9BJfgNCgYgU=;
 b=nW5yJq0WTJQVXgacM6K8BSHfOVNPLB9m/CUULMEeacqLMHRrP9WZ+ZBTpNpKrCxhQJ2tNu
 DxEIENgnHRnj8EzqzJvbPQMtzzMkIRUKu+y9ZxKt7batT82ngLZKwt5nP/UO3N35P6nUY8
 szEBxWI0XuNMIoR66AsN5UpUS5nufkxe6367dIFX5SnOUB/g0BCar9R4PQhenGpZ63bdLf
 fmCMOkrVyxj6ptu7t4rjBSK2v9Zs7ohQv5eCvei4dmzSyZr1L07fUkkgUpDj+RgqT9kce/
 Gt9QV2+O1AqABo7FbARzSTN22sH4xDzFebyNqshEIXKQMJNqay+14M4Z0vErtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nW5yJq0W
Subject: Re: [Buildroot] [PATCH 1/1] package/lightning: needs threads
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Feb 2023 19:22:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> threads are mandatory since bump to version 2.2.0 in commit
> af6f7aa76db5aed1eada0b27bd0375610a2fc728 and
> https://git.savannah.gnu.org/cgit/lightning.git/commit/?id=d5a7c8e4ad719e84dbb4904c532f906a1ef5a77b:
> 
> In file included from incr.c:2:
> ../include/lightning.h:27:10: fatal error: pthread.h: No such file or directory
>    27 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/62205869159d4a73c59a9795140fa77e9c3310ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lightning/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

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
