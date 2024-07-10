Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666F8C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 12:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B16A82051;
	Wed, 10 Jul 2024 12:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0KD7VRZdVfT; Wed, 10 Jul 2024 12:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3478205A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D3478205A;
	Wed, 10 Jul 2024 12:38:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80A621BF310
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EA0282038
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Na0sKjfffLRp for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 12:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51D6581766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D6581766
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51D6581766
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 12:37:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52DD040006;
 Wed, 10 Jul 2024 12:37:56 +0000 (UTC)
Date: Wed, 10 Jul 2024 14:37:55 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240710143755.7a0ad71f@windsurf>
In-Reply-To: <20240611171714.3233115-2-dario.binacchi@amarulasolutions.com>
References: <20240611171714.3233115-1-dario.binacchi@amarulasolutions.com>
 <20240611171714.3233115-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720615076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rnJILm2pBtkfnBkMEa5n48DeSBdgoKg8v28C0Vu1d8=;
 b=nTi8zVnH0asQOjqBbPIobVKnlUbKbE2E/2FLTdqiLVa2N0fifiH6Ux6baQ+WCk5VMQQNkg
 JrEo7Nm92IMNBa2I29aCUUPLLoySTgs7Irv/AyzvSC16RXuGOTfYA/W4HFgh5QgXQQUFch
 HJv+b5RlwMPyiZ2Dcze3w0DkaLk4Qqk4g85q+aBkkJt0LuKvu2UIGTzJK6pB5QfAPCSonC
 4D7HGbQ1vukMKKqwYCHrIsI7D+PZUroe1h8C0um8wHgBOfZfCS3PSaPJaafZ/YhG8+PlWn
 P1jbcKGUPajRUTnRiZpcVrLmht0ScPi7DOEuJxhx25lPnPMTBczoKpNCZrBINQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nTi8zVnH
Subject: Re: [Buildroot] [PATCH 2/2] package/snappy: fix compilation error
 raised by vqtbl1q_u8 instruction
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
Cc: linux-amarula@amarulasolutions.com, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpPbiBUdWUsIDExIEp1biAyMDI0IDE5OjE3OjE0ICswMjAwCkRhcmlvIEJp
bmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cgo+IFRo
ZSBwYWNrYWdlIGNvbXBpbGF0aW9uIGZvciB0aGUgcmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZp
ZyByYWlzZXMgdGhlCj4gZm9sbG93aW5nIGVycm9yOgo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJv
bSBidWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3NuYXBweS0xLjIuMS9zbmFwcHkuY2M6Mjk6Cj4gYnVp
bGRyb290L291dHB1dC9idWlsZC9zbmFwcHktMS4yLjEvc25hcHB5LWludGVybmFsLmg6IEluIGZ1
bmN0aW9uIOKAmHNuYXBweTo6aW50ZXJuYWw6OlYxMjggc25hcHB5OjppbnRlcm5hbDo6VjEyOF9T
aHVmZmxlKFYxMjgsIFYxMjgp4oCZOgo+IGJ1aWxkcm9vdC9vdXRwdXQvYnVpbGQvc25hcHB5LTEu
Mi4xL3NuYXBweS1pbnRlcm5hbC5oOjEwOToxMDogZXJyb3I6IOKAmHZxdGJsMXFfdTjigJkgd2Fz
IG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlOyBkaWQgeW91IG1lYW4g4oCYdnRibDFfdTjigJk/
Cj4gICAxMDkgfCAgIHJldHVybiB2cXRibDFxX3U4KGlucHV0LCBzaHVmZmxlX21hc2spOwo+ICAg
ICAgIHwgICAgICAgICAgXn5+fn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgdnRibDFfdTgKPiBt
YWtlWzRdOiAqKiogW0NNYWtlRmlsZXMvc25hcHB5LmRpci9idWlsZC5tYWtlOjExODogQ01ha2VG
aWxlcy9zbmFwcHkuZGlyL3NuYXBweS5jYy5vXSBFcnJvciAxCj4gCj4gVGhlIGFkZGVkIHBhdGNo
IGZpeGVzIHRoZSBlcnJvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFy
aW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpUaGFua3MgZm9yIHRoaXMgcGF0Y2gg
YW5kIHRoZSByZWxhdGVkIGludmVzdGlnYXRpb24uIEhvd2V2ZXIsIHRoZXJlIGlzCmFuIGlzc3Vl
IGluIGhvdyB0aGlzIGZpeCBpcyBhcnRpY3VsYXRlZCB3aXRoIHlvdXIgdmVyc2lvbiBidW1wIGlu
IFBBVENICjEvMi4gSW5kZWVkIHRoZXJlIGFyZSB0d28gcG9zc2liaWxpdGllczoKCi0gVGhlIGJ1
aWxkIGVycm9yIHdpdGggdGhlIE5FT04gaW5zdHJ1Y3Rpb24gaXMgaW50cm9kdWNlZCBieSB0aGUg
YnVtcAogIHRvIHZlcnNpb24gMS4yLjEuIEluIHRoaXMgY2FzZSwgdGhlIHBhdGNoIGZpeGluZyB0
aGUgYnVpbGQgZXJyb3IKICBzaG91bGQgYmUgaW4gdGhlIHBhdGNoIGRvaW5nIHRoZSBidW1wLgoK
LSBUaGUgYnVpbGQgZXJyb3Igd2l0aCB0aGUgTkVPTiBpbnN0cnVjdGlvbiBhbHJlYWR5IGV4aXN0
cyBpbiB0aGUKICBjdXJyZW50bHkgcGFja2FnZWQgMS4xLjEwIHZlcnNpb24gb2Ygc25hcHB5LiBJ
biB0aGF0IGNhc2UsIHRoZSBwYXRjaAogIGZpeGluZyB0aGUgaXNzdWUgc2hvdWxkIGNvbWUgKmJl
Zm9yZSogdGhlIHZlcnNpb24gYnVtcCBpbiB5b3VyCiAgc2VyaWVzLCBhbmQgc2hvdWxkIGluZGlj
YXRlICp3aGVuKiB0aGUgYnVpbGQgZXJyb3Igd2FzIGludHJvZHVjZWQsIHNvCiAgdGhhdCB3ZSBr
bm93IGlmIHRoZSBmaXggc2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8gQnVpbGRyb290IExUUwogIGJy
YW5jaGVzLgoKQ291bGQgeW91IGhhdmUgYSBsb29rIGludG8gdGhpcz8KClRoYW5rcyBhIGxvdCEK
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
