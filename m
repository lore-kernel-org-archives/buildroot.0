Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44330C43602
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CC8B4194C;
	Wed,  1 Jul 2026 20:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50-MqMy-xfFQ; Wed,  1 Jul 2026 20:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 412904190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936301;
	bh=tbp4dEko38/cJX2VY22YNCDpVkXLhhFE6/dGq3Jrwo4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYoY5Fkzzjw6iQ912svR6BFwZmEpmynS+LSxqvllcJXMleUCmLB8yEJjybZ4Xrk37
	 EcVXbEz8M5fP5aKtjDMqHoHg3EdzFuT1g1LMtTIHvDDcVTl7HzI3udl+RXrSR3uWNf
	 zNlv4LQBJKZAOsS9BVTwUr0LcGDvdb8ex/1XQ5RFqCMq7ZtVVD2Tp/cmcBiBgnlzpi
	 q5WLtZh4zxF3YcATCVi0JZsZmdDbUmRssrUQJ4Zmn5L/iItpHlzue3U3NgGaTxrjmS
	 KoKNopbaZOWeY1RJyUcO4jm1OqQVeLg/HNy4IJCIhL6CerRJm17ef7Xwt4Tf6Jmp8L
	 5RGfPhZeqZn5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 412904190D;
	Wed,  1 Jul 2026 20:05:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD893316
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1E14190C
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njRafPcgy8ma for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF5DA418E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5DA418E7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF5DA418E7
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:04:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 792870455; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 20:04:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wf1B1-000000032iP-216j;
 Wed, 01 Jul 2026 22:04:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  linux-amarula@amarulasolutions.com
In-Reply-To: <20260625123447.61478-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 25 Jun 2026 14:34:47 +0200")
References: <20260625123447.61478-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 01 Jul 2026 22:04:55 +0200
Message-ID: <87bjcqqxw8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=uarH9Zg0+98fa0lLd7/XEeVSYTcGDVbFv+A5kRoKCZIX2EcTXAQBarDo+ztfDr3UyVn89QRAM7knPZMKQ3cDjApahfHdWwwhXO26hTe9AEIeFNTvMj5UjnE40ZVKB225rbF9/9nSJ2H15MaXBE/EGlEvYHmsuqBZRs5kkF40Z2ivpdooVO0tF47lwTjYVCUKV0uFQZ8brH0asKxgfUpx2EYywOZjUi2NCSw+Aqhcmd64o3Ho0Liv1INBc4JaLf2dazPomqDY6E+/hYrMkj2JiEVfOcJfCiojXaGvhKFt7MktuJm0xCLKgj4H7KOUBYUDlhg7NcC+9j24eR92rbJV1w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=hh3+gcaTSVQA3cIAY0g5UWA4NtSoMS3rlRxeUFfQd4k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=uarH9Zg0
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.4.0
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > Release notes:
 > https://arma.sourceforge.net/docs.html#changelog

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
