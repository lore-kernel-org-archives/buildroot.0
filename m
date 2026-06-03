Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48DBCD6E6B
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6840180CD3;
	Wed,  3 Jun 2026 18:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzM8fE8K58fe; Wed,  3 Jun 2026 18:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4C080D89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780511987;
	bh=dvXuvGiZzhtgrEQMO/XeCHqzNvytGjxxfZfXu290v9c=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HK0pfTnx417N8XfHkp++3frE+/c6oohA+cw9GGlhyTlhkpdN6D4TkE4lRYivpkIfY
	 pEbwVfprt57nN72BQIXC6QNJucMEK6uXehKsOYGLzrNSnJXcuuDnrv2HLKgoHV1Xly
	 CO01qyrDuDJOVEs4BHfDhebyrba/GJjWRZTGbZR6qNq0mAkqLQvShu3Bnas8CabTzg
	 4YZV/1wsa/VLjg3eWr6T3J52aJpmpjdAao5Y2W16FjjEtbLBTrlRswOpeM5/bqqm1k
	 TFv2hwMY9oQO0Rk1wu+Ml0hpfKRiWaiFydd/+GyGoXKdnca/xiMuVIcWSwMmxPcgV1
	 mDP9aqTtKu33w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F4C080D89;
	Wed,  3 Jun 2026 18:39:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB692F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C93180CD3
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NS8I043bfA2Z for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 509B380C71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 509B380C71
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 509B380C71
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:39:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1013512503; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:39:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqVA-0000000Cei7-1Ukx;
 Wed, 03 Jun 2026 20:39:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260603174659.3517903-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 3 Jun 2026 19:46:59 +0200")
References: <20260603174659.3517903-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 20:39:40 +0200
Message-ID: <875x3zpixf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WauGIc1YpMKwFf+wGlppwznzFtQl2ibu6l7dMOvSpE2qKDb/e0VEs9WhcFbqUngTVPv2q/9aNO80keW7ugoSXRDJK3XQmxo514mk4KamwwZDvmX77GCn5HKHuER70INNpBWNUZ4J1nOxViqnB7Dh5+ZkD0gYgnk/j3vuxUG2wGYTU4GvlAYeD+iiYkVtb+wgYl4cz7QOdNy5ftEMUPIouD+pu7lv1/2nj0DvxOY3Q+fIk7Ns9Z2chqR5R1wo+ycCDbi7MZggZBJhrNBo1emVIA9cEXdH3vntQGWH1tUWZJeOmCwD5z+MQ+Fa6zNfxgL7FQnjNqTfA+0s19nJqWaY6w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=2nooQtVFf2n+xvKbGHEGOw1FBUIdKKVUBYhI9EJTxWU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=WauGIc1Y
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.2
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

 > Release notes of this bugfix release:
 > https://lists.freedesktop.org/archives/mesa-announce/2026-June/000853.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

> ---
 > Gitlab pipeline passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/0bf4938946641faea4a0c654fe7ce5527eb25911

 > I also tried to start a runtime test but failed:
 > https://gitlab.com/bkuhls/buildroot/-/pipelines/2574086081
 > "No matching runner available"

Hmm, maybe related to the recent gitlab changes. Romain, any ideas?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
