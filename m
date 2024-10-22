Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB60CDD0F8
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF36760640;
	Tue, 22 Oct 2024 20:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioCbseQz-xbs; Tue, 22 Oct 2024 20:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102DA60664
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 102DA60664;
	Tue, 22 Oct 2024 20:56:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD1C59F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E5424060E
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ji4rlwJDlqm for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28666404E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28666404E2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28666404E2
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:56:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76093C0006;
 Tue, 22 Oct 2024 20:56:48 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:56:47 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Suniel Mahesh <sunil@amarulasolutions.com>
Message-ID: <20241022225647.0a920dd0@windsurf>
In-Reply-To: <20241014180507.811832-1-vincent.stehle@arm.com>
References: <20241014180507.811832-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729630609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QuqMMJm2C2ipdNBeSe8wwpRBkfek6HMjIKdRmk/MBAQ=;
 b=L+D1PvoiXj1PObb0XQLx2kNApbpXovhmct8mye31NKjtFC8qhPhYqFMM3W998nj2IFI180
 ZHsJTb5idFdaK9K+A/8jsC/gN+H5BJSOSWDR1oQOKjtpk/OnqK0iKP9c2IafRmXi5o2W4t
 dbv+5PNkyVBnj1gytR1ysdHUhJ41ckKrlgjK+c31FrG1RBbWqNkcFcBRYKkV340qHgbum2
 phgIGlORdIOLMYyrMcU7wPZl17Yh+IYpDs7wjHwwbCisluPAofOr8L6j2r4Ukcbhk9S7Xl
 K16C8Nak5Hz7RToNnz46pH5hTB5Riyq49JuRbCX5Ui18X+JPWftxpBUGnr1oxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L+D1Pvoi
Subject: Re: [Buildroot] [PATCH] configs/rockpro64: bump Linux kernel,
 U-Boot and TF-A
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxNCBPY3QgMjAyNCAyMDowNTowNyArMDIwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiAtIEJ1bXAgTGludXgga2VybmVsIHRvIHY2LjEw
LjE0IGFuZCBhZGQgdGhlIGRlcGVuZGVuY3kgb24gaG9zdCBweXRob24zLgo+IC0gQnVtcCBVLUJv
b3QgdG8gdjIwMjQuMTAgYW5kIGFkZCB0aGUgZGVwZW5kZW5jeSBvbiBHbnVUTFMgYW5kCj4gICB1
dGlsLWxpbnV4IChmb3IgdXVpZCkuCj4gLSBCdW1wIFRGLUEgdG8gdjIuMTEuCj4gLSBUdXJuIG9u
IGhhc2hlcyB2ZXJpZmljYXRpb24gYW5kIGFkZCBoYXNoZXMgZm9yIHRoZSBMaW51eCBrZXJuZWwg
YW5kCj4gICBVLUJvb3QuCj4gLSBGaXggc2hlbGxjaGVjayB3YXJuaW5ncyBpbiB0aGUgcG9zdC1i
dWlsZCBzY3JpcHQuCj4gLSBSZW1vdmUgdGhlIHJlbGF0ZWQgZXhjZXB0aW9ucyBpbiAuY2hlY2tw
YWNrYWdlaWdub3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2Vu
dC5zdGVobGVAYXJtLmNvbT4KPiBDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gQ2M6IFN1bmllbCBNYWhlc2ggPHN1bmlsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+
IENjOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNv
bT4KPiAtLS0KPiAgLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgLS0KPiAgLi4uL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJz
Lmhhc2ggICAgICAgIHwgIDEgKwo+ICBib2FyZC9waW5lNjQvcm9ja3BybzY0L3BhdGNoZXMvbGlu
dXgvbGludXguaGFzaCAgICAgfCAgMiArKwo+ICBib2FyZC9waW5lNjQvcm9ja3BybzY0L3BhdGNo
ZXMvdWJvb3QvdWJvb3QuaGFzaCAgICAgfCAgMiArKwo+ICBib2FyZC9waW5lNjQvcm9ja3BybzY0
L3Bvc3QtYnVpbGQuc2ggICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGNvbmZpZ3Mvcm9ja3By
bzY0X2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKy0tLS0K
PiAgNiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ICBj
cmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvcGluZTY0L3JvY2twcm82NC9wYXRjaGVzL2xpbnV4LWhl
YWRlcnMvbGludXgtaGVhZGVycy5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9waW5l
NjQvcm9ja3BybzY0L3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYm9hcmQvcGluZTY0L3JvY2twcm82NC9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKCkFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
