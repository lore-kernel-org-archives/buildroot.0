Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B41FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 09:59:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D3961059
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 09:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4D3961059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8C2780D80;
	Mon,  8 Nov 2021 09:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ik6-qKYTY-Fx; Mon,  8 Nov 2021 09:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F8480D4F;
	Mon,  8 Nov 2021 09:59:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33F3A1BF267
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 09:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22F456072C
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 09:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bupUwAgmTBiH for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 09:59:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F0F0600CC
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 09:59:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ec40:2d6d:9ac7:d39c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3DB20B0056A;
 Mon,  8 Nov 2021 10:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636365586;
 bh=7iQeruXHcAXz+DG7nKnJ6AKyJrkGPMxJOO1T8PksP44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NyY28u8IJmLmCmvEfASG1n+cUgRLRbYa6FjUmEyKWK5+82zPB39Aq7JMDNWSIHb8n
 xPKNvJVnwFlAbPQfGm23jDKSjJ02UoUQO8n13V9wVUbL8kdFcIlKb5YVSUCNiLf9P4
 A27X2eP2RhSCxtO7QgQFq2nkv0BGUmBmg9hfXAdOLDQz5a2c/qsrOsKYeM/PiX6xB5
 oLI82R/UyXKgo5t7c48BwJgmJ7pD0LkDdLSo3JzS2ehZ96orqYkdhW7weQ2sHSQsgx
 LrRb8QeaZJHcobMUugbIeL6jtlqtdUnDD65189UUUyCrPhUxsJR76Y/kypFRMKQ7Iw
 6vIcr6Dzb2QYA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Nov 2021 10:59:39 +0100
