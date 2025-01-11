Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4A8E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7D95606E9;
	Sat, 11 Jan 2025 17:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ckPO61794Mb; Sat, 11 Jan 2025 17:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C25096078E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25096078E;
	Sat, 11 Jan 2025 17:32:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B402F950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95F8F838CC
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzLvlKunHbGs for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8AE1837DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8AE1837DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8AE1837DA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:31:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7C206B0051B;
 Sat, 11 Jan 2025 18:31:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49656])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:31:56 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:31:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111150707.2826032-1-james.hilliard1@gmail.com>
References: <20250111150707.2826032-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b291ed0b064f3c35efbc30c5e5b34460@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616717;
 bh=tSaB5CVqWIvgumNh+Gzrabjez2veLHE6LIcLRlZ0duU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QeF2LtNNNFIdgvt2f1C48a2WWDsRjhZs0q3uwoQtoSgpvpWbqJT+ggnyXK3qHfMii
 fdvVk1sWx8BVueA7ToaE1AQnSekuF2v/HqrXzaS8FoVE/IEWWtbxZqfnW6Mp2jyBhK
 aFoiO3Ho0bk968JnJBBFKn9fcmQY3e18FTWzOWUU9pXMIpyrRFb9Ha+OumQq8lnmTI
 qLvhiEUyIC+A6UpusFCMPcMe6QwSuuoJntCo4pZJntQn345BMkVUj/BiKGyTZlm0Am
 QSfGjr4Xqb83IchskZv3Bl/mlMth0LinNX+IBm1kFWQ1ht5nolml5ZpMtiio7JV++D
 9x3PLKn6dJxtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QeF2LtNN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to
 version 2.0.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 16:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
