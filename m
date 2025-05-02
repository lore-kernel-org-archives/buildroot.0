Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B91C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8126760B56;
	Fri,  2 May 2025 10:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6FzlwQuW4bj; Fri,  2 May 2025 10:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9533360AF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9533360AF5;
	Fri,  2 May 2025 10:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFCCCEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9091460AF5
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b22bHlrw_jh8 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E4F5605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E4F5605E9
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E4F5605E9
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 471971C0D89; Fri,  2 May 2025 12:14:31 +0200 (CEST)
Message-ID: <32ffeac4-1e90-413a-b221-a1f8b0f326e2@rnout.be>
Date: Fri, 2 May 2025 12:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francis Laniel <flaniel@linux.microsoft.com>
References: <20250427-patch_pahole-v1-1-b8cc84bd5a51@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250427-patch_pahole-v1-1-b8cc84bd5a51@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746180871; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QmV8Ar4Y1an0cK62UYr2mziGu+shCaHMJIdxlbQfEZw=;
 b=Fq4olFa51PyyGBgu+2orumuIwA0ZxTzCgA5k/4WnhaqaG16JPSMiF9bw2wbx8dzV7YRSkQ
 BNJUJBgv4IMc53CXyDZQqNMKLyBZA1jnkCMSYutiNZ/iAF9h/CD4OxBoURaFN6kHF2alTM
 nlIYasGSJBwTlqgHzdfa8j5xzLBXmboFRT1DF1XWSKbZzWSVbtAl+MNQHGo1dDG2EoZLmH
 lOPiNY8hZFvV9XAJWyx5Eh+H5h6IW/AliMaxuJAkZJTUti+ROixQqCW0EtyBahv3pt4HXL
 c6rxA+T37XqqA2dPF2050s2PJnGbZdtyh3MEEDncrGe+5nn9hlSi2PlOse4owQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Fq4olFa5
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/pahole: fix build with
 host-cmake 4.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8wNC8yMDI1IDIxOjQxLCBBbGV4aXMgTG90aG9yw6kgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBob3N0LXBhaG9sZSBidWlsZCBmYWlscyB3aXRoIHJlY2VudCBob3N0LWNtYWtlIHZlcnNp
