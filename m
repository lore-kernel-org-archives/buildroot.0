Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB5DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 21:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 928EC60BE8;
	Sun, 13 Feb 2022 21:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwZdyWWNBRtd; Sun, 13 Feb 2022 21:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB49E60BBF;
	Sun, 13 Feb 2022 21:00:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99E021BF83E
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8837E60BBF
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVUMkmCPQEc2 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 21:00:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3606160B93
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 21:00:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 384B4200009;
 Sun, 13 Feb 2022 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644786054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPmab1bMiIpqUHHMTDk8g/BbzdDMXhumtlYtEyrAzTg=;
 b=KhcuN6pQEju3PLTvrqHRBBqGYO18OBdaqVQ8sBifsNoHvM/0pAbqiAoVUY4vNyT6ct3SIu
 tK2NmSevn3PQbzt0lC0CVfnsdCpJIaO6e4cKLaXB+geG0U9E1cxun8chovXx8JTlvUcL+D
 59x+XUa2C9tFUy+h/g3gLBKyC4B8PLuR2e//f12yxoJgGW84jQ1Oq0hVgl7kDuzz3VB+md
 KLGzc0UZ858HqysLzXftYMkkesfK8vz3JQw9u3EOH4D1fxZ0Knf4YbZLc2EY+O3pEvHj9L
 9ga4wb9qTWghhY76qeL9iDrLkBd640ZlAgFt1qov3ioO0cs9FPJudAJks+W04g==
Date: Sun, 13 Feb 2022 22:00:53 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220213220053.1a27eaed@windsurf>
In-Reply-To: <20220213214501.29dbc301@windsurf>
References: <Ygalu5jOo9skIxRc@waldemar-brodkorb.de>
 <20220213214501.29dbc301@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/binutils: fixes glibc build
 compiled with -Os on x86
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

On Sun, 13 Feb 2022 21:45:01 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, 11 Feb 2022 19:06:51 +0100
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > See here:
> > https://sourceware.org/bugzilla/show_bug.cgi?id=28870
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>  
> 
> Is this patch also needed for binutils 2.38 ?

No it isn't: it's part of binutils 2.38.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
