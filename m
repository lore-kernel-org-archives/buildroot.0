Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80115C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 245B441044;
	Tue, 21 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 245B441044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iE0B2BiJ9d3O; Tue, 21 Feb 2023 20:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E13F40C45;
	Tue, 21 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E13F40C45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A41DE1BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24DF081404
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24DF081404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pG2doR-r1asF for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:49:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC0F281407
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC0F281407
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:49:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 24CE3240003;
 Tue, 21 Feb 2023 20:49:49 +0000 (UTC)
Date: Tue, 21 Feb 2023 21:49:48 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230221214948.0b7ba737@windsurf>
In-Reply-To: <20230221203403.GH2718518@scaer>
References: <20230221142144.1503123-1-fontaine.fabrice@gmail.com>
 <20230221154827.7e737960@windsurf> <20230221200857.GG2718518@scaer>
 <20230221212634.736f8d70@windsurf> <20230221203403.GH2718518@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677012592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnp7om76Z7HPsfW1PdpgEcwDcr/qE08zP40pP7/ctk8=;
 b=mZTKz0SzBD+UODMoFznzFVfYSYCP9JI4yHDK+j3LA1wwyj16/zs6UYtzoaIYdyeT5waNRX
 LrAW5WhQx+G71C1SaXJER29z94isOy0iXv/0KGzOfQrNIND3S7GcfN7sVJabXQAvlOA8oM
 cTizubBkNdNd/I0Wm9xD1+BGt/g10widYUM+NR/tXFe+9mHqTCh4VvH+NjmhXXAymBLqS3
 m5/9kxHn99Xe2h1bY861VscuVGqfheGntk7hTdpms7rQYvgbuDdq9jgjWW3tEePOZs8JeQ
 YA8foCbjnH1wbMrB98sSOvbju7/nEBjPqnJRX7FwhMa4Zs5oRHt2wjWkLjHE9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mZTKz0Sz
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: disable with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 21:34:03 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The upstream code is (split for readability):
> 
>      if (('-Ofast' in c_args or
>           '-ffast-math' in c_args or
>           '-ffinite-math-only' in c_args
>          ) and
>          not '-fno-finite-math-only' in c_args
>         )
> 
> So, if -fno-finite-math-only is in c_args, then the whole condition
> should evaluate to false, and thus it should not error out, right?
> 
> Or did I lose more than my grep-fu? ;-)

No, tonight your grep-fu is better than mine: you're totally right! :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
