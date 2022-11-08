Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD1EC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95EB481EA0;
	Tue,  8 Nov 2022 20:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95EB481EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bF5qf7Tosd4J; Tue,  8 Nov 2022 20:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C972F81E94;
	Tue,  8 Nov 2022 20:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C972F81E94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 066C81BF3C6
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5211414E5
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5211414E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hn-XOZ-GOvj0 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:22:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4E5B40951
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4E5B40951
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:22:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8EA0B60002;
 Tue,  8 Nov 2022 20:22:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1osV6q-000V56-Mn; Tue, 08 Nov 2022 21:22:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221029170023.219493-1-fontaine.fabrice@gmail.com>
 <20221029170023.219493-2-fontaine.fabrice@gmail.com>
Date: Tue, 08 Nov 2022 21:22:12 +0100
In-Reply-To: <20221029170023.219493-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Oct 2022 19:00:23 +0200")
Message-ID: <877d05gpsb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/f2fs-tools: fix build with lz4
 1.9.4
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump of lz4 to version
 > 1.9.4 in commit 1f54af8c4f814bfc0993756b82575ad581ce5318:

 > compress.c: In function 'lz4_compress_init':
 > compress.c:36:42: error: 'LZ4_STREAMSIZE_U64' undeclared (first use in this function); did you mean 'LZ4_STREAMSIZE'?
 >    36 | #define LZ4_STREAMSIZE                  (LZ4_STREAMSIZE_U64 * sizeof(long long))
 >       |                                          ^~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ca8b6646322a4cb911fad5fb9cb38046743609bf

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
