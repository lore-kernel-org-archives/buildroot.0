Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B788C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C8518123E;
	Sun, 28 Apr 2024 19:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnN6bmNZJgWL; Sun, 28 Apr 2024 19:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F41814B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19F41814B8;
	Sun, 28 Apr 2024 19:35:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8704E1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72E0C40657
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CysG4R4VoWB8 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1B9C402F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B9C402F8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1B9C402F8
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:35:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0D1460003;
 Sun, 28 Apr 2024 19:35:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s1AJD-006Vuy-03;
 Sun, 28 Apr 2024 21:35:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240331164354.94483-1-fontaine.fabrice@gmail.com>
Date: Sun, 28 Apr 2024 21:35:35 +0200
In-Reply-To: <20240331164354.94483-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 31 Mar 2024 18:43:54 +0200")
Message-ID: <8734r5cmbc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/giflib: fix host build without
 convert
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Do not build docs for host-giflib to avoid the following build failure
 > without convert on host raised since bump to version 5.2.2 in commit
 > f98239dada59270efe19de9d9fae50ec9ab9d28c and
 > https://sourceforge.net/p/giflib/code/ci/d565f6fa04be8973425bd7cd3f169908ac9e95c2:

 > convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
 > make[2]: convert: No such file or directory

 > Fixes: f98239dada59270efe19de9d9fae50ec9ab9d28c
 >  - http://autobuild.buildroot.org/results/04dd54f5060881cb8aa030de34edb4ceea863fa6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
