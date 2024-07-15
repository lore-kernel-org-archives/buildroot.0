Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23215C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B57404DE;
	Mon, 15 Jul 2024 10:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSjVMziJI1ha; Mon, 15 Jul 2024 10:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A28F4051E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A28F4051E;
	Mon, 15 Jul 2024 10:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6494A1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51656404F3
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28FObjyhFUMf for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:18:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7EBA40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7EBA40025
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7EBA40025
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:18:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 040181BF206;
 Mon, 15 Jul 2024 10:18:01 +0000 (UTC)
Date: Mon, 15 Jul 2024 12:18:00 +0200
To: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
Message-ID: <20240715121800.7aa996cf@windsurf>
In-Reply-To: <20231025205233.1925727-1-kadir.c.yilmaz@gmail.com>
References: <20231025205233.1925727-1-kadir.c.yilmaz@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721038685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jsrqroupk1YGIG9XRRTTGKXO7BEy7ktwxiTnQE+Xzcs=;
 b=Dx370LSFek8HA5RTCHHjAfnBsU6cU1t3V/DoVu0pDYc8TJQswej0+D92uigPW9EjmgnAD1
 lTP3bUhnXe79bvj+H19jEeyKEBEaE4RhIexnPusHFzqtpXvKP6uRmFWsmlQoaW3x4eMNo3
 I0a8fs4Txs6HeXpZEULufwqnhT0JFy1MUGDisiLwF01HBSN9pZrYNi3pN9skDN089ZGs37
 fyGis2d9vRVs6S4bnfd1eL1tR+Bs2L9xZ3WPCwx4vKn1PjZGA+pnWc1Tv2K1njnZGnXP9b
 yMba461H9kFkxQWNj4rOxyxssqH3g48mZ1KM2VSMwqu1wHu8l7thqlkqZtoXrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dx370LSF
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5webengine-chromium: fix
 python3.11 build errors
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gS2FkaXIsCgpPbiBXZWQsIDI1IE9jdCAyMDIzIDIyOjUyOjMzICswMjAwCkthZGlyIFlp
bG1heiA8a2FkaXIuYy55aWxtYXpAZ21haWwuY29tPiB3cm90ZToKCj4gcXQ1d2ViZW5naW5lIGZh
aWxzIHRvIGJ1aWxkIGR1ZSB0byBjaGFuZ2VzIGludHJvZHVjZWQgaW4gcHl0aG9uMy4xMToKPiAK
PiAtIFs4NjQvMjMxOTJdIEFDVElPTiAvL3NlcnZpY2VzL21ldHJpY3MvcHVibGljL2NwcDpnZW5f
dWttX2J1aWxkZXJzKC9obwo+ICAgbWUvdmFncmFudC9vdXRwdXRfcmFzcGJlcnJ5cGkzX3F0NXdl
L2J1aWxkL3F0NXdlYmVuZ2luZS01LjE1Ljgvc3JjL3RvCj4gICBvbGNoYWluOnRhcmdldCkKPiAg
IC4uLgo+ICAgcmUuZXJyb3I6IGdsb2JhbCBmbGFncyBub3QgYXQgdGhlIHN0YXJ0IG9mIHRoZSBl
eHByZXNzaW9uIGF0IHBvc2l0aW9uIDEKPiAKPiAgICAgaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcv
My4xMS9saWJyYXJ5L3JlLmh0bWwKPiAgICAgKD9haUxtc3V4KQo+ICAgICBDaGFuZ2VkIGluIHZl
cnNpb24gMy4xMTogVGhpcyBjb25zdHJ1Y3Rpb24gY2FuIG9ubHkgYmUgdXNlZCBhdCB0aGUKPiAg
ICAgc3RhcnQgb2YgdGhlIGV4cHJlc3Npb24uCj4gCj4gLSBbMzc0Mi8yMjMyM10gQUNUSU9OIC8v
Y2hyb21lL2FwcDpjaHJvbWl1bV9zdHJpbmdzX2dyaXQoL2hvbWUvdmFncmFudC8KPiAgIG91dHB1
dF9yYXNwYmVycnlwaTNfcXQ1d2UvYnVpbGQvcXQ1d2ViZW5naW5lLTUuMTUuOC9zcmMvdG9vbGNo
YWluOnRhcgo+ICAgZ2V0KQo+ICAgLi4uCj4gICBWYWx1ZUVycm9yOiBpbnZhbGlkIG1vZGU6ICdy
VScKPiAKPiAgICAgb3BlbigpLCBpby5vcGVuKCksIGNvZGVjcy5vcGVuKCkgYW5kIGZpbGVpbnB1
dC5GaWxlSW5wdXQgbm8gbG9uZ2VyCj4gICAgIGFjY2VwdCAnVScgKOKAnHVuaXZlcnNhbCBuZXds
aW5l4oCdKSBpbiB0aGUgZmlsZSBtb2RlLiBJbiBQeXRob24gMywKPiAgICAg4oCcdW5pdmVyc2Fs
IG5ld2xpbmXigJ0gbW9kZSBpcyB1c2VkIGJ5IGRlZmF1bHQgd2hlbmV2ZXIgYSBmaWxlIGlzCj4g
ICAgIG9wZW5lZCBpbiB0ZXh0IG1vZGUsIGFuZCB0aGUgJ1UnIGZsYWcgaGFzIGJlZW4gZGVwcmVj
YXRlZCBzaW5jZQo+ICAgICBQeXRob24gMy4zLiBUaGUgbmV3bGluZSBwYXJhbWV0ZXIgdG8gdGhl
c2UgZnVuY3Rpb25zIGNvbnRyb2xzIGhvdwo+ICAgICB1bml2ZXJzYWwgbmV3bGluZXMgd29yay4g
KENvbnRyaWJ1dGVkIGJ5IFZpY3RvciBTdGlubmVyIGluIGJwby0zNzMzMC4pCj4gCj4gU2lnbmVk
LW9mZi1ieTogS2FkaXIgWWlsbWF6IDxrYWRpci5jLnlpbG1hekBnbWFpbC5jb20+Cj4gLS0tCj4g
IC4uLngtYnVpbGQtdG9vbHMtdG8tcnVuLXdpdGgtcHl0aG9uMy4xMS5wYXRjaCB8IDcyICsrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZS1jaHJvbWl1bS8wMDAzLUZp
eC1idWlsZC10b29scy10by1ydW4td2l0aC1weXRob24zLjExLnBhdGNoCgpTbyBJIGRpZCBub3Qg
cmVhbGx5IGFwcGx5IHlvdXIgcGF0Y2ggYXMtaXMsIGJlY2F1c2UgaW5zdGVhZCBJCmJhY2twb3J0
ZWQgZml4ZXMgZnJvbSBDaHJvbWl1bSB1cHN0cmVhbSBpbnN0ZWFkLiBBcyBzYWlkIGluIGFub3Ro
ZXIKcGF0Y2gsIEkganVzdCBwdXNoZWQgMTMgY29tbWl0cyB0aGF0IGZpeCBhIG51bWJlciBvZiB0
aGluZ3MgaW4KcXQ1d2ViZW5naW5lLCBhbmQgdGhhdCBhbGxvdyBhIHN1Y2Nlc3NmdWwgYnVpbGQg
b2YgdGhpcyBjb25maWd1cmF0aW9uOgoKQlIyX2FhcmNoNjQ9eQpCUjJfQVJNX0ZQVV9WRlBWM0Qx
Nj15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RM
SU49eQpCUjJfUk9PVEZTX0RFVklDRV9DUkVBVElPTl9EWU5BTUlDX0VVREVWPXkKQlIyX1BBQ0tB
R0VfTUVTQTNEPXkKQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1NXUkFTVD15CkJS
Ml9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRUdMPXkKQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9F
Uz15CkJSMl9QQUNLQUdFX1FUNT15CkJSMl9QQUNLQUdFX1FUNVdFQkVOR0lORT15CgpCZXN0IHJl
Z2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
