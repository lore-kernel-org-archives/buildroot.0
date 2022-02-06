Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883DDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 18:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB5660ABE;
	Sun,  6 Feb 2022 18:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-8FK_xYLXV7; Sun,  6 Feb 2022 18:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 198F460586;
	Sun,  6 Feb 2022 18:48:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E82ED1BF38B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 18:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D66E68176D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 18:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 491UZnNyytti for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 18:48:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 943418176B
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 18:48:24 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 147E6440528;
 Sun,  6 Feb 2022 20:47:59 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1644173279;
 bh=z2NIc6pX78U1w+jCjCtjwRdm/L62+VBAkNE81k9cYxA=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=V4AQLu/vw6HPdfQGMlIRIkMTXq/DWJ7lRnJ0Y13D1Ls0bJ4v8F52Kg32Ggvj+zUir
 GPPLVn6AaNwzzkYjxFMM4ok7KhRh7iSwKsWsPfbRxYU3J4Xf7qwFENvJdKzIyl3nrH
 SYfVuRFOTcpavGgxiXFBW8bGFcsK+92juiwZHb4oZ6TfcFFiNigKMnMUG/ilEyLn5H
 Gv8w8RB90ja9pU7BXno/UnYBLVJAGjPvv7+0sV7Ka8g3kppPa4WBz7J+LvoTVR8bcf
 Rqnw0MCPGZHba2ztARsPYZbsUYTbHpH+6z1jgz3AmG8+xZCARc1+OttoqvSdDVTEb8
 UW5dp3KfZemaQ==
References: <20220206020711.3dc6e42e@ux550ve>
User-agent: mu4e 1.6.10; emacs 27.1
To: Daniil Stas <daniil.stas@posteo.net>
Date: Sun, 06 Feb 2022 20:43:21 +0200
In-reply-to: <20220206020711.3dc6e42e@ux550ve>
Message-ID: <87mtj3de6j.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [BUG] boot/arm-trusted-firmware: Stack protection
 setting doesn't work
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFuaWlsIFN0YXMsCgpPbiBTdW4sIEZlYiAwNiAyMDIyLCBEYW5paWwgU3RhcyB3cm90ZToK
PiBUaGUgYnVnIHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1pdCBjY2FjOWE1YmJiCj4gKCJib290L2Fy
bS10cnVzdGVkLWZpcm13YXJlOiBkb24ndCBmb3JjZSBFTkFCTEVfU1RBQ0tfUFJPVEVDVE9SIiku
Cj4KPiBJbiB0aGlzIGNvbW1pdCB0aGUgRU5BQkxFX1NUQUNLX1BST1RFQ1RPUiBvcHRpb24gd2Fz
IG1vdmVkIGZyb20gbWFrZQo+IGFyZ3VtZW50cyB0byB0aGUgZW52aXJvbm1lbnQuIEJ1dCB0aGlz
IHZhbHVlIGdldHMgb3ZlcndyaXR0ZW4gaW4KPiBtYWtlX2hlbHBlcnMvZGVmYXVsdHMubWsgKGFu
ZCBwbGF0Zm9ybSBzcGVjaWZpYyBtYWtlZmlsZXMpIGJlZm9yZSBpdAo+IGdldHMgaGFuZGxlZCBp
biB0aGUgbGliL3N0YWNrX3Byb3RlY3Rvci9zdGFja19wcm90ZWN0b3IubWsuCj4gU28gc2V0dGlu
ZyBpdCB2aWEgZW52aXJvbm1lbnQgZG9lc24ndCB3b3JrLgo+Cj4gWW91IGNhbiBjaGVjayBpdCwg
Zm9yIGV4YW1wbGUsIGlmIHlvdSBjb21waWxlIFRGLUEgZm9yIHN0bTMybXAxNTdhX2RrMQo+IHBs
YXRmb3JtLCBhbmQgdGhlbiBjaGVjayBpZiBibDMyL3N0YWNrX3Byb3RlY3Rvci5vIGZpbGUgaXMK
PiBidWlsdC4KPiBJdCBnZXRzIGJ1aWx0IG9ubHkgd2l0aCBjb21taXQgY2NhYzlhNWJiYiBiZWlu
ZyByZXZlcnRlZC4KCldoYXQgaGFwcGVucyB3aGVuIHlvdSBidWlsZCB3aXRoIGEgdG9vbGNoYWlu
IHRoYXQgaGFzIG5vIFNTUCBzdXBwb3J0CndpdGggdGhlIGNvbW1pdCB5b3UgbWVudGlvbmVkIHJl
dmVydGVkPyBJIGJlbGlldmUgeW91IHdpbGwgZ2V0IGEgYnVpbGQKZXJyb3Igc2ltaWxhciB0byB0
aGlzIG9uZToKCmFhcmNoNjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy1nY2MuYnJfcmVhbDogZXJy
b3I6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIOKAmC1mc3RhY2stcHJvdGVjdG9y
LTDigJk7IGRpZCB5b3UgbWVhbiDigJgtZnN0YWNrLXByb3RlY3RvcuKAmT8KYWFyY2g2NC1idWls
ZHJvb3QtbGludXgtdWNsaWJjLWdjYy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1h
bmQtbGluZSBvcHRpb24g4oCYLWZzdGFjay1wcm90ZWN0b3ItMOKAmTsgZGlkIHlvdSBtZWFuIOKA
mC1mc3RhY2stcHJvdGVjdG9y4oCZPwpNYWtlZmlsZToxMDc1OiByZWNpcGUgZm9yIHRhcmdldCAn
L2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYXJtLXRydXN0ZWQt
ZmlybXdhcmUtdjIuNC9idWlsZC9hODB4MF9tY2Jpbi9yZWxlYXNlL2xpYmMvYXNzZXJ0Lm8nIGZh
aWxlZAptYWtlWzFdOiAqKiogWy9idWlsZHMvYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qvb3V0cHV0
L2J1aWxkL2FybS10cnVzdGVkLWZpcm13YXJlLXYyLjQvYnVpbGQvYTgweDBfbWNiaW4vcmVsZWFz
ZS9saWJjL2Fzc2VydC5vXSBFcnJvciAxCgpDb3BpZWQgZnJvbSBodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE0OTc2NjMyOTQuCgpEbyB5b3UgaGF2ZSBh
IGJldHRlciBzdWdnZXN0aW9uPwoKYmFydWNoCgotLSAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+LiAufiAgIFRrIE9wZW4gU3lzdGVtcwo9fS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLW9vTy0tVS0tT29v
LS0tLS0tLS0tLS0tez0KICAgLSBiYXJ1Y2hAdGtvcy5jby5pbCAtIHRlbDogKzk3Mi41Mi4zNjgu
NDY1NiwgaHR0cDovL3d3dy50a29zLmNvLmlsIC0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
