Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE633F46449
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 10:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E30F60C01;
	Mon, 16 Mar 2026 10:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibR-ehl-7eUr; Mon, 16 Mar 2026 10:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C2060C10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773656985;
	bh=/ZWAKESiQ+0J2HFo3G/4hZHypz/zOmPpFrSmlqtpgJo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QK77zEh1jZjFCigsiraY+JWLmrp0MO1luCiRSj4tObQBBawD7klIU9VIn+QOi1QQx
	 xe8Z96igoT5NEYRk8Owp2ph7mDLK2I6+lpta+wJrrJ68ZJASKfyHmdLywZ9d+pLMbx
	 EkDhj/9jstK/WJAsab5J4S/avrtLcP0JKcNU7Fliy7j/zuoA8jgWsUBsycV/C1lbAH
	 n9Y04hniMvntfgdoKmzNlI+xapoqCCaSlWHx69wnDSN/17DxpZNVLMmRL5z8GGQnXT
	 ewjQiworbyI1iMM8JBlSpxnHlCMbFY+i/Bx63KTPxrC7U6NXo+3J41/UvD9wc30cIj
	 xjT9kkluRWd2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C2060C10;
	Mon, 16 Mar 2026 10:29:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C47D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC8F040CEE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZBVThKRunxw for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 10:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC9AA405FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC9AA405FA
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC9AA405FA
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:29:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 64BAEC4158D;
 Mon, 16 Mar 2026 10:30:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DA4DA5FC4A;
 Mon, 16 Mar 2026 10:29:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3481010369E67; Mon, 16 Mar 2026 11:29:37 +0100 (CET)
Date: Mon, 16 Mar 2026 11:29:35 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Louis Chauvet <louis.chauvet@bootlin.com>, Eric
 Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20260316112935.4336b322@kmaincent-XPS-13-7390>
In-Reply-To: <abbeWoojTqlSCJwr@windsurf>
References: <20260312111331.391639-1-kory.maincent@bootlin.com>
 <abbeWoojTqlSCJwr@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773656979; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=28TIOqJHToWK6lkr5kEd1C5Kadonc7GJ0y6d1MtJ0hM=;
 b=UROqCFyzDk5OCSum5T3d0jElYU4g4xYaz1ZIezKvcjU5LwDExiLu9yubeWto12O1VJytlL
 dEqq+fbkqo8krQWG2aQj73cAjx9YOXdQtpd9BJitAk7Fi47Skx+JLEbXGZxerWJBRcad6U
 +dwD8XQ/St3vjSnbPHbBhynZSbLppTg2OEq8rTLrG0l9TdbkhcclkCGd0IPUOrhYzxoeNG
 Cz6jS6Qb7Byd8j1fPDDEG0IbrP2Mo2hUtIbBHgaMic7n29+r2kax0j5gArt0APQ5/cQGEA
 KLVSaJmP7m11DOyXyGvMjUi7oe3FpX98y/g8djDYxZdQu0TIK1eRLNuQALVBoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UROqCFyz
