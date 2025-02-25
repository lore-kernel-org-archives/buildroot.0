Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A8EC021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 20:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CD0C40CC5;
	Tue, 25 Feb 2025 20:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92u5S1ZD4oaU; Tue, 25 Feb 2025 20:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355DF40DB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355DF40DB0;
	Tue, 25 Feb 2025 20:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AC432019
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77CA48132D
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdAoUejtyJKi for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 20:12:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CA1881349
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA1881349
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CA1881349
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:12:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 321E8B00576;
 Tue, 25 Feb 2025 21:12:52 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Feb 2025 21:12:52 +0100
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 21:12:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250225130959.960578-1-flavio.tapajos@newtesc.com.br>
References: <20250225130959.960578-1-flavio.tapajos@newtesc.com.br>
User-Agent: Webmail Free/1.6.10
Message-ID: <7a67449794c5e6a3331ebe58f461bb90@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740514375;
 bh=pyqGjDht8Gp/u5Oj0E1o6OpmbZUmhwI7tAnY7NyRi8Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ONR5bUQa4q5/60/t/ANplSRPfQ82nvz6/xrJt/3AxATXjExAA5g58aRipBkrYbBBb
 sJcIoT1lc5Pi4wyHBvT8eUg1O97gZnrktGg/2IyR03KMNFGFKJgaf9l0i0pJjWe18a
 A2wbaWrz4Tgl5+5ikk/cYvR+WoLTZb0HEkn60Dz75kacghxkxL10VBRPge07niNpNJ
 KnzlkbyXWwS1mhnYDS4Zb5vBPILnNg1hrtL9Cnz/cotC/LPPyEEKkMK+O/tW4IZf+0
 l56y2giawkWVP7IOaA7afDosS7+L9w7DLeWDSm4O/+ItZ6k6YVHJ82TaGyqjZPn5Ks
 PSFcPoj0AJqUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ONR5bUQa
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to
 version 2.0.38
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjUvMDIvMjAyNSAxNDowOSwgRmzDoXZpbyBUYXBhasOzcyB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
