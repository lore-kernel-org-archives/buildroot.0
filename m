Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3737D6B6A7
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBC260594;
	Thu, 31 Oct 2024 12:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OES-WCabRU1x; Thu, 31 Oct 2024 12:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B1EB6065D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B1EB6065D;
	Thu, 31 Oct 2024 12:47:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC4365E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD3E96065D
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ru3Hg0mv8ZN5 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 914A260594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 914A260594
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 914A260594
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:47:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34FF920005;
 Thu, 31 Oct 2024 12:47:01 +0000 (UTC)
Date: Thu, 31 Oct 2024 13:47:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241031134700.5a24d2bd@windsurf>
In-Reply-To: <20241030222533.1826144-1-bernd@kuhls.net>
References: <20241030222533.1826144-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730378821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBg+AeXn5zJYBYdwZBH61Wg6FZOMbkQEznXDrMRQV9w=;
 b=bM0A+zBQEibzZiDsjbI/CA8qWwSCzmiqTioIg4tFgXPxuZdIb1GqXnQ6qqxnAe9ZtR9Ons
 DjvopA56WLfN1pIgBJrzgA4X4wXN5sbrdt1z4B+74bMlHLt5hZKw2cmQaLbE7Bj93wHfFf
 UpqAX+I7KHONWQYnokUU5R02nI9px0h2Q9uRROJ4+b4UvjUpJCmaFMgt21A6WTrM5tkpZR
 YNe/+h19Zbu8E87mc3pPv6qJZxB7h/IzDPMa4yLjc6YrLvQMKAsute6mQ4EtHcRLzltcgy
 WxJBM0M44OeCOJJAu19QwS93zoonfjdFU89Gr9kyoguF+WUG4zWnA5/+Jwbvdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bM0A+zBQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libv4l: fix TARGET_NLS_LIBS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Oct 2024 23:25:33 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> When switching the build system to meson in buildroot commit
> 41ce1cc690b0837a1822079317bf317ddaeac17b the way TARGET_NLS_LIBS was
> passed to the build system was not updated causing build errors.
> 
> Fixes:
> http://autobuild.buildroot.net/results/96b/96b08078ea412b97a4719321ad0fdad4003e42c5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Please note that this build error first occured on Sep 12, long before
> meson was bumped to 1.6.0:
> http://autobuild.buildroot.net/results/6cf/6cf2bddef3f31eef21465ee98e13440dca65ca0f/

Applied to master. Thanks a _lot_ for the research of since when the
problem started occurring: much appreciated!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
