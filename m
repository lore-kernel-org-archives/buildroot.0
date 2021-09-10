Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C99C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:25:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B32611C7
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08B32611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCDFF61B93;
	Fri, 10 Sep 2021 16:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24KS4w01P0ef; Fri, 10 Sep 2021 16:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D2761B92;
	Fri, 10 Sep 2021 16:25:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCD911BF2C7
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C976761B8E
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTSGC4WtZMMq for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 16:25:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25FB361B92
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 16:25:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d014:579:30ce:61f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id BE9482003CC;
 Fri, 10 Sep 2021 18:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631291102;
 bh=S/tEHQYNlfwprq+6N7Y65j0fENaZZi2J/wmQGGtB8Zo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LmoUHUSoIkoykkD0enljthvMMZsylHnbMlHx+sB4Sel2Tb/J0S4cNuRRqF6X9pZ6x
 hAr5qcQpyZAICaOXSdp9gHWqXauKASQKTgfC+y1p74itLas1DgB5EDywrXQgpWqaNd
 xrgi80iIQ54KqbXH4tR126/4eqRjZRA56/0Lg0Gs0oKFCsVU0+RonGzjHY8Suco7qz
 1mkW4C458ByxdpPEvmssimnRJzK+ELF0vWC9T+eohLghswOu7oiszkpD80pX4TFg7p
 h7uSJodMhnSfc9zQjhw5Hl1ArJ7T/W0Apg9LegoMy3inrmstFLuUI/AXpGZaw67hHw
 axmeQbdTNX9bQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Sep 2021 18:24:53 +0200
