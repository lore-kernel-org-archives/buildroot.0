Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EF7C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A5EC405A2;
	Sun, 13 Nov 2022 21:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A5EC405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMU1eEDBywud; Sun, 13 Nov 2022 21:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98B534058B;
	Sun, 13 Nov 2022 21:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98B534058B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 206801BF406
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06DE24086E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06DE24086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cYfIJx7qQXCQ for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:01:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DFB7404E7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DFB7404E7
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:01:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB2F4FF805;
 Sun, 13 Nov 2022 21:01:32 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:01:31 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221113220131.710a51e4@windsurf>
In-Reply-To: <20221113110901.4065729-1-yann.morin.1998@free.fr>
References: <20221113110901.4065729-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668373293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2A3kkH53KlZrmdWkQPnQ/kvQ9dWI+SU33aaQF5qs5Hg=;
 b=e9labSNjYGERJimd2FQu/BvdZuh15zhQbcii0yPEqsDAAW/5SgeikPT4iLYQZeCKLxgsZ0
 d/kgW/bo+p270L4PQhN2Rxi2eO4hinuRQROjfl5yC8ffGV/ojAVUNrkpyzBx/1UHqoNOnf
 LhmJSkUW6YiQwPzMTmnS9EM9RXUYOsHs5/BvH7+im/7ZbPKJsmN6rTN+gYdnWiC/HjwEGR
 yCP99ZEPf2+vj6XVh1kSFeTQZF2iXIMFTxlxxqRj9fMewt0gaSBC5szVl9fwv+YFBHq9zG
 O++0+MxHNuvZr2IPv0JhSCjbTC/Eg3e1IhERCMkhqNKHCdRaYTa8AfLyGsc3DQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e9labSNj