Date: Mon, 8 Nov 2021 10:59:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211108095939.GB680793@scaer>
References: <20211107192930.370979-1-romain.naour@gmail.com>
 <53DE106D-44F1-40F5-B364-DA9708EFC032@senzilla.io>
 <fde73ce5-a720-3846-56da-cc53a358fd7b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fde73ce5-a720-3846-56da-cc53a358fd7b@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] configs/qemu_aarch64_sbsa_defconfig:
 use ARM cortex a57
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBEaWNrLCBBbGwsCgpPbiAyMDIxLTExLTA3IDIzOjEyICswMTAwLCBSb21haW4gTmFv
dXIgc3Bha2UgdGh1c2x5Ogo+IExlIDA3LzExLzIwMjEgw6AgMjI6MjUsIEQuIE9sc3NvbiBhIMOp
Y3JpdMKgOgo+ID4gSGkgUm9tYWluLAo+ID4gCj4gPiBSZXNlbmRpbmcgbXkgcmV2aWV3IGJlY2F1
c2UgSSBkaWRuJ3QgcmVwbHkgdG8gYWxsIDopCj4gPiAKPiA+PiBPbiA3IE5vdiAyMDIxLCBhdCAy
MDoyOSwgUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+
ID4+IO+7v1doZW4gYm9vdGluZyB3aXRoIGNvcnRleC1hNTMsIHFlbXUgcmVmdXNlIHRvIHN0YXJ0
IHdpdGggdGhlIGZvbGxvd2luZyBtZXNzYWdlCj4gPj4gWzFdOgo+ID4+Cj4gPj4gwqBxZW11LXN5
c3RlbS1hYXJjaDY0OiBzYnNhLXJlZjogQ1BVIHR5cGUgb3RoZXIgdGhhbiB0aGUgYnVpbHQtaW4g
Y29ydGV4LWE1Nwo+ID4+IG5vdCBzdXBwb3J0ZWQKPiA+IAo+ID4gVGhhbmtzIGZvciBjYXRjaGlu
ZyB0aGlzISBMb29rcyBsaWtlIHJlbW92YWwgb2YgYTUzIHN1cHBvcnQgaXMgYSBmYWlybHkgcmVj
ZW50Cj4gPiBjaGFuZ2UgaW4KPiA+IFFFTVU6wqBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11
L2NvbW1pdC80ZjMzNWE2MzgxZjgzYmViNWQ2YWMwZDM5OTM1MTQzNzk0NTRhOTlkI2RpZmYtOGVm
YjczYzNlMGRkOWQ3YTEzYjA1OTdhMDU2YjRjZDhmYTlkOTI1MGM3ZGU4YjFkM2I1MzhkMDdkOThh
OGM1MAo+ID4gPGh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvY29tbWl0LzRmMzM1YTYzODFm
ODNiZWI1ZDZhYzBkMzk5MzUxNDM3OTQ1NGE5OWQjZGlmZi04ZWZiNzNjM2UwZGQ5ZDdhMTNiMDU5
N2EwNTZiNGNkOGZhOWQ5MjUwYzdkZThiMWQzYjUzOGQwN2Q5OGE4YzUwPgo+IAo+IFRoYW5rcyBm
b3IgdGhlIGxpbmshIEluZGVlZCB0aGUgYTUzIHN1cHBvcnQgaGFzIGJlZW4gcmVtb3ZlZCBzaW5j
ZSBxZW11IDYuMC4KCkNvcnRleC1hNTMgaGFzIG5vdCBiZWVuIHJlbW92ZWQgZnJvbSBxZW11LiBJ
dCdzIGp1c3QgdGhhdCBpdCBubyBsb25nZXIKaXMgYSB2YWxpZCBDUFUgZm9yIHRoZSBzYnNhLXJl
ZiBtYWNoaW5lLgoKSSd2ZSBhbW1lbmRlZCB0aGUgY29tbWl0IGxvZyB3aXRoIHRoZSBpbmZvIHBy
b3ZpZGVkIGJ5IERpY2ssIGFuZCBhcHBsaWVkCnRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywK
WWFubiBFLiBNT1JJTi4KCj4gSSB3YXMgc3VycHJpc2VkIGJ5IGhhdmluZyB0aGlzIGlzc3VlLCBJ
dCdzIGEgZ29vZCByZWFzb24gdG8gZW5hYmxlIHRoZSBnaXRsYWIKPiBydW50aW1lIHRlc3Rpbmcg
aW4gdGhlIGZvbGxvd2luZyBwYXRjaC4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4g
Cj4gPiAKPiA+PiBVc2UgQVJNIGNvcnRleCBhNTcgYXMgcmVxdWVzdGVkIGJ5IFFlbXUuCj4gPj4K
PiA+PiBbMV0KPiA+PiBodHRwczovL2dpdC5xZW11Lm9yZy8/cD1xZW11LmdpdDthPWNvbW1pdGRp
ZmY7aD02NDU4MDkwM2MyYjNhZWUwOGQ3NGQ2NGU2MjQ4YTMxM2IyNDZjYjY5Cj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gPj4g
Q2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KPiA+PiAtLS0KPiA+PiBib2FyZC9xZW11
L2FhcmNoNjQtc2JzYS9yZWFkbWUudHh0IMKgfCAyICstCj4gPj4gY29uZmlncy9xZW11X2FhcmNo
NjRfc2JzYV9kZWZjb25maWcgfCAyICstCj4gPj4gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9h
YXJjaDY0LXNic2EvcmVhZG1lLnR4dAo+ID4+IGIvYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvcmVh
ZG1lLnR4dAo+ID4+IGluZGV4IDc5MzUxMDhlZjEuLmI2Mjk0N2Y1NWYgMTAwNjQ0Cj4gPj4gLS0t
IGEvYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvcmVhZG1lLnR4dAo+ID4+ICsrKyBiL2JvYXJkL3Fl
bXUvYWFyY2g2NC1zYnNhL3JlYWRtZS50eHQKPiA+PiBAQCAtMTcsNyArMTcsNyBAQCBSdW4gdGhl
IGVtdWxhdGlvbiB3aXRoOgo+ID4+Cj4gPj4gwqDCoHFlbXUtc3lzdGVtLWFhcmNoNjQgXAo+ID4+
IMKgwqDCoMKgLU0gc2JzYS1yZWYgXAo+ID4+IC0gwqDCoMKgLWNwdSBjb3J0ZXgtYTUzIFwKPiA+
PiArIMKgwqDCoC1jcHUgY29ydGV4LWE1NyBcCj4gPj4gwqDCoMKgwqAtc21wIDQgXAo+ID4+IMKg
wqDCoMKgLW0gMTAyNCBcCj4gPj4gwqDCoMKgwqAtbm9ncmFwaGljIFwKPiA+PiBkaWZmIC0tZ2l0
IGEvY29uZmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPiA+PiBiL2NvbmZpZ3MvcWVt
dV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnCj4gPj4gaW5kZXggMGUxYzc5OWI0ZC4uZDFlMGFkYWRk
MSAxMDA2NDQKPiA+PiAtLS0gYS9jb25maWdzL3FlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+
ID4+ICsrKyBiL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnCj4gPj4gQEAgLTEs
NiArMSw2IEBACj4gPj4gIyBBcmNoaXRlY3R1cmUKPiA+PiBCUjJfYWFyY2g2ND15Cj4gPj4gLUJS
Ml9jb3J0ZXhfYTUzPXkKPiA+PiArQlIyX2NvcnRleF9hNTc9eQo+ID4+Cj4gPj4gIyBUb29sY2hh
aW4KPiA+PiBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9XQ0hBUj15Cj4gPj4gLS0gCj4gPj4gMi4z
MS4xCj4gPiAKPiA+IExvb2tzIGdvb2QhCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBEaWNrIE9sc3Nv
biA8aGlAc2VuemlsbGEuaW8+Cj4gPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
