Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9FDC021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCAE88415E;
	Sat, 14 Sep 2024 18:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeiFVwj1EFh8; Sat, 14 Sep 2024 18:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E35C384160
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E35C384160;
	Sat, 14 Sep 2024 18:25:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46F751BF283
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34C6F408DD
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tk9yv3QTAxj2 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:25:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE4E5408D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4E5408D2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE4E5408D2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:25:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B9BFC0003;
 Sat, 14 Sep 2024 18:25:26 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:25:23 +0200
To: Andreas =?UTF-8?B?RMO8cmluZw==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240914202523.015cff9a@windsurf>
In-Reply-To: <20240914201937.567067fd@devuanPc.fritz.box>
References: <20240914201937.567067fd@devuanPc.fritz.box>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726338326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hL/3DbMtsbNoa9Yh4E63hp5BfiNw2Dcv62uJeO5Bb44=;
 b=IErWlMJlDuC7z4hL0kCDs0HiC48pAQloHJFqwGpEMh2oFsoLyqaxAwuZ6MKfIWtXluFVdq
 HoFkjVPMLhVk/aiNFk1pkCXGfVquv474jbH/JoSvIrvZONFsFAh8Hu/JjeF7F0VC+TYYKe
 hKk+vMtmaTLUcTQ2VxiNq9vuIQO2+Iwq2hTkR8Rbg+YsliW+YxL8xEjdgStTFiGzGIxdB+
 mpjDqa0AfueQsfuAoLKRgrFWl6uYxDyMyBl3m8cIEFShTUeYdY2or9Lia6ZRgXRwRXogYf
 1rY2fLloguKr3g5gaax1FkoDLsZHu3bPXvmMkZtche8wgHHs+5MHu5BA1+Gzlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IErWlMJl
Subject: Re: [Buildroot] Buildroot does not use ccache for compiling Linux
 kernel?
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
Cc: Andreas =?UTF-8?B?RMO8cmluZw==?= <brpi@duering-andreas.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywKCk9uIFNhdCwgMTQgU2VwIDIwMjQgMjA6MTk6MzcgKzAyMDAKQW5kcmVh
cyBEw7xyaW5nIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToK
Cj4gRHVyaW5nIHRoaXMgcHJvY2VzcywgSSByZWFsaXplZCB0aGF0IGNjYWNoZSwgYWx0aG91Z2gg
ZW5hYmxlZCwgaXMgbm90Cj4gdXNlZCBmb3IgY29tcGlsaW5nIHRoZSBMaW51eCBrZXJuZWwuIEkg
dGhpbmsgdGhpcyBpcyBiZWNhdXNlIG9mIHRoZQo+IHJlY2lwZSBpbiBsaW51eC9saW51eC5tazoK
PiAKPiBMSU5VWF9NQUtFX0ZMQUdTID0gXAo+ICAgICAgICAgSE9TVENDPSIkKEhPU1RDQykgJChz
dWJzdCAtSS8sLWlzeXN0ZW0gLywkKHN1YnN0IC1JIC8sLWlzeXN0ZW0gLywkKEhPU1RfQ0ZMQUdT
KSkpICQoSE9TVF9MREZMQUdTKSIgXAo+ICAgICAgICAgQVJDSD0kKEtFUk5FTF9BUkNIKSBcCj4g
ICAgICAgICBJTlNUQUxMX01PRF9QQVRIPSQoVEFSR0VUX0RJUikgXAo+ICAgICAgICAgQ1JPU1Nf
Q09NUElMRT0iJChUQVJHRVRfQ1JPU1MpIiBcCj4gICAgICAgICBXRVJST1I9MCBcCj4gICAgICAg
ICBSRUdFTkVSQVRFX1BBUlNFUlM9MSBcCj4gICAgICAgICBERVBNT0Q9JChIT1NUX0RJUikvc2Jp
bi9kZXBtb2QKPiAKPiBUaGUgbGludXgga2VybmVsIHNlZW1zIHRvIGFzc2VtYmxlIHRoZSBjb21w
aWxlciB1c2luZyBUQVJHRVRfQ1JPU1MsCj4gZS5nLgo+IENDID0gJChUQVJHRVRfQ1JPU1MpZ2Nj
Cj4gCj4gQXMgYSB2ZXJ5IGNydWRlIHNvbHV0aW9uLCBJIGNoYW5nZWQgdGhlIGNvcnJlc3BvbmRp
bmcgbGluZSB0bwo+ICAgICAgICAgQ1JPU1NfQ09NUElMRT0iY2NhY2hlICQoVEFSR0VUX0NST1NT
KSIKPiBidXQgdGhpcyBpcyBwcm9iYWJseSBub3QgdGhlIG9wdGltYWwgc29sdXRpb24uIChJIGRp
ZG4ndCBjYXJlZnVsbHkKPiBjaGVjayB3aGVyZSBlbHNlIENST1NTX0NPTVBJTEUgaXMgdXNlZCku
Cj4gCj4gSWYgdGhpcyBpcyBhIGtub3duIGxpbWl0YXRpb24/IFNob3VsZCB0aGlzIGJlIGFkZGVk
IHRvIHRoZQo+IGRvY3VtZW50YXRpb24/CgpUaGUgdGhpbmcgeW91J3JlIG1pc3NpbmcgaXMgdGhh
dCBmb3IgdGFyZ2V0IGJ1aWxkcywgY2FsbGluZyBjY2FjaGUgaXMKaGlkZGVuIGluc2lkZSBvdXIg
dG9vbGNoYWluIHdyYXBwZXIuCgpXaGVuIHdlIGNhbGwgJChIT1NUX0RJUikvYmluL2FybS1saW51
eC1nY2MsIGl0IGRvZXNuJ3QgY2FsbCB0aGUKY29tcGlsZXIuIEl0IGNhbGxzIG91ciB0b29sY2hh
aW4gd3JhcHBlcgoodG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVyLmMpLCB3aGljaCBpdHNlbGYg
Y2FsbHMgdGhlIGNvbXBpbGVyLiBBbmQKYXMgcGFydCBvZiB0aGF0LCBpdCBkb2VzIGludm9rZSBj
Y2FjaGUuCgpTbyB3ZSBhcmUgdXNpbmcgY2NhY2hlIGZvciBhbGwgdGFyZ2V0IGNvZGUsIGFzIGl0
J3MgZGlyZWN0bHkgZG9uZSBieQpvdXIgY29tcGlsZXIgd3JhcHBlci4KCkJlc3QgcmVnYXJkcywK
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
