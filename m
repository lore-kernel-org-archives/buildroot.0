Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76BFC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AAE608CE;
	Mon,  6 May 2024 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ymESiPTcWXF; Mon,  6 May 2024 21:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF62560A69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF62560A69;
	Mon,  6 May 2024 21:04:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 748141BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D13A40201
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3N1ZRzSCAP0w for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:04:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B6964021C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6964021C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B6964021C
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:04:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77B46C0004;
 Mon,  6 May 2024 21:04:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s45VB-003k7y-2r;
 Mon, 06 May 2024 23:04:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
References: <20240411152016.1185109-1-ben.hutchings@mind.be>
Date: Mon, 06 May 2024 23:04:01 +0200
In-Reply-To: <20240411152016.1185109-1-ben.hutchings@mind.be> (Ben Hutchings
 via buildroot's message of "Thu, 11 Apr 2024 17:20:16 +0200")
Message-ID: <87edaey7ni.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/skeleton-init-sysv: Set sticky bit
 on /dev/shm
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
Cc: oss-security@lists.openwall.com, Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ben" == Ben Hutchings via buildroot <buildroot@buildroot.org> writes:

 > /dev/shm is a world-writable directory, like /tmp, and should also
 > have the sticky bit set.  Without this, any user can delete and
 > replace another user's files in /dev/shm.

 > This bug has been present since /dev/shm was added to the skeleton
 > /etc/fstab, but appears to have been fixed for systems using systemd
 > by commit 76fc9275f14e "system: separate sysv and systemd parts of the
 > skeleton" which went into Buildroot 2017.08.

 > Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
 > Fixes: 22fde22e35f98f7830c2f8955465532328348cd1

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
