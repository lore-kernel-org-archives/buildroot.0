Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8097ACE7B11
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 09:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E3F0420F6;
	Thu, 28 Sep 2023 09:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E3F0420F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFZ3hNF3_Nu9; Thu, 28 Sep 2023 09:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406BE42557;
	Thu, 28 Sep 2023 09:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406BE42557
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66C931BF2BD
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 09:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F25C42557
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 09:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F25C42557
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1daFT0fpjMqZ for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 09:26:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F36AA420F6
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 09:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36AA420F6
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAED61BF212;
 Thu, 28 Sep 2023 09:26:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qlnI3-005bDK-B3; Thu, 28 Sep 2023 11:26:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230927204329.626845-1-fontaine.fabrice@gmail.com>
Date: Thu, 28 Sep 2023 11:26:35 +0200
In-Reply-To: <20230927204329.626845-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Sep 2023 22:43:29 +0200")
Message-ID: <874jjey7g4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/bind: security bump to version 9.16.44
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2023-3341: The code that processes control channel messages sent
 > to `named` calls certain functions recursively during packet parsing.
 > Recursion depth is only limited by the maximum accepted packet size;
 > depending on the environment, this may cause the packet-parsing code to
 > run out of available stack memory, causing `named` to terminate
 > unexpectedly. Since each incoming control channel message is fully
 > parsed before its contents are authenticated, exploiting this flaw does
 > not require the attacker to hold a valid RNDC key; only network access
 > to the control channel's configured TCP port is necessary. This issue
 > affects BIND 9 versions 9.2.0 through 9.16.43, 9.18.0 through 9.18.18,
 > 9.19.0 through 9.19.16, 9.9.3-S1 through 9.16.43-S1, and 9.18.0-S1
 > through 9.18.18-S1.

 > https://ftp.isc.org/isc/bind9/9.16.44/CHANGES

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - fix tarball hash

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
