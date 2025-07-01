Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF2BC8302F
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 07:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DC6614F4;
	Tue,  1 Jul 2025 07:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WF_lq26O8i5; Tue,  1 Jul 2025 07:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48895614AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48895614AB;
	Tue,  1 Jul 2025 07:52:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24981197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF4060ED5
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnTWZkrF9HIS for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 07:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20CA961201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20CA961201
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20CA961201
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:51:59 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 5D9DCC24B3;
 Tue,  1 Jul 2025 09:51:56 +0200 (CEST)
Message-ID: <213c41a9-39e7-4cdc-9d10-059b19dd49f8@grenoble.cnrs.fr>
Date: Tue, 1 Jul 2025 09:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, James Knight <git@jdknight.me>,
 buildroot@buildroot.org
References: <20250630023826.1163-1-git@jdknight.me>
 <ad972ec9-1dfb-4b88-906d-53981bd63771@grenoble.cnrs.fr>
 <6902641c-7dd5-45c8-9406-db5d54670562@rnout.be>
Content-Language: en-US, fr
In-Reply-To: <6902641c-7dd5-45c8-9406-db5d54670562@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1751356316;
 bh=Xn9FWPi9A5GvxXtaMdllfmD3Dervn5Hv+BqMIzlbpjg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=OAbVaLFnr5b/nZrz+emIG4FIngh392VG9KzvwJPqlKOF/SMBd2VEaiL/6FwbbZk2j
 4kuF6L1HM7GipQ/nrKj+McwnDNvfTRQ8Vu25cGzu5u1Z59mzoa9/nqNaR2VBWBXgXa
 Z4Redtu1iYpm1lCqBAzrkaRLpNu1Zrcz4goy5+2bPvH6lFK7TdX/j5mwWN8TE39Y9L
 d27GMK9kGBZoAL9tjLO7G0+Zq71JttQ8UfsgcQN/Iv+HgQr4eqHwd9mcYvLgDqI5Zw
 P7UgEb9Ia/63JGlAItHrTebcleQlpfHJEMMtxJAJrKkSBfZdOxpTShdITlYJqMetia
 URa3CZwte18LA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=OAbVaLFn
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: ignore configs/ prefix on
 configuration events
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpUb2RheSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gSW4gYmFzaCwgeW91
IGNhbiB1c2UgQ3RybC1iYWNrc2xhc2ggdG8gb25seSB1c2UgZmlsZW5hbWUgY29tcGxldGlvbiwK
PiBub3QgY29udGV4dC1zZW5zaXRpdmUgY29tcGxldGlvbi4gQnV0IHRoYXQgb25seSB3b3JrcyBp
ZiBpdCdzIGFuCj4gYWN0dWFsIGZpbGVuYW1lLCBsaWtlIGluIHRoZSBleGFtcGxlIHRoYXQgSmFt
ZXMgZ2l2ZXMuCgpUb2RheSBJIGxlYXJuZWQgc29tZXRoaW5nLiBUaGFua3MhIE5vdywgb24gbXkg
c3lzdGVtIHRoZSBrZXkgYmluZGluZ3MKYXJlIGRpZmZlcmVudDoKCiAgICBDdHJsLVwgIOKGkiAg
c2VuZCBTSUdRVUlUIChpZ25vcmVkIGJ5IGJhc2gpCiAgICBBbHQtLyAgIOKGkiAgZmlsZW5hbWUg
Y29tcGxldGlvbgoKUmVnYXJkcywKCkVkZ2FyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
