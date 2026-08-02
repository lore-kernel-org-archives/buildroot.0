Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BECC55174
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 19:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 471E4606AA;
	Sun,  2 Aug 2026 19:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPyyhyjQq9D9; Sun,  2 Aug 2026 19:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D246068D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785700143;
	bh=bk9XnE7pFcBATUGvCuZmBmbdUEmEbuM39aLzPnmncCM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TUpYy0kIt0BwneAYX1kgyjCkc4lXjMof5V8YZUnR15mmyXCzjqvPdTN7ZOY1f/Bf5
	 q1k/JRQ9BYwPMeYWzr3TK62AfMm9yhth/ufQnPAuidUDG1kupUi28VJ5l9xPVjUvqm
	 CGghwnb5r0iKV35FmEzGh0YcoIbCUVOSKgxIZNli38+IA642goMVyVSlXv8teza+p1
	 n3VuJoprqMVgHE4qo4s07tVU9APhCalJ09aT0iJxY/hvrUv+m8DH5v5EEQgShbt+Hn
	 5ZaZGc1bzG//WvtUwDJpgJ56z5XDrhSZso73F1/y65mobn13mu0q8CG/R2gg5jNoxW
	 sPKDb/aBvMYbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D246068D;
	Sun,  2 Aug 2026 19:49:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BDB63A6
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 197D36068D
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpT9wNZQdeVl for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 19:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 457446066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457446066E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 457446066E
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 065B613F88E;
 Sun,  2 Aug 2026 21:48:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 21:48:57 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 21:48:57 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260418191120.981179-1-ju.o@free.fr>
References: <20260418191120.981179-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <68240b7b9c3883814a037cac80a79ba8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785700139;
 bh=RdE4bPm8lLkuAXnXLh8LC71ZKDdmcH+znofU6cZ+uHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nvpT8JXCcktkLt3itdhnZf5VpvwUsy9epi40Y5ufxqLC6Pbjo4N9UVpU20hA6NqCc
 kXPyAKPJS/QHJPCmICoaxEoZEVCPD/1nADtNljcUyoyH1YPmr1n6/vXd+qdaj0QfVn
 acNNVYp5fIXIVVm/6WCdtVM7esXu4ljP2OFphBHhhYGjOJsReG5GEroaploV016yo6
 kltGG8Xmoc/hYvWW30FbIE49OjmG96Gr7/hVywfgxwDWBjhyElX/kWJVsm8coXLM/K
 aPv735MjgPsjmupR4XiTVP9KqF6rb8p7+yqTJi+GDWfMC6FMIUvxXg18eatyb0Yn7x
 ifodqLyUGOwvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nvpT8JXC
Subject: Re: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.16.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/04/2026 21:11, Julien Olivain via buildroot wrote:
> For change log since 4.15.2, see:
> https://github.com/Z3Prover/z3/blob/z3-4.16.0/RELEASE_NOTES.md#version-4160
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
