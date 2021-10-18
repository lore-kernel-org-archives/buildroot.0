Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A77C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:35:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237F46108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 237F46108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67D040164;
	Mon, 18 Oct 2021 20:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IeeDI5uF6NPH; Mon, 18 Oct 2021 20:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1526D40474;
	Mon, 18 Oct 2021 20:35:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB5ED1BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB719404B6
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAExZIG8TI2A for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:35:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A11C403A1
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:35:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A2581C000A;
 Mon, 18 Oct 2021 20:34:59 +0000 (UTC)
Date: Mon, 18 Oct 2021 22:34:58 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211018223458.6d52ee5e@windsurf>
In-Reply-To: <20211013065446.1857356-1-fontaine.fabrice@gmail.com>
References: <20211013065446.1857356-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tss: needs host-acl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Oct 2021 08:54:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add host-acl mandatory dependency for setfacl to avoid the following
> build failure since bump to version 3.1.0 in commit
> 470e2e9bc5211184431fbc868359a9d695e624f4 and
> https://github.com/tpm2-software/tpm2-tss/commit/9d42f4dbde6a94724e95d57c333cda7711dda57c:

So this commit adds:

# Check all tools used by make install
AS_IF([test "$HOSTOS" = "Linux"],
      [ERROR_IF_NO_PROG([groupadd])
       ERROR_IF_NO_PROG([useradd])
       ERROR_IF_NO_PROG([id])
       ERROR_IF_NO_PROG([chown])
       ERROR_IF_NO_PROG([chmod])
       ERROR_IF_NO_PROG([mkdir])
       ERROR_IF_NO_PROG([setfacl])])

But in the context of Buildroot, using groupadd, useradd, chown, chmod,
setfacl at install time cannot work, since we're not doing "make
install" as root.

So are we sure that adding host-acl as a dependency to get a host
variant of setfacl is really the good solution?

How is it handled for groupadd/useradd/chown/chmod today ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
