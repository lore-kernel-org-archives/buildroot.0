Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61423E77170
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 16:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3ED940178;
	Thu,  5 Dec 2024 16:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CguTSFv2xfW4; Thu,  5 Dec 2024 16:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFEA640B4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFEA640B4B;
	Thu,  5 Dec 2024 16:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ADF11DD1
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 16:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 688D040B4B
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 16:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPGs4QhNjDkt for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 16:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C99E54014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C99E54014E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C99E54014E
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 16:57:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E307240005;
 Thu,  5 Dec 2024 16:57:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJFAP-004a9k-1l;
 Thu, 05 Dec 2024 17:57:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org,  thomas.petazzoni@bootlin.com
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241128035016.750439-1-fancp2007@gmail.com>
Date: Thu, 05 Dec 2024 17:57:29 +0100
In-Reply-To: <20241128035016.750439-1-fancp2007@gmail.com> (Scott Fan's
 message of "Thu, 28 Nov 2024 11:50:14 +0800")
Message-ID: <871pym9ifa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Scott" == Scott Fan <fancp2007@gmail.com> writes:

 > The previous build setup would check for pidfd_open using
 > AC_CHECK_FUNC and would be incorrectly reported as true.

 > Backport patch from upstream:
 > [1] https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553
 > [2] https://gitlab.com/procps-ng/procps/-/commit/587efb47df7ddbfda4e6abdd1e7792a2531a238f
 > [3] https://gitlab.com/procps-ng/procps/-/commit/5acbb5dc1587d688de646d739a97251eb893bbb0

 > Signed-off-by: Scott Fan <fancp2007@gmail.com>

Committed after adding a reference to an autobuilder failure, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
