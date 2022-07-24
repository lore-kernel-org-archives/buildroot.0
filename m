Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA07C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38B6684123;
	Sun, 24 Jul 2022 08:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B6684123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQXd3jBZACO2; Sun, 24 Jul 2022 08:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F8283F5A;
	Sun, 24 Jul 2022 08:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36F8283F5A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0616C1BF35F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E022D60D50
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E022D60D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcHwDo7uPBel for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:19:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF3560BC0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEF3560BC0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:19:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d13so4244621wrn.10
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jJxXrE0Q9xOoaidAE9HyR47PER+nYRrFamp5MtBg208=;
 b=NdkYYvyRSFonlSbDq4hlUcRhp8gYNp5jYgHwGTKQtRU5z5pfTqpn/AyackEjZJyfhs
 +15O7EkYecl4/MDFp3wUkromdEKPBVhVGJ9BgKWFEbLJKup93K1a9sM+a+F5vVudCWCs
 imM/1ELIFcJggVkPebavXzJKpffzhnx0izii8M8KaII8huwTviy/TCUxthPuRbk1Xo56
 lp16ZRgiCq4bSvy81VU2Ejo/Lg/mh214OYy+QtXo86pByIhS3NCaOIAF2lOaYzcn4Lea
 l2w5O8ozwKGNtT4K5cmQMgm825pZpce3WZg+SKt4qx5d8/gJ+Vvbls/r90Tjo1v++Xai
 CD3g==
X-Gm-Message-State: AJIora9NurNio1Ymr6rf3WA82CBDQH//wGLH4908KtuinWPf42fii/qS
 OAl2O63NswmROcAG80GB0xMYdA==
X-Google-Smtp-Source: AGRyM1tYv6KQ1fUZI7wmRgwWRkg7JNoOE7/NE3ArxKg6uC/C3x/Z3dpBf8/a0ssjXMLJBlBXH3G0Eg==
X-Received: by 2002:a05:6000:1a41:b0:20e:687f:1c3 with SMTP id
 t1-20020a0560001a4100b0020e687f01c3mr4498752wry.415.1658650787723; 
 Sun, 24 Jul 2022 01:19:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5d498b000000b0021e42e7c7dbsm9036333wrq.83.2022.07.24.01.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 01:19:47 -0700 (PDT)
Message-ID: <c85bf232-28ca-8d43-06ca-8e2d78db1581@smile.fr>
Date: Sun, 24 Jul 2022 10:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
 <20220705134402.5914-2-david.gouarin@thalesgroup.com>
 <5c4dd777-7209-90e3-ea5d-b0ae57c745a9@smile.fr> <20220724075906.GO2641@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220724075906.GO2641@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jJxXrE0Q9xOoaidAE9HyR47PER+nYRrFamp5MtBg208=;
 b=oLspenIFRpfUeTcrfQB0/pResHRZB+4qotDIyWI7J0x+CdF1zg3Fs9/E8y2+hEbD9u
 CNR1A6tRUM50vHCnlHqg8SYVHSYPIEExTLzfUt+BasrbJ/5C4YAme0I5R+ONdfQDCqdL
 p4L3eHJ8XuT/nyMjvedwSUSWryOo5X+IXhQ0fLFHe+Kgjk4OH3pfJwRx/Xnq4XngKHZ5
 gL9KIwlebAnDMnQpIGlY1PL0wMDiiSX2zo2XzdY7OcbSzDQvgE2E8Wnw6bENctWZ4hhm
 5MtPAkGuU1njx+4Lyb01uKjFJjxEzGyI+W/OCHKcYjhTGIVHI+vBqLhyVEr8+lRKBwQi
 /MMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=oLspenIF
