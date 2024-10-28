Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA48D33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 15:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E1C400A9;
	Mon, 28 Oct 2024 15:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmrEdUfTTaY9; Mon, 28 Oct 2024 15:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CDBB4012F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CDBB4012F;
	Mon, 28 Oct 2024 15:41:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58444112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D8280B1B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKc9nW6yoTZB for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 15:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2921C80B10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2921C80B10
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2921C80B10
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:41:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CE3AE000C;
 Mon, 28 Oct 2024 15:41:19 +0000 (UTC)
Date: Mon, 28 Oct 2024 16:41:18 +0100
To: "=?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= (Leonid Yuriev)"
 <leo@yuriev.ru>
Cc: buildroot@buildroot.org
Message-ID: <20241028164118.1f770fb2@windsurf>
In-Reply-To: <20241027193029.298728-1-leo@yuriev.ru>
References: <20241027193029.298728-1-leo@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730130079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncRY7zBeKvyIS57S1CMKIeXqLN6W/hV/o7fLaF28wOM=;
 b=braWmPF+RQCmGGzsld6ZebVoo9uzu5Gr4WnwEj//aUYKrWEqRy6HzphDFU84N6BMulLX/M
 EiOqn4MDMTm6bKD2XfYa/xYnfBGZv/25nCzYX5a2vRR8q7c+SFsH85u85oFpUBenBjVHf0
 qxYByeQgG7BUiPjq2oVUa6N4dPGQY8JxFTAIwbQf5KMP8Nrj1McLa6nXe8mjL1JhXcepgG
 9kUH7xtHmIGGbE9lw+2MDepoIay/rbTynF0vB8P9XV8D+1Gdwr0WmirVjUREB+qOCmGYqo
 cxr1jYb14Dbt7UjIozRF1rllYyPvzdQv8M+Mk80i9EsV6Y6IgxB4epvPEVEJXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=braWmPF+
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.12
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

