Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D26ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5349483E8F;
	Sat, 17 Sep 2022 15:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5349483E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCjA6C9I7aSk; Sat, 17 Sep 2022 15:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBA982813;
	Sat, 17 Sep 2022 15:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CBA982813
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79ED81BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 549AE41B61
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549AE41B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABBtD9yJaGDE for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:23:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32D8741B37
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32D8741B37
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:23:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 586531C0004;
 Sat, 17 Sep 2022 15:23:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZZfV-009PMi-P2; Sat, 17 Sep 2022 17:23:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
References: <20220815.100252.228788492467122600.atsushi.nemoto@sord.co.jp>
Date: Sat, 17 Sep 2022 17:23:45 +0200
In-Reply-To: <20220815.100252.228788492467122600.atsushi.nemoto@sord.co.jp>
 (Atsushi Nemoto's message of "Mon, 15 Aug 2022 10:02:52 +0900 (JST)")
Message-ID: <87zgey10u6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/uboot-tools: fix dumpimage for
 FIT image
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Atsushi" == Atsushi Nemoto <atsushi.nemoto@sord.co.jp> writes:

 > The upstream commit 7a01882eb37e7504e2450f474d0cc8db60ed26c2
 > ("common: Kconfig.boot: Add FIT_PRINT config option") introduce
 > CONFIG_FIT_PRINT and make fit_print_contents() empty if it was
 > not enabled.

 > Adding CONFIG_FIT_PRINT=y to UBOOT_TOOLS_MAKE_OPTS does not help
 > while CONFIG_FIT_PRINT=y affects Makefiles only, not C sources.

 > Add "#define CONFIG_FIT_PRINT 1" to autoconf.h if FIT_SUPPORT enabled.

 > Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
 > ---
 > Backport to: 2022.02.x, 2022.05.x
 > Change from v1: Describe why not add CONFIG_FIT_PRINT=y

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
