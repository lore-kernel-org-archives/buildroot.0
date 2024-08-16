Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E81FC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 06:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F03B54000B;
	Fri, 16 Aug 2024 06:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcPkjMqR_gEJ; Fri, 16 Aug 2024 06:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85BF9400B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85BF9400B5;
	Fri, 16 Aug 2024 06:35:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 300191BF40F
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 06:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BD8A6073A
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 06:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygnY59DpHsMV for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 06:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=george.kiagiadakis@collabora.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E196860739
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E196860739
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E196860739
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 06:35:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1723790120; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mjPkjBLeVNlVYW5No+EaoSEm/clUCUqEhAu33CS/oEuQISbN/dGCbksnnh8uD6Q+TfNBO/afTY1GlQ6XBylR/sLRrMa6NNinQrk94tQSaw3nz+NaOdMf4E1ipuxvuZKO6E2WWV02++5RhP6H/7KwR5AhngG5CJrEkJXUagA4cJk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723790120;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2X8HUaPWM9QfSyPzt3kx5ujKMDxANwytthr25JXr540=; 
 b=f78qqwAH2tSIlyoNsBlSp44nqYXu6NubUNeGhbQzvutuRYOj6rsoy46mzBH09dciBUbP5cq+kRsXpwCPQhxmMbd9X3S/lCLTVDbG/3wfxbi1J4F/BAFjpIVU/3zQ/bq9wdB1R/Thd9amj1L8nsSHxIRK1AoIm/+jt9ZhCtFMkG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=george.kiagiadakis@collabora.com;
 dmarc=pass header.from=<george.kiagiadakis@collabora.com>
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1723790119247617.1086099856086;
 Thu, 15 Aug 2024 23:35:19 -0700 (PDT)
Date: Fri, 16 Aug 2024 09:35:19 +0300
From: George Kiagiadakis <george.kiagiadakis@collabora.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <19159e5d138.f970df6710293.9038501200698515008@collabora.com>
In-Reply-To: <Zr46oBQNQctbUKjM@landeda>
References: <20240815150344.241837-1-george.kiagiadakis@collabora.com>
 <20240815150344.241837-3-george.kiagiadakis@collabora.com>
 <Zr46oBQNQctbUKjM@landeda>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1723790120; 
 s=zohomail; d=collabora.com; i=george.kiagiadakis@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2X8HUaPWM9QfSyPzt3kx5ujKMDxANwytthr25JXr540=;
 b=T5db512tQA4RI9c12kEQl9m8EaGnRIs5AC9h4pzU6elQtgfS4evrNiyDzi7Igyby
 3ZkW/xgolKmqHWzyR4Tj+Misg+/fi70nK4zlBDpn6herP5YxLrbLdEUGPUKB4DKzWwU
 lpGaFsXwLH/3FkfzlPALnV7Ca9q+7h8q0g92mrK0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=collabora.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=collabora.com header.i=george.kiagiadakis@collabora.com
 header.a=rsa-sha256 header.s=zohomail header.b=T5db512t
