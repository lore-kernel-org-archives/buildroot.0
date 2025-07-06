Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7F6C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 11:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE40580C06;
	Sun,  6 Jul 2025 11:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhweY2gfbQNb; Sun,  6 Jul 2025 11:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1998980BCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1998980BCF;
	Sun,  6 Jul 2025 11:57:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 693CC19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B39B4005F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78o5Qgaf2kjG for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 11:57:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE8724008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE8724008F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE8724008F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:57:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 21F2D2003D0;
 Sun,  6 Jul 2025 13:57:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Jul 2025 13:57:32 +0200
MIME-Version: 1.0
Date: Sun, 06 Jul 2025 13:57:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250706100731.799929-1-bernd@kuhls.net>
References: <20250706100731.799929-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d9dc90455e4165bf3669fb61d19b48ef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751803053;
 bh=wzujdFWqqTv4WLDd7wMk8zcl7C+t/ShssITGZbq+n78=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sil20qlGyIq2YbcBamYs0/kKVRAzTlidktVeGwwxB9dMyf19bEWUVXDgO8EKG6iY4
 CLZKUiuIl/DWHO7C5BzsITkNp6wGNpj9LvC1JcT8zuQ9vh8t0MwkqYrOc23mvNneK5
 90YW45xgsCvovQKxa6JQ4q7e62WWQyrtN9g/7wwzc9DV6lX2waNoZib0unnHYLIybk
 ufplg9r6P77pBIvouknftfnck7fknT7G4VNeyEhnhzGobBgLhvZmHII8uP7uYIcEnR
 gokpEiOOwWepjNyH8xIl1tx2h22++B41vFptfdm6KU86DFJMHwurkk2lis26Fvgd1K
 /ctLnSiW4R46w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sil20qlG
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-inputstream-adaptive: bump
 version to 21.5.15-Omega
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

On 06/07/2025 12:07, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
