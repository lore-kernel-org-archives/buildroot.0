Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FFEC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6280581E55;
	Mon, 25 Mar 2024 09:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98buYP4lLGLL; Mon, 25 Mar 2024 09:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E8B08195C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E8B08195C;
	Mon, 25 Mar 2024 09:01:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80FBE1BF3DB
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E6F94029B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2Ls6FPVHZWI for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1545440179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1545440179
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1545440179
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:01:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0401D20004;
 Mon, 25 Mar 2024 09:01:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rogCW-008cyh-13;
 Mon, 25 Mar 2024 10:01:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240315221029.88170-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2024 10:01:04 +0100
In-Reply-To: <20240315221029.88170-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 15 Mar 2024 23:10:29 +0100")
Message-ID: <87zfumd6sv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/cvs: fix build without editor
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

 > Set default editor to /bin/vi to fix the following build failure when no
 > editor is found on host:

 > configure:40833: checking for vim
 > configure:40862: result: no
 > configure:40833: checking for vi
 > configure:40862: result: no
 > configure:40833: checking for emacs
 > configure:40862: result: no
 > configure:40833: checking for nano
 > configure:40862: result: no
 > configure:40833: checking for pico
 > configure:40862: result: no
 > configure:40833: checking for edit
 > configure:40862: result: no
 > configure:40874: error:
 >     Failed to find a text file editor.  CVS cannot be compiled
 >     without a default log message editor.  Searched for
 >     `vim vi emacs nano pico edit'.  Try `configure --with-editor'.

 > While at it, drop CVS_CONFIGURE_ARGS variable for simplicity

 > Fixes:
 >  - http://autobuild.buildroot.org/results/5b8a747698bc2e64eb1f001e87577e86e4cb8d14

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
