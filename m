Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78877C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 204FA4040B;
	Mon,  3 Feb 2025 17:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALJ_W2ey9Q45; Mon,  3 Feb 2025 17:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2657340484
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2657340484;
	Mon,  3 Feb 2025 17:14:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E7551A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 031C1803D6
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HG_WcGI_P3Wa for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:14:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CF5B80AF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CF5B80AF2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CF5B80AF2
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:14:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1248055365
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Feb 2025 17:14:30 +0000 (UTC)
Message-ID: <2d4c7e01-6260-4d92-91dc-60fa61b25359@korsgaard.com>
Date: Mon, 3 Feb 2025 18:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <2955850.e9J7NaK4W3@localhost>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <2955850.e9J7NaK4W3@localhost>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XY6z1sBzy9qCXYuYbNQS6LB/wqVIKvjDXGGTKGpKaCEEr7nV7dPpwY5KbNq4XjvmJ5GMenWu6ekaKvT9cwL0j7JqFc0r5ZwgU2lB1XNXA5TXqPP4vZuRDU/NfyqmqbheVUc4xXXu+TqRYnoos4747z6Z38uGgudEJB4IdLhOOkNiuWZcAxfd2wdFZu/oLUix7s+cXmpnc/6KaLUMtmEc9gppaJZ89D3KYwI6EH2pDmeMxFF2apZO4+jdQEWyceIJmVCVtQvvH0F3/dgmVOReuQBfyqYDpxacMyeF5OLjrCGgsQ/XzEi7Kulhs69zwpmIZd9K+7XziXyqvdHwvwXNMw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=9+X7rrwH4E2KoY+zcOE0abvvKNvZQd0ebTaqzkEJiv0=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=XY6z1sBz
Subject: Re: [Buildroot] [PATCH 1/1] package/proftpd: add option to enable
 mod_lang
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/21/24 20:54, Mattia Narducci wrote:
> ProFTPD's mod_lang module handles RFC 2640 LANG and OPTS UTF8 commands
> allowing localization of greetings and command responses and the use of
> character sets beyond 7 bit ASCII for directory and file names.
> 
> Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
