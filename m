Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A263CD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 14:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB89C45FEA;
	Tue,  9 Jun 2026 14:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhQP6pM9ppfd; Tue,  9 Jun 2026 14:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D4B42275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781016994;
	bh=zZXxvktiOZcRGwEEhdh/IGglE7drmkQFZhjK54KdrU4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GXr2ATqt1UrXq8Libb40rBDB967sLDCg33k6KIq4GaTjKPkXxQ3/4Nmb99TPbIY+U
	 yBQOZs6IRVajlAASzSSvaiUG9NzmKLgpgmSQaYT9HtFWl7bIcbwblZ/MhOFPrN0gun
	 aV6Ygj2R+sx2B3+CfT5XmumZtkvLNyQ/VTt3zALbfhXG1IlD4AAoFdZnXu5PkOKWYr
	 eRutF1x+eBnSjbi3GvJLoZOyH2FPNsP1DM8Ez9JlLNXQk5LKwFQXQ3lrz1Zv5aEuV+
	 QdJENOIw2Qc2JthB8hSkLTXAH9Lscx7IXRtF0ZNg5RZ+tSSIbVAoLE4nzRN0Ok+Uhz
	 fWMgYr6bPQkbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D4B42275;
	Tue,  9 Jun 2026 14:56:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3194A2C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 14:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 153FB42751
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 14:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpHxK8t2GpSy for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 14:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5759A4274F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5759A4274F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5759A4274F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 14:56:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -72176899; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 09 Jun 2026 14:56:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wWxsP-0000000BxGd-0tXW;
 Tue, 09 Jun 2026 16:56:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  Daniel Price
 <daniel.price@gmail.com>
In-Reply-To: <20260608222601.941724-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Tue, 9 Jun 2026 00:26:01
 +0200")
References: <20260608222601.941724-1-titouan.christophe@mind.be>
Date: Tue, 09 Jun 2026 16:56:25 +0200
Message-ID: <87a4t3pxt2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PpexyU1/rBjgR2ItjwPw5DV617t7Bw1OwtCNtib1APERuEqiuaj0r3BxG0Ji4978bhuOjvpSf58aK94E5ILC4C9U7bkMdQcuh3XLnzWlqvIEFGsJpg8cX4nX2H6i6ijPx3dsY/KcXaB+BzIyuJlheAI7dZAL53kulJN29CQAiR96tuRkYUle+z/eEtuhAr8qzjwRNVGAnxjPV0xN33h4Z8NzK85NZZbwo1Zcf53lc+EBhEbQACAbyCytWGfyI1uAAzAMO02SgYvh7Kwyf5jLOscCSKa5VfrShZ4PkgBqeG0/FQgjzNyqJ3EfvzDh4TZGXzO0UMLkGgfaMfFEJx6lew==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=G+jF0kw4n3P2thCsVUcPJgih2PVeymX7le+WNcuJd8g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=PpexyU1/
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.6.4
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > See the release notes:
 > https://github.com/redis/redis/blob/8.6.4/00-RELEASENOTES

 > This fixes the following vulnerabilities:
 > - CVE-2026-23479:
 >     Redis is an in-memory data structure store. In redis-server from 7.2.0
 >     until 8.6.3, the unblock client flow does not handle an error return
 >     from `processCommandAndResetClient` when re-executing a blocked
 >     command. If a blocked client is evicted during this flow, an
 >     authenticated attacker can trigger a use-after-free that may lead to
 >     remote code execution. This has been patched in version 8.6.3.
 >     https://www.cve.org/CVERecord?id=CVE-2026-23479

 > - CVE-2026-23631:
 >     Redis is an in-memory data structure store. In all versions of redis-
 >     server with Lua scripting, an authenticated attacker can exploit the
 >     master-replica synchronization mechanism to trigger a use-after-free
 >     on replicas where replica-read-only is disabled or can be disabled,
 >     which may lead to remote code execution. A workaround is to prevent
 >     users from executing Lua scripts or avoid using replicas where
 >     replica-read-only is disabled. This is patched in version 8.6.3.
 >     https://www.cve.org/CVERecord?id=CVE-2026-23631

 > - CVE-2026-25243:
 >     Redis is an in-memory data structure store. In versions of redis-
 >     server up to 8.6.3, the RESTORE command does not properly validate
 >     serialized values. An authenticated attacker with permission to
 >     execute RESTORE can supply a crafted serialized payload that triggers
 >     invalid memory access and may lead to remote code execution. A
 >     workaround is to restrict access to the RESTORE command with ACL
 >     rules. This is patched in version 8.6.3.
 >     https://www.cve.org/CVERecord?id=CVE-2026-25243

 > - CVE-2026-25588:
 >     RedisTimeSeries is a time-series module for Redis. In all versions
 >     before 1.12.14 of RedisTimeSeries, the module does not properly
 >     validate serialized values processed through the Redis RESTORE
 >     command. An authenticated attacker with permission to execute RESTORE
 >     on a server with the RedisTimeSeries module loaded can supply a
 >     crafted serialized payload that triggers invalid memory access and may
 >     lead to remote code execution. A workaround is to restrict access to
 >     the RESTORE command with ACL rules. This has been patched in version
 >     1.12.14.
 >     https://www.cve.org/CVERecord?id=CVE-2026-25588

 > - CVE-2026-25589:
 >     RedisBloom is a probabilistic data structures module for Redis. In all
 >     versions of RedisBloom before 2.8.20, the module does not properly
 >     validate serialized values processed through the Redis RESTORE
 >     command. An authenticated attacker with permission to execute RESTORE
 >     on a server with the RedisBloom module loaded can supply a crafted
 >     serialized payload that triggers invalid memory access and may lead to
 >     remote code execution. A workaround is to restrict access to the
 >     RESTORE command with ACL rules. This issue is fixed in version 2.8.20.
 >     https://www.cve.org/CVERecord?id=CVE-2026-25589

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
