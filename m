Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4514CCAC5BA
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 19:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFD8413E0;
	Thu, 25 Sep 2025 19:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8iEIhxFDQDI; Thu, 25 Sep 2025 19:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E0441281
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E0441281;
	Thu, 25 Sep 2025 19:42:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EE4C177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75464614EF
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWiYyRaTnUy4 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 19:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FD62614EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD62614EC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FD62614EC
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:42:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6043878035B;
 Thu, 25 Sep 2025 21:42:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Sep 2025 21:42:15 +0200
MIME-Version: 1.0
Date: Thu, 25 Sep 2025 21:42:15 +0200
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20250923135223.1062683-1-clg@kaod.org>
References: <20250923135223.1062683-1-clg@kaod.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <8d3ee63fa1e851699b49b789cfb5da9e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758829338;
 bh=Nm1z+8nfGaPv6iM7ucVzm6gJxuh6YOgPkLoKdAJ1yUo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u6iHvjPsyTCl0GA7WmlUKkfUvgLk3IFO+TUrujaxnVqoXh2snKgoz0ayl9uzVix8b
 yuu4DH8VmF3zA7NQz0Bx8bm1zzerAs8BMzTGlSPBjapaRadIli9AzZAV0Iq/eWEWs2
 p0AZhsz9cmBgoXS3knyI+uYMPBDw3Y+UdwG8gZTcnmKavh+Xzo8kjAHCbRXIETmBRc
 tsXp7g0VKGhHuEwHjx1o8uWVRiNR+KLBv9pJRrOIsfobY0sX2fOMxDVveBjvVZ6ZJZ
 vnOIwMF/g/RDXNJcM6hF2P5/6yW0SM7en1KZLiRjYyrgjPFxjO3KH69Il/uHzxBirP
 CHkOsUDoX2oZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u6iHvjPs
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed_ast2500evb: check hashes,
 use bootlin toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ8OpZHJpYywgSm9lbCwgQWxsLAoKT24gMjMvMDkvMjAyNSAxNTo1MiwgQ8OpZHJpYyBMZSBH
b2F0ZXIgd3JvdGU6Cj4gVGhpcyBjb21taXQgYWRkcyBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tf
SEFTSEVTPXkgYW5kCj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY2X0VBQklI
Rl9HTElCQ19TVEFCTEU9eSBpbiB0aGUKPiBkZWZjb25maWcsIGJ1bXBzIGtlcm5lbCB0byA2LjE2
LjcsIGFuZCBhZGRzIGN1c3RvbSBoYXNoIGZpbGVzIGFuZAo+IHJlbW92ZXMgdGhlIGV4Y2VwdGlv
biBlbnRyeSBpbiAuY2hlY2twYWNrYWdlaWdub3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEPDqWRy
aWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4gLS0tClsuLi5dCj4gZGlmZiAtLWdpdCBhL2Nv
bmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnIAo+IGIvY29uZmlncy9hc3BlZWRfYXN0
MjUwMGV2Yl9kZWZjb25maWcKPiBpbmRleCA2NDY2NmNjM2Q3MDQuLmNhNmExZWYzZDM4ZSAxMDA2
NDQKPiAtLS0gYS9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwo+ICsrKyBiL2Nv
bmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnCj4gQEAgLTEsMTIgKzEsMTYgQEAKPiAg
QlIyX2FybT15Cj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xNj15
Cj4gK0JSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ICtCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JP
T1RMSU49eQo+ICtCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQVJNVjZfRUFCSUhGX0dM
SUJDX1NUQUJMRT15CgpUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBjaGVjayBmYWlsdXJlLiBTZWU6
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTE0ODEy
MzgzNDEKCldBUk46IGRlZmNvbmZpZyAuL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29u
ZmlnIGNhbid0IGJlIHVzZWQ6CiAgICAgICBNaXNzaW5nOiAKQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9CT09UTElOX0FSTVY2X0VBQklIRl9HTElCQ19TVEFCTEU9eQoKVGhpcyBkZWZjb25maWcgZG9l
cyBub3Qgc2VsZWN0IGFueSBDUFUsIHNvIGl0IGRlZmF1bHRzIHRvOgpCUjJfYXJtOTI2dD15CgpB
Y2NvcmRpbmcgdG8gdGhlIEtlcm5lbCBkdHM6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvdHJlZS9hcmNoL2FybS9ib290L2R0
cy9hc3BlZWQvYXNwZWVkLWc1LmR0c2k/aD12Ni4xNi43I240MAoKQ3B1IHNlZW1zIHRvIGJlICJh
cm0xMTc2anpmLXMiLgoKSW4gdGhhdCBjYXNlLCB0aGlzIGRlZmNvbmZpZyBzaG91bGQgYWRkOgpC
UjJfYXJtMTE3Nmp6Zl9zPXkKCkNvdWxkIHlvdSBjb25maXJtIGl0IGlzIHRoZSBjYXNlIGFuZCBz
ZW5kIGEgcGF0Y2ggZml4aW5nIHRoZSBpc3N1ZSwKcGxlYXNlPwoKPiArQlIyX0RPV05MT0FEX0ZP
UkNFX0NIRUNLX0hBU0hFUz15Cj4gK0JSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9hc3BlZWQv
YXN0MjUwMC1ldmIvcGF0Y2hlcyIKPiAgQlIyX1RBUkdFVF9HRU5FUklDX0hPU1ROQU1FPSJhc3Qy
NTAwLWV2YiIKPiAgQlIyX1RBUkdFVF9HRU5FUklDX0lTU1VFPSJBc3BlZWQgQVNUMjUwMCBFVkIi
Cj4gIEJSMl9TWVNURU1fREhDUD0iZXRoMCIKPiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQ
VD0iYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0LWltYWdlLnNoIgo+ICBCUjJfTElOVVhfS0VSTkVM
PXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTYuNCIKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTl9WQUxVRT0iNi4xNi43Igo+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0i
YXNwZWVkX2c1Igo+ICAKPiBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0i
Ym9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL2xpbnV4LmZyYWdtZW50Igo+ICBCUjJfTElOVVhfS0VS
TkVMX1haPXkKPiAtLQo+IDIuNTEuMAoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
