Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9526FC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130FB40953;
	Sun, 23 Apr 2023 09:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 130FB40953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbOLKSGtCeyA; Sun, 23 Apr 2023 09:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A42C4090F;
	Sun, 23 Apr 2023 09:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A42C4090F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CDD71BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E6081EFD
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E6081EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfC7oHgj9Tyj for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:28:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40B181EE9
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C40B181EE9
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:28:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4699D240003;
 Sun, 23 Apr 2023 09:28:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqW1U-002Z5G-3j; Sun, 23 Apr 2023 11:28:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Ott via buildroot <buildroot@buildroot.org>
References: <20230412224038.109749-1-stefan@ott.net>
Date: Sun, 23 Apr 2023 11:28:44 +0200
In-Reply-To: <20230412224038.109749-1-stefan@ott.net> (Stefan Ott via
 buildroot's message of "Thu, 13 Apr 2023 00:40:39 +0200")
Message-ID: <87jzy36j77.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/eudev: fix compile-time
 issue with very old kernel headers
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Stefan" == Stefan Ott via buildroot <buildroot@buildroot.org> writes:

 > Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
 > compiling against such a kernel will fail.

 > This patch introduces a version check and makes eudev fall back to
 > v2cap.capabilities on these kernels.

 > Upstream: https://github.com/eudev-project/eudev/pull/247
 > Signed-off-by: Stefan Ott <stefan@ott.net>
 > ---
 > Changes v1 -> v2 (suggested by Arnout Vandecappelle):
 > - Clarified description to talk about kernel *headers*
 > - Use a git-formatted patch instead
 > - Added a Signed-off-by line
 > - Added upstream reference

Committed to 2023.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