Subject: Re: [Buildroot] [PATCH 2/2] package/libtalloc: bump version to 2.3.4
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgRGF2aWQsIEFsbCwKCkxlIDI0LzA3LzIwMjIgw6AgMDk6NTksIFlhbm4gRS4g
TU9SSU4gYSDDqWNyaXTCoDoKPiBSb21haW4sIERhdmlkLCBBbGwsCj4gCj4gT24gMjAyMi0wNy0y
MyAxOToxNSArMDIwMCwgUm9tYWluIE5hb3VyIHNwYWtlIHRodXNseToKPj4gTGUgMDUvMDcvMjAy
MiDDoCAxNTo0NCwgRGF2aWQgR09VQVJJTiBhIMOpY3JpdMKgOgo+Pj4gVGhpcyB2ZXJzaW9uIG5l
ZWRzIHRvIGRlZmluZSBhbiBlbnZpcm9ubWVudCB2YXJpYWJsZSBpbiBidWlsZCBhbmQgaW5zdGFs
bCBzdGVwcy4KPj4+IFRoaXMgcmVxdWlyZXMgYW4gdXBncmFkZSB0byBwa2dfd2FmLm1rLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEdPVUFSSU4gPGRhdmlkLmdvdWFyaW5AdGhhbGVzZ3Jv
dXAuY29tPgo+Pj4gLS0tCj4+PiAgcGFja2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLmhhc2ggfCAy
ICstCj4+PiAgcGFja2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLm1rICAgfCA1ICsrKystCj4+PiAg
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5oYXNoIGIvcGFja2FnZS9s
aWJ0YWxsb2MvbGlidGFsbG9jLmhhc2gKPj4+IGluZGV4IGNiZmQxMWU2M2IuLjBiYzhlZGI2OTUg
MTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MuaGFzaAo+Pj4gKysr
IGIvcGFja2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLmhhc2gKPj4+IEBAIC0xLDMgKzEsMyBAQAo+
Pj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4+PiAtc2hhMjU2ICA2YmU5NWIyMzY4YmQwYWYxYzRj
ZDdhODgxNDZlYjZjZWVhMThlNDZjM2ZmYzkzMzBiZjYyNjJiNDBkMWQ4YWFhICB0YWxsb2MtMi4z
LjMudGFyLmd6Cj4+PiArc2hhMjU2ICAxNzlmOWViZTI2NWU2N2U0YWIyYzI2Y2FkMmI3ZGU0YjZh
NzdjNmMyMTJmOTY2OTAzMzgyODY5ZjA2YmU2NTA1ICB0YWxsb2MtMi4zLjQudGFyLmd6Cj4+PiAg
c2hhMjU2ICBmODM0MGM0NDlkZDY0YTU1YzY2MDViMDJmY2FkMmFlYzZmNDczNjEyYWM2MDI2NzM5
YTIyOTk1MzgwYTgwNDNjICB0YWxsb2MuaAo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlidGFs
bG9jL2xpYnRhbGxvYy5tayBiL3BhY2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5tawo+Pj4gaW5k
ZXggOGNiYTY5OWVhMS4uNmE1ZTFlZjRiNiAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvbGlidGFs
bG9jL2xpYnRhbGxvYy5tawo+Pj4gKysrIGIvcGFja2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLm1r
Cj4+PiBAQCAtNCw3ICs0LDcgQEAKPj4+ICAjCj4+PiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
Pj4+ICAKPj4+IC1MSUJUQUxMT0NfVkVSU0lPTiA9IDIuMy4zCj4+PiArTElCVEFMTE9DX1ZFUlNJ
T04gPSAyLjMuNAo+Pj4gIExJQlRBTExPQ19TT1VSQ0UgPSB0YWxsb2MtJChMSUJUQUxMT0NfVkVS
U0lPTikudGFyLmd6Cj4+PiAgTElCVEFMTE9DX1NJVEUgPSBodHRwczovL3d3dy5zYW1iYS5vcmcv
ZnRwL3RhbGxvYwo+Pj4gIExJQlRBTExPQ19MSUNFTlNFID0gTEdQTC0zLjArCj4+PiBAQCAtNDAs
NiArNDAsOSBAQCBlbHNlCj4+PiAgTElCVEFMTE9DX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtcHl0
aG9uCj4+PiAgZW5kaWYKPj4+ICAKPj4+ICtMSUJUQUxMT0NfQ09ORl9FTlYgKz0gUFlUSE9OSEFT
SFNFRUQ9MQo+Pj4gK0xJQlRBTExPQ19NQUtFX0VOViArPSBQWVRIT05IQVNIU0VFRD0xCj4+Cj4+
IFRoaXMgbG9va3Mgc3VzcGljaW91cy4uLiBQWVRIT05IQVNIU0VFRD0xIHdhcyBhZGRlZCB1cHN0
cmVhbSB3aXRob3V0IGV4cGxhbmF0aW9uCj4+IGJ5IHRoaXMgY29tbWl0IFsxXSBiZWZvcmUgbGli
dGFsbG9jIDIuMy4wLgo+IAo+IEkgYWdyZWUgdGhhdCB0aGlzIG5lZWRzIG1vcmUgZXhwbGFuYXRp
b25zIHRoYW4ganVzdCAidGhpcyBpcyBuZWVkZWQgdG8KPiBidWlsZCIgKG9idmlvdXNseSBpdCBp
cyBuZWVkZWQgdG8gYnVpbGQsIG90aGVyd2lzZSB0IHdvdWxkIG5vdCBiZQo+IHRoZXJlKS4KPiAK
Pj4gQWJvdXQgUFlUSE9OSEFTSFNFRUQgWzJdLgo+PiBXaHkgaXQncyBub3cgbmVlZGVkPyBIYXZl
IHlvdSB0cmllZCB3aXRob3V0IGl0Pwo+PiBbMV0gaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL3Nh
bWJhLXRlYW0vdGFsbG9jLy0vY29tbWl0L2FmYjRlMjJjNGNiYzE1YjZiNmNmODI0Mjc0YjY1M2Vh
YWFmZTRjYzUKPj4gWzJdIGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMvdXNpbmcvY21kbGluZS5o
dG1sI2VudnZhci1QWVRIT05IQVNIU0VFRAo+IAo+IFRoZSB0aGluZyBpcyB0aGF0IHRhbGxvYyBp
cyBleHRyYWN0ZWQgb3V0IG9mIHRoZSBzYW1iYSBjb2RlLCBzbyBsb29raW5nCj4gYXQgdGhlIHRh
bGxvYyByZXBvc2l0b3J5IGRvZXMgbm90IHlpZWxkIGludGVyZXN0aW5nIGNvbW1pdCBsb2dzLCBq
dXN0Cj4gIk5ldyB1cHN0cmVhbSB2ZXJzaW9uIDIuMS4xNiIgZm9yIHRoZSBjb21taXQgdGhhdCBp
bnRyb2R1Y2VkCj4gUFlUSE9OSEFTSFNFRUQuCj4gCj4gQnV0IGxvb2tpbmcgdCB0aGUgc2FtYmEg
Y29kZSB5aWVsZHMgYmV0dGVyIHJlc3VsdHM6Cj4gCj4gICAgIDE5YTRkM2NhNjkyZSBidWlsZDog
V29ya2Fyb3VuZCBweXRob24zIGhhc2ggb3JkZXIgaXNzdWVzIChmb3Igbm93KQo+IAo+ICAgICBU
aGlzIHdvcmtzIGFyb3VuZCBweXRob24zIGhhdmluZyBhIG5ldyBoYXNoIHNlZWQgZWFjaCB0aW1l
IGl0IHN0YXJ0cyB0byBhbGxvdwo+ICAgICBhIHNlY29uZCAibWFrZSIgbm90IHRvIHJlYnVpbGQg
dGhlIHdvcmxkLgo+IAo+ICAgICBUaGlzIHNob3VsZCBwcm9iYWJseSBiZSByZXZlcnRlZCBvbmNl
IHdlIGZpbmQgdGhlIGhhc2ggdGhhdCBpcyBjYXVzaW5nCj4gICAgIHRoZSBpc3N1ZSwgYnV0IHNo
b3VsZCByZWR1Y2UgZnJ1c3RyYXRpb24gZm9yIG5vdy4+Cj4gU28gaXQgbG9va3MgbGlrZSB0aGVy
ZSBpcyBhbiBpc3N1ZSBpbiB3YWYgKHdoaWNoIGlzIHdyaXR0ZW4gaW4gcHl0aG9uKQo+IHdoZXJl
IGl0IHVzZXMgdGhlIC5oYXNoKCkgb2Ygb2JqZWN0cyB0byBkZWNpZGUgd2hldGhlciB0byByZWJ1
aWxkIGZpbGVzCj4gb3IgbnQsIGFuZCBvZiBjb3Vyc2UsIHRoYXQgY2hhbmdlcyBldmVyeSBydW4g
YmVjYXVzZSBweXRob24gdXNlcyBhCj4gZGlmZmVyZW50IHNlZWQgYXQgZXZlcnkgcnVuIChhbmQg
cmlnaHRseSBzbykuIEFuZCBzbywgcGVvcGxlIHRoYXQKPiBhY3RpdmVseSBkZXZlbG9wIG9uIHNh
bWJhIGRvIG5vdCB3YW50IHRvIHJlYnVpbGQgZXZlcnl0aGluZyB3aGVuIHRoZQo+IGNoYW5nZSBh
IHNpbmdsZSBmaWxlLCBvYnZpb3VzbHkuCgpUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiEKCj4g
Cj4gQnV0IGluIG91ciBjYXNlLCBpbiBCdWlsZHJvb3QsIHdlIGRvIG5vdCBuZWVkIHRvIGRvIHNv
LiBJbmRlZWQsIHdlIGFyZQo+IGJ1aWxkaW5nIHRoZSBwYWNrYWdlIGp1c3Qgb25jZSwgc28gd2Ug
YXJlIG5vdCBnb2luZyB0byBoaXQgdGhhdAo+IHNpdHVhdGlvbi4KPiAKPiBTbywgSSBkbyBub3Qg
dGhpbmsgd2UgbmVlZCB0aGlzLgo+IAo+IERhdmlkLCBjYW4geW91IHRyeSB0byBzZWUgaWYgdGhl
IGJ1aWxkIHN1Y2NlZWRzIHdpdGhvdXQgUFlUSE9OSEFTSFNFRUQ/Cj4gSWYgaXQgcmVhbGx5IG5l
ZWRzIGl0IChlLmcuIGJ1aWxkIGZhaWx1cmUsIG9yIHJ1bnRpbWUgZmFpbHVyZSksIHRoZW4KPiBw
bGVhc2UgZXh0ZW5kIHRoZSBjb21taXQgbG9nIHdpdGggdGhlIGFib3ZlIGluZm9ybWF0aW9uIGFu
ZCB0aGUgZmFpbHVyZQo+IHJlYXNvbi4gSWYgaXQgZG9lcyBub3QgbmVlZCBpdCwgdGhlbiBqdXN0
IHJlc3BpbiB0aGUgYnVtcCB3aXRob3V0LgoKSSBmb3VuZCBhbm90aGVyIGNvbW1pdCBhZGRpbmcg
dGhlIG9mZmVuZGluZyB3YWYgY2hlY2s6CgpodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9z
YW1iYS8tL2NvbW1pdC80MjBiYmIxZDkyZmQyYTI4NzI1YjUzZjQyNWJhM2QyMTQ4MzFiNjYwCgpi
ZWNhdXNlIGl0IGRvZXNuJ3Qgd29yayB3aXRob3V0IFBZVEhPTkhBU0hTRUVELgoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+IAo+IFRoYW5rcyEKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4u
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
