Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DFFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 18:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7655A41EF5;
	Sat, 11 Nov 2023 18:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7655A41EF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWgefjZ3PhOe; Sat, 11 Nov 2023 18:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4EA441ED8;
	Sat, 11 Nov 2023 18:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4EA441ED8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B64E31BF36A
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 18:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D91141478
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 18:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D91141478
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQ32lNm338dr for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 18:58:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07E2E400CB
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 18:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07E2E400CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id B16CC40002;
 Sat, 11 Nov 2023 18:58:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r1tBi-006jOu-3B;
 Sat, 11 Nov 2023 19:58:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231108215203.26206-1-fontaine.fabrice@gmail.com>
Date: Sat, 11 Nov 2023 19:58:34 +0100
In-Reply-To: <20231108215203.26206-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 8 Nov 2023 22:52:03 +0100")
Message-ID: <8734xci0bp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/json-c: fix build with gcc 5
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

 > Fix the following build failure with gcc 5 raised since bump to version
 > 0.17 in commit 725580a26ecbd554567880e95b8533b2c9baa5f9:

 > /home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c: In function 'json_pointer_result_get_recursive':
 > /home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c:193:25: error: 'idx' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 res-> index_in_parent = idx;
 >                          ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/523b35a979d59121fe4e18c38171792b06233940

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
