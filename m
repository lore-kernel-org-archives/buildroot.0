Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B2EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB4560FA5;
	Mon,  4 Apr 2022 12:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IesJb6TM3yU9; Mon,  4 Apr 2022 12:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C0160B1C;
	Mon,  4 Apr 2022 12:30:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 791041BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7603C409B1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z79CJuprawCZ for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:30:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42A87409A6
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:30:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71E1CFF818;
 Mon,  4 Apr 2022 12:30:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nbLqU-005rUf-E1; Mon, 04 Apr 2022 14:30:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20220328111413.1618964-1-foss+buildroot@0leil.net>
Date: Mon, 04 Apr 2022 14:30:10 +0200
In-Reply-To: <20220328111413.1618964-1-foss+buildroot@0leil.net> (Quentin
 Schulz's message of "Mon, 28 Mar 2022 13:14:12 +0200")
Message-ID: <87lewl1165.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/qt5base: fix race with
 libxkbcommon
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > qt5wayland package currently has a bug if the xkbcommon Qt config is not
 > enabled which highlighted a race issues between qt5base, libxkbcommon
 > and qt5wayland.

 > qt5wayland has a dependency on libxkbcommon package if it's enabled.
 > qt5base only has a dependency on libxkbcommon if xcb support is to be
 > enabled.

 > If libxkbcommon package is built before qt5base, qt5base will detect it
 > during its configure step and enable the Qt config accordingly. This
 > will make it available to qt5wayland afterwards, even if xcb support is
 > not enabled in Buildroot Kconfig.

 > However, if qt5base is built before libxkbcommon is, qt5base will not
 > advertise support of xbcommon feature to qt5wayland (which will fail its
 > build because of a bug in the source code).

 > Since the package build order should not impact the outcome of the
 > build, let's explicit the dependency if and only if libxkbcommon package
 > is to be compiled at some point in time so that at least this feature is
 > not susceptible to races.

 > Cc: Quentin Schulz <foss+buildroot@0leil.net>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
