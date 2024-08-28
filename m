Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB85CC54752
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 08:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6710D400D2;
	Wed, 28 Aug 2024 08:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTgpRVEkA_ye; Wed, 28 Aug 2024 08:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2545D4062A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2545D4062A;
	Wed, 28 Aug 2024 08:49:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55BC01BF232
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 08:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 419C84062A
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 08:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVe9xzG0C073 for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 08:49:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 273D0400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 273D0400D2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 273D0400D2
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 08:49:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEAD0E0004;
 Wed, 28 Aug 2024 08:49:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjEMj-004ilB-0p;
 Wed, 28 Aug 2024 10:49:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
References: <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
 <20240717121147.1353901-1-fred.lefranc+evs@gmail.com>
Date: Wed, 28 Aug 2024 10:49:21 +0200
In-Reply-To: <20240717121147.1353901-1-fred.lefranc+evs@gmail.com> (Fred
 Lefranc's message of "Wed, 17 Jul 2024 14:11:46 +0200")
Message-ID: <877cc18226.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v4] package/busybox: fix build with glibc
 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fred" == Fred Lefranc <fred.lefranc.evs@gmail.com> writes:

 > When glibc was bumped to version 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97,
 > it removed the deprecated libcrypt support.

 > In such a situation, until the upgrade of glibc to 2.39, Busybox could rely on the
 > libcrypt provided by glibc. Since version 2.39, glibc no longer provides libcrypt,
 > causing a build failure with Busybox configurations that have CONFIG_USE_BB_CRYPT
 > disabled.

 > To fix this, add the libxcrypt dependency to Busybox when BR2_PACKAGE_LIBXCRYPT is
 > selected. The user is still responsible for enabling BR2_PACKAGE_LIBXCRYPT when
 > their Busybox configuration has CONFIG_USE_BB_CRYPT disabled.

 > Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
 > ---
 > Changes v3 -> v4
 >   - fix commit message to explain the non-working case
 > Changes v2 -> v3
 >   - fix commit message
 > Changes v1 -> v2
 >   - busybox.mk: fix BUSYBOX_DEPENDENCIES ident & remove the check
 > for BR2_TOOLCHAIN_USES_GLIBC (req by Thomas)
 >   - Config.in: remove libxcrypt mandatory dependency
 > (req by Thomas)

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
