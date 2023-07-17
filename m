Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4BDEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 11:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A6481DF9;
	Mon, 17 Jul 2023 11:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A6481DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2L4oTQo5T9H; Mon, 17 Jul 2023 11:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7541181D4D;
	Mon, 17 Jul 2023 11:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7541181D4D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 638941BF352
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B06D60B8A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B06D60B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3SR8njAwYv7 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 11:07:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFDA60B69
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AFDA60B69
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 11:07:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1AABE0008;
 Mon, 17 Jul 2023 11:07:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qLM4t-00DMgd-O1; Mon, 17 Jul 2023 13:07:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230702122236.1113430-1-m.niestroj@grinn-global.com>
 <20230703220339.62e71e11@windsurf>
Date: Mon, 17 Jul 2023 13:07:43 +0200
In-Reply-To: <20230703220339.62e71e11@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 3 Jul 2023 22:03:39 +0200")
Message-ID: <87y1jeaj9c.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/chiliboard: uboot needs openssl
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun,  2 Jul 2023 14:22:35 +0200
 > Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

 >> Fixes uboot build errors:
 >> 
 >> In file included from tools/imagetool.h:24,
 >> from tools/aisimage.c:7:
 >> include/image.h:1383:12: fatal error: openssl/evp.h: No such file or directory
 >> 1383 | #  include <openssl/evp.h>
 >> |
 >> 
 >> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 >> ---
 >> configs/grinn_chiliboard_defconfig | 1 +
 >> 1 file changed, 1 insertion(+)

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
