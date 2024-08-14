Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FFC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 05:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE01340B39;
	Wed, 14 Aug 2024 05:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIEWw98kUSio; Wed, 14 Aug 2024 05:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CF7740451
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CF7740451;
	Wed, 14 Aug 2024 05:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E882F1BF484
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 05:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D558340451
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 05:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiBnTGqhS66A for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 05:54:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E77944000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E77944000B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E77944000B
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 05:54:38 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 07:54:36 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Aug 2024 07:54:36 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 07:54:34 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Wed, 14 Aug 2024 07:54:34 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,287,1716242400"; d="scan'208";a="186441869"
Date: Wed, 14 Aug 2024 07:54:34 +0200
To: <buildroot@buildroot.org>
Message-ID: <ZrxGmjMTU5qQHbVL@tl-lnx-nyma7486-2>
References: <cover.1723543467.git.yann.morin@orange.com>
 <8402ba3c5551505159a155c5cf0fc5b58c6a3614.1723543467.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8402ba3c5551505159a155c5cf0fc5b58c6a3614.1723543467.git.yann.morin@orange.com>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX405.corporate.adroot.infra.ftgroup
 (10.115.27.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723614879; x=1755150879;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=TX+u1qFXtixNQpYez+wPzi6tpUEzNgxO4FJ2fLLaSJA=;
 b=hdY8LIAFd2BiUVfziOROicmATFIlwWYdRzb0HC0ctEuUNYuVjBvwBXX3
 JaWgQmFEKfU6hQ1CcKA0ruZYH7YJ1ixvjAV6L2hbkWlronHa76IA8tnHj
 6lZFq8lHYpk54wqYmmn5N1fiufC+/Loksk96LfwH5iV9yLxJhl9VTp1I4
 58ABZWr8PlzHrBKjbvFE5kNhHHu5mRooPxemZ74ZgXo1Ea7pUmSAshuFe
 8z4tJWrfUdjOt6SjJf5mxOAW4RpQL//2WSeap7b3Tz6VkkSN48Pf5uPaW
 HtPJ5SCLKpyOfx1Uz3sIZEvkhzkDclfsd3jO3Xe/j3p9XjgbRCpGUnKYj
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=hdY8LIAF
Subject: Re: [Buildroot] [PATCH 3/3] toolchain/wrapper: move -ztext from
 LDFLAGS to toolchain wrapper
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gMjAyNC0wOC0xMyAxMjowNCArMDIwMCwgeWFubi5tb3JpbkBvcmFuZ2UuY29tIHNw
YWtlIHRodXNseToKPiBGcm9tOiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW5Ab3JhbmdlLmNv
bT4KPiAKPiBQYXNzaW5nIGxpbmtlciBmbGFncyB2aWEgTERGTEFHUyBpcyBub3RvcmlvdXNseSBm
cmFnaWxlOiBwYWNrYWdlcyBlaXRoZXIKPiB1c2UgTERGTEFHUyB3aXRoIHRoZSBnY2MgZnJvbnRl
bmQsIG9yIGRpcmVjdGx5IHdpdGggbGQuIFRoaXMgbWVhbnMgdGhhdAo+IGNhcmUgbXVzdCBiZSB0
YWtlbiB0byBvbmx5IHBhc3MgZmxhZ3MgdGhhdCBhcmUgcmVjb2duaXNlZCBieSBib3RoIGdjYwo+
IGFuZCBsZCwgd2hpY2ggdXN1YWxseSBwcm92ZXMgYSBiaXQgY2hhbGxlbmdpbmcsIGFzIGJkMDM1
ODcyYmU5OQo+IChwYWNrYWdlL01ha2VmaWxlLmluOiBVc2UgIi16IHRleHQiIGluc3RlYWQgb2Yg
Ii1XbCwgLXosIHRleHQiKQo+IGRlbW9uc3RyYXRlcyAobGF0ZXIgYW1tZW5kZWQgYnkgM2EzOWU3
MDZhOTFhKS4KPiAKPiBJdCB0dXJucyBvdXQgdGhhdCB3ZSBhbHJlYWR5IGhhdmUgYSBiZXR0ZXIs
IHJvYnVzdCB3YXkgb2YgcGFzc2luZwo+IExERkxBR1MgdmlhIHRoZSBnY2MgZnJvdG5lZDogdGhl
IHRvb2xjaGFpbiB3cmFwcGVyLCB3aGljaCB3ZSBhbHJlYWR5IHVzZQo+IHRvIHBhc3MgcmVscm8g
Zm9yIGV4YW1wbGUuCj4gCj4gV2UgY2FuIHJldmVydCBiYWNrIHRvIHVzaW5nIC1XbCwteix0ZXh0
LCBhcyB3ZSdyZSBzdXJlIHdoaXMgaXMgZ29pbmcgdG8KPiBiZSBhIGNhbGwgdG8gdGhlIGdjYyBm
cm9udGVuZCAodGhlIHdyYXBwZXIgaXMgbm90IHVzZWQgZm9yIGxkKSwgd2hpY2gKPiBtYWtlcyBp
dCBjb25zaXN0ZW50IHdpdGggdGhlIG90aGVyIHNpbWlsYXIgYXJncyBmb3IgLXogcmVscm8gYW5k
IC16IG5vdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4gQ2M6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4g
Q2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiBDYzogR2l1bGlvIEJl
bmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gQ2M6IFRob21h
cyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpNYXJrdXMgcHJvdmlk
ZWQgdGhlaXIgdGVzdGVkLWJ5IHRhZyBpbiBhbm90aGVyIHRocmVhZDoKICAgIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9DQUd0NEU1dTNVZUdETHBfRDFTZ2VkUWdYdmNOMm1HeFNG
M0V4WCtlMEtLcURNTVRWendAbWFpbC5nbWFpbC5jb20vCgpUZXN0ZWQtYnk6IE1hcmt1cyBNYXll
ciA8bW1heWVyQGJyb2FkY29tLmNvbT4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fX19fX19fX19fXwouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAgICBfXy8g
KSAgIHwgLyJcIEFTQ0lJIFJJQkJPTiB8CnwgICAgICAgICAgICAgICAgIHwgU29mdHdhcmUgIERl
c2lnbmVyIHwgIF8vIC0gLycgICB8IFwgLyBDQU1QQUlHTiAgICAgfAp8ICszMyA2MzguNDExLjI0
NSAnLS0tLS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAgIHwK
fCB5YW5uLm1vcmluIChhdCkgb3JhbmdlLmNvbSAgICAgICAgICAgfF89IiAgICAsLS0nIHwgLyBc
IEhUTUwgTUFJTCAgICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTpf
X19fX18vX19fX186LS0tLS0tLS0tLS0tLS0tLS0tJwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9p
bnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91
IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2VzLCBleHBs
b2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBjZSBt
ZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRpdGV1ciBl
dCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVzc2FnZXMg
ZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3JhbmdlIGRl
Y2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRl
Zm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2ht
ZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiB0
aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRpc3RyaWJ1
dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYW5k
IGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWlscyBtYXkg
YmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQgaGF2ZSBi
ZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
