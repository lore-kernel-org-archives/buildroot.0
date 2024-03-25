Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DD8C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60185605EB;
	Mon, 25 Mar 2024 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDyBBlSAsq2Y; Mon, 25 Mar 2024 10:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7970A60683
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7970A60683;
	Mon, 25 Mar 2024 10:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0781BF2E4
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 10:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65FA340598
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 10:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NI0SVO01F5Zz for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 10:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A7DF40585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A7DF40585
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A7DF40585
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 10:35:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 698F2E0003;
 Mon, 25 Mar 2024 10:35:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rohfy-008fPx-2P;
 Mon, 25 Mar 2024 11:35:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240317095811.52758-1-fontaine.fabrice@gmail.com>
 <8cf6b1a4-b64b-48a3-8a5f-d72a93751d5a@mind.be>
Date: Mon, 25 Mar 2024 11:35:34 +0100
In-Reply-To: <8cf6b1a4-b64b-48a3-8a5f-d72a93751d5a@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 24 Mar 2024 17:52:42
 +0100")
Message-ID: <875xxad2fd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/xvisor: fix build without
 python interpreter
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 17/03/2024 10:58, Fabrice Fontaine wrote:
 >> Fix the following build failures on a system not providing the "python"
 >> interpreter binary raised at least since bump to version 0.3.1 in commit
 >> c4f8b8968770ecbf6444a5921c6472f126717626 and more probably
 >> since the addition of the package in commit
 >> e23ddf0c13e6d3b054782b86188396a0c2add1a5 and
 >> https://github.com/xvisor/xvisor/commit/ba904b4066f4b375cb1ad76ca41570741dbec62e:
 >> /bin/sh: line 1:
 >> /home/buildroot/autobuild/instance-2/output-1/build/xvisor-0.3.1/tools/scripts/d2c.py:
 >> cannot execute: required file not found
 >> or
 >> /bin/sh:
 >> /home/buildroot/instance-0/output-1/build/xvisor-0.3.2/tools/scripts/d2c.py:
 >> /usr/bin/python: bad interpreter: No such file or directory
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/2e100bacc9e9face8351287e4c979c1729709d7b
 >> - http://autobuild.buildroot.org/results/5d8a08512db1b3095158753e3a7843b0fd6c9749
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  Applied to master, thanks.

..

 >> -XVISOR_DEPENDENCIES = host-bison host-dtc host-flex
 >> +XVISOR_DEPENDENCIES = host-bison host-dtc host-flex host-python3

Given that this script doesn't use any special python modules we can
presumably use BR2_PYTHON3_HOST_DEPENDENCY instead of forcing a build of
host-python3?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
