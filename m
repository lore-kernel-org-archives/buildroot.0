Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC93C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A2BE60635;
	Sun, 28 Apr 2024 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noeuXAvctuE5; Sun, 28 Apr 2024 19:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7573D60647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7573D60647;
	Sun, 28 Apr 2024 19:45:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75DCA1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6170540635
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMo8LEIYCU8N for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:45:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0B9940633
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B9940633
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0B9940633
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:45:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8582640005;
 Sun, 28 Apr 2024 19:45:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s1ASn-006hFL-2z;
 Sun, 28 Apr 2024 21:45:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240401184812.3BF0284735@busybox.osuosl.org>
Date: Sun, 28 Apr 2024 21:45:29 +0200
In-Reply-To: <20240401184812.3BF0284735@busybox.osuosl.org> (Yann E. MORIN's
 message of "Mon, 1 Apr 2024 17:03:08 +0200")
Message-ID: <87mspdb7ae.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] support/scripts/mkusers: fix UID/GID
 confusion
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=ebbcf5a0a752519efffeba432f347b49950b1f16
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 41ea61d59c3e (support/scripts/mkusers: allow option for system
 > uid/gid) confused GID and UID variables: the GID limits were used to
 > create UIDs.

 > Fix that.

 > Note that this fixes a shellcheck error; although there are many more
 > shellcheck errors, these fixes are semantically a bug that need to be
 > fixed separately from the coding style issues reported by shellcheck.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Norbert Lange <nolange79@gmail.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
