Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CB5C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 07:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9A881A2B;
	Fri, 23 Aug 2024 07:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRL1mG0OFh1j; Fri, 23 Aug 2024 07:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B0D81A30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B0D81A30;
	Fri, 23 Aug 2024 07:53:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8341BF3C2
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 07:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9AE600C9
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 07:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfihiFGvSYYP for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 07:53:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0FCC6006A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0FCC6006A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0FCC6006A
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 07:53:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25F9D240002;
 Fri, 23 Aug 2024 07:53:15 +0000 (UTC)
Date: Fri, 23 Aug 2024 09:53:13 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240823095313.5be93baa@windsurf>
In-Reply-To: <20240823070414.969141-1-dario.binacchi@amarulasolutions.com>
References: <20240823070414.969141-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724399595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3AJrzSQ6JEZ9lGPyvFrdwrwtyJWo424lxq8BVUiOrCo=;
 b=KD4RGEgBu/325QV/Li7P07yg3YDkhzd/lE4tgQPwlTqRX8Pagwc4NMAiJQCeYFYXSm1fYK
 x53T2ewNrT2iWhr6X9PbG490AJcF4fBD2e/gcqi6W7MkoQee1np31ZGdg3IJchX+5D4Ozy
 5FW/JQKUzShr91+XqoOLSadFSCOTC5LcrpEMMyCTVhIWI9iCIUwakeYKqwjeVrgOzZrujS
 DD5D0dSYVn4WvX+ctY/PJo5GWcX/VJZGwZ9aJkLbO7BGIMnySHVCgu+XVnwjMf67Oq3W9A
 AkO3Eb0SaGvH1vHMRtLdBFRUk4a5ZCR58VXWJ2ZgRMkFwIoagSR4oAK3nFkRwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KD4RGEgB
Subject: Re: [Buildroot] [PATCH 1/1] package/libcuefile: fix build failure
 due to implicit declaration
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

Hello Dario,

On Fri, 23 Aug 2024 09:04:14 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Fixes:
> - http://autobuild.buildroot.org/results/28f1e34166e836bf3b984f228bb09842840de82a
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../0002-libcuefile-fedora-c99.patch          | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/libcuefile/0002-libcuefile-fedora-c99.patch
> 
> diff --git a/package/libcuefile/0002-libcuefile-fedora-c99.patch b/package/libcuefile/0002-libcuefile-fedora-c99.patch
> new file mode 100644
> index 000000000000..fdd2c38d5939
> --- /dev/null
> +++ b/package/libcuefile/0002-libcuefile-fedora-c99.patch
> @@ -0,0 +1,26 @@
> +From 7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19 Mon Sep 17 00:00:00 2001
> +From: DJ Delorie <dj@redhat.com>
> +Date: Thu, 27 Apr 2023 17:24:58 -0400
> +Subject: [PATCH] Fix C99 compatibility issue
> +
> +Related to:
> +
> +  <https://fedoraproject.org/wiki/Changes/PortingToModernC>
> +  <https://fedoraproject.org/wiki/Toolchain/PortingToModernC>
> +
> +See Also https://bugzilla.redhat.com/show_bug.cgi?id=2190307
> +Signed-off-by: DJ Delorie <dj@redhat.com>
> +Upstream: https://src.fedoraproject.org/rpms/libcuefile/blob/7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19/f/libcuefile-fedora-c99.patch

Thanks for the fix, but we need you to add your Signed-off-by here.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
