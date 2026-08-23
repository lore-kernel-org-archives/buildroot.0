Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE567C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1499B40649;
	Sun, 23 Aug 2026 19:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edumYIcq8UCc; Sun, 23 Aug 2026 19:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787512814;
	bh=CO10XXk17AzkVKXdvXwz0s0pFbf00mNT3JPWONCrI9s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oV45kmOQB5ZMYiNcwwtJdtdq3ZfR6J08Fc0wLQGukTvFrG/gq3UHYA0zF/8ilEDkC
	 yZz1TR26U52W3TQjKhX1v+JSOUWsIfCvDwkqUCirckP5j1Jw1rebYUVSwY+ILzrzaH
	 RtmoZEzEA26WvWJnbOi46hzIDHuecXaGni/XZ6AW/w46O1VQwrpS2IvJ5YNLktZ3hU
	 JW5yt2MYBwsPQCcnzvxsOe35N7saUwAuWrdytXU3yZV8Y37+6AhySgDMumbONRaXTd
	 9UXmEHisFadUWhClT21tcAp/G6gMMuGn76I3UNofhzBQKPJWEYpPeyLnDyuW/33OHG
	 8nH8eyukdknog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26AF140611;
	Sun, 23 Aug 2026 19:20:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 270EF386
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18CAC606ED
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9sBpkziYRNy for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:20:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Eu+9ypS/
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3503E606C5
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:20:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Eu+9ypS/l+eZdkJZerfvaEinSt0UzNG734xG8AKBrydJQUGklVn7+k0xPhScbgiQ7TeLTCRpYK3TCfeNhI0vCXMKM/f06z3V72Ywt8YNgvfzq00aLZN2+DPyrAt8K4xwUwlr7Y/MmU+V+MpykGfGx/6Z2J+dsTDCCQWYuUrHhOR4XoEiQP6CzTEe6w+IFOtuS0BWfTAmK3ky14nD/+V6PGzL6iXAln7v2BwZaaKBvX5ag/x/FN6nVAo7X8BpzhJsziEZKMeD+L86+pNFhm+pQzR7eGeNosKxLig9rhqeXQ7Orve/klERe9XYGZFLZ3xDMBsIitBZyE/oCOCDpYdHZA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=JLtTnwJt1URbzDBaXhau9CradGp5nbjldXUlLbmP6AQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1344810245; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 19:20:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyDjj-0000000ALII-3Tus;
 Sun, 23 Aug 2026 21:20:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christopher Obbard via buildroot <buildroot@buildroot.org>
Cc: Christopher Obbard <chris.obbard@oss.qualcomm.com>
In-Reply-To: <20260822-wip-obbardc-change-email-v1-1-d78487afd04a@oss.qualcomm.com>
 (Christopher Obbard via buildroot's message of "Sat, 22 Aug 2026
 17:42:51 +0100")
References: <20260822-wip-obbardc-change-email-v1-1-d78487afd04a@oss.qualcomm.com>
Date: Sun, 23 Aug 2026 21:20:07 +0200
Message-ID: <87ecfod4pk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update email for Christopher
 Obbard
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

>>>>> "Christopher" == Christopher Obbard via buildroot <buildroot@buildroot.org> writes:

 > Update my email address.
 > Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
