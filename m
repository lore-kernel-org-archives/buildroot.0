Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79818C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 17:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0960941706;
	Mon, 13 Mar 2023 17:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0960941706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gp5zLmuC3uFM; Mon, 13 Mar 2023 17:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14EA6416B5;
	Mon, 13 Mar 2023 17:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14EA6416B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2231BF384
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54E0C400CB
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 17:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54E0C400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8b-SkaZLhIcN for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 17:09:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BA35409DB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BA35409DB
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 17:09:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6E8341C0007;
 Mon, 13 Mar 2023 17:09:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pblfa-0004VN-KE; Mon, 13 Mar 2023 18:09:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230224105148.1780818-1-fontaine.fabrice@gmail.com>
Date: Mon, 13 Mar 2023 18:09:10 +0100
In-Reply-To: <20230224105148.1780818-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 24 Feb 2023 11:51:48 +0100")
Message-ID: <87bkkw8top.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ntpsec: fix build without
 stack-protector
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

 > Fix the following build failure without stack-protector raised since the
 > addition of the package in commit
 > 27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

 > Checking for library ssp                 : not found
 > Checking for library ssp_nonshared       : not found
 > Checking if C compiler supports -fstack-protector-all : yes

 > [...]

 > The configuration failed
 > (complete log in /home/autobuild/autobuild/instance-2/output-1/build/ntpsec-1_2_2/build/config.log)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f38abc6b7f8464836231192cfe078a5b27319a8a
 >  - http://autobuild.buildroot.org/results/62be818e2f2eac07b4a2de6f4a8898cc4cc05b1f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
