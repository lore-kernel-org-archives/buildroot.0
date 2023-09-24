Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A5CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBDB540C4E;
	Sun, 24 Sep 2023 16:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBDB540C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0S_guyk4U2Ew; Sun, 24 Sep 2023 16:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABAA1400D7;
	Sun, 24 Sep 2023 16:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABAA1400D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05AB51BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2F8C41528
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2F8C41528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bloqiRYiMWPb for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:05:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA91E41517
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA91E41517
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB85EC0002;
 Sun, 24 Sep 2023 16:05:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkRc9-000B2c-J6; Sun, 24 Sep 2023 18:05:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <899835786b45f8576e62061b2a6a9a16751feb46.1694556946.git.yann.morin.1998@free.fr>
Date: Sun, 24 Sep 2023 18:05:45 +0200
In-Reply-To: <899835786b45f8576e62061b2a6a9a16751feb46.1694556946.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 13 Sep 2023 00:15:50 +0200")
Message-ID: <87wmwfk146.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/5] support/download/git: properly catch
 failures
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since commit b7efb43e86da (download/git: try to recover from
 > utterly-broken repositories), we catch errors through an ERR
 > trap, so we can try and recover from a broken repository. In
 > that commit, we switched from using "set -e" to "set -E", so
 > that trap is inherited in functions, command substitutions,
 > and subshells.

 > However, the trap is not defined until we have parsed the
 > options, created the cache directory, and eventually chdir()ed
 > into it. Athough improbable, it is possible for the git helper
 > to fail in any of those steps, and that would not get caught.

 > Fix that

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
