Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF172C83F17
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 10:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5545041E9F;
	Thu, 31 Aug 2023 10:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5545041E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIRIFJz-gldL; Thu, 31 Aug 2023 10:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7020241E9C;
	Thu, 31 Aug 2023 10:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7020241E9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0105E1BF3D4
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 10:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE13161241
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 10:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE13161241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id po1JwC2I1Wqy for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 10:06:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF4BA60FDB
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 10:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4BA60FDB
Received: by mail.gandi.net (Postfix) with ESMTPSA id F169924000F;
 Thu, 31 Aug 2023 10:06:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbeZW-000WMY-TD; Thu, 31 Aug 2023 12:06:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230315170518.884906-1-romain.naour@smile.fr>
 <20230801000842.4961386b@windsurf>
Date: Thu, 31 Aug 2023 12:06:42 +0200
In-Reply-To: <20230801000842.4961386b@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 1 Aug 2023 00:08:42 +0200")
Message-ID: <87v8cvmsp9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/xenomai: fix testsuite install
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Pierre Ficheux <pierre.ficheux@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed, 15 Mar 2023 18:05:18 +0100
 > Romain Naour <romain.naour@smile.fr> wrote:

 >> From: Pierre Ficheux <pierre.ficheux@smile.fr>
 >> 
 >> Since commit [1], the testsuite build is unconditionally disabled
 >> although we have the option BR2_PACKAGE_XENOMAI_TESTSUITE to
 >> install Xenomai testsuite on the target.
 >> 
 >> Handle --disable-testsuite option with BR2_PACKAGE_XENOMAI_TESTSUITE.
 >> 
 >> [1] 74196b7d059684e555a87e5409c21c56c727066b
 >> 
 >> Signed-off-by: Pierre Ficheux <pierre.ficheux@smile.fr>
 >> Signed-off-by: Romain Naour <romain.naour@smile.fr>
 >> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/xenomai/xenomai.mk | 16 ++++------------
 >> 1 file changed, 4 insertions(+), 12 deletions(-)

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
