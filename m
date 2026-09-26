Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3481FC9832F
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 22:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001A86067B;
	Sat, 26 Sep 2026 22:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHGS3zBuwU4Y; Sat, 26 Sep 2026 22:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8C49560666
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790460878;
	b=D3On5Gqn6o5Fj6fJSZNLkYevmGRmoiiZqOPP4JnIrH/f6yKoI5wBN/zNZ70g4Jk3+fWN
	 fNuDGLDYm3orz9MdoKVn7EN7VEIrTkBGfdNu2fZSiSldhTMC37QMWbU3LBlsH3eEYzWxx
	 wuKKNOGDUJevbHHnyL7sa6XNCpH/MjvB4TyycHGfC39b4t9s+kO+I9d/iS9+C7NEjORMC
	 Jj0TgkCzsnq/qGlXkS6lTlhGB0tB8Ap7jKtZtUIizsUhzs9Oo45P5J0q9zSkwFp/DkbWw
	 /R4IFxE4c/gV7M/4s7+9QIj/4XZ0N0K4cCJxUCwd5VkWzVLDmf00yvxaORnMUs5MBrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790460878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XAt7TjIK1LL9+F0gdY82wtILDxAI3BWW2Ks59IIwkDo=;
	b=HhM3cechMPK3dsqv6Haa3SUAWW3u7c4ymblWdgwXK1PwybSeMf0TUlFIY51vUJgnIXEe
	 U7yB7DaoLJ+OYz4NZ13xJnFl/4p/pCf1590RPf0craKnfdE6jKUc0EQMBvB3xPMbW6ZBg
	 u6Z+pR2pNtSsEHRYP9U4bHtgLFciX52ZTID7Ud2Bp+kfJtTiGw7yz9XxtR1WUueMlbwmS
	 pHYoTRhnFsp11UrbYub3BaHpbmpEu5ciy31vH+AOdMVr39ZvZwNSZsdSvnj+9GEgj+zFE
	 DdK9wnjoaY30FrhIhYZt0qOqcexuhXhfzpz3tn7BAHDgRuGSG27t11cJ7uyhEk+0K5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790460878;
	bh=XAt7TjIK1LL9+F0gdY82wtILDxAI3BWW2Ks59IIwkDo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZitMsLqYLffJC+SDABe2vkJgjKset6Lekomk7NaKt/S5KRyTQoVIWvE3FrLaapYO
	 LRHZFbSTdSFXb+502mktwMS6dySE+AjSqiZhfJZUYnn+BZ7Q22awd6kuapFbBpPvoL
	 KpebjqwwWj4dw+Wug2mBm8C9CoHY1B/Qxrnyn3QxxUW4JCxasNTesKyKR+rgN7MpdK
	 A40lJ4iAWiR8KrWmpkjkaZ+jXic8ZqmHuw2AzkYOlzklnJOOAfRDY4ass6HdL2gwKE
	 dBXUR4PmKAM8hz4BMmAh31/hXYZ3tnWoLDA6+DNzyOZ3XLAc1ae6s0qsIqbN0oBjMT
	 J8gzCQOUJ9m1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C49560666;
	Sat, 26 Sep 2026 22:14:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00DF4D1
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 22:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB5184005C
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 22:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3BZEsTCEZTE for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 22:14:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D9E9B40073
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790460875;
 b=nI8B8w50crPk8WEiZAEoEKw04LB+YmbAuMrL0InrgZZC1Uu2u8Hz4AVy58Y3PqqHwjFC
 fTLEB43h+Zr47TvqCIp5wEOAWI1VqHi5NryMtRhRHuaSeg+4XqYRiDKqQQh1hhs4HLe0l
 12CWb4LPiorhgHiJDSYQlFIMh2gwCYUcv92qrZpixX8lRBf+YXH5oXy/6pWU6BND7iprS
 68AEmEp9a9o/1P6Z9w6xq4luiNGlyLVczfOSstKSu/qhZXaY31QZ1rvqLFqx55IvWe+BH
 t7AdwyVBxBHqoGT6nAVK0iTIXa/9hAL5P/wyV7bNRTYI+Mbn2atJqGAUzuet8UlpQlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790460875;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=ycrNH6DEdr8EV9bazQm1lx4CpzL9A6Wg8zAv8rzj3cs=;
 b=W1BU5eu2vbXvydzqWIomMnahWf10Q+DXuDTDOcqSH+/bHjd3NMHDqQo9V8iG94QH15HH
 5NbqJkRBJxpzvYCwSqlvPMFvCEt7dXjAEyRmzfXwL3n5cdeDebh3jhWi20lxgbpQxfeYQ
 iQehIa4i1h9La8fjQFw0HvlgyYM/Bpt1L2eCT9qnDJFX/+pXPGMXes4r0ZDK0Jx0snD1E
 oL4V5h+nmm8tMUSy9G7Nj/Tf1avo8TN04xeiqhmw2XxpB4h+kR1CSuXySpo33Ykwrwy42
 BT4s/BcWgzWdNrHS7EnZYNKVKtkvtt6FkdD++jnd83zq9B3tPAVneWAZb5kYZ0uvWhA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=VLmQzwi8; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=VLmQzwi8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9E9B40073
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 22:14:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=VLmQzwi8yLpuuH/mWO6HGYdBftdWqdd0L0jCqvJOhzUAGL0zZ3B8phb77Lobrl9hnaBKNCyB0ZvC4+3Gk4zOzjF9Sd2AstwV30o/CIWSQ+pgHRL/IQDemFXsOL4I540SPqqJ+nbhHbsceT9ArU3tU1lYn87N6QnaNCfC8dYkzuFTuudu+sk+5U41OxjOQh6JG4COZtry4jE1Y4M51VKclsIdNNYxTEMREX0n5p9ce7uxlMA6wwhQV/LuCYJ6kfn6pEGubQgtQmtweMuVTiYzU/u1sMPsx0k5n0NvUb90YgBlUrmf9UdR48U8e6vV5DUexzR7nHy07NoYf0Kpkso4RA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=3H7r5XnYwmRHLS6o4wLb6KQjR09eqyoMcoSaJVbXKYE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 888122592; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 26 Sep 2026 22:14:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xAaf8-00000004Je6-0GaA;
 Sun, 27 Sep 2026 00:14:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Javi Merino <merino.jav@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <aqrtmYhvhag_najL@einstein> (Javi Merino's message of "Wed, 16
 Sep 2026 20:29:04 +0100")
References: <aqrtmYhvhag_najL@einstein>
Date: Sun, 27 Sep 2026 00:14:29 +0200
Message-ID: <875wzr4q4a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [infra] Missing tarball on sources.buildroot.net:
 gcc-14.2.0.tar.xz
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

>>>>> "Javi" == Javi Merino <merino.jav@gmail.com> writes:

 > Hi,
 > It appears that the tarball for gcc 14.2.0 (gcc-14.2.0.tar.xz) is missing from sources.buildroot.net.

 > Could someone please trigger a sync or upload the archive to sources.buildroot.net when you get a chance?

Done, thanks for the heads up. I believe the reason why it never got
archived is that we never had a Buildroot version defaulting to gcc 14.x
while 14.2.0 was used (and the mirroring logic has issues with "choice"
selections).

With that said, you must be using a quite old Buildroot version to use
gcc 14.2.0 as we moved to 14.3.0 back in May 2025 with:

commit e9227311d9a63c9a829316e2ffb91cb70ed127f1
Author: Kadambini Nema <kadambini.nema@gmail.com>
Date:   Fri May 30 17:22:16 2025 -0700

    package/gcc: update to 14.3.0

So consider upgrading to a supported Buildroot version.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
