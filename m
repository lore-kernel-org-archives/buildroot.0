Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAB9E7DF0F
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED5540B69;
	Mon,  2 Feb 2026 18:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztorQOZ4Ucqa; Mon,  2 Feb 2026 18:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 915CF40B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056333;
	bh=ztmu9iGrUoEgTuxz/R6DNhxTD8oI3PuvAA53GO8F2GI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1d7sbU5gkYIgJp9/su6y2DSL39O8eBBLFMrqt98HADmekUNuZAVzO5SWNsVk+ASC
	 iNMfpR2Upc/+0b16dhWPq51ot06RDDmVt3GY0IXGvwCWCAlu5Boy61d+5KsSq7JrhE
	 W7A+5MPYmXShJYxPIWB7dA5A/v5vGkLEyZ9KH09AIjJX6moEPydpyX8HqttAklh5bV
	 MAGlGdyCTjvra+fL/rTxu/fGX4JSLGTNriZcTHJAaIMv5NwERWFeHWKf7YWImiGn1b
	 OpnM2ETCFKfCVFka2lRNNDCmWCgOSkennfOKgXcNXERKVg8+xUbqZsKvYmMtyrmPPT
	 fH1QJO1SKcElg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 915CF40B81;
	Mon,  2 Feb 2026 18:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2109F4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A30BA40B7D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WyAmZ87zGNk for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8760740B69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8760740B69
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8760740B69
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -436717888; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 18:18:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmyVT-00000007RdP-2S7K;
 Mon, 02 Feb 2026 19:18:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260105194056.2156773-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 5 Jan 2026 20:40:55 +0100")
References: <20260105194056.2156773-1-bernd@kuhls.net>
 <20260105194056.2156773-2-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 19:18:39 +0100
Message-ID: <87ms1ruhz4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=OgJPY2TiVwTBIfIMkQ5jCsai7hG8QpYUFptWCdERwl6DYW5V1TCzvhMGZxBUpyLLTw0gjBfJFiGGKPKzO8tQlvyM7ixpsiaKR76C3n3GfYVO5ZxTWJduikB3Rq6caOg+ag2fOSCfya5C7x7e+sAnAcCoYQqDP0xyCvfuojCBw+u9MH7R6UixlMho4qMf6bfnwQ3dzpJfFce3Fgn1gKUHu/Vz3J/LttHbWq1aajbMVZemx2HCxWG96wsQXaChiJrKdu0g45Lxjo4OZVU+lGkxkKAVcTY66e86IDjV3n0+io1tKINQXt7lllAesYlO90X7gFf7OXAAEtB3jxW5plTadw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=dWkGMRE6oroyW0KaUfep7DgIk4FnydwIXv5XHOfxtGM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=OgJPY2Ti
Subject: Re: [Buildroot] [PATCH 2/3] package/dc3dd: needs host-bison
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
 > https://autobuild.buildroot.net/results/f11/f11b0b9154e9979f3f2d7ea84a019f7719565e8f/

 >     ../build-aux/ylwrap: line 176: bison: command not found

 > The build error occured already in 2024:
 > https://autobuild.buildroot.net/results/dea/dea779bbbbc08c7192f89073b93db768c41832f4/
 > so a backport to the LTS branches should be considered.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
