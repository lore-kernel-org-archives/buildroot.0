Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD66D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78A468126D;
	Sun, 11 Jan 2026 17:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otiBKq18Ji5u; Sun, 11 Jan 2026 17:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4067C810A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152249;
	bh=7EpxD955gYiyV6s1EzzHl5Za5ei9CR0IzF2EMNS6YU8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UfbMgIGpjpWIUhyBRvIL1y8nCIn+KSF8LeZL0NxEfi2Jou/9JHndbIEmI+lWvW2iy
	 7fDLiNBZczd4ksP7P7NS5DQUZClLYDSUKXWyzSTCCA5YEk0ZGc0g7EF7nNvwfnD5Hj
	 sKakWVVkjJXtp6GcX5LZLk6/T/sjqRWnLYul5q0wbFq7INFVbw+DRJjjkPnTDfIbvf
	 HvPAqGQkt+hjwF9TUDUXdabg0j5nRbRzWvaVUF4LR4oe1WTpyPzOf0Ind6mfWQFBpv
	 91hjzsWh9DCgmlGr68BI0CK04xfaex1Ob3mJJnDf9DE4hhS54X9Ob+nmMKMMEAMIRP
	 1Ni7bvVBy1byQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4067C810A2;
	Sun, 11 Jan 2026 17:24:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C6F18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C47D66085B
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SaKeqhaXvynx for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:24:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B54CD60781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B54CD60781
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B54CD60781
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:24:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1311598155; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Jan 2026 17:24:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vezAX-00000006stc-3b3U;
 Sun, 11 Jan 2026 18:24:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260111132505.135161-1-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Sun, 11 Jan 2026 16:25:05 +0300")
References: <20260111132505.135161-1-fido_max@inbox.ru>
Date: Sun, 11 Jan 2026 18:24:01 +0100
Message-ID: <87fr8cysem.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=o2IAdBSQQ+ztwOQQnESKaTYYbDB0rYUqIOf2e7JSUM2VXYFvkvdkk69naw6O+rIvI3rUXH/KZNtvcv7pMbRflMxQxsK7p9vbu1/4WqHfn+gVwaXQ/SiuNNEQwapzFlChVsh4aZuUyz4XCSNdAvCC1GMSn/rGXA03FdgOND6+c9cfVNuPKleirqpvsm1vGY7eJzg9iTedt7eQTGGOATizPIIA9Ms2GvLt1OAGp9a5aY3ND2ATgoKJS3B/dnUJJlDy6o8DDfFoDvww69MlGbTUkjUfOFeJbigAua6te+2HDWv+VnaxqZlvegB7JEDvaa6f0ovAGHgZl40KIjPfddaXlw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=HSf4flZhrFnRquKraGSM5TY5mpHckFgw/fzgRxyO7vI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=o2IAdBSQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.14.1
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

>>>>> "Maxim" == Maxim Kochetkov via buildroot <buildroot@buildroot.org> writes:

 > Changelog: https://github.com/libgeos/geos/releases/tag/3.14.1
 > Drop merged upstream patch.

 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
