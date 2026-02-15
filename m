Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D6BEF586D
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 09:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B63D340B12;
	Sun, 15 Feb 2026 09:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boWpG7umxTCO; Sun, 15 Feb 2026 09:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 543F0408A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771147059;
	bh=E1tP6FqmhpyL5zajccPljfpP6zMPSHqo8eSNA8KuhwQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c1PK4cDqdc2++H//laWu3I5Df0drJAtcFXdou+61BHrFhW+BOLEpnKoFjZMtiYf4H
	 vn6ZTQQPdt8hfozrjqNARcTZ6JKGvPLELNl/70dKH8wHyiccJtZ4Kb4jUfJMNdF0Z/
	 tdDEcjh0IatmcxO6XFyl9hS8sn61byA9icfpE04vFk+y6ALai83YDLDFCoAyXA/qGU
	 lcsmNEb0X1vQbsQ0pOF3PE/fhJdBO06KIyLpwsOWFLLg+1hQaPOV2RjvajgyrxYbdH
	 rwP2KHbt97L72fMJPR58uIVfr9lk8CJx1VcqQLhzFeuIdIXbkc3qDDYbHYap6ZHjWb
	 vHxI0FAzAL0wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 543F0408A3;
	Sun, 15 Feb 2026 09:17:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FFD331F
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53F734035E
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id An5ScS_ZgGnD for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 09:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DC044003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DC044003D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DC044003D
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:17:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 307842524; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 09:17:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrYFs-00000008cuR-0gVH;
 Sun, 15 Feb 2026 10:17:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260211183047.216472-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Wed, 11 Feb 2026 19:30:47 +0100")
References: <20260211183047.216472-1-ju.o@free.fr>
Date: Sun, 15 Feb 2026 10:17:28 +0100
Message-ID: <87fr72pdqv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YvxrDBv2qBJ4SGFY2xv1Lomo9x+M/WO/c8XSvarTdZj8t6HmxpuimR0G/yVEyeSo2RVFvwdv6z08/v4MbFsdxEVPdJikZ6df9tFDkRnmIsLJer8weenLizjp0X0CO4Rt3yofLcAFvA/n403qGF0KjsdWKvUhQr4OR07qs3aYAnAM2AtmM/OzXOoUKq3cMfTt6UHyXBUA1YASj7S2PbVZH+7ttLmgiQzMcv0EvP8aPAKlpdNY9vMrNJr3jarS7XkT4itu46be1hle5Dz1kIw7P+ny4oJMXRwfwWpeMqMk5PI3BRVmrGwyY9mKXeyeLj0AFUWxNJO0JvL2QuJuxyR6xw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=w9ZySJLGuFeFjCZSgV+fgrhE1zpFmolGGk6aHqgKQUU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YvxrDBv2
Subject: Re: [Buildroot] [PATCH 1/1] docs/website/{download,
 news}.html: fix date and url typos
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > The Buildroot commit [1] introduced two small typos, while doing the
 > updates to announce new releases.

 > The version 2025.02.10 release date is 2026-01-20 (and not 2022).
 > See the original announce [2].

 > The 2025.02.10 archive link in news.html has also a missing dot.

 > This commit fixes those typo in order to fix the website.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/21dda0665e5de8ddb2a09f199679b2c4be1384fc
 > [2] https://lore.kernel.org/buildroot/9b9654f8-6cdd-4108-b932-79509e455148@rnout.be/

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
