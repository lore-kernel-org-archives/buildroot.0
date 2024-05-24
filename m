Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6622C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA5080D96;
	Fri, 24 May 2024 12:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j31kv0cryjr4; Fri, 24 May 2024 12:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C233D8129A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C233D8129A;
	Fri, 24 May 2024 12:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EEEB1CF9B7
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B3DF60B0E
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bw1Mn8ZQAj9j for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 369E7605F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 369E7605F4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 369E7605F4
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:57:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5388FC0006;
 Fri, 24 May 2024 12:57:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAUU3-00Fy8L-2g;
 Fri, 24 May 2024 14:57:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240515181047.1254290-1-fontaine.fabrice@gmail.com>
Date: Fri, 24 May 2024 14:57:19 +0200
In-Reply-To: <20240515181047.1254290-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 15 May 2024 20:10:47 +0200")
Message-ID: <87fru7jrkg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: fix uclibc build
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following uclibc build failure raised since bump to version 6.11
 > in commit c6c173dadb7b44ba4af92237d05503b8e83e51dc and
 > https://github.com/pikvm/ustreamer/commit/2d6716aa4762151f0fb1b900d3cd3295d328cab6:

 > In file included from libs/base64.h:25,
 >                  from libs/base64.c:23:
 > libs/types.h:30:9: error: unknown type name 'ssize_t'
 >    30 | typedef ssize_t sz;
 >       |         ^~~~~~~

 > Fixes: c6c173dadb7b44ba4af92237d05503b8e83e51dc
 >  - http://autobuild.buildroot.org/results/24498049d7beb4afaaf9f9a0c2fc0bcd26a3ee04

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