Subject: Re: [Buildroot] [PATCH] package/systemd: fix build with -Ofast
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxMyBOb3YgMjAyMiAxMjowOTowMSArMDEwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gc3lzdGVtZCBkb2VzIG5vdCBidWlsZCB3aXRo
IC1PZmFzdCAoYXQgbGVhc3Qgd2l0aCBnY2MtMTIpLCBsZWFkaW5nIHRvCj4gYnVpbGQgZXJyb3Jz
IGxpa2U6Cj4gCj4gICAgIC4uL3NyYy9zaGFyZWQvY29uZGl0aW9uLmM6IEluIGZ1bmN0aW9uIOKA
mGNvbmRpdGlvbl9kdW1wX2xpc3TigJk6Cj4gICAgIC4uL3NyYy9zaGFyZWQvY29uZGl0aW9uLmM6
MTIyNzozMzogZXJyb3I6IOKAmCVz4oCZIGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBudWxsIFstV2Vy
cm9yPWZvcm1hdC1vdmVyZmxvdz1dCj4gICAgICAxMjI3IHwgICAgICAgICAgICAgICAgICIlc1x0
JXM6ICVzJXMlcyAlc1xuIiwKPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+Cj4gICAgIGNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9y
cwo+IAo+IEl0IGlzIG5vdCByZWFsbHkgY2xlYXIgd2hhdCB0aGUgcmVhc29uIGlzLCBidXQgaXQg
c21lbGxzIGxpa2UgYSBjb21waWxlcgo+IGVycm9yLgo+IAo+IEluZGVlZCwgdGhlIGZhaWxpbmcg
Zm9ybWF0IGlzIHBhc3NlZCB0byBhbiBmcHJpbnRmLCBhbmQgdGhlIHBhcmFtZXRlcgo+IGNvcnJl
c3BvbmRpbmcgdG8gdGhlIGZhaWxpbmcgJXMgZGlyZWN0aXZlIGlzIGEgY2FsbCB0byBhIGZ1bmN0
aW9uCj4gd2hpY2ggcHJvdG90eXBlIGlzIGRlZmluZWQgYnV0IHRoZSBpbXBsZW1lbnRhdGlvbiBv
bmx5IGNvbWVzIGxhdGVyIGluCj4gdGhlIHNhbWUgY29tcGlsYXRpb24gdW5pdCwgYnV0IGlzIHRo
ZSByZXN1bHQgb2YgbWFjcm8gZXhwYW5zaW9uLCB3aGljaAo+IHlpZWxkcyBhIGZ1bmN0aW9uIGRl
ZmludGlvbiBsaWtlOgo+IAo+ICAgICBjb25zdCBjaGFyIGZvb190b19zdHJpbmcoZm9vX3R5cGUg
aSkgewo+ICAgICAgICAgaWYgKGkgPCAwIHx8IGkgPj0gKGZvb190eXBlKSBFTEVNRU5UU09GKGZv
b190YWJsZSkpCj4gICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gICAgICAgICByZXR1cm4gZm9v
X3RhYmxlW2ldCj4gICAgIH0KPiAKPiAod2hlcmUgRUxFTUVOVFNPRih4KSBpcyBhIG1hY3JvcyBh
cm91bmYgc2l6ZW9mKHgpIHRvIGRldGVybWluZSB0aGUKPiBudW1iZXIgb2YgZWxlbWVudHMgaW4g
dGhlIGFycmF5IGZvb190YWJsZSkuCj4gCj4gSG93ZXZlciwgaW4gdGhlIGZhaWxpbmcgY2FzZSwg
Zm9vX3RhYmxlIGlzIGEgc3RhdGljIGNvbnN0IGFycmF5IGluZGV4ZWQKPiB3aXRoIGNvbnN0YW50
cyBmcm9tIGFuIGVudW0sIGFuZCBmb29fdG9fc3RyaW5nKCkgaXMgb25seSBldmVyIGNhbGxlZAo+
IHdpdGggdmFyaWFibGVzIHRoYXQgYXJlIG9ubHkgZXZlciBzZXQgdG8gb25lIG9mIHRob3NlIGVu
dW0gdmFsdWVzLgo+IAo+IFNpbmNlIC1PZmFzdCBpcyBhbHNvIGV4cGxpY2l0bHkgZG9jdW1lbnRl
ZCBhcyBicmVha2luZyBvdGVocndpc2UKPiBjb25mb3JtYW50IHByb2dyYW1zLCB3ZSdyZSBub3Qg
Z29pbmcgdG8gZGVidWcgZnVydGhlciB0aGUgcmVhc29uIGZvciB0aGUKPiBidWlsZCBmYWlsdXJl
LgoKSSB0aGluayBpdCB3b3VsZCBzdGlsbCBtYWtlIHNlbnNlIHRvIHJlcG9ydCB0aGUgYnVnIHRv
IGdjYyB1cHN0cmVhbS4KCj4gSW5zdGVhZCwganVzdCByZXZlcnQgdG8gdGhlIGJlc3QgYWx0ZXJu
YXRlIG9wdGltaXNhdGlvbiBsZXZlbC4gV2UgY2hvc2UKPiAtTzMsIGFzIC1PZmFzdCBpcyBiYXNl
ZCBvbiAtTzMgd2l0aCBicmVha2luZyBvcHRpbWlzYXRpb24gZmxhZ3MuCj4gCj4gV2l0aCAtTzMs
IHRoZSBidWlsZCBzdWNjZWVkcy4KPiAKPiBGaXhlczoKPiAgICAgaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnL3Jlc3VsdHMvM2ZmYWE5YjNlY2FjYzZhYzMyNmJlNzgxOTZhZjFhZDYxM2Yx
OTVlZC8gKHNwYXJjNjQpCj4gICAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1
bHRzLzNmNmFlMmU1MDNkZDE1MzllNDI0MGYzNDQ4NjVkYTQ4ODE4NzkyMDQvIChhcm0pCj4gICAg
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzY4YzE3MDU2NDkwZDQ0MWM3
Zjg2MjM0OWU5YzdlNDcxYjQ1NzAxNjIvIChwcGM2NCkKPiAgICAgLi4uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gQ2M6IE5vcmJl
cnQgTGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+Cj4gQ2M6IFNlbiBIYXN0aW5ncyA8c2VuQHBo
b2Jvc2RwbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIHwgNSArKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpCdXQgYW55d2F5OiBhcHBsaWVk
IHRvIG1hc3RlciwgdGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
