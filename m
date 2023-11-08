Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B94C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 07:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894EA408B0;
	Wed,  8 Nov 2023 07:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 894EA408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evTYjfSAAunS; Wed,  8 Nov 2023 07:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75AC94086E;
	Wed,  8 Nov 2023 07:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75AC94086E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82EBE1BF28A
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BA1281E5F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA1281E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JiMRA_RknVh5 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 07:22:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F10981E14
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 07:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F10981E14
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D20460009;
 Wed,  8 Nov 2023 07:22:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0ctN-00082J-2E;
 Wed, 08 Nov 2023 08:22:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231101154350.541223-1-fontaine.fabrice@gmail.com>
Date: Wed, 08 Nov 2023 08:22:25 +0100
In-Reply-To: <20231101154350.541223-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 1 Nov 2023 16:43:49 +0100")
Message-ID: <87ttpwu2tq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/conmon: seccomp needs headers
 >= 5.0
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > conmon unconditionally uses seccomp_notif_sizes which is only available
 > since kernel 5.0 and
 > https://github.com/torvalds/linux/commit/6a21cc50f0c7f87dae5259f6cfefe024412313f6
 > resulting in the following build failure since the addition of the
 > package in commit 06f50ff1bf066feb6cf6ed512113773f87c884fb:

 > In file included from src/seccomp_notify.h:4,
 >                  from src/seccomp_notify.c:26:
 > src/seccomp_notify_plugin.h:33:78: warning: 'struct seccomp_notif_sizes' declared inside parameter list will not be visible outside of this definition or declaration
 >    33 | typedef int (*run_oci_seccomp_notify_handle_request_cb)(void *opaque, struct seccomp_notif_sizes *sizes, struct seccomp_notif *sreq,
 >       |                                                                              ^~~~~~~~~~~~~~~~~~~
 > src/seccomp_notify.c:47:36: error: field 'sizes' has incomplete type
 >    47 |         struct seccomp_notif_sizes sizes;
 >       |                                    ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/cbfa2f3a585b7feecd902137bc589a1ec15cbefe

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
