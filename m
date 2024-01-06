Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD60C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD72B84032;
	Sat,  6 Jan 2024 09:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD72B84032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g_2xdV_yYlla; Sat,  6 Jan 2024 09:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2012E84029;
	Sat,  6 Jan 2024 09:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2012E84029
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85B291BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6903484018
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6903484018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ev-t-uiNmOj0 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:50:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C4D083E2C
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C4D083E2C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21EE940002;
 Sat,  6 Jan 2024 09:50:55 +0000 (UTC)
Date: Sat, 6 Jan 2024 10:50:54 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240106105054.17694103@windsurf>
In-Reply-To: <20240105132023.502516-1-fontaine.fabrice@gmail.com>
References: <20240105132023.502516-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704534655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1znOPFsspR4MwWeRzlBCIghkv1omxyMF3E5b1zQRoUo=;
 b=kmxnVJyYe3dRqsFvPPm1pR1oZu0O3MKjMLR5fvEon/PUjfehQkDtUFqeMn1gVphgbvYW+B
 RWIG56rJ84eMmu1f35xlomAUZlZVVFpjuYgY87gTaUuP75/vQXxmYAzONMNxsD1WjER9s2
 4Wqiey1zkqpyLpiGoq/XMjtH34hYiC0UJVpn+pMokxbO0uugyJbpUqv7//bMHxkvpIPOFk
 liqQpsSWm7drx1KwBkmtk6GkFXHTnhQzXO4RJSyCFEW3ERU0XM3fO3Ofv31gusJkVU+M+Z
 fgWUM9IBQRWivLMWrwAd9aZjsW6a109Zs2tkIZecd1D/roiJ8c9S64HYtnAvOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kmxnVJyY
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/cups: fix build without gnutls
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jan 2024 14:20:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without gnutls raised since bump to
> version 2.4.7 in commit 55c80fdfb379c74c7f7e8c260dea02e0150d7614 and
> https://github.com/OpenPrinting/cups/commit/b5b1418da7bfb9f81384c7c47cc59890b4d3ff5d
> 
> hash.c:16:12: fatal error: gnutls/crypto.h: No such file or directory
>    16 | #  include <gnutls/crypto.h>
>       |            ^~~~~~~~~~~~~~~~~
> 
> Those patches have been requested to upstream by Peter Korsgaard:
> https://github.com/OpenPrinting/cups/issues/762
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/888e9e252821bda1e051400d4aa850cd082e8e76
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Split upstream patch and update commit message

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
