Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87FFCA0FF3
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 14:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E0A48149B;
	Fri, 30 Aug 2024 14:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPAfyh80jUzu; Fri, 30 Aug 2024 14:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AED1D8175D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AED1D8175D;
	Fri, 30 Aug 2024 14:00:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB0D61BF5B3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 14:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B81D68175D
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 14:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpzrVATiC7iF for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 14:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A6328149B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A6328149B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A6328149B
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 14:00:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FD171BF20C;
 Fri, 30 Aug 2024 14:00:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sk2BD-008Xx7-17;
 Fri, 30 Aug 2024 16:00:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240722095445.60428-1-fontaine.fabrice@gmail.com>
Date: Fri, 30 Aug 2024 16:00:47 +0200
In-Reply-To: <20240722095445.60428-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Jul 2024 11:54:45 +0200")
Message-ID: <87seum1568.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/sconeserver: select libxcrypt
 if needed
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump of glibc to version
 > 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

 > In file included from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/sconex/ScriptBase.h:25,
 >                  from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealm.h:26,
 >                  from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealm.cpp:23:
 > /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/sconex/sconex.h:124:12: fatal error: crypt.h: No such file or directory
 >   124 | #  include <crypt.h>
 >       |            ^~~~~~~~~

 > Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 >  - http://autobuild.buildroot.org/results/24461bdb0a5d9a062b682ae3aeefa73c0408040b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
