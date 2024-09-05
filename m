Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EEBCD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE0A281DE7;
	Thu,  5 Sep 2024 19:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxov0etjTZTF; Thu,  5 Sep 2024 19:07:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0D3881DA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0D3881DA3;
	Thu,  5 Sep 2024 19:07:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2BF01BF307
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9099181DA3
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRyTzK_0kodf for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:07:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3975781D70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3975781D70
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3975781D70
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:07:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7232AFF803;
 Thu,  5 Sep 2024 19:07:26 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:07:25 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240905210725.49e2524c@windsurf>
In-Reply-To: <20240904204234.498396-1-yann.morin.1998@free.fr>
References: <20240904204234.498396-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725563246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJWZ9D1RD+h4pTGO9TcPbjFBSyOsjpV660U9349RVRU=;
 b=QtXfz6Dsh6oNquxm6AJreMKkXbNy6gWRJI7jL1y2bciSB8xQmPxPjxLRXLRCP2ZiL9mBZE
 J0+06feWQOyae8ezINXDwh6nMYhdzWojn0QgQWZZUH6+5rGzYZ/MKAaLQZarIku10ZqnFU
 1fS/9PbQSTsEe+WT/tq2NgHpM5Rn6MLbcLUVOeJXohjZX8EIhmNVgCo8+aLPOmbyhd7zWX
 mz8u9b869DxTtchxoSBhmNMm8s8H8XFvdJ+U4pVcfzU2gaeVUfbuxjQ+B3F7Ck3VXqfbmH
 D9+O4Qlxc95B7lkyJphFuAHESXZfEXuptmRw+YrJ5rImUqgG4ILAdtQr5ViNwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QtXfz6Ds
