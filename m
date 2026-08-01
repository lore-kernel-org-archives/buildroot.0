Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08582C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 14:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 960484073B;
	Sat,  1 Aug 2026 14:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxbqXZaIaKr3; Sat,  1 Aug 2026 14:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A931D407F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785594017;
	bh=6C2RwScscdU+pWmiP3bIJD1G9VIy49s1fLntIfYhfVc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NDcgIT94uxCHe8QWZIK3H7qyIjBQw1jm2hIissV8h9/K1+1W3jLiJp6AaRAn9cdKt
	 L/HPAsS7UM5Q5NsVmvBYLBXjlMxICj0qmEXj/lECZFb9l31rGSoSCbC2+mfOpG6/ZK
	 Ml8v+5d0LwYHuVCviIJknqMQdQGgdaEYbxpEadTkcYREaOII/D5bR9O+7jxUNqeVTw
	 4grZsh6AzcSbKvsAJioo8UjN5jqKZDNvEtmWbpJpCKzfR9W8nyzUIrbEU11XhBIM8l
	 BA22vwuQWJH/DG9CGcvbKiyFX/TfxtJKA/mhy7/YweZmUmvpCNqO0N8ojPZCpS0Zf6
	 zHwOYuNMtYZNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A931D407F7;
	Sat,  1 Aug 2026 14:20:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD30A32E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93D0C4006A
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkBfF7Vcaj3k for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 14:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A36A940015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A36A940015
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A36A940015
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:20:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1A04E13F879;
 Sat,  1 Aug 2026 16:20:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 16:20:03 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 16:20:03 +0200
To: matt@thewebers.ws
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Matthew Weber
 <mathew.l.weber3@boeing.com>, Neal Frager <neal.frager@amd.com>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>, Titouan Christophe
 <titouan.christophe@mind.be>, John Ernberg <john.ernberg@actia.se>
In-Reply-To: <20260703023758.3883041-1-matt@thewebers.ws>
References: <20260703023758.3883041-1-matt@thewebers.ws>
User-Agent: Webmail Free/1.6.17
Message-ID: <4b5d6ed71948cdd2e9866a181d4a8886@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785594013;
 bh=1LFPQ9rQa8K7CpuWTMfb42Xw1gVIKrBxJ8W5rUttzZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gbkPobvbXwwn5hLjETj52tmexiir0jJZMLOZiPBGzR4EZoM46BAW1K2t7LRexOvLK
 X7AwJsFVg/REYnsA+/2qdUBqSvhtKWAzmDgfzLs/ObgVo7GQ0SuScL4E9A1Rf4HAH5
 bXQeBWjflCwlLl+h7tgZfKkXQsykr5+Rsb87YVGRox5vHuqhgR9hgtPLNeOTK8m0Qv
 PfT5Fhtli07dKW4XbqtO2df3aquzMvqRYgK/LnptuTa35wHWGzjLDo4OWr+Vpv4oYO
 SdfYlGdDNROOqh9cKYY3wcqZyeG9dRDBaivwpppzE8w+0p7OIOb8418IEl2DZ+vsDw
 J4pwdYKT5MiOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gbkPobvb
