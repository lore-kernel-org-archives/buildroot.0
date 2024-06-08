Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97454C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5848F406B1;
	Sat,  8 Jun 2024 07:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGmteF-iNat3; Sat,  8 Jun 2024 07:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE6A41A74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DE6A41A74;
	Sat,  8 Jun 2024 07:44:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9565E1BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E84A41A74
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmT8AdTEkmS5 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50B5B406B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B5B406B1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50B5B406B1
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:44:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DA30C0003;
 Sat,  8 Jun 2024 07:44:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFqkr-00GV1m-1T;
 Sat, 08 Jun 2024 09:44:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20240510220704.1924373-1-brandon.maier@collins.com>
Date: Sat, 08 Jun 2024 09:44:49 +0200
In-Reply-To: <20240510220704.1924373-1-brandon.maier@collins.com> (Brandon
 Maier via buildroot's message of "Fri, 10 May 2024 22:07:04 +0000")
Message-ID: <87wmmz98um.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gcc: add patch to fix gcc 11 build
 warning
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > When building GCC 11 with GCC 14 the following error occurs
 >> ../../../libiberty/simple-object-mach-o.c:1231:17: error: passing
 > argument 1 of 'set_32' from incompatible pointer type
 > [-Wincompatible-pointer-types]

 > This was fixed upstream in GCC12[1]. It is applied to the GCC 11 release
 > branch[2], but has not been officially released yet.

 > [1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
 > [2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=02cd761eb1198df50453b2e39653f48053609ffc

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
