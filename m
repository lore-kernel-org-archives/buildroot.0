Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D596C7EE39
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 07:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE36A60DFF;
	Mon, 30 Jun 2025 07:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUTavm1qm_zZ; Mon, 30 Jun 2025 07:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4359D61150
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4359D61150;
	Mon, 30 Jun 2025 07:48:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6342FDF
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 07:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5486580D92
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 07:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-tZHgSqZ-mf for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 07:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA98F80D75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA98F80D75
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA98F80D75
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 07:48:48 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id D5896C0FDA;
 Mon, 30 Jun 2025 09:48:40 +0200 (CEST)
Message-ID: <ad972ec9-1dfb-4b88-906d-53981bd63771@grenoble.cnrs.fr>
Date: Mon, 30 Jun 2025 09:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <git@jdknight.me>, buildroot@buildroot.org
References: <20250630023826.1163-1-git@jdknight.me>
Content-Language: en-US, fr
In-Reply-To: <20250630023826.1163-1-git@jdknight.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1751269720;
 bh=KNVI4fzJoozfQA/UcsuW/przogH6b/U0OVWI8eg0Xl0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=nKK2jR+dsl53G67NsHfgoJXLkHHXND7aMfRwesNaP6i/0Dps+3oegLErzyl0IKBmQ
 kGryJ5ooMigl3psp/QUx9eGVohOkO9WhKtk22wizO8/b7iz/yCS78PtATLGDeclIea
 IXoNSMUBq47VopPv4eVnRTmR3ZmXrWfPvbs+KYL9VF7kHmg/XrScao+aANAUCQ1AdV
 I5lJpfBODWgLWlXc1F7ictn6eg2xmhon3eDHkRsmVGEf1m8YZE+T/PWnDW97dOjLXR
 zopfu2B+fRAQirAM7Nm1kVYMnUgOLmog+rOrLc2Ib91V/BhQdqqxWCuK3bFQGzX+Dt
 w/BdzxdbOjo2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=nKK2jR+d
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

SGVsbG8gYWxsIQoKT24gMjAyNS0wNi0zMCwgSmFtZXMgS25pZ2h0IHdyb3RlOgo+IEFsbG93cyBh
Y2NlcHRpbmcgYm9hcmQgY29uZmlndXJhdGlvbiBldmVudHMgdGhhdCBhcmUgcHJlZml4ZWQgd2l0
aCBhCj4gYGNvbmZpZ3MvYCBwYXRoLiBUaGlzIHByb3ZpZGVzIGEgY29udmVuaWVuY2UgZm9yIHVz
ZXJzIHdoZXJlIGl0IGNhbiBiZQo+IHNsaWdodGx5IGVhc2llci9xdWlja2VyIHRvIHV0aWxpemUg
c2hlbGwgY29tcGxldGlvbiB0byBwcmVwYXJlIGEgYnVpbGQuCj4gRm9yIGV4YW1wbGU6Cj4gCj4g
ICAgIG1ha2UgY29uZmlncy9xZW11X3NwYXJjNjRfc3VuNHVfZGVmY29uZmlnCj4gCj4gV291bGQg
YmUgZXF1aXZhbGVudCB0bzoKPiAKPiAgICAgbWFrZSBxZW11X3NwYXJjNjRfc3VuNHVfZGVmY29u
ZmlnCgpJIGRvbid0IGtub3cgaG93IHRoaXMgaXMgc3VwcG9zZWQgdG8gd29yayBidXQsIGluIG15
IGV4cGVyaWVuY2UsIHNoZWxsCmNvbXBsZXRpb24gb24gYnVpbGRyb290J3MgbWFrZSB0YXJnZXRz
IGlzIHBhaW5mdWxseSBzbG93LCBhbmQgZG9lcyBub3QKd29yayB3aXRoIGRlZm9uZmlnIHRhcmdl
dHMuCgpXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZDoKCiAgICBtYWtlIHFlbTxUQUI+IOKGkiBtYWtl
IHFlbXUKICAgIG1ha2UgcWVtdV9zcDxUQUI+YXJjNjQ8VEFCPiAgIyBubyBjb21wbGV0aW9uCgog
ICAgbWFrZSBjb25mPFRBQj4g4oaSIG1ha2UgY29uZmln4pCjICAjIHdoZXJlIOKAnOKQo+KAnSBp
cyBhIHRyYWlsaW5nIHNwYWNlCiAgICBtYWtlIGNvbmZpZ3MvcWU8VEFCPm11X3NwPFRBQj5hcmM2
NDxUQUI+ICAjIG5vIGNvbXBsZXRpb24KCkl0IHdvdWxkIGJlIHZlcnkgY29vbCB0byBoYXZlIHVz
YWJsZSBzaGVsbCBjb21wbGV0aW9uIHRob3VnaC4KCkNvbnRleHQ6IFVidW50dSAyNC4wNCwgYnVp
bGRyb290IGdpdCBtYXN0ZXIKClJlZ2FyZHMsCgpFZGdhciBCb25ldC4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
