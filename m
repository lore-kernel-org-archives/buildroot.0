Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5282AC25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 19:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0076E60768;
	Sun, 26 May 2024 19:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2E-GFJW8mnQ; Sun, 26 May 2024 19:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15FFD60770
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15FFD60770;
	Sun, 26 May 2024 19:48:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 504801D1391
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 19:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4994B60768
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 19:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOxxdlciHmTA for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 19:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F00560770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F00560770
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F00560770
 for <buildroot@buildroot.org>; Sun, 26 May 2024 19:48:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B01AC0004;
 Sun, 26 May 2024 19:48:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBJqm-004Otu-0u;
 Sun, 26 May 2024 21:48:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240502072327.741463-1-dario.binacchi@amarulasolutions.com>
Date: Sun, 26 May 2024 21:48:12 +0200
In-Reply-To: <20240502072327.741463-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 2 May 2024 09:23:26 +0200")
Message-ID: <871q5ogxs3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] package/qemu: fix disabling fp-bench
 test compilation
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
Cc: Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > With the bump to version 8.1.1, the patch that disabled the compilation
 > of the fp-bench test is no longer applicable, even though the package
 > compilation process does not report any errors in applying the patch
 > itself. The new patch does not disable the test by default but only if
 > the file fenv.h is not missing, with the hope that this approach will be
 > considered acceptable by the maintainer and merged upstream.

 > The patch is an adaptation of the one sent upstream.

 > Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 > ---

 > Changes v1 -> v2
 >  - Replace [Upstream status: <url>] with Upstream: <url>
 >  - Drop the added line to .checkpackageignore

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
