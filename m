Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7BAC25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 18:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6533C6FAFF;
	Thu, 26 Oct 2023 18:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6533C6FAFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRBIbMS0wJIE; Thu, 26 Oct 2023 18:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A08306FAF8;
	Thu, 26 Oct 2023 18:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A08306FAF8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D86F1BF378
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35CEA6FAE6
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35CEA6FAE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DuORu-y_qyH for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 18:34:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56E8A6FAE5
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 18:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56E8A6FAE5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B37F60002;
 Thu, 26 Oct 2023 18:34:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qw5Bf-0072UG-9w; Thu, 26 Oct 2023 20:34:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
 <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
Date: Thu, 26 Oct 2023 20:34:31 +0200
In-Reply-To: <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 17 Oct 2023 23:01:20 +0200")
Message-ID: <87edhhmdvs.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-utils: teach
 per-package-rsync to copy or hardlink dest
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit 21d52e52d8de (package/pkg-utils.mk: break hardlinks in global
 > {TARGET, HOST}_DIR on per-package build) was recently reverted, so we
 > are back to a situation where it is possible for packages and post-build
 > scripts to modify files in-place, and thus impact files in any arbitrary
 > per-package directory, which may break things on rebuild for example.

 > 21d52e52d8de wsa too big a hammer, but we can still apply the reasoning
 > from it, to the aggregation of the final target and host directories.

 > This solves the case for post-build scripts at least. We leave the case
 > of inter-package modification aside, as it is a bigger issue that will
 > need more than jsut copying files around.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Herve Codina <herve.codina@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
