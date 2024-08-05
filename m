Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA200C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 06:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6653880E23;
	Mon,  5 Aug 2024 06:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1OW_a7DFtoI; Mon,  5 Aug 2024 06:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B3DD80E32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B3DD80E32;
	Mon,  5 Aug 2024 06:25:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28F0A1BF3B5
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 06:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16AA960726
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 06:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyyu_1cGmoYd for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 06:25:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E025F60723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E025F60723
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E025F60723
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 06:25:33 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 196653535FBF; Mon,  5 Aug 2024 08:25:32 +0200 (CEST)
Date: Mon, 5 Aug 2024 08:25:32 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <ZrBwXIZm0rr/vlGR@waldemar-brodkorb.de>
References: <20240524181856.2712581-1-alexander.i.mukhin@gmail.com>
 <20240722144716.092e357b@windsurf>
 <CAH+XeQZrmvt7Ui7D6M2515=+W_3wTsPGVVWLcRALx+4X93Chzg@mail.gmail.com>
 <20240722151834.53981478@windsurf>
 <CAH+XeQZSokTTrUJWL02YkD75Z=Baxpwk28nMRBFjMSqcgBTG1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH+XeQZSokTTrUJWL02YkD75Z=Baxpwk28nMRBFjMSqcgBTG1g@mail.gmail.com>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722839132; bh=OTD8v12NjGAFXlZ9e0KIoIlzsKhC9w3R8sf15wYlE6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxKJh+Rnz6rJA56ASxGJLPCqw+GaLZDYY0ISfRFN/rqByt3bJofxbqFPEtIyHMVFt
 G6fliiV8BOFJTuCzrh6uCIHlJcXnbkRzb6FjrfOmPF5ShTOTVCKYKmucLs3KWO+QuR
 yjURS77x5bJhSJw6RmwFR/FW/7s2ld3AKKJy/zJTW3xy7o5mzIdg76QRrAkVTJT0Ss
 W/ArH1r7D11mwbck0pls9TTIaU+On9TwO94KdkfDWqG6y7jTjtmYtLW7bunRIOiP+F
 LIZK9uEcIK5TMvpPYWjtdoGX+VW0crpYJDbQhYQLLbg2nr60j57sjPY79AY+JjzjzS
 Q7GhwwucZIf8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=nxKJh+Rn
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.4
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCkpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyB3cm90ZSwKCj4gSGVsbG8gV2FsZGVtYXIgQnJv
ZGtvcmIsCj4gCj4gSSBzYXcgdGhlIGNvbW1pdCBodHRwczovL2NnaXQudWNsaWJjLW5nLm9yZy9j
Z2kvY2dpdC91Y2xpYmMtbmcuZ2l0L2NvbW1pdC8/aWQ9Cj4gMDViMTE4MDliZDExNDUwYWZmM2Qy
MGU0M2YxODQxNWNlNTg2MDFlNyB0aGF0IGRlZmluZXMgU0VFS19EQVRBIGFuZCBTRUVLX0hPTEUu
Cj4gSG93ZXZlciwgSSBub3RpY2VkIHRoYXQgdGhlIGZvbGxvd2luZyBjb2RlIGNvdWxkIGZhaWwg
YXQgcnVudGltZTogaHR0cHM6Ly8KPiBjZ2l0LnVjbGliYy1uZy5vcmcvY2dpL2NnaXQvdWNsaWJj
LW5nLmdpdC90cmVlL2xpYmMvc3lzZGVwcy9saW51eC9jb21tb24vCj4gbHNlZWsuYz9pZD0wNWIx
MTgwOWJkMTE0NTBhZmYzZDIwZTQzZjE4NDE1Y2U1ODYwMWU3I240NAoKRG8geW91IHVuZGVyc3Rh
bmQgdGhlIGlmZGVmIGNvbnN0cnVjdGlvbnM/IFVuZGVyIHdoaWNoIGNvbmRpdGlvbiBpdAp3aWxs
IHVzZSB0aGlzIGNvZGU/CiAKPiBTaG91bGQgU0VFS19EQVRBIGFuZCBTRUVLX0hPTEUgYmUgaW5j
bHVkZWQgaGVyZSBhcyB3ZWxsPwoKTm90IHN1cmUuIERvIHlvdSBoYXZlIGEgc2ltcGxlIHRlc3Qg
Y2FzZSBJIGNhbiB0cnk/CgpiZXN0IHJlZ2FyZHMKIFdhbGRlbWFyCiAKPiBSZWdhcmRzLgo+IAo+
IEVsIGx1biwgMjIganVsIDIwMjQgYSBsYXMgMTU6MTgsIFRob21hcyBQZXRhenpvbmkgKDwKPiB0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPikgZXNjcmliacOzOgo+IAo+ICAgICBIZWxsbyBK
b3PDqSwKPiAKPiAgICAgVGhhbmtzIGZvciB5b3VyIHN1cGVyIHF1aWNrIGZlZWRiYWNrIQo+IAo+
ICAgICBPbiBNb24sIDIyIEp1bCAyMDI0IDE1OjAxOjQ1ICswMjAwCj4gICAgIEpvc8OpIEx1aXMg
U2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPiB3cm90ZToKPiAKPiAg
ICAgPiBJbiB0aGUgbWVhbnRpbWUsIEkgcmVjb21tZW5kIHRoZSBmb2xsb3dpbmcgb3B0aW9uczoK
PiAgICAgPgo+ICAgICA+IEEpIFJldmVydCB0byB0aGUgcHJldmlvdXMgdmVyc2lvbiAoT3BlblpG
UyB2Mi4yLjMpLiBUaGlzIGlzIG5vdCBpZGVhbCBmb3IKPiAgICAgPiBwZW9wbGUgd2hvIGhhdmUg
YWxyZWFkeSB1cGdyYWRlZC4KPiAgICAgPgo+ICAgICA+IEIpIEluY2x1ZGUgYSB3b3JrLWluLXBy
b2dyZXNzIChpdCB3b3JrcyBmb3IgYnVpbGRyb290LCBJIHRlc3RlZCBpdCkKPiAgICAgcGF0Y2g6
Cj4gICAgID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3B1bGwvMTYxNjkucGF0Y2gu
Cj4gCj4gICAgIFBsZWFzZSBkbyB0aGlzIG9wdGlvbiAoQiksIGFuZCBhbHNvIGNvbnRyaWJ1dGUg
U0VFS19EQVRBIHN1cHBvcnQgdG8KPiAgICAgdUNsaWJjLiBJJ3ZlIGFkZGVkIFdhbGRlbWFyLCB0
aGUgdUNsaWJjLW5nIG1haW50YWluZXIsIGluIENjLgo+IAo+ICAgICBUaGFua3MgYSBsb3QhCj4g
Cj4gICAgIFRob21hcwo+ICAgICAtLQo+ICAgICBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCj4gICAgIEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCj4gICAgIGh0dHBzOi8vYm9vdGxpbi5jb20KPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
