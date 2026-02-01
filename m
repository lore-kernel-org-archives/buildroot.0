Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5899E6529D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A76FB60BCC;
	Sun,  1 Feb 2026 20:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogH7udCdlExS; Sun,  1 Feb 2026 20:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D9C606ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978414;
	bh=FQy7aLve3WbKrZwnp80BLa4THIYk3xcUWJdGLkEtNgM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OdmzEvskQ1xGYZ/3dejQfRDWmhJzLxIxbVXaitgh0ciGh1j1mnpD2uiiiwKn6t/ad
	 xLUODaKThde6H7K3F8F0gf6CnosnV/VhsYneSseYA238nlz5z5ruXlAmOvzk2H+RoH
	 aj5GzhNBQp/RYQn9vGJ17mS0xJf10KVJaUBvlm6V9bCz5J9ntWxIyoVKsuMGLdX0d7
	 1ESde3Mj7gUw50Hn1n5RxR0vzCkkYuqH8XuoDZTj1vsObNRmArZpC4xntcUttvzmIf
	 putIQDUOvpAnmUl7XqYazze6O7Durgqy3a1SaQ45kBP7SXJ6pCiXW/oEoHx4LuD2mB
	 y14qskC3cSrLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62D9C606ED;
	Sun,  1 Feb 2026 20:40:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A18DE23E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 911E560823
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGRhbLeEsu-y for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:40:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C076606C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C076606C5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C076606C5
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 892242624; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:39:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeEZ-00000005kDm-0oml;
 Sun, 01 Feb 2026 21:39:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260201184038.3445579-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 19:40:38 +0100")
References: <20260201184038.3445579-1-bernd@kuhls.net>
 <20260201184038.3445579-2-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 21:39:51 +0100
Message-ID: <871pj49p0o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AdAn8/k2Pdu9wOA3zyOFlndriyeqZz2QgXAkFoRcMnfdRPegZtRiuDg9S7Bw8TiuLlr4Wh+G6Znqn9RGTrxQDS/hwYwAbTzgiYQT2NAlPjpKQGeNeNWKfrLJ6bW4Y1Hj0rgplL13doJGFZbWTXBNpY3ePuKq0F/uZeYCILgNOpINFdS6ZjU6epaf691c+w2zpC8KNhdYlmyk5+w+ods9ARd+DOERXU2YnXi4YjMeKbVLALhvxgAVAf8V4Wvbz/YTquPTOGk5hAtePbCFHb0zACwSptz5bTylihEoqPbNVYWhLkGqSGUt3Qle2YcauyfQdOC6kyWQ2XAxfG+ru7bKsA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=D3rqQuDT4cqc22jKzHTAo6ToDP0ZRmbzEKgEjgJvmWs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=AdAn8/k2
Subject: Re: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version
 to 26.1.1
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

 > https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.1
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
