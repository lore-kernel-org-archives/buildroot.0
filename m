Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DB6C2BA1B
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 20:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB4E96069F;
	Mon, 10 Mar 2025 20:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7xS5rORQ1QN; Mon, 10 Mar 2025 20:13:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C262D60707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C262D60707;
	Mon, 10 Mar 2025 20:13:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEA30DC
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFE634048F
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7L33opXb4e_g for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 20:13:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A23D640645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A23D640645
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A23D640645
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:13:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E2F1819F576;
 Mon, 10 Mar 2025 21:13:19 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Mar 2025 21:13:19 +0100
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 21:13:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250310110841.1556155-1-raphael.melotte@mind.be>
References: <20250310110841.1556155-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <a9313621e43fb9e3752f0541639ce49c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741637601;
 bh=ojq74OH9d4TKICt1xOYXPWXYExF02LN5DxjjKnlNjuQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XI+VmY3jIECsq0ZH/clOXYIvCjqHUG4XH8sK98vgxujsigMvE53FAxM7taDsYCyIr
 qNVfWAUIPGbJFqsZ+/6powyqa7cDSo8tlqIFWaht2oHwKAYSPqHckz8/yg1NlsCSAs
 yjeIUELGwUoTqfz0zIEenW4kUOYNwM1MfvqizalJKxwzgG3Zb+qdW9v7J86yhdO1Fe
 +lxxT/Zj5sHb78cUgCT/NmuE6dhso/1BqvjEV9cmEzrqbTYa7nu/X4ob763o9kcidt
 p/o+TKxQui0MJzWegNXDTvJfhUCoEYo6LI9DQcao6sPdrhqNT9gupCo48APAp7xZNv
 x/Ee8O++bJgQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XI+VmY3j
Subject: Re: [Buildroot] [PATCH 1/1] package/jbig2dec: add upstream security
 fix for CVE-2023-46361
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

T24gMTAvMDMvMjAyNSAxMjowOCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlOgo+IENWRS0yMDIzLTQ2MzYx
OiBBcnRpZmV4IFNvZnR3YXJlIGpiaWcyZGVjIHYwLjIwIHdhcyBkaXNjb3ZlcmVkIHRvCj4gY29u
dGFpbiBhIFNFR1YgdnVsbmVyYWJpbGl0eSB2aWEgamJpZzJfZXJyb3IgYXQgL2piaWcyZGVjL2pi
aWcyLmMuCj4gCj4gaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjMtNDYz
NjEKPiAKPiBOb3RlIHRoYXQgamJpZzJkZWMgdmVyc2lvbiAwLjE5ICh1c2VkIGluIEJ1aWxkcm9v
dCAyMDI0LjAyLjExKSBpcyBub3QKPiBvZmZpY2lhbGx5IGxpc3RlZCBhcyBhZmZlY3RlZCwgYnV0
IGl0IGFjdHVhbGx5IGhhcyB0aGUgc2FtZSBidWcuCj4gCj4gQWxzbyBub3RlIHRoYXQgdGhpcyBD
VkUgaXMgYWJvdXQgYSBjcmFzaCBpbiB0aGUgQ0xJIHRvb2wgb25seS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpBcHBsaWVk
IHRvIG1hc3RlciwgdGhhbmtzLgoKSSBhbHNvIGFkZGVkIEpCSUcyREVDX0lHTk9SRV9DVkVTIGlu
IHRoZSAubWsgZmlsZS4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