Date: Fri, 10 Sep 2021 18:24:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210910162453.GX1053080@scaer>
References: <20210905173446.44137-1-yann.morin.1998@free.fr>
 <20210905174402.GV1053080@scaer>
 <b8b5e5f2-5549-777d-1d94-c93fd21e9d4b@gmail.com>
 <cc862f92-fa95-27ff-4643-6fa47e18b80d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc862f92-fa95-27ff-4643-6fa47e18b80d@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: bump version to fix
 regression
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kevin Tomary <kevin.tomary@hotmail.com>, Leon de Rooij <leon@exquisip.nl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIxLTA5LTA4IDIyOjIyICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDA4LzA5LzIwMjEgw6AgMjE6NTQsIFJvbWFpbiBOYW91ciBhIMOpY3Jp
dMKgOgo+ID4gTGUgMDUvMDkvMjAyMSDDoCAxOTo0NCwgWWFubiBFLiBNT1JJTiBhIMOpY3JpdMKg
Ogo+ID4+IE9uIDIwMjEtMDktMDUgMTk6MzQgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bha2UgdGh1
c2x5Ogo+ID4+PiBWZXJzaW9uIDEuNDYuMyBoYWQgYSByZWdyZXNzaW9uLCB3aGljaCBtZWFudCB0
aGUgZmlsZSB0aGF0IHdvdWxkIHN0b3JlCj4gPj4+IHRoZSBmaWxlc3lzdGVtIGltYWdlIGhhZCB0
byBwcmUtZXhpc3QsIG9yIG1rZnMuZXh0MiB3b3VsZCBmYWlsIHRvCj4gPj4+IGdlbmVyYXRlIHRo
ZSBmaWxlc3lzdGVtOgo+ID4+Pgo+ID4+PiAgICAgbWtmcy5leHQ0OiBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5IHdoaWxlIHRyeWluZyB0byBkZXRlcm1pbmUKPiA+Pj4gICAgIGZpbGVzeXN0ZW0g
c2l6ZQo+ID4+Pgo+ID4+PiBUaGUgcmVncmVzc2lvbiB3YXMgZml4ZWQgdXBzdHJlYW0sIGFuZCBp
cyBub3cgcGFydCBvZiB0aGUgMS40Ni40Cj4gPj4+IHJlbGVhc2UsIHNvIGJ1bXAgdG8gdGhhdCBy
ZWxlYXNlLgo+ID4+Pgo+ID4+PiBGaXhlczogIzE0MTk2Cj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYt
Ynk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+ID4+PiBSZXBvcnRl
ZC1ieTogS2V2aW4gVG9tYXJ5IDxrZXZpbi50b21hcnlAaG90bWFpbC5jb20+Cj4gPj4+IFJlcG9y
dGVkLWJ5OiBMZW9uIGRlIFJvb2lqIDxsZW9uQGV4cXVpc2lwLm5sPgo+ID4gCj4gPiBUaGVyZSBp
cyBhbm90aGVyIHJlZ3Jlc3Npb24gd2l0aCBlMmZzcHJvZyAxLjQ2LjQ6Cj4gPiAKPiA+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNTY4NjcyOTQwCj4gPiAKPiA+
IFdpdGggdGhlIGZpeCBiYWNrcG9ydGVkIHRvIDEuNDYuMyB0aGUgZXh0NCB0ZXN0IGlzIG9rLgo+
ID4gCj4gPiBodHRwczovL2dpdGh1Yi5jb20vdHl0c28vZTJmc3Byb2dzL2NvbW1pdC81MzQ2NDY1
NGJkMzNlNThlM2ZmZjA3OWYzNDI2MWI4MjNkODM5ZjNiCj4gCj4gQWN0dWFsbHkgdGhlcmUgaXMg
bm8gcmVncmVzc2lvbiwgZTJmc3Byb2dzIGRlcHJlY2F0ZWQgZmlsZXN5c3RlbXMgd2l0aCAxMjgt
Ynl0ZQo+IGlub2Rlcy4gTm93IG1rZnMuZXh0NCB1c2UgMjU2LWJ5dGUgaW5vZGVzIGV2ZW4gZm9y
IHNtYWxsIGZpbGVzeXN0ZW1zLgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90eXRzby9lMmZzcHJvZ3Mv
Y29tbWl0L2EyM2I1MGNkYjU1Y2I4MjZiODc0NWNiYzM3NDI5YzkzZjdiNjBjNjYKCk9oLCB2IGVy
eSBnb29kIGNhdGNoISBJIHdhcyBiYW5naW5nIG15IGhlYWQgb24gdGhpcyBhIHdoaWxlIGFnbywg
YW5kIHdhcwpwcmV0dHkgZGFybiBzdHVjay4uLiBUaGFua3MhCgo+IFdlIGhhdmUgdG8gdXBkYXRl
IG91ciB0ZXN0LgoKVGhlIGlub2RlIHNpemUgY2hhbmdlIHdhcyBwYXJ0IG9mIDEuNDYuNCwgbm90
IDEuNDYuMywgc28gaXQgbWFkZSBzZW5zZQp0byBmaXggdGhlIHRlc3QgYXQgdGhlIHNhbWUgdGlt
ZSB3ZSBidW1wIHRoZSB2ZXJzaW9uLCB3aGljaCBJJ3ZlIGRvbmUKYW5kIHB1c2hlZCBub3cuIFRo
YW5rcyEKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4K
PiAKPiAKPiA+IAo+ID4gQmVzdCByZWdhcmRzLAo+ID4gUm9tYWluCj4gPiAKPiA+IAo+ID4+Pgo+
ID4+PiAtLS0KPiA+Pj4gRm9yIHRoZSBzdGFibGUgYnJhbmNoIDIwMjEuMDgueCwgSSdsbCBzZW5k
IGEgZGlmZmVyZW50IHBhdGNoLCB0aGF0IGp1c3QKPiA+Pj4gYmFja3BvcnRzIHRoZSB1cHN0cmVh
bSBmaXguCj4gPj4KPiA+PiBJbiBmYWN0LCAyMDIxLjA4IHN0aWxsIGhhcyBlMmZzcHJvZ3MgMS40
Ni4yLCB3aGljaCBpcyBub3QgYWZmZWN0ZWQ7IHNvLAo+ID4+IG5vIGJhY2twb3J0cyBuZWVkZWQu
Cj4gPj4KPiA+PiBSZWdhcmRzLAo+ID4+IFlhbm4gRS4gTU9SSU4uCj4gPj4KPiA+Pj4gLS0tCj4g
Pj4+ICBwYWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MuaGFzaCB8IDIgKy0KPiA+Pj4gIHBhY2th
Z2UvZTJmc3Byb2dzL2UyZnNwcm9ncy5tayAgIHwgMiArLQo+ID4+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MuaGFzaCBiL3BhY2thZ2UvZTJmc3Byb2dzL2Uy
ZnNwcm9ncy5oYXNoCj4gPj4+IGluZGV4IDM2NjE4MDExOTkuLjYzYzdjOTkyOWYgMTAwNjQ0Cj4g
Pj4+IC0tLSBhL3BhY2thZ2UvZTJmc3Byb2dzL2UyZnNwcm9ncy5oYXNoCj4gPj4+ICsrKyBiL3Bh
Y2thZ2UvZTJmc3Byb2dzL2UyZnNwcm9ncy5oYXNoCj4gPj4+IEBAIC0xLDUgKzEsNSBAQAo+ID4+
PiAgIyBGcm9tIGh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5l
bC9wZW9wbGUvdHl0c28vZTJmc3Byb2dzL3YxLjQ2LjMvc2hhMjU2c3Vtcy5hc2MKPiA+Pj4gLXNo
YTI1NiAgODZkMTU4MGZhY2RkNDlmMmUwZTZiMDI3ZTI2YjFlNmM0OGFmNTM4NzYyZGM0MGFlZWQy
YTg3MTUzYzFmMTFiNyAgZTJmc3Byb2dzLTEuNDYuMy50YXIueHoKPiA+Pj4gK3NoYTI1NiAgYjEx
MDQyNTMzYzFiMWRjZjE3NTEyZjBkYTQ4ZTA1YjBjNTczZGFkYTFkZDhiNzYyODY0ZDEwZjRkYzM5
OTcxMyAgZTJmc3Byb2dzLTEuNDYuNC50YXIueHoKPiA+Pj4gICMgTG9jYWxseSBjYWxjdWxhdGVk
Cj4gPj4+ICBzaGEyNTYgIDVkYTVlZjE1M2U1NTljMWQ5OTBkNGMzZWVkYmVkZDQ0NDJkYjg5MmQz
N2VhZTFmMzVmZmYwNjlkZThlYzkwMjAgIE5PVElDRQo+ID4+PiAgc2hhMjU2ICAwMzI5ODliNTA4
ZjFhNzJlYmVlNWIzNDE3ZTU1ZDA2ZDQ3M2Y5ZWUyMDNlNDVhYjExODY0YTdlNDljZGVjNjNkICBs
aWIvc3MvbWl0LXNpcGItY29weXJpZ2h0LmgKPiA+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZTJm
c3Byb2dzL2UyZnNwcm9ncy5tayBiL3BhY2thZ2UvZTJmc3Byb2dzL2UyZnNwcm9ncy5tawo+ID4+
PiBpbmRleCA1NTI4ZWNiYzM0Li5jYTg5MTA2NmEyIDEwMDY0NAo+ID4+PiAtLS0gYS9wYWNrYWdl
L2UyZnNwcm9ncy9lMmZzcHJvZ3MubWsKPiA+Pj4gKysrIGIvcGFja2FnZS9lMmZzcHJvZ3MvZTJm
c3Byb2dzLm1rCj4gPj4+IEBAIC00LDcgKzQsNyBAQAo+ID4+PiAgIwo+ID4+PiAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiA+Pj4gIAo+ID4+PiAtRTJGU1BST0dTX1ZFUlNJT04gPSAxLjQ2LjMK
PiA+Pj4gK0UyRlNQUk9HU19WRVJTSU9OID0gMS40Ni40Cj4gPj4+ICBFMkZTUFJPR1NfU09VUkNF
ID0gZTJmc3Byb2dzLSQoRTJGU1BST0dTX1ZFUlNJT04pLnRhci54ego+ID4+PiAgRTJGU1BST0dT
X1NJVEUgPSAkKEJSMl9LRVJORUxfTUlSUk9SKS9saW51eC9rZXJuZWwvcGVvcGxlL3R5dHNvL2Uy
ZnNwcm9ncy92JChFMkZTUFJPR1NfVkVSU0lPTikKPiA+Pj4gIEUyRlNQUk9HU19MSUNFTlNFID0g
R1BMLTIuMCwgTUlULWxpa2Ugd2l0aCBhZHZlcnRpc2luZyBjbGF1c2UgKGxpYnNzIGFuZCBsaWJl
dCkKPiA+Pj4gLS0gCj4gPj4+IDIuMjUuMQo+ID4+Pgo+ID4+Cj4gPiAKPiAKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
