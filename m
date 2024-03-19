Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11FCC54E71
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 16:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5E5281260;
	Tue, 19 Mar 2024 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLxL8JpSfoQP; Tue, 19 Mar 2024 16:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76CC81261
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76CC81261;
	Tue, 19 Mar 2024 16:33:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B41C91BF836
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD10D402B9
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ASgoYTBvNOz for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 16:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 812CD40294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 812CD40294
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 812CD40294
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 16:33:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48A0C60003;
 Tue, 19 Mar 2024 16:33:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmcP4-004341-1u;
 Tue, 19 Mar 2024 17:33:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240304155009.3505542-1-fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2024 17:33:30 +0100
In-Reply-To: <20240304155009.3505542-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Mar 2024 16:50:09 +0100")
Message-ID: <87le6e9o6d.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc-hawkbit-updater: fix build
 with gcc 4.8
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
Cc: Colin Foster <colin.foster@in-advantage.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 4.8 raised since the addition
 > of the package in commit 928b7219cd7079864eadadc66dbff21c5cd72804:

 > ../src/hawkbit-client.c:873:17: error: 'for' loop initial declarations are only allowed in C99 mode
 >                  for (const gint *code = &resumable_codes[0]; *code; code++)
 >                  ^
 > ../src/hawkbit-client.c:873:17: note: use option -std=c99 or -std=gnu99 to compile your code

 > Fixes: 928b7219cd7079864eadadc66dbff21c5cd72804
 >  - http://autobuild.buildroot.org/results/e275d0ec4fe1da418a6163b46666316034b83b19

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
