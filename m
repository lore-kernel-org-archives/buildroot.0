Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464AEE7C6FC
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 09:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F18581AEA;
	Sun,  1 Feb 2026 09:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnXtOuTdfUyO; Sun,  1 Feb 2026 09:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 119C881ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769937941;
	bh=qhsO80D581pYLW57DjkQ/jbsFnNk4M5TV8yEfGa5U+U=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OHqwwm/HLhQiRjxyvybr/nn+SFHTC4fV1fxBflNb7WrYlKQwVWSpyfnccwa8NSyv9
	 GPeccGLTqTVJhuyeom0noWZn4SsLiK46oBuDOWYSZi/kT562677AWb3S+tT+TqTqke
	 HBJpQAJ3U5wNpvHT4vz4e/C9TRGVXrFxbOsZpFJdOnf9DZYMfTGc0dBjtYGNFIzAfk
	 A3Xl/Qtr1XQOBDHJj/Yv1lm+lfTKMPrlmJDBAIENKz+Dc20gtMTD+dr22D+DK3Vw/d
	 OKFNh9RdepXLQ9JE657GZ5ohgwhDyFaZIvpIz6ZHGIwwkOsIpVSCMcMOZpS2QgQ0Os
	 KiYl/STyDlnZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 119C881ABB;
	Sun,  1 Feb 2026 09:25:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF10B34C
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC15E4080B
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBBFoeg-css0 for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 09:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E370407F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E370407F8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E370407F8
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:25:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1093904415; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 09:25:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmThg-00000005iVW-0YY2;
 Sun, 01 Feb 2026 10:25:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet via buildroot <buildroot@buildroot.org>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,  Biagio Montaruli
 <biagio.hkr@gmail.com>
In-Reply-To: <e55485db-18a1-41ed-814b-a74461665fae@grenoble.cnrs.fr> (Edgar
 Bonet via buildroot's message of "Fri, 30 Jan 2026 19:41:12 +0100")
References: <e55485db-18a1-41ed-814b-a74461665fae@grenoble.cnrs.fr>
Date: Sun, 01 Feb 2026 10:25:10 +0100
Message-ID: <87343kx1c9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FvzuDKGuluRek+7ScspNSphYjM15TMyldk9e0wmkTorA8otRAoQ+zLMueNaGWzpYepCrziCAn1xy7L0FxdXqk3c9FnPkdRCOvfpCqj/OeoluZPuy5D61pCHUR+42D5bkEDcxg+/4DXt2nQadjGqExpe1nlM/k+nEjO76EVMGxULsWMVLJRCq8gGt/EsvAWc3BRREXiTQF7yCa+NKnoYMhnXvp7pSGlyed/4k2iQi1NwXCehz3czyOy6NLhcOu6Im6Q/2qWf/5/f/r1U/K1rKo8Z1PW2+fUAUtI9X0w1ZIGBng8Kld53fSGLZbal9HZwWEzmc5ODi27r2BMiPLHKkXA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ZlFm3hKTk0OHw6Cc/ykwOh5BYOO0LPjrGLkQDx6ZeJM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=FvzuDKGu
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.18.8
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

>>>>> "Edgar" == Edgar Bonet via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
