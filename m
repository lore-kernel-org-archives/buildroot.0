Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597EBE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D769410A4;
	Sat, 11 Jan 2025 17:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqSOr1owbYw1; Sat, 11 Jan 2025 17:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A4540BDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A4540BDF;
	Sat, 11 Jan 2025 17:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02468942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7B2A60708
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eQEzKWiGuo8 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 064EE606E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 064EE606E9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 064EE606E9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:31:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2E152780507;
 Sat, 11 Jan 2025 18:31:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49656])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:31:34 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:31:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250111150209.2823450-1-james.hilliard1@gmail.com>
References: <20250111150209.2823450-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <75a774032a93f52dc006740a987023df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616696;
 bh=46cceP1R4dKE/aUYCC8oGaVVWc8bWtIkB7tFn+e9yQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PRdiRBeA6oEkgdmy5Ja1xx1FOGT67fTHaHnqg6ksG5xElWGdW1PHCY3Cw6uh20U+l
 /9wB2aKO9wn2e5ay+EaveNj0R4JYFSq4cJMHa6WuonPD9w/kIah7fWsqgOLWKtf7hV
 Twjeln89/tg9KMwb6LHWAhfe20ymQPC9z0/+rVVgZbcBI9E9gCa+gbnWk3q66VSEhi
 OUv6M849WaiVOSp3trXHTo7RmHhJs5ZO9EuXVIn3aUhpHZ2cI59WGt9v4oNElERv37
 m+jebKz1SeGUJ5ThUhevKS53FDCco0KXRr2W/tCCUhVOnNT2938GuEvx7dsxq3TdL5
 Y4fCE9xuOqPlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PRdiRBeA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 11.1.0
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

On 11/01/2025 16:02, James Hilliard wrote:
> License hash changed due to end year removal:
> https://github.com/python-pillow/Pillow/commit/513fe2ca2d23c7f1685b089fc6087ab02b2828df
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