Subject: Re: [Buildroot] [PATCH] package/pkg-cargo: don't install crates
 tracking
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBXZWQsICA0IFNlcCAyMDI0IDIyOjQyOjM0ICswMjAwCiJZYW5uIEUuIE1PUklO
IiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiBCeSBkZWZhdWx0LCAnY2FyZ28g
aW5zdGFsbCcgYWxzbyBpbnN0YWxscyBhIGtpbmQgb2YgInJlZ2lzdHJ5IiBpbgo+IC91c3IvLmNy
YXRlczIuanNvbiBhbmQgL3Vzci8uY3JhdGVzLnRvbWwgWzBdOgo+ICAgICBUbyB0cmFjayBpbmZv
cm1hdGlvbiBvZiBpbnN0YWxsZWQgZXhlY3V0YWJsZXMsIHNvbWUgZXh0cmEgZmlsZXMsCj4gICAg
IHN1Y2ggYXMgLmNyYXRlcy50b21sIGFuZCAuY3JhdGVzMi5qc29uLCBhcmUgYWxzbyBjcmVhdGVk
IHVuZGVyIHRoaXMKPiAgICAgcm9vdC4KPiAKPiBQcmVzdW1hYmx5LCB0aGlzIHdvdWxkIGJlIHVz
ZWQgYnkgImNhcmdvIHVuaW5zdGFsbCIgdG8gcHJvcGVybHkgY2xlYW51cAo+IHRoZSBwYWNrYWdl
IFsxXToKPiAgICAgQnkgZGVmYXVsdCBhbGwgYmluYXJpZXMgYXJlIHJlbW92ZWQgZm9yIGEgY3Jh
dGUgWy4uLl0uCj4gCj4gSG93ZXZlciwgaW4gdGhlIGNvbnRleHQgb2YgQnVpbGRyb290LCB0aGlz
IGlzIHVzZWxlc3MsIGFzIHdlIGRvIG5vdAo+IHVuaW5zdGFsbCBwYWNrYWdlcywgYW5kIHRodXMg
dGhvc2UgZmlsZXMgYXJlIHN1cGVyZmx1b3VzLgo+IAo+IFRlbGwgY2FyZ28gdG8gbm90IGNyZWF0
ZSB0aGF0IHRyYWNraW5nIGluZm9ybWF0aW9uLCBieSB1c2luZyAtLW5vLXRyYWNrCj4gdG8gImNh
cmdvIGluc3RhbGwiLgo+IAo+IE5vdGUgdGhhdCB0aGlzIHdvdWxkIGNhdXNlIGNhcmdvIHRvIGZh
aWwgdG8gaW5zdGFsbCBhIGZpbGUgdGhhdCBhbHJlYWR5Cj4gZXhpc3RzIFsyXSwgbGlrZSB3b3Vs
ZCBiZSB0aGUgY2FzZSB3aGVuIHJ1bm5pbmcgZm9vLXJlaW5zdGFsbCBmb3IgZXhhbXBsZToKPiAg
ICAgLS1uby10cmFjawo+ICAgICBCeSBkZWZhdWx0LCBDYXJnbyBrZWVwcyB0cmFjayBvZiB0aGUg
aW5zdGFsbGVkIHBhY2thZ2VzIHdpdGggYQo+ICAgICBtZXRhZGF0YSBmaWxlIHN0b3JlZCBpbiB0
aGUgaW5zdGFsbGF0aW9uIHJvb3QgZGlyZWN0b3J5LiBUaGlzIGZsYWcKPiAgICAgdGVsbHMgQ2Fy
Z28gbm90IHRvIHVzZSBvciBjcmVhdGUgdGhhdCBmaWxlLiBXaXRoIHRoaXMgZmxhZywgQ2FyZ28K
PiAgICAgd2lsbCByZWZ1c2UgdG8gb3ZlcndyaXRlIGFueSBleGlzdGluZyBmaWxlcyB1bmxlc3Mg
dGhlIC0tZm9yY2UgZmxhZwo+ICAgICBpcyB1c2VkLiBUaGlzIGFsc28gZGlzYWJsZXMgQ2FyZ2/i
gJlzIGFiaWxpdHkgdG8gcHJvdGVjdCBhZ2FpbnN0Cj4gICAgIG11bHRpcGxlIGNvbmN1cnJlbnQg
aW52b2NhdGlvbnMgb2YgQ2FyZ28gaW5zdGFsbGluZyBhdCB0aGUgc2FtZQo+ICAgICB0aW1lLgo+
IAo+IEhvd2V2ZXIsIHdlIGRvIGFscmVhZHkgdXNlIC0tZm9yY2Ugd2hpY2ggYWxsb3dzIGNhcmdv
IHRvIG92ZXJ3cml0ZQo+IGV4aXN0aW5nIGZpbGVzIHdpdGhvdXQgYW55IGZ1cnRoZXIgYWRvLCBz
byBpbiBvdXIgY2FzZSwgLS1uby10cmFjayB3aWxsCj4gb25seSBkaXNhYmxlIHRoZSB0cmFja2lu
ZyBpbmZvcm1hdGlvbi4KPiAKPiBBbHNvLCBpbiBCdWlsZHJvb3QsIHdlIGRvIG5vdCBoYXZlIGNv
bmN1cnJlbnQgaW5zdGFsbGF0aW9uIF90byB0aGUgc2FtZQo+IGxvY2F0aW9uXzogZWl0aGVyIFBQ
RCBpcyBkaXNhYmxlZCwgaW4gd2hpY2ggY2FzZSBvbmx5IG9uZSBwYWNrYWdlIHdpbGwKPiBiZSBp
bnN0YWxsZWQgdG8gdGhlIGNvbW1vbiB0YXJnZXQvIGF0IGEgdGltZSwgb3Igd2UncmUgdXNpbmcg
UFBELCBzbwo+IGVhY2ggcGFja2FnZSB3aWxsIGdldCBpbnN0YWxsZWQgaW50byBpdHMgb3duIHRh
cmdldC8uIFRodXMsIC0tbm8tdHJhY2sKPiBoYXMgbm8gYWR2ZXJzZSBzaWRlIGVmZmVjdCBmb3Ig
dXMuCj4gCj4gQ2xvc2VzOiAjMTcKClRoYW5rcyBmb3IgdGhlIHBhdGNoLCB3aGljaCBJIGhhdmUg
YXBwbGllZCB0byBuZXh0LiBIb3dldmVyLCBJIHdvdWxkCnJlYWxseSBsaWtlOgoKQ2xvc2VzOiAj
MTcKCnRvIGJlOgoKRml4ZXM6CgogIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2lzc3Vlcy8xNwoKRm9yIHR3byByZWFzb25zOgoKKDEpIEZvciBhdXRvYnVpbGRl
ciBmYWlsdXJlcyB3ZSB1c2UgYSBmdWxsIFVSTCwgbm90IGp1c3QgdGhlCiAgICBpZGVudGlmaWVy
LCBzbyB3ZSBzaG91bGQgZG8gdGhlIHNhbWUgZm9yIEdpdGxhYiBpc3N1ZS4gSXQgYWxzbyBtYWtl
cwogICAgdGhlbSBkaXJlY3RseSBjbGlja2FibGUgZnJvbSB0aGUgY29tbWl0IGxvZywgd2hpY2gg
aXMgcmVhbGx5IG5pY2UsCiAgICBhbmQgbWFrZXMgaXQgdmVyeSBjbGVhciB0aGF0IGl0J3MgZml4
aW5nIGEgR2l0bGFiIGlzc3VlCgooMikgRml4ZXM6IGdldHMgcGlja2VkIHVwIGJ5IHBhdGNod29y
ayBhbmQgbm90IENsb3NlczoKCkkgYWRqdXN0ZWQgdGhpcyB3aGVuIGNvbW1pdHRpbmcsIHNvIHRo
aXMgd2FzIHJlYWxseSBqdXN0IHRvIGhvcGVmdWxseQplc3RhYmxpc2ggd2hhdCB3ZSBjb25zaWRl
ciB0byBiZSBvdXIgYmVzdCBwcmFjdGljZSBvbiB0aGlzIG1hdHRlciA6LSkKClRoYW5rcyBhIGxv
dCBmb3IgYWRkcmVzc2luZyB0aGlzIGlzc3VlIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