Subject: Re: [Buildroot] [PATCH] package/xen: bump to 4.21.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMDcvMjAyNiAwNDozNywgbWF0dEB0aGV3ZWJlcnMud3Mgd3JvdGU6Cj4gRnJvbTogTWF0
dGhldyBXZWJlciA8bWF0aGV3Lmwud2ViZXIzQGJvZWluZy5jb20+Cj4gCj4gQnVtcCBYZW4gZnJv
bSA0LjE5LjUgdG8gNC4yMS4xLgo+IAo+IFJlc29sdmVkIGluIHZlcnNpb24gYnVtcDoKPiAtIDAw
MDItQXJtLXBsYXRmb3Jtcy1maXgtYnVpbGQtd2l0aC1nY2MxNS5wYXRjaAo+ICAgVXBzdHJlYW06
IAo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlm
ZjtoPTM5Zjk1MDg5ZTJiYTE1YzU0MzhjZTkwNGMwY2JiZDhkNzlkM2U2ZTcKPiAKPiBUaGUgZ2l0
LWNoZWNrb3V0LnNoIGZpeCBmb3Igbm9uLW1hc3RlciBicmFuY2ggY2hlY2tvdXQgaXMgbm93IGlu
Y2x1ZGVkOgo+ICAgCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdHdlYi8/cD14
ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTAxZmIyM2RkNzEwMDZkODdlODc0ZjMxMGU5YzUwZjMxNTgy
ZjI3NGUKPiAKPiBSZW1haW5pbmcgcGF0Y2hlcyByZWZyZXNoZWQgZm9yIHVwZGF0ZWQgY29udGV4
dDoKPiAtIDAwMDEtTm8tdHJhY2UtYmFja2VuZC5wYXRjaCAoQnVpbGRyb290IHNwZWNpZmljLCBj
cm9zcy1jb21waWxlIAo+IHdvcmthcm91bmQpCj4gLSAwMDAyLVVwZGF0ZS1saW5rZXItZmxhZ3Mu
cGF0Y2ggKEJ1aWxkcm9vdCBzcGVjaWZpYywgY3Jvc3MtY29tcGlsZSAKPiB3b3JrYXJvdW5kKQo+
IAo+IFN0YXJ0aW5nIHdpdGggWGVuIDQuMjAsIHFlbXUteGVuIGlzIG5vIGxvbmdlciBidW5kbGVk
IGluIHRoZSByZWxlYXNlCj4gdGFyYmFsbC4gQWRkIGEgbmV3IHFlbXUteGVuIHBhY2thZ2UgdGhh
dCBwcm92aWRlcyB0aGUgcWVtdS14ZW4gc291cmNlCj4gdHJlZSB3aXRoIHJlcXVpcmVkIG1lc29u
IHN1YnByb2plY3RzIHByZS1wb3B1bGF0ZWQuIFRoaXMgYXZvaWRzIGFueQo+IG5ldHdvcmsgYWNj
ZXNzIGR1cmluZyB0aGUgYnVpbGQuCj4gCj4gTmV3IGRlcGVuZGVuY2llczoKPiAtIHFlbXUteGVu
IChwcm92aWRlcyBxZW11LXhlbiBzb3VyY2UgZm9yIHRvb2xzIGJ1aWxkKQo+IC0gaG9zdC1weXRo
b24tZGlzdGxpYiAobmVlZGVkIGJ5IFFFTVUncyBta3ZlbnYpCj4gCj4gVGhlIHFlbXUteGVuIHBh
Y2thZ2U6Cj4gLSBGZXRjaGVzIHFlbXUteGVuIHZpYSBnaXQgKHdpdGhvdXQgcmVjdXJzaXZlIHN1
Ym1vZHVsZXMgdG8gYXZvaWQKPiAgIG1hc3NpdmUgUk9NIGRvd25sb2FkcykKPiAtIFByZS1wb3B1
bGF0ZXMgcmVxdWlyZWQgbWVzb24gc3VicHJvamVjdHMgKGtleWNvZGVtYXBkYiwKPiAgIGJlcmtl
bGV5LXNvZnRmbG9hdC0zLCBiZXJrZWxleS10ZXN0ZmxvYXQtMykgZnJvbSBnaXRsYWIgYXJjaGl2
ZXMKPiAtIEFwcGxpZXMgcGFja2FnZWZpbGVzIG92ZXJsYXlzIChtZXNvbi5idWlsZCkgZm9yIHN1
YnByb2plY3RzIHRoYXQKPiAgIG5lZWQgdGhlbQo+IC0gUmVtb3ZlcyAud3JhcCBmaWxlcyBmb3Ig
dW51c2VkIHN1YnByb2plY3RzIHRvIHByZXZlbnQgYW55IG5ldHdvcmsKPiAgIGFjY2VzcyBhdHRl
bXB0cyBkdXJpbmcgdGhlIGJ1aWxkCj4gLSBQYXRjaGVzIHhlbl9uYXRpdmUuaCAjZXJyb3IgdG8g
I3dhcm5pbmcgZm9yIGNyb3NzLWNvbXBpbGUKPiAKPiBUZXN0ZWQgd2l0aDoKPiAgICAgc3VwcG9y
dC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4gICAgICAgICAtZCBkbCAtbyBvdXRwdXRfZm9sZGVyIFwK
PiAgICAgICAgIHRlc3RzLnBhY2thZ2UudGVzdF94ZW4uVGVzdFhlbkFhcmNoNjQKPiAgICAgc3Vw
cG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4gICAgICAgICAtZCBkbCAtbyBvdXRwdXRfZm9sZGVy
IFwKPiAgICAgICAgIHRlc3RzLnBhY2thZ2UudGVzdF94ZW4uVGVzdFhlbkFybXY3Cj4gCj4gQm90
aCBhYXJjaDY0IGFuZCBhcm0zMiBydW50aW1lIHRlc3RzIHBhc3MuCj4gCj4gUXVpY2sgYnVpbGQg
ZGVmY29uZmlnIHVzZWQgZm9yIGl0ZXJhdGlvbjoKPiAgICAgQlIyX2FhcmNoNjQ9eQo+ICAgICBC
UjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09U
TElOPXkKPiAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNf
U1RBQkxFPXkKPiAgICAgQlIyX1BBQ0tBR0VfWEVOPXkKPiAgICAgQlIyX1BBQ0tBR0VfWEVOX0hZ
UEVSVklTT1I9eQo+ICAgICBCUjJfUEFDS0FHRV9YRU5fVE9PTFM9eQo+ICAgICAjIEJSMl9UQVJH
RVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gCj4gUmVsYXRlZCBwcmlvciBhdHRlbXB0czoKPiAg
IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyNjAyMTEwNTUxMzguNzE5NDU5LTEtbWF0dGhldy5sLndlYmVyQGdtYWlsLmNvbS8KPiAgIAo+
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
NTEwMDcxNjQ3NTYuODkzMjY0LTEtdGl0b3Vhbi5jaHJpc3RvcGhlQG1pbmQuYmUvCj4gCj4gQ2M6
IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgo+IENjOiBKdWxpZW4gT2xpdmFpbiA8
anUub0BmcmVlLmZyPgo+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5j
b20+Cj4gQ2M6IFRpdG91YW4gQ2hyaXN0b3BoZSA8dGl0b3Vhbi5jaHJpc3RvcGhlQG1pbmQuYmU+
Cj4gQ2M6IEpvaG4gRXJuYmVyZyA8am9obi5lcm5iZXJnQGFjdGlhLnNlPgo+IFNpZ25lZC1vZmYt
Ynk6IE1hdHRoZXcgV2ViZXIgPG1hdGhldy5sLndlYmVyM0Bib2VpbmcuY29tPgoKQXBwbGllZCB0
byBtYXN0ZXIsIHRoYW5rcy4KCkZvciBpbmZvLCBJIGhhdmUgbWFkZSB0aGUgZm9sbG93aW5nIG1p
bm9yIGNoYW5nZXM6Ci0gdXBkYXRlIHFlbXUteGVuIHBhY2thZ2UgdXJsIGluIENvbmZpZy5pbgot
IHNwbGl0IFhFTl9ERVBFTkRFTkNJRVMgbGluZXMKLSBhZGQgQ09QWUlORyBsaWNlbnNlIGhhc2gg
aW4gcWVtdS14ZW4uaGFzaAoKU2VlOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9jb21taXQvNDZiNWM5NTY0NzU3N2ZlYmRhM2NjNDU1NmZjMWU3ZWVkMDE3YmNl
NQoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