T24gU3VuLCAyNyBPY3QgMjAyNCAyMjozMDoyOCArMDMwMArQm9C10L7QvdC40LQg0K7RgNGM0LXQ
siAoTGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+IHdyb3RlOgoKPiBUaGlzIGlzIGJ1Z2Zp
eCByZWxlYXNlIG9mIHN0YWJsZSBsaWJtZGJ4IGJyYW5jaC4KPiAKPiBUaGUgbW9zdCBzaWduaWZp
Y2FudCBmaXhlcyBzaW5jZSB2MC4xMi4xMCAodGhlIHByZXZpb3VzIHZlcnNpb24gcGlubmVkIHRv
Cj4gYnVpbGRyb290KToKPiAKPiAgLSBGaXhlZCB0aGUgcG9zc2liaWxpdHkgb2YgYFNJR1NFR1Zg
IGluc2lkZSB0aGUgYGNvaGVyZW5jZV9jaGVjaygpYCBhZnRlcgo+ICAgIGNoYW5naW5nIHRoZSBn
ZW9tZXRyeSBieSBhbm90aGVyIHByb2Nlc3Mgd2l0aCBhbiBpbmNyZWFzZSBpbiB0aGUgdXBwZXIK
PiAgICBEQiBzaXplIGFib3ZlIHRoZSBwcmV2aW91cyBpbi1wcm9jZXNzIGxpbWl0Lgo+IAo+ICAt
IEZpeGVkIGN1cnNvcihzKSBoYW5kbGluZyBvcGVuZWQgaW4gcGFyZW50IHRyYW5zYWN0aW9ucyBh
bmQgY2xvc2VkIGJlZm9yZQo+ICAgIHRoZSBjb21wbGV0aW9uIG9mIG5lc3RlZC9jaGlsZCB0cmFu
c2FjdGlvbnMuIEluIHN1Y2ggY2FzZSwgY2xvc2VkCj4gICAgY3Vyc29ycyB3ZXJlICJyZXN1cnJl
Y3RlZCIsIHdoaWNoIGxlZCB0byBhIGxlYWsgb2YgbWVtb3J5IGFsbG9jYXRlZCBmb3IKPiAgICBz
dWNoIGN1cnNvcnMuCj4gCj4gIC0gRml4ZWQgYSBwb3NzaWJpbGl0eSBvZiBgU0lHU0VHVmAgd2hl
biBlbmFibGluZyBsb2dnaW5nIG9mIHRoZQo+ICAgIGBNREJYX0xPR19UUkFDRWAgbGV2ZWwgaW4g
ZGVidWcgYnVpbGRzLgo+IAo+ICAtIENvcnJlY3Rpb24gb2YgdGhlIG1pc3NpbmcgYFRYTl9FTkRf
RU9URE9ORWAgaW4gdGhlIGNhc2UgdGhlIHN0YXJ0IG9mCj4gICAgYSByZWFkaW5nIHRyYW5zYWN0
aW9uIGZhaWxzLiBUaGUgbWVudGlvbmVkIGJpdC1mbGFnIHdhcyBtaXNzaW5nIGluIHRoZQo+ICAg
IHRyYW5zYWN0aW9uIGRlc3RydWN0aW9uL3NodXRkb3duIHBhdGggb24gZXJyb3IgaXRzIGxhdW5j
aC4gQmVjYXVzZSBvZgo+ICAgIHRoaXMsIGFuIGF0dGVtcHQgd2FzIG1hZGUgdG8gZGVzdHJveSB0
aGUgY3Vyc29ycywgd2hpY2ggbGVkIHRvIGNyYXNoCj4gICAgZGVidWcgYnVpbGRzLCBzaW5jZSB0
aGUgY29ycmVzcG9uZGluZyBhcnJheSBpcyBpbnRlbnRpb25hbGx5IGZpbGxlZAo+ICAgIHdpdGgg
cG9pc29uIHBvaW50ZXJzLgo+IAo+ICAtIE1vZGlmaWNhdGlvbiBvZiBgbWRieF9jbG9zZV9ieSgp
YCB0byByZXR1cm4gYW4gZXJyb3Igd2hlbiB0cnlpbmcgdG8KPiAgICBjbG9zZSB0aGUgZGJpIGRl
c2NyaXB0b3Igb2YgYSB0YWJsZSBjcmVhdGVkIGFuZC9vciBtb2RpZmllZCBpbiBhCj4gICAgc3Rp
bGwtcnVubmluZyB0cmFuc2FjdGlvbi4gU3VjaCBwcmVtYXR1cmUgY2xvc3VyZSBvZiB0aGUgZGVz
Y3JpcHRvciBpcwo+ICAgIGFuIGluY29ycmVjdCB1c2Ugb2YgdGhlIEFQSSBhbmQgYSB2aW9sYXRp
b24gb2YgdGhlIGNvbnRyYWN0L3ByZWNvbmRpdGlvbnMKPiAgICBmb3JtdWxhdGVkIGluIHRoZSBk
ZXNjcmlwdGlvbiBvZiBgbWRieF9jbG9zZV9kYmkoKWAuCj4gCj4gICAgSG93ZXZlciwgaW5zdGVh
ZCBvZiByZXR1cm5pbmcgYW4gZXJyb3IsIGFuIGluY29ycmVjdCBjbG9zdXJlIG9mIHRoZQo+ICAg
IGRlc2NyaXB0b3Igd2FzIHBlcmZvcm1lZCwgd2hpY2ggY291bGQgbGVhZCB0byB0aGUgY3JlYXRp
b24gb2YgYSB0YWJsZQo+ICAgIHdpdGggYW4gZW1wdHkgbmFtZSwgbGVha2FnZSBvZiBkYXRhYmFz
ZSBwYWdlcyBhbmQvb3IgY29ycnVwdGlvbiBvZiBhCj4gICAgYi10cmVlIHN0cnVjdHVyZSAod3Jv
bmcgcmVmZXJlbmNlIHRvIHRoZSByb290IG9mIGEgdGFibGUpLgo+IAo+IFRoZSBjb21wbGV0ZSBD
aGFuZ2VMb2c6Cj4gICAgIGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRi
eC9ibG9iP2ZpbGU9Q2hhbmdlTG9nLm1kCj4gCj4gU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0
INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2LnJ1Pgo+IC0tLQo+ICBwYWNr
YWdlL2xpYm1kYngvbGlibWRieC5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL2xpYm1kYngvbGlibWRi
eC5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQ
ZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
