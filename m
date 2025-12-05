Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85805D3749B
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D3F6F4AA;
	Fri,  5 Dec 2025 20:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaALQ5LkSPxj; Fri,  5 Dec 2025 20:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975C860856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764966547;
	bh=dHMcUYnLwOprk4dw0BjaqvKEqgJ808VatYy1f89GZZ4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbr4lQioOR0DO8QfWzAKiuTvP4FfLv8wcSqv+sCt36L8t2fMxtTQ/Mg46VRmT8t0C
	 jjs74wVJFeFULtZ8H2a/LFwUlCMnTjzTyvaaGZqIihjGMWaJUuzXQa4nfiBa4H5ct1
	 jIRw1TQH7Y3aC5iy+udUUoAiRfcyG/dNToTYnOLJ3gvlsxf7OFubYdR7eyGkBFDNez
	 Fw9aR28oD4tCw3YWfus2qrXwDIe5SntKWZKyc/AAd2aMOfEGWhEdPTf7AWs3FpV8eZ
	 whlB28MyZ9RuHUDnHuXHk9GZpyldkRasUoC79EaRcGKo7cg4EQoK3AsrUaLPOuvmTP
	 vceEO2qOHrNlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 975C860856;
	Fri,  5 Dec 2025 20:29:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1AA01A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB2A84C10
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2uU2YBWgThg for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:29:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D29C84C0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D29C84C0E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D29C84C0E
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:29:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 230468925; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Dec 2025 20:28:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vRcQD-000000028Hv-2Yee;
 Fri, 05 Dec 2025 21:28:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251203170333.1769022-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 3 Dec 2025 18:03:33 +0100")
References: <20251203170333.1769022-1-bernd@kuhls.net>
Date: Fri, 05 Dec 2025 21:28:57 +0100
Message-ID: <87ldjgekqe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CR3tiyk8o84TX5RL+10HRVZN0Jb1qYhRc5vW6xe0FuJ7lLD8GgMp7T+j/vQmKtrAwq+LuuovlCQymOf7IyZw4xesG17dzeK+Su5vHDx1C2kfWTJKWtC0l6AOcqHWqCAwOHly13W0kT9QTztwwO2CAlhj/iqgIEiqW1DEIKCUPC5Wi7C0/f3HRFb0JEG+IK1qIE+eOEyq41bgR20ULhQa4r6J4KelmvIOm9Ijd34Nr+/xL3de/q5OZsUkMUzbAYcOEAQ2tvC8oyPqjhFCQAio1PEGkzrKXXKRcmJ9Npw4T6fNJEaAxtR7aB2eKv0iw/XVYrDAzIF5yaUBfyXKd2/v/Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=fxj0ThQLdgxL4Vy01wytNBZ4zbHFQthH1Zj+cqRtNzo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=CR3tiyk8
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: bump 5.4.x series
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

 > https://lwn.net/Articles/1049060/
 > "This is the LAST 5.4.y release.  It is now end-of-life and should not be
 >  used by anyone, anymore.  As of this point in time, there are 1539
 >  documented unfixed CVEs for this kernel branch, and that number will
 >  only increase over time as more CVEs get assigned for kernel bugs."

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Maybe we should drop 5.4.x support then?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
