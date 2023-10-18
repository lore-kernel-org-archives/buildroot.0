Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB0DCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0DC4822E9;
	Wed, 18 Oct 2023 15:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0DC4822E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzSixhfp-tSL; Wed, 18 Oct 2023 15:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BA982128;
	Wed, 18 Oct 2023 15:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06BA982128
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 105791BF5D7
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6050405AC
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6050405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HROQHaAgqtfm for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:38:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CC1A401A4
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC1A401A4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15F98C0011;
 Wed, 18 Oct 2023 15:38:07 +0000 (UTC)
Date: Wed, 18 Oct 2023 17:38:07 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231018173807.1586a883@bootlin.com>
In-Reply-To: <20231018152047.GA2607@scaer>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
 <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
 <20231018105301.495c5899@bootlin.com> <20231018152047.GA2607@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697643488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqoJytzGsThyK4z/3KReS7JCZkrhTnC0uu295LDym74=;
 b=iZt7GFe2qKf+5y9yRQYrNgs1NObyjv+XiSUJcXDDR6lV1hbyb57mO9DBTqVf+nMH63a/4T
 24TMQNZ0A+rL+aMsP71KbAf+fYeDLkTXQAFMNHjBib/4XYs2uYVDsq173Ak6SI+Yx57qNK
 GMCtoZBzVlaYi/azWRbCz1xgh8cTm3iyxthAlGEtE44zkswnvrYp6IitDgHPnU6S0kWmcX
 uftmsgk1bbhaWYF95KrlkddZ8TgF5bfIHT7nzIpqk1caK8tLQXrU7UgHubDbfSJXA8P8gu
 5gL30qBqrAi3aQuq3YhwR9ysOUeYe0uJGb+yLqjegTc2vlMsQ0sbb2JR5fuWtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iZt7GFe2
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-utils: teach
 per-package-rsync to copy or hardlink dest
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoKT24gV2VkLCAxOCBPY3QgMjAyMyAxNzoyMDo0NyArMDIwMAoiWWFubiBFLiBN
T1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gSGVydsOpLCBBbGwKPiAK
Wy4uLl0KPiAKPiA+ID4gLS0tIGEvcGFja2FnZS9wa2ctdXRpbHMubWsKPiA+ID4gKysrIGIvcGFj
a2FnZS9wa2ctdXRpbHMubWsKPiA+ID4gQEAgLTIxNCwxMCArMjE0LDE5IEBAIGlmZXEgKCQoQlIy
X1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTKSx5KQo+ID4gPiAgIyAkMTogc3BhY2Utc2VwYXJhdGVk
IGxpc3Qgb2YgcGFja2FnZXMgdG8gcnN5bmMgZnJvbQo+ID4gPiAgIyAkMjogJ2hvc3QnIG9yICd0
YXJnZXQnCj4gPiA+ICAjICQzOiBkZXN0aW5hdGlvbiBkaXJlY3RvcnkKPiA+ID4gKyMgJDQ6IGxp
dGVyYWwgImNvcHkiIG9yICJoYXJkbGluayIgdG8gY29weSBvciBoYXJkbGluayBmaWxlcyBmcm9t
IHNyYyB0byBkZXN0Cj4gPiA+ICBkZWZpbmUgcGVyLXBhY2thZ2UtcnN5bmMKPiA+ID4gIAlta2Rp
ciAtcCAkKDMpCj4gPiA+ICAJJChmb3JlYWNoIHBrZywkKDEpLFwKPiA+ID4gLQkJcnN5bmMgLWEg
LS1saW5rLWRlc3Q9JChQRVJfUEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLyBcCj4gPiA+ICsJCXJz
eW5jIC1hIFwKPiA+ID4gKwkJCS0taGFyZC1saW5rcyBcICAKPiA+IFlvdSBwcmVzZXJ2ZSBoYXJk
IGxpbmtzICgtLWhhcmQtbGlua3MpIGluIGFsbCBjYXNlcyAoY29weSBhbmQgaGFyZGxpbmspLgo+
ID4gSW4gY2FzZSBvZiBjb3B5LCBpcyBpdCBjb3JyZWN0IHRvIHByZXNlcnZlIGhhcmQgbGlua3Mg
PyAgCj4gCj4gWWVzLCAtLWhhcmQtbGlua3MgaXM6Cj4gCj4gICAgIFRoaXMgdGVsbHMgcnN5bmMg
dG8gbG9vayBmb3IgaGFyZC1saW5rZWQgZmlsZXMgaW4gdGhlIHNvdXJjZSBhbmQKPiAgICAgbGlu
ayB0b2dldGhlciB0aGUgY29ycmVzcG9uZGluZyBmaWxlcyBvbiB0aGUgZGVzdGluYXRpb24uCgpJ
biBjYXNlIG9mICdjb3B5JywgeW91IGtlZXAgaGFyZC1saW5rcyBhbHJlYWR5IHByZXNlbnQgaW4g
c291cmNlIGFuZCBzbyB0aGUKZGVzdGluYXRpb24gKGZpbmFsIGhvc3QvdGFyZ2V0IGRpcnMpIGlz
IG5vdCBhIGZ1bGwgY29weS4KU29tZSBoYXJkLWxpbmtzIGNhbiBiZSBwcmVzZW50IGFuZCBwb3N0
LWJ1aWxkIHNjcmlwdHMgY2FuIHN0aWxsIGNvcnJ1cHQgc29tZQpwZXItcGFja2FnZSBzb3VyY2Vz
LgoKSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBrZWVwaW5nIGhhcmQtbGlua3Mgb24gdGhpcyBsYXN0
IGNvcHkgaXMgbmVlZGVkIGFuZCBJCnByb2JhYmx5IG1pc3Mgc29tZXRoaW5nLi4uCgpSZWdhcmRz
LApIZXJ2w6kKCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+ID4gPiArCQkJJChp
ZiAkKGZpbHRlciBoYXJkbGluaywkKDQpKSwgXAo+ID4gPiArCQkJCS0tbGluay1kZXN0PSQoUEVS
X1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8sIFwKPiA+ID4gKwkJCQkkKGlmICQoZmlsdGVyIGNv
cHksJCg0KSksIFwKPiA+ID4gKwkJCQkJJChlbXB0eSksIFwKPiA+ID4gKwkJCQkJJChlcnJvciBw
ZXItcGFja2FnZS1yc3luYyBjYW4gb25seSAiY29weSIgb3IgImhhcmRsaW5rIiwgbm90ICIkKDQp
IikgXAo+ID4gPiArCQkJCSkgXAo+ID4gPiArCQkJKSBcCj4gPiA+ICAJCQkkKFBFUl9QQUNLQUdF
X0RJUikvJChwa2cpLyQoMikvIFwKPiA+ID4gIAkJCSQoMykkKHNlcCkpCj4gPiA+ICBlbmRlZiAg
Cj4gPiAKPiA+IFsuLi5dCj4gPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
