Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3895CD462D0
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 16:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E887740634;
	Wed, 13 Nov 2024 16:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDb1bU1Ytuap; Wed, 13 Nov 2024 16:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1D59405F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D59405F0;
	Wed, 13 Nov 2024 16:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12F526C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F33104063C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpnM9dJNmErY for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 16:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 162BC4062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162BC4062D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 162BC4062D
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:17:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 427B424000C;
 Wed, 13 Nov 2024 16:16:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tBG38-00FYyY-2n;
 Wed, 13 Nov 2024 17:16:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20241028222101.2184759-1-bernd@kuhls.net>
Date: Wed, 13 Nov 2024 17:16:58 +0100
In-Reply-To: <20241028222101.2184759-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 28 Oct 2024 23:21:01 +0100")
Message-ID: <87bjyjyupx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/apache: Include
 ap_config_auto.h to define _GNU_SOURCE
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/2f6/2f6b7bbb4c97e4c91b3abd6bb205e237e57045fa/
 > and many more.

 > The bug was introduced by bumping apache to 2.4.59 with buildroot commit
 > e0bbfaea0e983c1ce42a9c3085f3ca3dd796852f which includes
 > https://github.com/apache/httpd/commit/008e6afcfdae36bce1b5f3fc0cb9519375fd99cf

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: Fixed missing _GNU_SOURCE define (Thomas)

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
