Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D016C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 12:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F227260E1E;
	Tue, 15 Nov 2022 12:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F227260E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJQMMx1USVcd; Tue, 15 Nov 2022 12:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FDB60E19;
	Tue, 15 Nov 2022 12:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45FDB60E19
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2521BF348
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44783415F6
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44783415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHaTvTxVpGeO for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 12:52:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B50404091B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B50404091B
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 12:52:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A65D0C0009;
 Tue, 15 Nov 2022 12:52:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouvQ1-008d2N-Im; Tue, 15 Nov 2022 13:52:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221110220620.89736-1-fontaine.fabrice@gmail.com>
Date: Tue, 15 Nov 2022 13:52:01 +0100
In-Reply-To: <20221110220620.89736-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 10 Nov 2022 23:06:20 +0100")
Message-ID: <87k03wgz2m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wavemon: fix kernel header
 collision
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump to version 0.9.4 in
 > commit 5cae1a0d675eca41125b6430157d3d0d78d1220c:

 > In file included from iw_if.h:26:0,
 >                  from conf.c:19:
 > /home/buildroot/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/linux/if.h:71:2: error: redeclaration of enumerator 'IFF_UP'
 >   IFF_UP    = 1<<0,  /* sysfs */
 >   ^
 > /home/buildroot/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/net/if.h:44:5: note: previous definition of 'IFF_UP' was here
 >      IFF_UP = 0x1,  /* Interface is up.  */
 >      ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/cbdf3e0cf0bee8f1b076581768c24155afc320d9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
