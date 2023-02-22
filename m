Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF81C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 490464105B;
	Wed, 22 Feb 2023 15:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 490464105B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7A_J6IUBFCBo; Wed, 22 Feb 2023 15:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FEBB404D5;
	Wed, 22 Feb 2023 15:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEBB404D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 861C91BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E4E6418E2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E4E6418E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WwJluJE_YAfi for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:50:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020A5418DB
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 020A5418DB
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:50:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B0B69100018;
 Wed, 22 Feb 2023 15:50:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUrNx-007rrc-BO; Wed, 22 Feb 2023 16:50:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230114170738.1101463-1-fontaine.fabrice@gmail.com>
Date: Wed, 22 Feb 2023 16:50:25 +0100
In-Reply-To: <20230114170738.1101463-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Jan 2023 18:07:38 +0100")
Message-ID: <87ilftwvge.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mongoose: fix build with gcc 4.8
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 4.8 raised since bump to
 > version 7.8 in commit f9e51e1150f59962577358b3da5c390ca4749291:

 > /home/buildroot/autobuild/run/instance-2/output-1/build/mongoose-7.8/mongoose.c: In function 'mg_iotest':
 > /home/buildroot/autobuild/run/instance-2/output-1/build/mongoose-7.8/mongoose.c:4484:3: error: 'for' loop initial declarations are only allowed in C99 mode
 >    for (struct mg_connection *c = mgr->conns; c != NULL; c = c->next) {
 >    ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c538c6d8e87e4e24097c9878ee15083802276505

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
