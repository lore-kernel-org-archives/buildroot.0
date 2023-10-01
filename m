Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC6DE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 14:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59D41418A5;
	Sun,  1 Oct 2023 14:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D41418A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OsVXjC4xk_5; Sun,  1 Oct 2023 14:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69C8E4188F;
	Sun,  1 Oct 2023 14:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69C8E4188F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 147FC1BF59E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E27A460D53
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E27A460D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WtFLEIKnTcjm for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 14:36:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1FA160BEA
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 14:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1FA160BEA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CF95C0006;
 Sun,  1 Oct 2023 14:36:23 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmxYV-00Gcjv-Fr; Sun, 01 Oct 2023 16:36:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <a9774109676af0756f842322eb9baf0a7bacdf48.1695641648.git.yann.morin@orange.com>
Date: Sun, 01 Oct 2023 16:36:23 +0200
In-Reply-To: <a9774109676af0756f842322eb9baf0a7bacdf48.1695641648.git.yann.morin@orange.com>
 (yann morin's message of "Mon, 25 Sep 2023 13:34:16 +0200")
Message-ID: <87il7q5s0o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCHv2] package/go: fix installation
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > When building for a target architecture that go does not support, the
 > isntallation fails with:

 >     $ make host-go
 >     [...]
 >     ln -sf ../lib/go/bin/go /home/nyma7486/dev/work/5GCroCo/O/pouet/per-package/host-go/host/bin/
 >     ln: failed to create symbolic link '/home/nyma7486/dev/work/5GCroCo/O/pouet/per-package/host-go/host/bin/': No such file or directory

 > Indeed, the HOST_DIR/bin is not guaranteed to exist when we install a
 > host package, so it needs to be explicitly created before we can create
 > entries in there.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Christian Stewart <christian@aperture.us>
 > Cc: Anisse Astier <anisse@astier.eu>

 > ---
 > Changes v1 -> v2:
 >   - drop surious hunk

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
