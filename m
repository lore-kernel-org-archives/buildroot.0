Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42924C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 008E740199;
	Mon, 22 Jul 2024 16:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4BWFl3bZoi7; Mon, 22 Jul 2024 16:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACFBE401A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACFBE401A0;
	Mon, 22 Jul 2024 16:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82C021BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CFD540320
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTRHq6uDKHLk for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED7E84023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED7E84023C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED7E84023C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:23:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 285CC1C0002;
 Mon, 22 Jul 2024 16:23:13 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:23:12 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20240722182312.1500234b@windsurf>
In-Reply-To: <20240722142141.2105929-2-salvador.joseluis@gmail.com>
References: <20240722142141.2105929-2-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEK5Ickr6O7kZO11PDkG5lFlqUvHtwdw4uxQOGAe99w=;
 b=HNp7TqQJbyillhJkWtMTilfj+vt11pEI4vxDiH/10nlWrWIOhm+c3amDfgT0DIg1sTOown
 oqyyMKeoMDNxD++N1zxzoP9Ldcel1/HwyYaIoXoB87cL6STQ+K8I2CglqajOxjJkLV1G0d
 v2LLa1qrkgQ8W8CxW1HQ850T73UiPvgC9dmGWMy3BgaEEJk0e5u9Q0dhFVAwDsbEdrbUPw
 xJdTLI7irdEKusXXzEOdtyFQb7GEJ9WrS8N0InESwMC6XkxB7/yBEqagniOQmQYImLMCoy
 AS+IJvqTi7t4Q6c2i9MB5glUG6jzuTd+CQrnuiynbdOreGP88ZjwfO3Og2NhWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HNp7TqQJ
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: fix uClibc support
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBNb24sIDIyIEp1bCAyMDI0IDE2OjIxOjQyICswMjAwCkpvc8OpIEx1
aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPiB3cm90ZToKCj4g
VGhpcyB1cGRhdGUgYWRkcmVzc2VzIHRoZSBpc3N1ZSBvZiB1Q2xpYmMgc3VwcG9ydCBieSBza2lw
cGluZyBaRlMgdGVzdHMKPiB0aGF0IHJlcXVpcmUgU0VFS19EQVRBIHN1cHBvcnQuCj4gCj4gVGhp
cyBpcyBhIHdvcmstaW4tcHJvZ3Jlc3MgcGF0Y2ggd2hpbGUgd2Ugd2FpdCBmb3IgYW4gdXBzdHJl
YW0gZml4Lgo+IEN1cnJlbnQgdXBzdHJlYW0gZWZmb3J0cyBjYW4gYmUgZm9sbG93ZWQgaGVyZToK
PiBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcHVsbC8xNjE2OQo+IAo+IENvbnRleHQ6
Cj4gLSBPcGVuWkZTIGluY2x1ZGVzIGEgdGVzdCBmb3IgYSBidWcgdGhhdCBvY2N1cnMgd2hlbiBj
b3B5aW5nIGEgbGFyZ2UKPiAgIG51bWJlciBvZiBQVU5DSEVEIGZpbGVzLgo+IC0gT3BlblpGUyBo
YXMgYmFja3BvcnRlZCB0aGlzIHRlc3QgdG8gdjIuMi54Lgo+IC0gdUNsaWJjIGRvZXMgbm90IHN1
cHBvcnQgU0VFS19EQVRBIGFuZCBTRUVLX0hPTEUuCj4gLSBUaGUgWkZTIHRlc3QgYGNwX3N0cmVz
c2AgY2FuIG5vdCBiZSBjb21waWxlZCB1c2luZyB1Q2xpYmMuCj4gCj4gVGhpcyBjb21taXQgZml4
Ogo+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy83
MzkxNzkzMjI2Cj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxz
YWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CgpUaGFua3MgZm9yIGNvbWluZyB1cCB3aXRoIHRo
ZSBwYXRjaCEgU2VlIGJlbG93IHNvbWUgY29tbWVudHMuCgoKPiArIGNvbmZpZy91c2VyLXVuaXN0
ZC5tNCAgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gKyBj
b25maWcvdXNlci5tNCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiArIGNvbmZpZy96
ZnMtYnVpbGQubTQgICAgICAgICAgICAgICAgICAgIHwgIDEgKwoKU2luY2UgdGhpcyBwYXRjaCB0
b3VjaGVzIHRoZSBtNCBtYWNoaW5lcnksIHdlIG5lZWQgWkZTX0FVVE9SRUNPTkYgPSBZRVMKaW4g
dGhlIC5tayBmaWxlLiBUdXJucyBvdXQgaXQgaXMgYWxyZWFkeSB0aGVyZS4uLiBidXQgZm9yIHRo
ZSB3cm9uZwpyZWFzb246CgojIDAwMDEtY29uZmlnLXVzZXItY2hlY2stZm9yLWFpby5oLnBhdGNo
ClpGU19BVVRPUkVDT05GID0gWUVTCgpJbmRlZWQsIHRoaXMgcGF0Y2ggMDAwMS1jb25maWctdXNl
ci1jaGVjay1mb3ItYWlvLmgucGF0Y2ggaXMgbm8gbG9uZ2VyCnRoZXJlLgoKQ291bGQgeW91IGFz
IHBhcnQgb2YgdGhpcyBwYXRjaCBmaXggdGhpcyB1cD8KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
emZzL3pmcy5oYXNoIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKPiBpbmRleCA5YzhkNGNlYzg1Li5i
ZWY5NTA2M2Y5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvemZzL3pmcy5oYXNoCj4gKysrIGIvcGFj
a2FnZS96ZnMvemZzLmhhc2gKPiBAQCAtNCwzICs0LDUgQEAgc2hhMjU2ICA5NzkwOTA1Zjc2ODNk
NDE3NTk0MThlMWVmMzQzMjgyOGMzMTExNjY1NGZmMDQwZTkxMzU2ZmYxYzIxYzMxZWMwICB6ZnMt
Mi4KPiAgIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgo+ICBzaGEyNTYgIDFmZmI3MGMzM2M0Zjc5
ZjA0ZTk0N2ZhY2M1Yzc4NTFmMjg5NjA5MjU2YWFjYjQ3ZmMxMTVmNzAwNDI3ZDk1MjAgIExJQ0VO
U0UKPiAgc2hhMjU2ICBmMTI1YTM3YzgyOTcwNWVmZjNlNmY3N2E5ZjZjNThmZDcxMDYwZjg0YWI1
NDE4MGI5OGZhZmRmOTRhMjAyMWViICBDT1BZUklHSFQKPiArCj4gK3NoYTI1NiAgNzFlNjA1ZGYz
N2FiZjhjNDhiN2MxMDNlNmRlYzc1MzhiNWQwNmZjOTE0MTZjNzdjNTA1MjVkMDIxYjliOTFiMCAg
MDAwMS10ZXN0cy1jcF9maWxlcy1pZ25vcmUtaWYtU0VFS19EQVRBLWlzLW5vdC1kZWZpbmVkLnBh
dGNoCgpObyBuZWVkIHRvIHB1c2ggdGhlIGhhc2ggb2YgdGhlIHBhdGNoIGluIHRoZSBoYXNoIGZp
bGUuIFRoZSBoYXNoIGZpbGUKaXMgdG8gZG9jdW1lbnQgaGFzaGVzIG9mIHN0dWZmIGRvd25sb2Fk
ZWQgYnkgQnVpbGRyb290LiBIZXJlIHRoZSBwYXRjaAppcyBwcm92aWRlZCAqYnkqIEJ1aWxkcm9v
dCwgc28gbm8gaGFzaCBjaGVja2luZyBpcyBuZWVkZWQgZm9yIGl0LgoKQ291bGQgeW91IHNlbmQg
YSB2MiB0byBhZGRyZXNzIHRob3NlIHR3byBzbWFsbCBjb21tZW50cz8KClRoYW5rcyBhIGxvdCEK
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
