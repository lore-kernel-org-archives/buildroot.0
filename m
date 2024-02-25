Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BFFC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 07:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D54406B0;
	Sun, 25 Feb 2024 07:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5H5qECVQkFWh; Sun, 25 Feb 2024 07:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE33E406C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE33E406C8;
	Sun, 25 Feb 2024 07:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 191841BF20D
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 07:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1115E405CC
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 07:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrcx6sfVqAHn for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 07:53:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9518400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9518400A4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9518400A4
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 07:53:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEDDF240002;
 Sun, 25 Feb 2024 07:53:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1re9Jk-00E29n-1W;
 Sun, 25 Feb 2024 08:53:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240224214601.680607-1-fontaine.fabrice@gmail.com>
Date: Sun, 25 Feb 2024 08:53:00 +0100
In-Reply-To: <20240224214601.680607-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 24 Feb 2024 22:46:01 +0100")
Message-ID: <87wmqtrndv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/redis-plus-plus: needs threads
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
Cc: Prabhu Sannachi <prabhu.sannachi@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > redis-plus-plus unconditonally uses mutex and so needs threads since its
 > addition in commit c46df9de21e718a9ed6a2df2bb945c386695d3bf and
 > https://github.com/sewenew/redis-plus-plus/commit/1fa8f6bbfb24c8f328aa23ee1dd3c3f99c1b4caf:

 > In file included from /home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/connection_pool.h:27,
 >                  from /home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/connection_pool.cpp:17:
 > /home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/sentinel.h:95:10: error: 'mutex' in namespace 'std' does not name a type
 >    95 |     std::mutex _mutex;
 >       |          ^~~~~

 > Fixes: c46df9de21e718a9ed6a2df2bb945c386695d3bf
 >  - http://autobuild.buildroot.org/results/cc4c54134e8a522b4c028aab4266f47cf862e2a9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
