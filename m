Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A38C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 08:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9358126B;
	Wed,  7 Aug 2024 08:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPi3ucbllhum; Wed,  7 Aug 2024 08:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00CC48126D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00CC48126D;
	Wed,  7 Aug 2024 08:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82DB01BF329
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ED91404D0
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2duoJSkUC7uQ for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 08:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31714404CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31714404CB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31714404CB
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 08:53:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30DD6C0007;
 Wed,  7 Aug 2024 08:53:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbcPz-001bJU-16;
 Wed, 07 Aug 2024 10:53:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZN4z+n37WMFvHgsF@waldemar-brodkorb.de>
Date: Wed, 07 Aug 2024 10:53:15 +0200
In-Reply-To: <ZN4z+n37WMFvHgsF@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 17 Aug 2023 16:51:38 +0200")
Message-ID: <87sevgogsk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCHv2 2/2] package/tcf-agent: fix uClibc-ng
 compile on ARM
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > When a shared build is used, we can use getauxval and no ARM only
 > instuctions are in use.

 > When a static build is used, we need to override CFLAGS to use
 > arm instructions, as uClibc-ng only supports getauxval for shared case.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/3b5/3b5c5519a3e5ee490308bc1a1b9579ce13417235

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1 -> v2:
 >   - musl is not affected, change requested by Thomas Petazzoni

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
