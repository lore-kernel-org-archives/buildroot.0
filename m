Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392BAC6FD1F
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF4FD81839;
	Mon, 25 Mar 2024 09:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIbNCd3E7cgr; Mon, 25 Mar 2024 09:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A88781A27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A88781A27;
	Mon, 25 Mar 2024 09:04:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 597A91BF370
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4630C4055A
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd-zLd-694rn for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAD4840550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD4840550
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAD4840550
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:04:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 889F1240002;
 Mon, 25 Mar 2024 09:04:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rogFu-008d6B-3B;
 Mon, 25 Mar 2024 10:04:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20240312190954.71227-1-brandon.maier@collins.com>
 <20240315234316.17513-1-brandon.maier@collins.com>
Date: Mon, 25 Mar 2024 10:04:34 +0100
In-Reply-To: <20240315234316.17513-1-brandon.maier@collins.com> (Brandon Maier
 via buildroot's message of "Fri, 15 Mar 2024 23:43:16 +0000")
Message-ID: <87r0fyd6n1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gmp: fix target build with
 host gcc 4.9
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > GMP does not build if the host gcc is v4.9 due to the following error
 >   gen-sieve.c: In function 'setmask':
 >   gen-sieve.c:99:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
 >      for (unsigned i = 0; i < 2 * a * b; ++i)
 >      ^
 >   gen-sieve.c:99:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code

 > The gen-sieve utility was added in GMP v6.3.0. It is built using
 > CC_FOR_BUILD (host compiler) during cross compilation as it generates
 > build files. Autoconf does not have a macro for add -std=c99 to
 > CC_FOR_BUILD, so it must be set manually.

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
 > ---
 > v1: https://patchwork.ozlabs.org/project/buildroot/patch/20240312190954.71227-1-brandon.maier@collins.com/

 > v2:
 > - remove unnecessary comment and ifdef check

Committed to 2024.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