Subject: Re: [Buildroot] [PATCH 3/4] package: add wireplumber in the config
 system
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IC0tLS0gT24gVGh1LCAxNSBBdWcgMjAyNCAyMDoyODowMCArMDMwMCAgWWFubiBFLiBNT1JJTiAg
d3JvdGUgLS0tIAogPiBHZW9yZ2UsIEFsbCwKID4gCiA+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250
cmlidXRvaW4hCiA+IAogPiBPbiAyMDI0LTA4LTE1IDE4OjAzICswMzAwLCBHZW9yZ2UgS2lhZ2lh
ZGFraXMgc3Bha2UgdGh1c2x5OgogPiA+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBLaWFnaWFkYWtp
cyBnZW9yZ2Uua2lhZ2lhZGFraXNAY29sbGFib3JhLmNvbT4KID4gPiAtLS0KID4gPiAgcGFja2Fn
ZS9Db25maWcuaW4gfCAxICsKID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiA+
ID4gCiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcu
aW4KID4gPiBpbmRleCBmMmM2M2ZmYjZlLi4zM2NiNTA1MjJmIDEwMDY0NAogPiA+IC0tLSBhL3Bh
Y2thZ2UvQ29uZmlnLmluCiA+ID4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KID4gPiBAQCAtNjEs
NiArNjEsNyBAQCBtZW51ICJBdWRpbyBhbmQgdmlkZW8gYXBwbGljYXRpb25zIgogPiA+ICDCoMKg
wqDCoHNvdXJjZSAicGFja2FnZS92bGMvQ29uZmlnLmluIgogPiA+ICDCoMKgwqDCoHNvdXJjZSAi
cGFja2FnZS92b3JiaXMtdG9vbHMvQ29uZmlnLmluIgogPiA+ICDCoMKgwqDCoHNvdXJjZSAicGFj
a2FnZS93YXZwYWNrL0NvbmZpZy5pbiIKID4gPiArwqDCoMKgwqBzb3VyY2UgInBhY2thZ2Uvd2ly
ZXBsdW1iZXIvQ29uZmlnLmluIgogPiAKID4gQUZBSUNTLCB3aXJlcGx1bWJlciBpcyBhbHJlYWR5
IHNvdXJjZWQsIG9uIGxpbmUgMTc2NiwgaW4gdGhlCiA+IExpYnJhcmllcy0+R3JhcGhpY3Mgc3Vi
LW1lbnUuCiA+IAogPiBZb3UgY2FuIHNlYXJjaCBmb3IgS2NvbmZpZyBzeW1ib2wgYnkgaGl0dGlu
ZyAnLycgaW4gdGhlIG1lbnVjb25maWcsIGFuZAogPiB0aGVuIGVudGVyIGEgcXVlcnkgKHJlZ2V4
cCksIHdoaWNoIG9wZW5zIGEgbGlzdCBvZiByZXN1bHRzLCBhbmQgZm9yIGVhY2gKID4gdGhlcmUg
aXMgYSBudW1iZSByeW91IGNhbiBoaXQgdG8gZGlyZWN0bHkganVtcCB0aGVyZSAob3IgYXQgbGVh
c3Qgc2VlCiA+IHRoZSBkZXBlbmRlbmNpZXMgdGhhIHRhcmUgbm90IG1ldCkuCiA+IAogPiBJZiB5
b3UgYmVsaWV2ZSB0aGF0J3Mgbm90IGEgZ29vZCBsb2NhdGlvbiwgdGhlbiBwbGVhc2Ugc2VuZCBh
bm90aGVyCiA+IHBhdGNoIG1vdmluZyBpdCBhcm91bmQsIHdpdGggYSBjb21taXQgbG9nIHRoYXQg
ZXhwbGFpbnMgd2h5IHlvdSBiZWxpZXZlCiA+IGl0IHNob3VsZCBiZSBtb3ZlZCBhcm91bmQuCiAK
T2gsIHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIEkgYWRtaXQgSSBkaWQgbm90IHJl
YWxpemUgdGhhdCBpdCB3YXMgaW4gYSBkaWZmZXJlbnQgc2VjdGlvbi4gSSB3b3VsZCBuZXZlciB0
aGluayBvZiBsb29raW5nIGluICJHcmFwaGljcyIsIGl0IG1ha2VzIG5vIHNlbnNlIGZvciB3aXJl
cGx1bWJlci4gSSB3aWxsIHN1Ym1pdCBhbm90aGVyIHBhdGNoLgoKQmVzdCByZWdhcmRzLApHZW9y
Z2UKCiA+IFJlZ2FyZHMsCiA+IFlhbm4gRS4gTU9SSU4uCiA+IAogPiA+ICDCoMKgwqDCoHNvdXJj
ZSAicGFja2FnZS95YXZ0YS9Db25maWcuaW4iCiA+ID4gIMKgwqDCoMKgc291cmNlICJwYWNrYWdl
L3ltcGQvQ29uZmlnLmluIgogPiA+ICDCoMKgwqDCoHNvdXJjZSAicGFja2FnZS96eW5hZGRzdWJm
eC9Db25maWcuaW4iCiA+ID4gLS0gCiA+ID4gMi4zMC4yCiA+ID4gCiA+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KID4gPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CiA+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKID4gPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKID4gCiA+IC0tIAogPiAuLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgogPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAogPiB8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAogPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAogPiB8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAogPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwogPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwogPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0CiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAogPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
