Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2948EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 10:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD4B40C24;
	Mon, 11 Sep 2023 10:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD4B40C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5NrCzNR2rC6; Mon, 11 Sep 2023 10:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FE4E40B53;
	Mon, 11 Sep 2023 10:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FE4E40B53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55A4D1BF28E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EC2C60BFF
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC2C60BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yErx1O79wEgD for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 10:30:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D41E360B24
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 10:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D41E360B24
Received: by mail.gandi.net (Postfix) with ESMTPSA id C808840028;
 Mon, 11 Sep 2023 10:30:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfeBU-00Eevz-Nw; Mon, 11 Sep 2023 12:30:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230807215218.8ECE084777@busybox.osuosl.org>
Date: Mon, 11 Sep 2023 12:30:24 +0200
In-Reply-To: <20230807215218.8ECE084777@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 7 Aug 2023 23:49:16 +0200")
Message-ID: <874jk1c88v.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/libglib2: fix libiconv handling
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ff050de534eed1dab152890d748952fc659882a0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In upstream commit e71ecc8771a4f13bc6046438ab0845944831b9a6 ("build:
 > Remove deprecated -Diconv option"), merged since glib 2.75.1, the
 > meson -Diconv option was removed.

 > In Buildroot, this means that the build of libglib2 has been broken
 > since commit 3f9622fe3d85b4d9f734b879abc1d485afea19b2, which bumped
 > libglib2 from 2.72.3 to 2.76.1 for configurations that have libiconv
 > enabled, causing this build failure:

 > ../output-1/build/libglib2-2.76.1/meson.build:1:0: ERROR: Unknown options: "iconv"

 > iconv is now automatically detected by Meson machinery, and so the
 > option was considered as no longer being needed. This commit fixes
 > that by dropping the useless -Diconv=external.

 > Another related change done is remove the double addition of libiconv
 > into the <pkg>_DEPENDENCIES variable: libiconv can only be enabled
 > when BR2_ENABLE_LOCALE is disabled, and libglib2/Config.in selects
 > BR2_PACKAGE_LIBICONV when !BR2_ENABLE_LOCALE. So testing
 > BR2_ENABLE_LOCALE!=y and BR2_PACKAGE_LIBICONV=y is exactly the same
 > thing, causing libiconv to be added twice to the dependencies.

 > Fixes:

 >   http://autobuild.buildroot.net/results/d2da03f7558f3b6ee59c813bb64115702e52704c/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
