Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9842CE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 19:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6312D80475;
	Sun, 29 Dec 2024 19:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivRSdJL-JovM; Sun, 29 Dec 2024 19:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86C868047C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C868047C;
	Sun, 29 Dec 2024 19:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D49ECA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A64B4055E
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96YzG5SEbLxH for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 19:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1299C4055A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1299C4055A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1299C4055A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:57:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B691440003;
 Sun, 29 Dec 2024 19:57:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tRzPX-00EbGz-04;
 Sun, 29 Dec 2024 20:57:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20241216122209.238083-1-peter@korsgaard.com>
Date: Sun, 29 Dec 2024 20:57:14 +0100
In-Reply-To: <20241216122209.238083-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 16 Dec 2024 13:22:08 +0100")
Message-ID: <87ldvyi7ol.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/apr: add upstream security fix for
 CVE-2023-49582
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2023-49582: Lax permissions set by the Apache Portable Runtime
 > library on Unix platforms would allow local users read access to named
 > shared memory segments, potentially revealing sensitive application data.
 > This issue does not affect non-Unix platforms, or builds with
 > APR_USE_SHMEM_SHMGET=1 (apr.h) Users are recommended to upgrade to APR
 > version 1.7.5, which fixes this issue.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > NOTICE: Add patch rather than bumping to 1.7.5 as the patches (0002-/0003-)
 > we have reverted to fix apr-build do not apply to 1.7.5 and to make
 > backporting to LTS easier.

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
