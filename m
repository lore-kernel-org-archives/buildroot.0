Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885A5C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D92460614;
	Sat, 12 Sep 2026 07:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxHLIxGUpvXO; Sat, 12 Sep 2026 07:39:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45FAF60617
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198774;
	b=dP/JjQ5jx3kcMNI3N6lgtctW54y2B93j8pVQW2jZ4PyT9I/CztlyuSkmyswIQEMofg0c
	 nwLAdY2BO5RtFwCbhjn/9cKVRV4HadahhvAmlSlfBP9SpCR73ykrLc2bPDZJKb1Ow7cNE
	 8p0X6wW8433mgFi4NML67pKpCcWimO39JGNvATyzCJQX7FZYIPpbXZwzRj5ytkoN1EQkE
	 tMaPeSGU4uCJjHgpozyWZHM6an1G/2OdnPUdGWrQ10UoE52ZQngGg1o69ZMRp0BRPyFy2
	 86XRgTA7yzmoAHt6+/8DGsR/MMuZyw3jXedmCS+8MvqB3oaCgWfrH05yX0PkI4ZXxiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iu6/BTtQUvHdYQny3mKRimIiPYl1oqGc0apJkVwBQUM=;
	b=j17jbeFKpInf5ZUBo7goQAPdWMzNFlnX41qrGaAhZ+ZKKch/NeGK5NgZ7ezuC6kNpxvI
	 F1uUKL9zbUObc3TmXqgifgSs7+BVLaVcinGzBR0IPCmy6Ajrwf3lknmrhboU4E9zKRyPx
	 WO9LwleDLq11AeXPTyQJShtp+Czyovta3fpppBx6rgMmg3GshPyuacMC1T+Enwnaa4Dzn
	 dI84P0UDBb+CapGvFyFqnhkl0YNM3eeIg9xtSfJA42SWOyv8ECFMHJ02m+WrSa7IQ6hZq
	 yJZgEgCGm9a1+EiV0deJUt+PSgOZT4TLR/JZ2SPNz66yn3qtJKmc8bkpYT4yW5XTY0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=pGh6bo8G;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198774;
	bh=iu6/BTtQUvHdYQny3mKRimIiPYl1oqGc0apJkVwBQUM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZt0ea/aWyPL0HHkeKCnP83L/4ysJWwdy7M/iCok2t9a99w3BOw+irQAMGU8FL+BU
	 RHWua1PkUcGL11p9fsp1wWWb88Drdc7rEcWNhrYH+gdz6QqxmDVMc16naE9iKojqPC
	 YEHsrzqVSSQwpMRG2tAvGDyJrI6gv9trQ7zPAURgnTxr5sZAev5DIUgM59Io8PKCaK
	 NFWFrzQmkqZKkk42Muc/RBHvfw/vppRtC6k/VGzc2HgerHqtIaBVj7jTBxKa9vSErH
	 Dt17ou3/c/05kgNtRkUgKAhj587nEx8CYq+t5hiy2BgEXkYHT7tpd3pdiy139ikwY3
	 0+Tyv6cKJgkFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FAF60617;
	Sat, 12 Sep 2026 07:39:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80FABEB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7092460617
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0FTMiAm8Kv1 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:39:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5E6F660614
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198771;
 b=m+uPvpAoHKnhg7HX67YEbf7OS9GDJVUrzB6VUxVNpzD/6JCJjMue1r+PQfGfl/UM/PnH
 n6Q/x0MglUJTJESSfj5YR06nnjZInxQud1Yvh5dml8W7CcVfKyvtzR2Enfh3tK+/q7uEy
 6/LRPWfjNrQDlmGFzR9jbqDQiC8Alxm8w+pWrNotExmvXDXfyBfjp50SHW0/63fGxYfmG
 peavpe3QxUPFrY2z2tmEYPZM5Q622yHjz75rHxUVcI87Lul+0hqqhAdPxxNXZX0xGUhkI
 qDQvane4yWAs+CdLqvH5kKIVkr8lRZBWU/wh6vEIgh+Yi2Z8UbtBe5auFDxg8azfy8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198771;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=SsCUWMJGNhmmja2tWG+l2Vbcj6oLjR3MlhnY56lcXgA=;
 b=Wd6XPK4PKz8TQvwYXkvxOQgdLEsVOCiPyA0qz1Ua+bmILnU9y1eL4IcGw5LwGztNfRH1
 WZCUw7bMFPPtsXSytk29heM46HQ5tqeOSd/yA4iHFqFYoLYYD/arF24CBC2JzvSX6xK5V
 ksMqbSavIJvVqHwcP/4lkNqNRoFc/FaJ/wSdpWvwJghZ58Ht8RLWtBMcAp4Jaz3b4Gdc7
 oNzvGxWv+oJ9wHeviyU4X6duQVDQKXklef7T71cgt1BPGuW0BcLEg9rFSRZP3/WCCwspg
 ktMPXYl38hZ3yXChdTMScxQ5quFg6UJAUPoiRdAL/WgX4lwth7inHfi+Ft3rupmOyYw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=pGh6bo8G; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=pGh6bo8G
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E6F660614
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=pGh6bo8GAhywyie0kwbmDclocrA+DKGoYW6SkDsL4pfgw2TGYiinAGCBZJodF4GXKpTrImLE7eEjgUJthynl+1PsSwlbF/LXoahaBB/zfDni+/1v5TJGy5C8jMutPIv3IZ7WGo8WTEj8b6da8Wp6wbl+aiZ8qePtavEa8Acn3PONiVehDlynqUFNAVbFvzTR7XN4hqUeMrZicDpkUHzHhxKz6hyRcffU397LzNUp8ObeqGkDR58+AVZMU33MVxoek6wFwDUXrVb6/dAp/5mD+Zv39YoKSo4YvB12jU9TNQG9mr32o8mZ6aCTfdZWfdkPvDH5AH8gB7u3azeg2yTEdg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=AwU7Vb1jyYHbi2RRuqMd55fBzpYIlxHYIqqDmJAH93k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 81534583;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 12 Sep 2026 07:39:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x5IKc-0000000FCkF-1fX4;
 Sat, 12 Sep 2026 09:39:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910215723.2585965-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 10 Sep 2026 23:57:23 +0200")
References: <20260910215723.2585965-1-bernd@kuhls.net>
Date: Sat, 12 Sep 2026 09:39:26 +0200
Message-ID: <87mrtmdikx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: renumber patches
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

 > Buildroot commit 99bfbef093f41f20dff305dea83c7763c8b34a1b removed patch
 > 0002 but forgot to renumber the remaining patches.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
