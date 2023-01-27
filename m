Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D48C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 12:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F28241CFB;
	Fri, 27 Jan 2023 12:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F28241CFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsW-P7l3LX0f; Fri, 27 Jan 2023 12:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47F5B41B76;
	Fri, 27 Jan 2023 12:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47F5B41B76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 642491BF263
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D31341B76
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D31341B76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pA-wZBwH_npD for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 12:54:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF7AE419CB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF7AE419CB
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 12:54:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C2A1B2000C;
 Fri, 27 Jan 2023 12:54:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pLOFp-0020Pf-Tk; Fri, 27 Jan 2023 13:54:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230115182724.377966-1-fontaine.fabrice@gmail.com>
Date: Fri, 27 Jan 2023 13:54:53 +0100
In-Reply-To: <20230115182724.377966-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Jan 2023 19:27:24 +0100")
Message-ID: <87sffw3zoi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: fix build with
 libressl >= 3.5.0
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

 > Fix the following build failure with libressl raised since bump to
 > version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

 > In file included from /tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c:18:
 > /tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c: In function 'get_dh2048':
 > /tmp/instance-10/output-1/build/mariadb-10.3.36/include/ssl_compat.h:68:45: error: invalid use of incomplete typedef 'DH' {aka 'struct dh_st'}
 >    68 | #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
 >       |                                             ^~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/524198344aafca58d214537af64c5961c407b0f8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
