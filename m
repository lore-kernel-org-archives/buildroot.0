Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3139C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB7FC60592;
	Sun, 28 Apr 2024 19:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6KIFp7bwBxo; Sun, 28 Apr 2024 19:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B949C60647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B949C60647;
	Sun, 28 Apr 2024 19:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 456751BF3DB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F53140433
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4yAIhDck6Pm for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:45:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4532C40429
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4532C40429
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4532C40429
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:45:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EBA0FF804;
 Sun, 28 Apr 2024 19:45:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s1AT3-006hFd-35;
 Sun, 28 Apr 2024 21:45:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240401184812.5335884736@busybox.osuosl.org>
Date: Sun, 28 Apr 2024 21:45:45 +0200
In-Reply-To: <20240401184812.5335884736@busybox.osuosl.org> (Yann E. MORIN's
 message of "Mon, 1 Apr 2024 17:03:12 +0200")
Message-ID: <87il01b79y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] support/scripts/mkusers: fix
 shellcheck errors
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=01b3053ceccad2486e25a17af6dfc5039b7eea3e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > the user tables do not use trailing backslash \ to continue lines,
 > so we don't want them to be interpreted thusly, so we use 'read -r'
 > (SC2162).

 > Integer variables need not be quoted (SC2086). In any case, should
 > there be an actual issue and they be set empty, that would cause a
 > runtime issue, wether they be quoted or not.

 > The binary -o and -a ar perfectly defined in bash's test (SC2166).

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
