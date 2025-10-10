Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2CACAC5BB
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 05:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5565F60DE6;
	Fri, 10 Oct 2025 05:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UG-jjAefmPCD; Fri, 10 Oct 2025 05:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6154460F0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6154460F0E;
	Fri, 10 Oct 2025 05:19:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70A3C119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 05:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 631054120A
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 05:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQxfBSOp-wdI for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 05:19:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4413E41174
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4413E41174
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4413E41174
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 05:19:28 +0000 (UTC)
X-CSE-ConnectionGUID: fGOLiCt9QDiBsQV/WHTdBg==
X-CSE-MsgGUID: vrqZnU7HRQe9pwCdfGacDw==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Oct 2025 07:19:26 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Oct 2025 07:19:26 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59;
 Fri, 10 Oct 2025 07:19:24 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 10 Oct 2025 07:19:24 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: tuSaPpwtS3+8CezOHypGrg==
X-CSE-MsgGUID: 3X91k+niSJOpTvPfsSfR3g==
X-IronPort-AV: E=Sophos;i="6.19,218,1754949600"; d="scan'208";a="343380378"
Date: Fri, 10 Oct 2025 07:19:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
CC: <buildroot@buildroot.org>
Message-ID: <aOiXXHg2kwmHaIea@yd-6wlzhs3>
References: <20251009165624.3914222-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009165624.3914222-1-bernd@kuhls.net>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX108.corporate.adroot.infra.ftgroup (10.115.27.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1760073569; x=1791609569;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ApfzthZ/ZqEnLdgitL5g9ylEnQA9ffn/dyP+Pn76Ok8=;
 b=s7zavronVZbeZXPMKPzNrFmgNR6onLBf7kL8LVsnLQCJ27eapxiLJjww
 /fNbrnrjaktIw1m7xk5xrTGk90RtWRINPjZl2lQ8PhGAPuyDehwHeO8wU
 AJR+HAL342O/H0bMHgfFuGBZHobB98Bzx7OilnTkdk448bCQn6HCXmAL8
 60yvMB3IOprfShqqza4ra48sQw90gbgYBRSpQAx6l2FPsL1hY64M5QOHw
 NV7kUvcO2sdZw/EZBqGnW7RkoRpjSFMVOK1UIAkyLLpBrZOlos5eLb3H4
 u6vLkKSI6ZKRcTSmM4GmpRdvF7v+hg9YYvJwiurEZYPzzwsWPIe0qhOGD
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=s7zavron
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: remove -std=gnu++98 from
 CFLAGS
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

QmVybmQsIEFsbCwKCk9uIDIwMjUtMTAtMDkgMTg6NTYgKzAyMDAsIEJlcm5kIEt1aGxzIHNwYWtl
IHRodXNseToKPiBJbiAyMDE2IGJ1aWxkcm9vdCBjb21taXQgYjRjMDUwZTlhZmVkN2E4ZGMzMDJl
NmUxMDE0Y2M0ZmZiNTA4NTkwZCBhZGRlZAo+IC1zdGQ9Z251Kys5OCBhbHNvIHRvIENGTEFHUyBr
bm93aW5nIHRoYXQgaXQgd2lsbCBjYXVzZSB3YXJuaW5nczoKPiBodHRwczovL2xpc3RzLm5vbmdu
dS5vcmcvYXJjaGl2ZS9odG1sL2dwc2QtZGV2LzIwMTYtMDkvbXNnMDAwODIuaHRtbAo+ICdBbHRo
b3VnaCB0aGlzIGxlYWRzIHRvIGxvdHMgb2Ygd2FybmluZ3Mgb24gZXZlcnkgY29tcGlsYXRpb24g
d2l0aCBnY2M6Cj4gImNjMTogd2FybmluZzogY29tbWFuZCBsaW5lIG9wdGlvbiAnLXN0ZD1nbnUr
Kzk4JyBpcyB2YWxpZCBmb3IgQysrL09iakMrKyBidXQgbm90IGZvciBDIicKPiBUaGVzZSB3YXJu
aW5ncyBhcmUgc3RpbGwgcHJlc2VudCBidXQgY2F1c2UgYSBtaXNkZXRlY3Rpb24gaW4gY29uZmln
dXJlCj4gICAgIENoZWNraW5nIGlmIHN0cmVycm9yX3IoKSByZXR1cm5zIGludC4uLiBubwo+IGJl
Y2F1c2UgaGVyZSB3YXJuaW5ncyBhcmUgdHJlYXRlZCBhcyBlcnJvcnMsIHF1b3RpbmcgY29uZmln
LmxvZzoKPiBjYzE6IGVycm9yOiBjb21tYW5kLWxpbmUgb3B0aW9uIMOi4oKsy5wtc3RkPWdudSsr
OTjDouKCrOKEoiBpcyB2YWxpZCBmb3IgQysrL09iakMrKyBidXQgbm90IGZvciBDIFstV2Vycm9y
XQo+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgpJJ20gbm90IHN1
cmUgd2h5IHdlIG9ubHkgbm90aWNlIHRvZGF5LCB0aG91Z2g6IHRoZSB0b29sY2hhaW4gaXMgZ2Nj
LTE0LAp3aGljaCBpcyBub3QgcmVhbGx5IG5ldywgYW5kIHRoZXJlIGlzIG9ubHkgdGhpcyBvbmUg
c2luZ2xlIGZhaWx1cmUgaW4KdGhlIGF1dG9idWlsZGVycy4uLgoKPiBJbiAyMDE3IHVwc3RyZWFt
IGNvbW1pdHRlZAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ncHNkL2dwc2QvLS9jb21taXQvZDI4N2M3
NmY0ZjJlMWZmZDI3NWRhNDFiODRmOWUwOGVhN2Y3NDM0NAo+IHdoaWNoIGFkZGVkICJzdGQ6OiIg
bmFtZXNwYWNlIHByZWZpeGVzIGFuZCBmaXhlZCB0aGUgb3JpZ2luYWwgcHJvYmxlbS4KPiAtc3Rk
PWdudSsrOTggYmVpbmcgcmVtb3ZlZCBmcm9tIENGTEFHUyBsZXRzIGNvbmZpZ3VyZSBjb3JyZWN0
bHkgZGV0ZWN0Cj4gc3RyZXJyb3JfcigpOgo+ICAgICBDaGVja2luZyBpZiBzdHJlcnJvcl9yKCkg
cmV0dXJucyBpbnQuLi4geWVzCgpBd2Vzb21lIHJlc2VhcmNoLCB0aGFua3MhIEkndmUgYmVlbiBz
Y3JhdGNoaW5nIG15IGhlYWQgb24gdGhpcywgYnV0IEkKbWlzc2VkIHRoZSB1cHN0cmVhbSBjb21t
aXQgZDI4N2M3NmY0ZjJlIHlvdSBzcG90dGVkLiDwn5GNCgpbLS1TTklQLS1dCj4gRml4ZXM6Cj4g
aHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzUyZDc0N2QzM2Q3MTRlYTEw
YjllN2VlMTBhZGVhZGQ5ZTQ1MTJjMmQvCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJl
cm5kQGt1aGxzLm5ldD4KClRlc3RlZC1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFu
Z2UuY29tPgpSZXZpZXdlZC1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29t
PgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvZ3BzZC9ncHNkLm1r
IHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvZ3BzZC9ncHNkLm1rIGIvcGFja2FnZS9ncHNkL2dwc2QubWsKPiBpbmRleCAxYjIw
MjEwYzQ5Li5jNWM0ZGFkMjk2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ3BzZC9ncHNkLm1rCj4g
KysrIGIvcGFja2FnZS9ncHNkL2dwc2QubWsKPiBAQCAtMzcsNyArMzcsNiBAQCBlbmRpZgo+ICAj
IEJ1aWxkIGxpYmdwc21tIGlmIHdlJ3ZlIGdvdCBDKysKPiAgaWZlcSAoJChCUjJfSU5TVEFMTF9M
SUJTVERDUFApLHkpCj4gIEdQU0RfTERGTEFHUyArPSAtbHN0ZGMrKwo+IC1HUFNEX0NGTEFHUyAr
PSAtc3RkPWdudSsrOTgKPiAgR1BTRF9DWFhGTEFHUyArPSAtc3RkPWdudSsrOTgKPiAgR1BTRF9T
Q09OU19PUFRTICs9IGxpYmdwc21tPXllcwo+ICBlbHNlCj4gLS0gCj4gMi40Ny4zCj4gCgotLSAK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fX19fX19fX19fXwouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0tLS0t
LS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAgICBf
Xy8gKSAgIHwgLyJcIEFTQ0lJIFJJQkJPTiB8CnwgICAgICAgICAgICAgICAgIHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgIF8vIC0gLycgICB8IFwgLyBDQU1QQUlHTiAgICAgfAp8ICszMyA2MzguNDEx
LjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAg
IHwKfCB5YW5uLm1vcmluIChhdCkgb3JhbmdlLmNvbSAgICAgICAgICAgfF89IiAgICAsLS0nIHwg
LyBcIEhUTUwgTUFJTCAgICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LTpfX19fX18vX19fX186LS0tLS0tLS0tLS0tLS0tLS0tJwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMg
am9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVz
IG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2VzLCBl
eHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBj
ZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRpdGV1
ciBldCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVzc2Fn
ZXMgZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3Jhbmdl
IGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUs
IGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRh
Y2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlv
biB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRpc3Ry
aWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3UgaGF2
ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
YW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWlscyBt
YXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQgaGF2
ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
