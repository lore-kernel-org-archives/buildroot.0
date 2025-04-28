Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73B4C369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 19:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF26F60812;
	Mon, 28 Apr 2025 19:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-p0fv800QjH; Mon, 28 Apr 2025 19:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEC3660B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC3660B6D;
	Mon, 28 Apr 2025 19:52:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 688A1C5
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A75B40436
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeksvZ_hT1jU for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 19:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0F4A40288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F4A40288
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0F4A40288
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:52:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5DDDA78035E;
 Mon, 28 Apr 2025 21:52:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 28 Apr 2025 21:52:46 +0200
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 21:52:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, =?UTF-8?Q?J=2E_Neusch=C3=A4?=
 =?UTF-8?Q?fer?= <j.ne@posteo.net>
In-Reply-To: <20250419-fix_mpv-v3-1-579a46da5c72@bootlin.com>
References: <20250419-fix_mpv-v3-1-579a46da5c72@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <79080cfeb59d83b3fa0d7edd390dd7ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745869972;
 bh=lcSD+7NKs3IQaSo2Pn0HwMEiNMjgkSzQBe9SvpWPEno=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NkVwJZRAg0i0f675ByzmhiR2q3M/vAdUYFnyfesHtRovIbpm4ryhH5FdBwL5wEBcY
 ztH12jwu3Dre3LSAIB5r3FsTOogwXreQwpVbPWBvRHV/kJUzCatq/YqfO0putz0fs6
 wd9JJO0ppNBvq9jAJoiVcxsB0kDaldHNyOeNrBsLBXVcMPTr60DHw81TzH5bWRViMa
 9bYAY4lfxKEsD6egNQRb3IsZcvDe9G8KGKi3ZzkMjAM5x96x3ARcfvisjDFu8N2Eua
 M+RJ1Z/Gllh5NWnnV8PsjUaRZLIGFLYN+QWgKtNEdy2PB1eT0lHmvYknKKBYked9zP
 Bc+rr0P2goNjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NkVwJZRA
Subject: Re: [Buildroot] [PATCH v3] package/mpv: switch to meson from waf
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

T24gMTkvMDQvMjAyNSAxNzo1NiwgVGhvbWFzIEJvbm5lZmlsbGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBTaW5jZSBjb21taXQgZmQ1NjIzMTUsIHdoaWNoIHVwZGF0ZWQgd2FmIHRvIHYyLjEuMSwg
QnVpbGRyb290IGhhcwo+IGVuY291bnRlcmVkIGlzc3VlcyBidWlsZGluZyBtcHYsIGxpa2VseSBk
dWUgdG8gYW4gb3V0ZGF0ZWQgdmVyc2lvbiBvZgo+IHRoZSB3YWYgYnVpbGQgc3lzdGVtLgpbLi4u
XQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVmaWxsZUBi
b290bGluLmNvbT4KPiBUZXN0ZWQtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+
CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
