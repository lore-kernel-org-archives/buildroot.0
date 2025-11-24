Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228B0CFD352
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 19:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C487983CEC;
	Mon, 24 Nov 2025 19:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5G64uTD4AHST; Mon, 24 Nov 2025 19:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 587BF8249B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587BF8249B;
	Mon, 24 Nov 2025 19:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD894E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B417960854
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWH6s67BeSsM for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 19:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 43C34607BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43C34607BD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43C34607BD
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:51:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9266978050C;
 Mon, 24 Nov 2025 20:51:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Nov 2025 20:51:20 +0100
MIME-Version: 1.0
Date: Mon, 24 Nov 2025 20:51:20 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251104113032.674980-1-adam.duskett@amarulasolutions.com>
References: <20251104113032.674980-1-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fea4ff6c5fbcd31153c0c41ed5eebc94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764013881;
 bh=4jz8sjyGa2wYWWTR9cDkI+/uDQd/MTl3Ks+6zVmqJ7s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WNGnHvRyy9rkIy2hZP/At+iaBdpkxS1jqIM2j46Y1QChrcgQr7jcSpoOAqbLwS1p3
 zdkiCF4K6lO1HKhurXghWNKWRVmly6AHyK7IclGwqvYMasV4r4byyEQuenYBhEVf5L
 d5bAbqLjHQcQaYS/hgk0dzps4X5EQ+u23pTzdJ0EBC5xG2V02Ibv2+aKR3Oc3istEh
 I4lLjpr+wnEerfw7/eJRY3WAyGCZbaarvT9fg6AISObvX6FTukXIuRbVg1HIh3rRfR
 QdnwRKniEEZZSnXWCDxFv9NbTl3ymH029uEcjH1xSeaHnKdhbo4ufz7pi4bto96U0s
 Oh+NyFOrN722w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WNGnHvRy
Subject: Re: [Buildroot] [PATCH v2] package/python-pysocks: add host variant
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

On 04/11/2025 12:30, Adam Duskett wrote:
> The host-depot-tools package now requires a host variant of the
> python-pysocks package due to the python-httplib2 update on commit
> 55a80f89d7321000591de349c7083a94c0349187.
> 
> Httplib2 removed the internal socks.py file on commit
> 1a6ff781792099e9e14d7beb610bd99112b17b07.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
