Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33490C4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B536E6FA37;
	Fri, 12 Jan 2024 18:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B536E6FA37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgSFz26nr2b7; Fri, 12 Jan 2024 18:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17E1260C20;
	Fri, 12 Jan 2024 18:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E1260C20
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31A451BF83B
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 093FC4037C
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 093FC4037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtavZj7Nj3iV for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:42:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC79A40108
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC79A40108
Received: by mail.gandi.net (Postfix) with ESMTPSA id C398540004;
 Fri, 12 Jan 2024 18:42:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOMUA-00CCMx-0f;
 Fri, 12 Jan 2024 19:42:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240105181207.748233-1-fontaine.fabrice@gmail.com>
Date: Fri, 12 Jan 2024 19:42:30 +0100
In-Reply-To: <20240105181207.748233-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Jan 2024 19:12:07 +0100")
Message-ID: <87y1cuwfzd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libostree: needs headers >= 5.8
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libostree unconditionally uses loop_config since bump to version 2023.5
 > in commit c64a3e9767757f6bab0ecf2df35871508003f39e and
 > https://github.com/containers/composefs/commit/d7f24100c932cd0da9c315de7c7d44fe7a5005cd
 > which is only available with kernel >= 5.8 and
 > https://github.com/torvalds/linux/commit/3448914e8cc550ba792d4ccc74471d1ca4293aae
 > resulting in the following build failure:

 > composefs/libcomposefs/lcfs-mount.c: In function 'setup_loopback':
 > composefs/libcomposefs/lcfs-mount.c:273:16: error: variable 'loopconfig' has initializer but incomplete type
 >   273 |         struct loop_config loopconfig = { 0 };
 >       |                ^~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/25d9d4f256861628ddd8e8ce659a39655d27b457
 >  - http://autobuild.buildroot.org/results/5c7e1e47c6eb43f7832ef7820ec2b5ac0f3c3696

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
