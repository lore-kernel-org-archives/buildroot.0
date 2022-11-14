Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95DDC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6041481257;
	Mon, 14 Nov 2022 22:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6041481257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GET-b6wXBf9d; Mon, 14 Nov 2022 22:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF2F58125D;
	Mon, 14 Nov 2022 22:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF2F58125D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A6F71BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1247A4032A
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1247A4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5IUtcb2rfnMc for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:24:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E03B340325
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E03B340325
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:24:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8E9EAC0007;
 Mon, 14 Nov 2022 22:24:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouhsY-007pY4-K0; Mon, 14 Nov 2022 23:24:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Justin Wood <jwood@starry.com>
References: <20221102165629.755750-1-jwood+buildroot@starry.com>
 <20221106105124.GP3918838@scaer> <87o7t9i8yy.fsf@dell.be.48ers.dk>
 <CANWKTsML2wzXuh8tA8R-+=r0fXyZ5N3vwZ3JEHE33caEUZv+4w@mail.gmail.com>
Date: Mon, 14 Nov 2022 23:24:34 +0100
In-Reply-To: <CANWKTsML2wzXuh8tA8R-+=r0fXyZ5N3vwZ3JEHE33caEUZv+4w@mail.gmail.com>
 (Justin Wood's message of "Mon, 14 Nov 2022 15:25:27 -0500")
Message-ID: <87fseli38d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: add support
 for cryptography > 3.0
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
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Justin" == Justin Wood <jwood@starry.com> writes:

 > On Mon, Nov 14, 2022 at 3:20 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> This is patching code we've added ourselves in patch 0001, so perhaps it
 >> makes sense to invert the order of the patches, merge them or simply
 >> drop the certdata2pem.py call completely? We don't build
 >> host-python-cryptography automatically, so it can only happen if the
 >> recently added optee-os option is selected (or a custom package), and
 >> they happen to build before ca-certificates.
 >> 
 >> Committed to 2022.08.x, thanks (we don't have host-python-cryptography
 >> in 2022.02.x).

 > Of note, in my setup I'm using a system-provided python for host-python,
 > which has `cryptography` installed and available due to a linting tool we
 > install.  That is what caused it to fail for me in 2022.02.x.

Ahh, so you are having some local modifications causing this issue?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
