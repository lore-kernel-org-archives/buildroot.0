Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3990FD743DB
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D84754E95A;
	Wed, 20 Nov 2024 21:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ugAedr976B0; Wed, 20 Nov 2024 21:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CBF94EB9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CBF94EB9F;
	Wed, 20 Nov 2024 21:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B193727DE
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F6354EB9F
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4x2x7E32ZrGO for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D8574E95A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8574E95A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D8574E95A
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:41:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96FF61BF206;
 Wed, 20 Nov 2024 21:41:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tDsRm-002Mrn-36;
 Wed, 20 Nov 2024 22:41:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: buildroot@buildroot.org,  Michael Fischer <mf@go-sys.de>,  Anthony
 Viallard <viallard@syscom-instruments.com>
References: <7a7eb00c-ce72-4a05-adf2-7229578c0030@grenoble.cnrs.fr>
 <e229fa46-f9ef-4ab6-b7d2-523809e2a3d6@grenoble.cnrs.fr>
Date: Wed, 20 Nov 2024 22:41:14 +0100
In-Reply-To: <e229fa46-f9ef-4ab6-b7d2-523809e2a3d6@grenoble.cnrs.fr> (Edgar
 Bonet's message of "Fri, 27 Sep 2024 14:09:01 +0200")
Message-ID: <87serlshvp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gnuplot: fix build failures
 on undefined FE_UNDERFLOW
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

>>>>> "Edgar" == Edgar Bonet <bonet@grenoble.cnrs.fr> writes:

 > Gnuplot carries the implicit assumption that, if the header fenv.h is
 > available, then it must define FE_UNDERFLOW. This assumption fails on
 > microblaze{,el}, mips{,64}{,el}, nios2 and or1k.

 > Fixes:
 >   - https://autobuild.buildroot.org/results/aa177c4f4f7c7429f052cebbf54f7027e4b2cabd/
 >   - https://autobuild.buildroot.org/results/868ca441daa2485b997f307edeede31dd229bfc2/
 >   - https://autobuild.buildroot.org/results/0a152cbfe23703bc5012098864d7fd5608775882/
 >   - https://autobuild.buildroot.org/results/d43be86091c9bd9163c145264151532f0f485528/
 > Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
 > ---
 > Changes v1 -> v2:
 >   - replaced the submitted patch with the version accepted upstream
 >     (different title and slightly different contents)
 >   - removed Upstream: link to the submitted patch
 >   - added Upstream: links to the accepted commits (for 'master' and the
 >     'branch-6-0-stable' maintenance branch)
 >   - in the commit log, updated the list of architectures where the build
 >     fails
 >   - in the commit log, updated Fixes: links to point to the latest
 >     failure on each architecture family

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