b25zLCBwcm9kdWNpbmcgdGhlCj4gZm9sbG93aW5nIGVycm9yOgo+IAo+IENNYWtlIERlcHJlY2F0
aW9uIFdhcm5pbmcgYXQgQ01ha2VMaXN0cy50eHQ6MSAoY21ha2VfbWluaW11bV9yZXF1aXJlZCk6
Cj4gICAgQ29tcGF0aWJpbGl0eSB3aXRoIENNYWtlIDwgMy41IHdpbGwgYmUgcmVtb3ZlZCBmcm9t
IGEgZnV0dXJlIHZlcnNpb24KPiBvZgo+ICAgIENNYWtlLgo+IAo+ICAgIFVwZGF0ZSB0aGUgVkVS
U0lPTiBhcmd1bWVudCA8bWluPiB2YWx1ZSBvciB1c2UgYSAuLi48bWF4PiBzdWZmaXggdG8KPiB0
ZWxsCj4gICAgQ01ha2UgdGhhdCB0aGUgcHJvamVjdCBkb2VzIG5vdCBuZWVkIGNvbXBhdGliaWxp
dHkgd2l0aCBvbGRlcgo+IHZlcnNpb25zLgo+IAo+IFRoZSBpc3N1ZSBjYW4gYmUgcmVwcm9kdWNl
ZCB3aXRoIGEgbWluaW1hbCBkZWZjb25maWc6Cj4gICAgQlIyX2FybT15Cj4gICAgQlIyX2NvcnRl
eF9hNz15Cj4gICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gICAgQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTF9CT09UTElOPXkKPiAgICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgICBCUjJfTElOVVhf
S0VSTkVMX0RFRkNPTkZJRz0idmVyc2F0aWxlIgo+ICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNf
SE9TVF9QQUhPTEU9eQo+IEFuZCBob3N0LWNtYWtlID49IDQuMC4wCj4gCj4gVGhlIGlzc3VlIGhh
cyBhbHJlYWR5IGJlZW4gZml4ZWQgaW4gdGhlIHVwc3RyZWFtIHBhaG9sZSBwcm9qZWN0IGFuZCBp
cwo+IGluY2x1ZGVkIGluIHZlcnNpb25zID49IDEuMjguCj4gCj4gRml4IHRoZSBpc3N1ZSBvbiB0
aGUgY3VycmVudCBMVFMgYnJhbmNoIGJ5IGJyaW5naW5nIHRoZSBmaXhpbmcgY29tbWl0Cj4gZnJv
bSB1cHN0cmVhbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5s
b3Rob3JlQGJvb3RsaW4uY29tPgoKICBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKICBS
ZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiBUaGUgaXNzdWUgaGFzIGFscmVhZHkgYmVlbiBmaXhl
ZCBvbiBidWlsZHJvb3QgbWFzdGVyIGJyYW5jaCAoWzFdKSBieQo+IGJ1bXBpbmcgdGhlIHBhY2th
Z2Ugb24gYSBuZXdlciB2ZXJzaW9uIHRvIG1ha2Ugc3VyZSB0byBpbmNsdWRlIHRoZQo+IGNvcnJl
c3BvbmRpbmcgZml4Lgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3Qv
MjAyNTA0MTUtYnVtcF9wYWhvbGUtdjEtMS02YzZkZjNmZjQ5N2ZAYm9vdGxpbi5jb20vCj4gLS0t
Cj4gICAuLi5NYWtlTGlzdHMudHh0LVJlcXVpcmUtY21ha2UtMy41LW9yLWhpZ2hlci5wYXRjaCB8
IDQ1ICsrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGFob2xlLzAwMDEtQ01ha2VMaXN0cy50
eHQtUmVxdWlyZS1jbWFrZS0zLjUtb3ItaGlnaGVyLnBhdGNoIGIvcGFja2FnZS9wYWhvbGUvMDAw
MS1DTWFrZUxpc3RzLnR4dC1SZXF1aXJlLWNtYWtlLTMuNS1vci1oaWdoZXIucGF0Y2gKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAuLjAxZjk4ZmNiODgyMTQ4ZjNhMGJhOWIwZTZjODlmM2ZkOWQ1NTg4NTEKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9wYWhvbGUvMDAwMS1DTWFrZUxpc3RzLnR4dC1SZXF1
aXJlLWNtYWtlLTMuNS1vci1oaWdoZXIucGF0Y2gKPiBAQCAtMCwwICsxLDQ1IEBACj4gK0Zyb20g
MTJjYTExMjgxOTEyYzI3MmY5MzFlODM2YjkxNjBlZTgyNzI1MDcxNiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiArRnJvbTogQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxvIDxhY21lQHJlZGhhdC5j
b20+Cj4gK0RhdGU6IFR1ZSwgMjYgTm92IDIwMjQgMTQ6MTk6MTYgLTAzMDAKPiArU3ViamVjdDog
W1BBVENIXSBDTWFrZUxpc3RzLnR4dDogUmVxdWlyZSBjbWFrZSAzLjUgb3IgaGlnaGVyCj4gKwo+
ICtUbyBhZGRyZXNzIHRoaXMgd2FybmluZyBmcm9tIGNtYWtlOgo+ICsKPiArQ01ha2UgRGVwcmVj
YXRpb24gV2FybmluZyBhdCBDTWFrZUxpc3RzLnR4dDoxIChjbWFrZV9taW5pbXVtX3JlcXVpcmVk
KToKPiArICBDb21wYXRpYmlsaXR5IHdpdGggQ01ha2UgPCAzLjUgd2lsbCBiZSByZW1vdmVkIGZy
b20gYSBmdXR1cmUgdmVyc2lvbiBvZgo+ICsgIENNYWtlLgo+ICsKPiArICBVcGRhdGUgdGhlIFZF
UlNJT04gYXJndW1lbnQgPG1pbj4gdmFsdWUgb3IgdXNlIGEgLi4uPG1heD4gc3VmZml4IHRvIHRl
bGwKPiArICBDTWFrZSB0aGF0IHRoZSBwcm9qZWN0IGRvZXMgbm90IG5lZWQgY29tcGF0aWJpbGl0
eSB3aXRoIG9sZGVyIHZlcnNpb25zLgo+ICsKPiArQ2M6IEFsYW4gTWFndWlyZSA8YWxhbi5tYWd1
aXJlQG9yYWNsZS5jb20+Cj4gK0NjOiBBbmRyaWkgTmFrcnlpa28gPGFuZHJpaS5uYWtyeWlrb0Bn
bWFpbC5jb20+Cj4gK0NjOiBEb21lbmljbyBBbmRyZW9saSA8Y2F2b2tAZGViaWFuLm9yZz4KPiAr
Q2M6IERvbWluaXF1ZSBMZXVlbmJlcmdlciA8ZGltc3RhckBvcGVuc3VzZS5vcmc+Cj4gK0NjOiBE
b21pbmlxdWUgTWFydGluZXQgPGFzbWFkZXVzQGNvZGV3cmVjay5vcmc+Cj4gK0NjOiBFZHVhcmQg
WmluZ2VybWFuIDxlZGR5ejg3QGdtYWlsLmNvbT4KPiArQ2M6IEd1aWxoZXJtZSBBbWFkaW8gPGFt
YWRpb0BnZW50b28ub3JnPgo+ICtDYzogSmFuIEFsZXhhbmRlciBTdGVmZmVucyA8aGVmdGlnQGFy
Y2hsaW51eC5vcmc+Cj4gK0NjOiBKaXJpIE9sc2EgPGpvbHNhQGtlcm5lbC5vcmc+Cj4gK0NjOiBN
YXR0aGlhcyBTY2h3YXJ6b3R0IDx6emFtQGdlbnRvby5vcmc+Cj4gK0xpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9aMFlFRkFCUWVqZkdUeXJqQHgxCj4gK1NpZ25lZC1vZmYtYnk6IEFy
bmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUByZWRoYXQuY29tPgo+ICtVcHN0cmVhbTogaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2RldmVsL3BhaG9sZS9wYWhvbGUuZ2l0L2NvbW1p
dC8/aWQ9MTJjYTExMjgxOTEyYzI3MmY5MzFlODM2YjkxNjBlZTgyNzI1MDcxNgo+ICtTaWduZWQt
b2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+ICst
LS0KPiArIENNYWtlTGlzdHMudHh0IHwgMiArLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQg
Yi9DTWFrZUxpc3RzLnR4dAo+ICtpbmRleCAxZDBkYWRmNmVlYTcuLjkwZmE2NWMzOTFiNiAxMDA2
NDQKPiArLS0tIGEvQ01ha2VMaXN0cy50eHQKPiArKysrIGIvQ01ha2VMaXN0cy50eHQKPiArQEAg
LTEsNCArMSw0IEBACj4gKy1jbWFrZV9taW5pbXVtX3JlcXVpcmVkKFZFUlNJT04gMi44LjEyKQo+
ICsrY21ha2VfbWluaW11bV9yZXF1aXJlZChWRVJTSU9OIDMuNSkKPiArIHByb2plY3QocGFob2xl
IEMpCj4gKyBjbWFrZV9wb2xpY3koU0VUIENNUDAwMDUgTkVXKQo+ICsKPiArLS0KPiArMi40OS4w
Cj4gKwo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiA4M2I1ZTYxMDVjYWY2ODFkNzdlOTZmZTVmNzM4
Y2NlOWEwMTRjZDg0Cj4gY2hhbmdlLWlkOiAyMDI1MDQyNy1wYXRjaF9wYWhvbGUtZjY3NmVlYTY2
NDQ3Cj4gCj4gQmVzdCByZWdhcmRzLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
