Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B9BC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C85640585;
	Wed, 22 Feb 2023 19:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C85640585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVnkfmHljq2l; Wed, 22 Feb 2023 19:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5018740566;
	Wed, 22 Feb 2023 19:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5018740566
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59E9E1BF475
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 411264193F
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 411264193F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHlHxQaN7w8Z for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 19:52:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF224192F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADF224192F
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 19:52:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA461100009;
 Wed, 22 Feb 2023 19:52:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUvA9-008Asw-0U; Wed, 22 Feb 2023 20:52:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220928205527.GH1419013@scaer>
 <20220929104648.324977-1-giulio.benetti@benettiengineering.com>
 <20230206234520.4a140264@windsurf>
Date: Wed, 22 Feb 2023 20:52:24 +0100
In-Reply-To: <20230206234520.4a140264@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 6 Feb 2023 23:45:20 +0100")
Message-ID: <87o7plqxzb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/qt5: fix build failure due to
 libressl use
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Thu, 29 Sep 2022 12:46:48 +0200
 > Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

 >> Qt5 only supports openssl, check [0] and [1]. So in qt5base.mk let's check
 >> if BR2_PACKAGE_LIBOPENSSL is enabled instead of BR2_PACKAGE_OPENSSL(that
 >> could be openssl or libressl) and for qt5enginio and qt5webkit let's select
 >> BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL instead of only BR2_PACKAGE_OPENSSL.
 >> This way we make sure that only openssl is selected and not libressl or
 >> other future openssl-like implementations.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/a956b48b782dbaa055d7146360465e2493a809d9/
 >> 
 >> [0]: https://doc.qt.io/qt-5/ssl.html#enabling-and-disabling-ssl-support
 >> [1]: https://bugreports.qt.io/browse/QTBUG-68374
 >> 
 >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 >> ---
 V1-> V2:
 >> * select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL instead of BR2_PACKAGE_LIBOPENSSL
 >> ---
 >> package/qt5/qt5base/qt5base.mk   | 4 ++--
 >> package/qt5/qt5enginio/Config.in | 1 +
 >> package/qt5/qt5webkit/Config.in  | 1 +
 >> 3 files changed, 4 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
