Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD5C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 10:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F8A40602;
	Sun, 16 Jun 2024 10:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LIM_TILLCUF; Sun, 16 Jun 2024 10:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B3694061C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B3694061C;
	Sun, 16 Jun 2024 10:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099181BF31B
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA5544061C
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_qGo00Egzmc for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 10:22:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79F0C40602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79F0C40602
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79F0C40602
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 10:22:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA221C0002;
 Sun, 16 Jun 2024 10:22:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sIn1r-001TCB-0B;
 Sun, 16 Jun 2024 12:22:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Fazio <vfazio@gmail.com>
References: <20240609174048.31062-1-vfazio@gmail.com>
Date: Sun, 16 Jun 2024 12:22:30 +0200
In-Reply-To: <20240609174048.31062-1-vfazio@gmail.com> (Vincent Fazio's
 message of "Sun, 9 Jun 2024 12:40:48 -0500")
Message-ID: <875xu9qja1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix config directory
 pattern
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Vincent" == Vincent Fazio <vfazio@gmail.com> writes:

 > Previously, when running `PYTHON3_REMOVE_USELESS_FILES`, the hook to
 > clean up files from the python config directory assumed a pattern of
 > "config-$(VERSION)m-$(PLATFORM_TRIPLET)".

 > However, the "m" ABI suffix was dropped in python 3.8, so the hook would
 > never actually find files to delete. No error was raised due to the use
 > of a subshell to invoke find.

 > Also, if a platform triplet is not detected during the configure stage,
 > the config directory (LIBPL) defaults to `config-$VERSION`, and has no
 > trailing `-$PLATFORM_TRIPLET`.

 > Now, we glob anything after the version to ensure files get deleted.

 > Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
