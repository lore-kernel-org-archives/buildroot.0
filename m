Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EEEC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 507C4606A5;
	Fri,  2 Aug 2024 21:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ks-Gy3sEJD0H; Fri,  2 Aug 2024 21:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6647F606B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6647F606B1;
	Fri,  2 Aug 2024 21:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 130961BF312
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0092C40789
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzHMub4t37za for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2F4B40754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2F4B40754
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2F4B40754
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:59:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3A93E0002;
 Fri,  2 Aug 2024 21:59:11 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:59:11 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20240802235911.17d1ce8f@windsurf>
In-Reply-To: <20240223203031.825112-1-kazemi.ms@gmail.com>
References: <20240223203031.825112-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722635952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uyi4A/lEg/4OMwDTfFD/csjwK+u+4oq/kDvorOPZLNA=;
 b=YBObAfdT4mpKLGVBVudZdJ9EiuA7K+93zCct7lx/tgGFFB8Dx2+wfCQLqOUjWvzvBQdZkC
 Utf+c8YtNFlL8JyCpDr3+9ldeIGRcHZ2bGUXml9M3km1IhqNraOHRQXkyMZiOunZuU4dIP
 N7HZKEKwWABGwc1HXhqqPrdGXMtyX8KQXVQne/BFoxLgyngA6zvBPZuvd5mNfMCNdnSEpB
 fIRS4FYpEFM/pJzKWQ4uc6MrfnPPaROJ1/HbMwrC3D5I+46+BBo8O64lWP5UHqFeU7NaSo
 p/rCB3lxj9UInvJ9kyARaOrYEYWPVGGUlnIsuek9z0WkykRwnVfULr53iv0GAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YBObAfdT
Subject: Re: [Buildroot] [PATCH 1/1] package/fd: new package
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

Hello Saeed,

On Fri, 23 Feb 2024 21:30:31 +0100
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> A simple, fast and user-friendly alternative to 'find'
> 
> https://github.com/sharkdp/fd.git
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Thanks, I've applied! I had to fix two small things.

> diff --git a/package/Config.in b/package/Config.in
> index bf0fe078b9..090fa80a29 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -182,6 +182,7 @@ menu "Development tools"
>  	source "package/diffutils/Config.in"
>  	source "package/dos2unix/Config.in"
>  	source "package/findutils/Config.in"
> +	source "package/fd/Config.in"

Alphabetic ordering was not correct here, and it was spotted by "make
check-package".


> diff --git a/package/fd/fd.hash b/package/fd/fd.hash
> new file mode 100644
> index 0000000000..7950055efa
> --- /dev/null
> +++ b/package/fd/fd.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  49d57704f1a75b20a770d50538818ec003f42a5c19a39a682639b5e72e72ee7d  fd-9.0.0.tar.gz

The file name and hash changed, because between the moment your patch
was submitted and now, we did some changes in the cargo-package
vendoring logic (so basically, not your fault!).

Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
