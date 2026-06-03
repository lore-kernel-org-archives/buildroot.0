Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39FECD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7700342871;
	Wed,  3 Jun 2026 18:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6J-HqbEAEvhH; Wed,  3 Jun 2026 18:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13840427FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512634;
	bh=zQe1DGiERKhvo+lvSoqiR7RWWDszUEq8D/Bf81BWSN0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VPgMtrqBLUXWcjhTBqfzc54kv6AJdM9+bXwMu66kFc5CDrfIPF2BNC4cOcxahpah8
	 /V0FTsdKXYD3Rl9eb6OwKJP1cRM4G9uQdl5d4eyo17q1dLSZZmrR7H1TwEmDJFWDGK
	 LN9lAez8UNYO2qUByYNrZBcuTVvOJJJGS7UlxRvFKUPKAPXWc0O9RrQX6aoo4zmvDC
	 56muj4/CfNweZn0j2iRzEVYQ2LCQ0Cg3+o/hSeYy4oy74Szl3/gv/tuZJciFnYMwUl
	 9xiMHUWMEL18f2kPtEFalKCKxKtAQNL2ZGpoRR5Fz1ulIyk9lfVRGYqXQf9wMV7ySo
	 hvjdiKFV/5n0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13840427FE;
	Wed,  3 Jun 2026 18:50:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A0222F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BF8361AED
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALhwRygFdqts for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27BEE61799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27BEE61799
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27BEE61799
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:50:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1466192742; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:50:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqfS-0000000CfyK-1R5Y;
 Wed, 03 Jun 2026 20:50:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260602173804.1630604-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 2 Jun 2026 19:38:04 +0200")
References: <20260602173804.1630604-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 20:50:18 +0200
Message-ID: <8733z3o3v9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dwOECbN0WlBO9vYZvQgAIbQUfiIoJX5cZWGMnKygVDtinZbzvFfRPnDvL2bWVPQ6BUBLkJeLACTeZFUA1c9UoHUZKsRkpOAHXD7vfaXbt5BQoqll24tFsTKGnjeM1nM8Ajbm115XuAF69enVFTwkrtX2EbgStONq5AWybh4DGDy9a7ghAn88EFobo+GNQcHl5xF9jlzEs6b6JF+m4ZcyjXLT2A2Ea6YH3Az8TuQmmQtY3LfLic3/6aaiW35tGJ0v/NMwoXSiI5TN39CHSSqoqSBUACq4nqiPX0N8OpVPyKxWo1fNoyCi04kmT5n6aYzrErCuUmkpHVLpvr1M92z2Yg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ytxQda/maQCIm39Ufh84r78mfM4Y7WrJVox1EmBcz5U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=dwOECbN0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/stress-ng: bump version to
 0.21.02
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

 > https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.02
 > https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.01

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