Subject: Re: [Buildroot] [PATCH] package: Add drm_info
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxNSBNYXIgMjAyNiAxNzozNDozOCArMDEwMApUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8gS29yeSwKPiAKPiBUaGFu
a3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBUaGUgY29tbWl0IHRpdGxlIHNob3VsZCBiZToKPiAKPiAg
ICAgcGFja2FnZS9kcm0taW5mbzogbmV3IHBhY2thZ2UKPiAKPiBPbiBUaHUsIE1hciAxMiwgMjAy
NiBhdCAxMjoxMzozMFBNICswMTAwLCBLb3J5IE1haW5jZW50IHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gPiBkcm1faW5mbyBpcyBhIHNtYWxsIHV0aWxpdHkgdG8gZHVtcCBpbmZvIGFib3V0IERSTSBk
ZXZpY2VzLgo+ID4gCj4gPiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZW1l
cnNpb24vZHJtX2luZm8KPiA+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFp
bmNlbnRAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgLi4uMDAwMS1tZXNvbi5idWlsZC1GaXgt
QnVpbGRyb290LWJ1aWxkLnBhdGNoIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ID4gIHBhY2th
Z2UvZHJtX2luZm8vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrCj4gPiAg
cGFja2FnZS9kcm1faW5mby9kcm1faW5mby5oYXNoICAgICAgICAgICAgICAgIHwgIDUgKysrCj4g
PiAgcGFja2FnZS9kcm1faW5mby9kcm1faW5mby5tayAgICAgICAgICAgICAgICAgIHwgMTUgKysr
KysrKysKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykgIAo+IAo+IFRoZSBw
YWNrYWdlIHNob3VsZCBiZSBuYW1lZCBkcm0taW5mbywgbm90IGRybV9pbmZvLgo+IAo+IEFsc28s
IHBsZWFzZSBhZGQgYW4gZW50cnkgaW4gdGhlIERFVkVMT1BFUlMgZmlsZS4KPiAKPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2RybV9pbmZvLzAwMDEtbWVzb24uYnVpbGQtRml4LUJ1aWxkcm9vdC1i
dWlsZC5wYXRjaAo+ID4gYi9wYWNrYWdlL2RybV9pbmZvLzAwMDEtbWVzb24uYnVpbGQtRml4LUJ1
aWxkcm9vdC1idWlsZC5wYXRjaCBuZXcgZmlsZSBtb2RlCj4gPiAxMDA2NDQgaW5kZXggMDAwMDAw
MDAwMC4uYjcwOWFiOGExZgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9kcm1f
aW5mby8wMDAxLW1lc29uLmJ1aWxkLUZpeC1CdWlsZHJvb3QtYnVpbGQucGF0Y2gKPiA+IEBAIC0w
LDAgKzEsMzQgQEAKPiA+ICtGcm9tIDc4NTUyNWE3NDg3OGJkZjY4OGM1NDY2ZDgzZTE5M2UyMDdh
YmVkNmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiArRnJvbTogS29yeSBNYWluY2VudCA8
a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPiA+ICtEYXRlOiBXZWQsIDExIE1hciAyMDI2IDE5
OjAzOjQ2ICswMTAwCj4gPiArU3ViamVjdDogW1BBVENIXSBtZXNvbi5idWlsZDogRml4IEJ1aWxk
cm9vdCBidWlsZAo+ID4gKwo+ID4gK0luIGNyb3NzIGNvbXBpbGF0aW9uIGNhc2UgcGNfc3lzcm9v
dGRpciB2YXJpYWJsZSBjb250YWlucyB0aGUgc3lzcm9vdCBwYXRoLAo+ID4gK2J1dCBpbmNsdWRl
ZGlyIGZyb20gcGtnY29uZmlnIGFscmVhZHkgY29udGFpbnMgdGhlIGZ1bGwgYWJzb2x1dGUgcGF0
aAo+ID4gKyhzeXNyb290ICsgL3Vzci9pbmNsdWRlKSwgc28gY29uY2F0ZW5hdGluZyB0aGVtIGRv
dWJsZSB0aGUgc3lzcm9vdCBwcmVmaXguCj4gPiArCj4gPiArVGhlIGZpeCByZW1vdmVzIHBjX3N5
c3Jvb3RkaXIgKyBzbyBpbmNsdWRlZGlyIGlzIHVzZWQgZGlyZWN0bHksIHdoaWNoCj4gPiArYWxy
ZWFkeSBwb2ludHMgdG8gdGhlIGNvcnJlY3QgYWJzb2x1dGUgcGF0aCBvbiB0aGUgZmlsZXN5c3Rl
bS4KPiA+ICsKPiA+ICtVcHN0cmVhbTogTi9BICAKPiAKPiBDbGVhcmx5IGRvaW5nIGNyb3NzLWNv
bXBpbGF0aW9uIHByb3Blcmx5IHdpdGggbWVzb24gaXMgcG9zc2libGUuIFNvIGFuCj4gdXBzdHJl
YW1hYmxlIHBhdGNoIG11c3QgYmUgcG9zc2libGUgZm9yIHRoaXMuIEkgdGhpbmsgdXNpbmcKPiBw
Y19zeXNyb290ZGlyIGhlcmUgaXMgaW5jb3JyZWN0LCBidXQgSSBoYXZlbid0IGNoZWNrZWQgdGhv
cm91Z2hseS4gQnV0Cj4gaW4gYW55IGNhc2UsIHRoaXMgaXMgbm90IGEgImZpeCBCdWlsZHJvb3Qg
YnVpbGQiIHBhdGNoLCBhcyB0aGlzIGlzc3VlCj4gaXMgdW5yZWxhdGVkIHRvIEJ1aWxkcm9vdCwg
YW55IG90aGVyIGNyb3NzLWNvbXBpbGF0aW9uIHNjZW5hcmlvIHdvdWxkCj4gZW5jb3VudGVyIHRo
ZSBzYW1lIGlzc3VlLiBUaGlzIG1lYW5zIGEgcGF0Y2ggbXVzdCBiZSBzdWJtaXR0ZWQKPiB1cHN0
cmVhbS4KCkkgZmlyc3Qgd2FudGVkIHRvIHNlbmQgdGhpcyBwYXRjaCB1cHN0ZWFtIGJ1dCBhIHNw
ZWNpZmljIHBhdGNoIGFkZGVkIHRoZQpwY19zeXNyb290ZGlyIHBhcnQsIHNvIGFzIEkgYW0gbm90
IGEgbWVzb24gZXhwZXJ0IEkgc3VwcG9zZWQgdGhlcmUgd2FzIGEKdmFsdWFibGUgcmVhc29uIGZv
ciB0aGF0LiAKICAgIGNkZTk0MTQgRmluZCBkcm1fZm91cmNjLmggaW4gc3lzcm9vdAoKICAgIFdo
ZW4gUEtHX0NPTkZJR19TWVNST09UX0RJUiBpcyBzZXQsIHRoZSBwa2ctY29uZmlnIHZhcmlhYmxl
IGBpbmNsdWRlZGlyYAogICAgb25seSBjb250YWlucyB0aGUgcGF0aCBpbnNpZGUgdGhlIHN5c3Jv
b3QuIFRvIGZpbmQgdGhlIGFjdHVhbCBmaWxlLAogICAgcHJlcGVuZCB0aGUgc3lzcm9vdCAoZGVm
YXVsdHMgdG8gYC9gKS4KCkkgd2lsbCB0YWtlIGEgZGVlcGVyIGxvb2sgYXQgaXQuCgpSZWdhcmRz
LAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
