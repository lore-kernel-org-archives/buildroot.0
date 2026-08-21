Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F12C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 14:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348CC811A7;
	Fri, 21 Aug 2026 14:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH9kSnZ52cMs; Fri, 21 Aug 2026 14:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787323658;
	bh=ztrkD7czVGgVoqjl44dMQ68qFydcy8jGghB6OZt6Vh4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARmqoG4KOEuV8g2FDaXNXUQJjXr7Zh2IuMefTuO4TcwkNPjkcRxDR90ReF3z0g9Oq
	 ugsU3cyKg3FR9yeYb1vN1wAQJ8rdHm4LYZg2YbzPnyYjPodb0D8sQJzggxgkAsBCCl
	 Fg/cWOmDQmqZY5UZuVAP1FY0t5UR5zjEvnY50lpV4KIqV08GxxcAufNZbK4anBDMTa
	 D+DhLbgifafAB6rrrO4OJhSXi/CqxHR4PpCe1LuuFkDxMtY6QljSADdVf7X3gxqlJf
	 QHgcDTODNeSXnj7fVJ9p0HLaRzljv+Mxobs89HRwATDy+NY2vzDv6nBl0dgm3J5BtT
	 6MzEkbs4t6CXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA24480F67;
	Fri, 21 Aug 2026 14:47:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC76336
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 14:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C8F980F67
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 14:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKCM7hLCvmHU for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 14:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=HTOviIom
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7407980F29
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 14:47:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HTOviIomBDrrbswCvFJ7QdTx27XmXN3SW26ayeaOhe/mYF5b/s7h47i5HTQHeGg69v4XDpSlNwS8vblcxYvQCWuhgNTUMk8XqgrGrwC7/zLP3mIewAtxB5fA6X84AQnTeNnl6nz6UJQU/YVCsJAsRQ0VribHOoQTIaX5Ylv3+z170AfhSwgE9tFthevx//ARtQDbgU3aAEpUDJ4MaVuJVPc1e5jRM0G7dgo7JJHt8B8zH3IY8pFarFOaICC7n9dEyilolYrpNriAemo2dOf8l6mnNAPFWn3CA8hVVmuQ40n5asvPI6JTjFHMaJYRK3UdGZQTM2xF7/ICb367PFTB5g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=5tRJ6UdfwfUqcbqNw8XwTpqfqPcS/wBZ/7Hqgcdsli4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1702845494; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 21 Aug 2026 14:47:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wxQWq-00000006Xcc-1REm;
 Fri, 21 Aug 2026 16:47:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fred Lefranc <fred.lefranc.evs@gmail.com>, Titouan Christophe
 <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <CAGkXw1U23+yWPktkA2Sk=+c0Prh4M9mJvhWERPJwkri6oO2=Kg@mail.gmail.com>
 (Fred Lefranc's message of "Fri, 21 Aug 2026 11:49:40 +0200")
References: <20260817140122.27796-1-fred.lefranc.evs@gmail.com>
 <87qzjw6cd9.fsf@dell.be.48ers.dk>
 <CAGkXw1U23+yWPktkA2Sk=+c0Prh4M9mJvhWERPJwkri6oO2=Kg@mail.gmail.com>
Date: Fri, 21 Aug 2026 16:47:32 +0200
Message-ID: <87zeyf7cor.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] packages/haproxy: security bump to version
 2.6.32
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

>>>>> "Fred" == Fred Lefranc <fred.lefranc.evs@gmail.com> writes:

 > Will you backport it to 2025.02.x branch also or do I need to to
 > request a patch specifically?

Normally it will be picked up automatically next time 2025.02.x is
synched with the fixes in master, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
