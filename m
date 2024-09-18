Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43226CCD1A0
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 13:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA2042650;
	Wed, 18 Sep 2024 13:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qN-9CHbl5NEx; Wed, 18 Sep 2024 13:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A8742699
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A8742699;
	Wed, 18 Sep 2024 13:48:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B73951BF4E2
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 13:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A42847CD
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 13:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkfqvSBdFh3q for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 13:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 853E5847CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 853E5847CC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 853E5847CC
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 13:48:29 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 15:48:27 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2024 15:48:27 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 18 Sep 2024 15:48:25 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:48:25 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.10,238,1719871200"; d="scan'208";a="199533203"
Date: Wed, 18 Sep 2024 15:48:25 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <ZuraKWUWIIGrV+i6@yd-6wlzhs3>
References: <cover.1725049576.git.yann.morin.1998@free.fr>
 <23841300f5a85914d9c0fc19b24df485ba861efa.1725049576.git.yann.morin.1998@free.fr>
 <CABGWkvq=ca3xYu6+_91-8KtoQqCBOBGexBbJe8wDZGMR3YQUcA@mail.gmail.com>
 <ac95b02.879a.19204270bbd.Coremail.tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac95b02.879a.19204270bbd.Coremail.tianyuanhao3@163.com>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1726667310; x=1758203310;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=UYQ/rKyeefnWcBS7PEuVJ617ofAF0+LWXJ6UWKvgmdU=;
 b=oexH8Xck4t+CHULCTUq5i9trS1D0u8HHw183k2KmCr7AWUlq1Qmz30S6
 0ILk6Q0ns6EEHAovCWo/PKlF7EIWHCwsbCVqv1o1UC/mKpOsrXHH79LoZ
 XOsa7xgO7HMMDBx29xysZiST76elyJ4KeK09iJgtj+v1prcOJRLNIMb2t
 fWtQPn4J+KpGncUGbDXcZVj2UR7rbU8sEUqwL/oyX8LE+K0rF7+nZXD/4
 iIxjeNvCATxyikQgNnZfpxhcviXkJ0nkhzIDZCeYlIaSiQsncruqTCulX
 Axt0Zj4QTGU0g1Wo4XlsEOQ4ptIwGmxRKGuvwZNltuiQFWFeTxzYkGNhA
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=oexH8Xck
Subject: Re: [Buildroot] [PATCH 3/3] system: add tini as init system
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VElBTiBZdWFuaGFvLCBBbGwsCgpPbiAyMDI0LTA5LTE4IDE2OjAyICswODAwLCBUSUFOIFl1YW5o
YW8gc3Bha2UgdGh1c2x5Ogo+IEF0IDIwMjQtMDktMTQgMTc6MDQ6MjYsICJEYXJpbyBCaW5hY2No
aSIgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiA+T24gRnJp
LCBBdWcgMzAsIDIwMjQgYXQgMTA6MjbigK9QTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5
OThAZnJlZS5mcj4gd3JvdGU6Cj4gPj4gVGluaSBpcyBhIHNwZWNpYWwtcHVycG9zZSBpbml0IHN5
c3RlbSwgYWltZWQgYXQgY29udGFpbmVycy4KPiA+PiBBZGQgaXQgdG8gdGhlIGNob2ljZSBvZiBp
bml0IHN5c3RlbXMuClstLVNOSVAtLV0KPiBJIHRoaW5rIHRoaXMgaXMgY29tcGxldGVseSAqKndy
b25nKiouCj4gUGVvcGxlIHVzdWFsbHkgZG8gbm90IHB1dCBkb2NrZXItaW5pdCAoc3VjaCBhcyB0
aW5pL2NhdGF0b25pdCkgaW4KPiBjb250YWluZXIgaW1hZ2VzLCBidXQgaW4gdGhlIGhvc3Qgc3lz
dGVtLCBhbmQgdXNlIGl0IGJ5Cj4gYGRvY2tlciBydW4gLS1pbml0YC4KClRoZSBjb250YWluZXIg
d29ybGQgZG9lcyBub3QgcmV2b2x2ZSBvbmx5IGFyb3VuZCBkb2NrZXI7IHRoZXJlIGFyZSBvdGhl
cgpzb2x1dGlvbnMuCgpXZSBkbyBoYXZlIGEgc2l0dWF0aW9uIHdoZXJlIHRoZSBjb250YWluZXIg
cnVudGltZSB3aWxsIGV4cGVjdCB1cyB0bwphY3R1YWxseSBwcm92aWRlIG91ciBvd24gUElELTEg
dGhhdCBpcyBhIHByb3BlciByZWFwZXIuIEluIHRoYXQKc2l0dWF0aW9uLCB3ZSBkbyBuZWVkIHRv
IGhhdmUgdGluaSBpbiB0aGUgY29udGFpbmVyIGFuZCBydW5uaW5nIGFzIHRoZQplbnRyeXBvaW50
LgoKTm90ZSB0aGF0IHRpbmkgYWxzbyB3b3JrcyBpZiBpdCBpcyBub3QgUElELTE7IGluIHRoYXQg
Y2FzZSwgaXQgdXNlcyB0aGUKc3VicmVhcGVyIGZlYXR1cmUgKHNpbmNlIGtlcm5lbCAzLjQsIGFn
ZXMgYWdvIG5vdyEpLgoKWW91IG1lbnRpb24gY2F0YXRvbml0LiBJIHdhcyBub3QgYXdhcmUgYWJv
dXQgaXQsIGFuZCBuZWl0aGVyIHRoYXQgaXQKd2FzIHBhY2thZ2VkIGluIEJ1aWxkcm9vdCwgYnV0
IHRoZW4gaXQgbWlnaHQgbWFrZSBzZW5zZSB0byBhbHNvIGFkZAp0aGF0IHRvIHRoZSBsaXN0LCBu
b3cuCgpJZiBvbmUgc3RpbGwgd2FudHMgdG8gZGVsZWdhdGUgdGhlIFBJRC0xIHJlYXBlciB0byBh
IGRvY2tlci1wcm92aWRlZAp0aW5pIChvciBhbHRlcm5hdGl2ZSksIHRoZW4gaXQgaXMgc3RpbGwg
cG9zc2libGUgdG8gc2VsZWN0IHRoZSAiQ3VzdG9tCihub25lKSIgZW50cnkgaW4gdGhlIGNob2lj
ZS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF9fX19fX19fX19fXwouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAgICBfXy8gKSAgIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8CnwgICAgICAgICAgICAgICAgIHwgU29mdHdhcmUgIERlc2lnbmVyIHwgIF8vIC0gLycgICB8
IFwgLyBDQU1QQUlHTiAgICAgfAp8ICszMyA2MzguNDExLjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0t
LS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAgIHwKfCB5YW5uLm1vcmluIChhdCkgb3Jh
bmdlLmNvbSAgICAgICAgICAgfF89IiAgICAsLS0nIHwgLyBcIEhUTUwgTUFJTCAgICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTpfX19fX18vX19fX186LS0tLS0tLS0t
LS0tLS0tLS0tJwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmly
IGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBk
b2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMg
YXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZl
dWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRpdGV1ciBldCBsZSBkZXRydWlyZSBhaW5zaSBx
dWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVzc2FnZXMgZWxlY3Ryb25pcXVlcyBldGFudCBz
dXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2Fi
aWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1l
cmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25m
aWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQg
YnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3
aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGlu
IGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2Ug
YW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlz
IG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2Vk
IG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
