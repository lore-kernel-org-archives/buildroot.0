Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A37EFCBD4
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651D760F29;
	Mon, 16 Mar 2026 08:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8gRmXCQObYn; Mon, 16 Mar 2026 08:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4117260E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773648910;
	bh=vL5RaTlXfXvnyjvMD9kuzexUF7jspyRpUFq2tVkffhg=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZb882JPPDy2DDTgoyWHU/km8Q+2oojNm5NS7/2xnsXqj7h3zQF5D0svKsIcTlIuo
	 ioiJNHoCZ8+tbLpL5e7kquf9JcwrkaMjaQN+oDjXkIzkshxeW5PMlB7qoI95IjC3gv
	 XxoJosdMwhHmj34eqbeKKL9kq7930kD54/JWb9FA003Owshe53UM355C6taTbksSIT
	 H79NkyViEYHmUi5HGWO2q6nNF7ad45i3pszv/j7/k6F1t3JnYbBHYaMumOU5Yt88ty
	 L4YlMKomEWj6xC3Jp/l3GEacvy+9xu+F6rWOaa6xV6/h52DoLPaN1EfaHEfnDURXy+
	 yev6WEH7ffDcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4117260E69;
	Mon, 16 Mar 2026 08:15:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 896651B4
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AF5E40EBA
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSBD4W02kbdF for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BEF940EB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BEF940EB7
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BEF940EB7
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:15:06 +0000 (UTC)
X-CSE-ConnectionGUID: AIvIdkPVTAihwazBS7NV0A==
X-CSE-MsgGUID: HcYgdbaVQkyiCqNQDFnwzA==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 16 Mar 2026 09:15:05 +0100
Received: from unknown (HELO OPE16NORMBX604.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:15:05 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX604.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 16 Mar 2026 09:15:03 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 16 Mar 2026 09:15:03 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: q+dv82gaQ7SCg94hQhkLZg==
X-CSE-MsgGUID: iskHySdMR4SVsEp3xS1Z5g==
X-IronPort-AV: E=Sophos;i="6.23,123,1770591600"; d="scan'208";a="404439806"
Date: Mon, 16 Mar 2026 09:15:03 +0100
To: Romain Naour <romain.naour@smile.fr>
CC: <buildroot@buildroot.org>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <abe8BzQSq4cxvEw1@yd-6wlzhs3>
References: <0b6f75dfab9a0258eebab63e0a47a4e4c9796246.1771243321.git.yann.morin@orange.com>
 <7868097b-81f2-481c-b755-4500f64ca362@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7868097b-81f2-481c-b755-4500f64ca362@smile.fr>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1773648907; x=1805184907;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=7zGE09EVsAB1rsx6mhYLesdPEF+Je1uM/eo3ucSZ0MY=;
 b=F2amUa+cT0Fe/rBzD0lXN6CoEOipc0/94m6lFNEYxbAhPpKHDsepQQ6Q
 lmss3MLoTQFfY9rs+73WLcrtXNnjKngfWzKYlSu4dBwknlCEQSPLlCTco
 tkGlAOUDCyFQvWlkLpLwULCINXk6OUcaSe2+BjWEyCnusvt1akKeQ2fpA
 55ROi5kwULw0AnIbH5SphDdOpGrH321B7ZepOeo5qRX8Xn5BIXCCVdVNs
 ZST20XRF93fm8GZMZgbHZc0ncQbeMaTHLmLDFvvJq1GCvaPdV2bXlNSdh
 AaUD/6m6H06WC/Qq/MpQ4EVQEvJ/S1QRwZH6KyqgIjl3Y0dh+5o05U59/
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=F2amUa+c
Subject: Re: [Buildroot] [PATCH] package/python-humanfriendly: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDI2LTAzLTEzIDIxOjUwICswMTAwLCBSb21haW4gTmFvdXIgdmlh
IGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gTGUgMTYvMDIvMjAyNiDDoCAxMzowMiwgeWFubi5t
b3JpbkBvcmFuZ2UuY29tIGEgw6ljcml0wqA6ClstLVNOSVAtLV0KPiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1odW1hbmZyaWVuZGx5L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWh1
bWFuZnJpZW5kbHkvQ29uZmlnLmluCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXgg
MDAwMDAwMDAwMC4uMDYxOTc4NDNiMwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2Fn
ZS9weXRob24taHVtYW5mcmllbmRseS9Db25maWcuaW4KPiA+IEBAIC0wLDAgKzEsNyBAQAo+ID4g
K2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fSFVNQU5GUklFTkRMWQo+ID4gKwlib29sICJweXRo
b24taHVtYW5mcmllbmRseSIKPiA+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QWVRIT04zCj4g
PiArCWhlbHAKPiA+ICsJICBIdW1hbiBmcmllbmRseSBpbnB1dC9vdXRwdXQgZm9yIHRleHQgaW50
ZXJmYWNlcyB1c2luZyBQeXRob24uCj4gPiArCj4gPiArCSAgaHR0cHM6Ly9naXRodWIuY29tL3hv
bG94L3B5dGhvbi1odW1hbmZyaWVuZGx5Lwo+IAo+IFRoZSBsYXN0IGNvbW1pdCBpbiB0aGUgdXBz
dHJlYW0gcmVwb3NpdG9yeSB3YXMgbWVyZ2VkIGluIDIwMjEuCj4gSXMgdGhpcyBwcm9qZWN0IHN0
aWxsIGFjdGl2ZWx5IG1haW50YWluZWQ/Cj4gU2luY2UgdGhlcmUgaXMgbm8gcnVudGltZSB0ZXN0
LCBpdCBtYXkgYnJlYWsgd2l0aCBhbnkgcHl0aG9uIG1ham9yIHVwZGF0ZS4KCkkndmUgc2VudCBh
IHYyIHdpdGggYSBzaW1wbGUgcnVudGltZSB0ZXN0IHRvIGNhdGNoIGFueSBzdWNoIGlzc3VlLi4K
CkJ1dCBJIGZvcmdvdCB0byBhZGQgbXlzZWxmIHRvIERFVkVMT1BFUlMgZm9yIHRoYXQgcGFja2Fn
ZS4uLiA6LS8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9fX19fX19fX19fXwouLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFu
biBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAgICBfXy8gKSAgIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8CnwgICAgICAgICAgICAgICAgIHwgU29mdHdhcmUgIERlc2lnbmVyIHwgIF8vIC0g
LycgICB8IFwgLyBDQU1QQUlHTiAgICAgfAp8ICszMyA2MzguNDExLjI0NSAnLS0tLS0tLS0tLS0t
LS0tLS0tLS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAgIHwKfCB5YW5uLm1vcmluIChh
dCkgb3JhbmdlLmNvbSAgICAgICAgICAgfF89IiAgICAsLS0nIHwgLyBcIEhUTUwgTUFJTCAgICB8
CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTpfX19fX18vX19fX186LS0t
LS0tLS0tLS0tLS0tLS0tJwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNv
bnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBl
dCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVz
IHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJl
dXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRpdGV1ciBldCBsZSBkZXRydWlyZSBh
aW5zaSBxdWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVzc2FnZXMgZWxlY3Ryb25pcXVlcyBl
dGFudCBzdXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVz
cG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lm
aWUuIE1lcmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFp
biBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90
ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNv
cGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVt
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1l
c3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3Jh
bmdlIGlzIG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBj
aGFuZ2VkIG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
