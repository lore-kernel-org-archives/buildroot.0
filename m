Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCB9C369D3
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 11:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76EBA80E9F;
	Tue, 22 Apr 2025 11:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4atYBh-mm9f; Tue, 22 Apr 2025 11:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 543C780BB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 543C780BB0;
	Tue, 22 Apr 2025 11:04:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12FFC1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC9EE80E78
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSINtlUO1-tC for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 11:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0193580B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0193580B60
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0193580B60
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:04:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6224F5FF88;
 Tue, 22 Apr 2025 13:04:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Apr 2025 13:04:51 +0200
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 13:04:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
In-Reply-To: <20250422085947.687912-1-vincent.stehle@arm.com>
References: <20250422085947.687912-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b7d07ef62d9f41bdacd38970085c5359@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745319893;
 bh=Mbm4QF40Glpo0OnLbdJ1TWTvKUyMoJBBLHDha5P3P/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H8U+FQsqOW/xuVqjvxx5YBvj00BCUlW6/ez/EulvaKz0hOOL/vgf67dUwRH/unF4f
 VLANfSDBKI+crkz1rhDOx+BSTx8c5O+brcPXbyhJNZWqCDWBaTcwrkr+Sh6Yqk5q+/
 f/sQGhI9dhXKVKk5qT+p0W35ThBbTsi2Kg2Fi6PW3E8X9+NTgeVw4IfLIsu81w21Ao
 BTVvXGDbnC+stzCLNVXnfiSg5lswyuSHAx7fdw35iBT+794rW8w5LkOiOkkz84/H/4
 zUf2wzHqHZ/dcMHET9jhbzWBMCuCqGa1v12JkdWR9Xgsz9T+0MVnmK9NvvQTXlsLsz
 4m+ZElZFs31bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H8U+FQsq
Subject: Re: [Buildroot] [PATCH] support/testing: test_edk2: add
 macchiatobin build test
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

T24gMjIvMDQvMjAyNSAxMDo1OSwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IEFkZCBhbiBFREsg
SUkgYnVpbGQgdGVzdCBmb3IgdGhlIE1BQ0NISUFUT2JpbiBwbGF0Zm9ybS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IERp
Y2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KPiBDYzogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
