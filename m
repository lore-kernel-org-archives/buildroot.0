Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16010C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 14:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8FA94062A;
	Sat,  2 Apr 2022 14:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdmsb2dthmcQ; Sat,  2 Apr 2022 14:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C688B40528;
	Sat,  2 Apr 2022 14:17:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD4AD1BF867
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBFED40528
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHUlr3aXLyXt for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 14:17:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAEED4012A
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:17:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F3E8F1C0003
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648909057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgKkaF42HLe60Yyocf8Cl/9P1f0od43b035pTX3kk2o=;
 b=VhgpgKjBUcBWiuW6SGl/VRhoiwz79hFbeyyL+22b8ubWHlUym3deq8b2snPUnO7qxUkXdX
 xIkFmEapAZJoh/xPeMhKGwDeMyUZCNXqlAAeYr7ON0IyxXqcMSFY4bVb8/CbcDZe7RQ+qO
 0GLmyKSUoNEDPJM112ZDiPsWsAVc6B2b+xhWkNYXs9HaRCaPknyqCni9iArsn9B+Oz8swn
 0WTsrOtbj0eZievt6bfvrknCVDXc4/EfKokhrK47tiW6+6NTXdI7PeO5/6fH6VdyXSONN7
 OV0Q10bb6CmwAjZ2jUUlDFpJaO3QV4/8S1BfXWWfty8EJ8U0MZEjCvSVEKSQ4A==
Date: Sat, 2 Apr 2022 16:17:35 +0200
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20220402161735.3510233f@windsurf>
In-Reply-To: <20220402141531.1320584-4-thomas.petazzoni@bootlin.com>
References: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
 <20220402141531.1320584-4-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] support/scripts/pkg-stats: reimplement
 CPE parsing in pkg-stats
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat,  2 Apr 2022 16:15:30 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> This commit reimplements the XML parsing needed to do the CPE matching
> directly in pkg-stats, using the XmlParser functionality of
> ElementTree, also called "streaming parsing". Thanks to this, we never
> load the entire XML tree in RAM, but only stream it through the
> parser, and construct a very simple list of all CPE identifiers. The
> max memory consumption of pkg-stats is now:

[...]

I forgot to mention that the JSON output of pkg-stats for the full
package set, before and after this commit, is exactly identical.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
