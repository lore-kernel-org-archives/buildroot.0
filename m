Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2242CC47258
	for <buildroot@archiver.kernel.org>; Thu, 25 Jan 2024 22:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79D1C402B1;
	Thu, 25 Jan 2024 22:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79D1C402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpGIJmEQeB5h; Thu, 25 Jan 2024 22:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13DA24369E;
	Thu, 25 Jan 2024 22:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13DA24369E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2DE1BF321
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 22:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2338361B39
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 22:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2338361B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0jCfTflXuDn for <buildroot@lists.busybox.net>;
 Thu, 25 Jan 2024 22:33:55 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 909F8615A5
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 22:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 909F8615A5
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rT8IB-00A9f5-Ny; Thu, 25 Jan 2024 23:33:51 +0100
Received: from localhost (momiji.home [local])
 by momiji.home (OpenSMTPD) with ESMTPA id 76530865;
 Thu, 25 Jan 2024 22:33:50 +0000 (UTC)
Date: Fri, 26 Jan 2024 00:33:46 +0200
Message-ID: <20240126003346.GB2901019@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <8734ul6ruc.fsf@48ers.dk>
References: <20240125144121.1534299-1-aperez@igalia.com>
 <8734ul6ruc.fsf@48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5PXGckOMCKCIyMmSbIO1PtqyrQCDJMh+4P73o/XS/i4=; b=mX3BkbHin3K7Jlo1KCtIxCgTXf
 Q3uzWx8/uAz72jzgsndixzSyEoBU14DPzgHPliOP4Xlzrzfngv1lXKGMbI6fFGxWbDB6vgGmunAKv
 lMhGPJOvBzHtJqObF0w7mhuhUE1Jvziz0BtQZJvW4axtLAq5EbRpbu2ANwR6DCGXrD5+K5ZdDbnb2
 OENILpyeqgvuDfJGNCN/xGXfrfBnmm3rJuFlDdfhm9PaWAlMrLlSxXA+9lkoJ5DY6p57m3KqDpuDx
 VaFvXkBGVVbMXvZdCbJ/9MZa2EvSbOGmtBSYJ4xeOrFXebw4p0xgpfp2R6Nnrl08L9oOfXpTaQ6DD
 b8N2dW3Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=mX3BkbHi
Subject: Re: [Buildroot] [PATCH] package/libwpe: switch back to version
 1.14.2
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
Content-Type: multipart/mixed; boundary="===============4686365081285313870=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4686365081285313870==
Content-Type: multipart/signed; boundary="xEAhc/qeod6LaX1U"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--xEAhc/qeod6LaX1U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBUaHUsIDI1IEphbiAyMDI0IDIyOjExOjM5ICswMTAwIFBldGVyIEtvcnNnYWFy
ZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4gPj4+Pj4gIkFkcmlhbiIgPT0gQWRyaWFu
IFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyaXRlczoKPiAKPiAgPiBUaGUg
dmVyc2lvbmluZyBzY2hlbWUgZm9yIGxpYndwZSB1c2VzIHRoZSBtaWRkbGUgdmVyc2lvbiBudW1i
ZXIgdG8KPiAgPiBpbmRpY2F0ZSBzdGFiaWxpdHk6IGFuIGV2ZW4gbnVtYmVyIGZvciBzdGFibGUg
cmVsZWFzZXMsIG9kZCBmb3IKPiAgPiBkZXZlbG9wbWVudCBwcmV2aWV3IHJlbGVhc2VzLiBBcyBz
dWNoLCBCdWlsZHJvb3Qgc2hvdWxkIGJlIHVzaW5nCj4gID4gdmVyc2lvbiAxLjE0LjIsIHdoaWNo
IGlzIHRoZSBtb3N0IHJlY2VudCBvZiB0aGUgc3RhYmxlIHJlbGVhc2VzLgo+ICA+IFdoaWxlIGF0
IGl0LCBhZGQgYSBub3RlIGluIHRoZSAubWsgZmlsZSBhYm91dCB0aGUgdmVyc2lvbmluZyBzY2hl
bWUuCj4gCj4gSG1tLCB0aGlzIHdhcyBidW1wZWQgYmFjayBpbiBKdWx5IGJlZm9yZSAyMDIzLjA4
LXJjMS4gSXMgdGhlcmUgbm8gMS4xNi54Cj4gdmVyc2lvbiBjb21pbmc/CgpOb3QgYW55dGltZSBz
b29uLiBSZWxlYXNlIDEuMTQuMiB3aGljaCBJIGp1c3QgbWFkZSB5ZXN0ZXJkYXkgaW5jbHVkZXMg
YWxsIHRoZQpmaXhlcyB0aGF0IGFyZSBhbHNvIGluIDEuMTUuMiAtLSB1c3VhbGx5IHdlIG9ubHkg
ZG8gYSBuZXcgc3RhYmxlIGJyYW5jaCBpZgp0aGVyZSBhcmUgbmV3IGZlYXR1cmVzLCBhbmQgd2Ug
aGF2ZW4ndCBhZGRlZCBhbnl0aGluZyB0byBsaWJ3cGUgZm9yIGEgcXVpdGUKbG9uZyB0aW1lLgoK
QWxzbywgWWFubiBhc2tlZCBvbiBJUkMgd2hldGhlciB0aGUgcGFja2FnZXMgdGhhdCBkZXBlbmQg
b24gbGlid3BlCih3cGViYWNrZW5kLWZkbywgd3Bld2Via2l0LCBnc3QxLXBsdWdpbnMtYmFkKSBj
YW4gdXNlIDEuMTQueC4uLiBZZXMsCnRoZXkgY2FuLiBGb3IgV1BFIFdlYktpdCB3ZSBldmVuIGhh
dmUgYSBjb21wYXRpYmlsaXR5IHRhYmxlIGhlcmU6CgogIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9y
ZWxlYXNlL3NjaGVkdWxlLwoKPSkKCk1heWJlIHdlIHNob3VsZCByZWNvbnNpZGVyIHRoZSB2ZXJz
aW9uaW5nIHNjaGVtZSwgdXNpbmcgc3VmZml4ZXMgZm9yCmRldmVsb3BtZW50IHJlbGVhc2VzIGFu
ZCByZWxlYXNlIGNhbmRpZGF0ZXMgKCJYLlktZGV2TiIsICJYLVktcmNOIikKaW5zdGVhZCBvZiBl
dmVuL29kZCBudW1iZXJpbmcuIEl0IHNlZW1zIHRvIGNhdXNlIGVub3VnaCBjb25mdXNpb24gdG8K
YXQgbGVhc3QgY29uc2lkZXIgdGhlIGNoYW5nZS4KCj4gID4gU2lnbmVkLW9mZi1ieTogQWRyaWFu
IFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gID4gLS0tCj4gID4gIHBhY2th
Z2UvbGlid3BlL2xpYndwZS5oYXNoIHwgNiArKystLS0KPiAgPiAgcGFja2FnZS9saWJ3cGUvbGli
d3BlLm1rICAgfCAzICsrLQo+ICA+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAKPiAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ3cGUvbGlid3Bl
Lmhhc2ggYi9wYWNrYWdlL2xpYndwZS9saWJ3cGUuaGFzaAo+ICA+IGluZGV4IDIyNmI0ZjMyOTUu
LjU1NGIxZjJiMGUgMTAwNjQ0Cj4gID4gLS0tIGEvcGFja2FnZS9saWJ3cGUvbGlid3BlLmhhc2gK
PiAgPiArKysgYi9wYWNrYWdlL2xpYndwZS9saWJ3cGUuaGFzaAo+ICA+IEBAIC0xLDYgKzEsNiBA
QAo+ICA+IC0jIEZyb20gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2VzL2xpYndwZS0xLjE1
LjEudGFyLnh6LnN1bXMKPiAgPiAtc2hhMSAgMDA4MmNlYjQ3NTE3NWJmZWNkMTE3MmYyYzBiMjky
ODI0ZDMxNTYxYiAgbGlid3BlLTEuMTUuMS50YXIueHoKPiAgPiAtc2hhMjU2ICAxNGQzNmE5M2Ew
NWFiN2FkYTliZWM1ODE3MjBiODA1NzMzNmZlNjgxYmJiZTU5YmRhN2Q1MGNiOGYzZWJhM2E2ICBs
aWJ3cGUtMS4xNS4xLnRhci54ego+ICA+ICsjIEZyb20gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3Jl
bGVhc2VzL2xpYndwZS0xLjE0LjIudGFyLnh6LnN1bXMKPiAgPiArc2hhMSAgNzBhMmI4OTRhZjJi
NTBkNzA4MjI2MDE1OGE4OTUyNDk3NGE0ODBmMyAgbGlid3BlLTEuMTQuMi50YXIueHoKPiAgPiAr
c2hhMjU2ICA4YWUzODAyMmM1MGNiMzQwYzk2ZmRiZWUxMjE3ZjFlNDZhYjU3ZmJjMWM4YmE5ODE0
MjU2NWFiYmVkYmUyMmVmICBsaWJ3cGUtMS4xNC4yLnRhci54ego+ICAKPiAgPiAgIyBIYXNoZXMg
Zm9yIGxpY2Vuc2UgZmlsZXM6Cj4gID4gIHNoYTI1NiAgMzViZWYyOTVjZWRiYmYxNzllYWVlMTQz
MjgwMDI1ODdhMGU3ZGMwOGViZjNmMTVlYTA4MGE2ZjI4MTVmMGQ3YiAgQ09QWUlORwo+ICA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYndwZS9saWJ3cGUubWsgYi9wYWNrYWdlL2xpYndwZS9saWJ3
cGUubWsKPiAgPiBpbmRleCBmOGM2YjBmYzc2Li4xZmJkZDVmY2MzIDEwMDY0NAo+ICA+IC0tLSBh
L3BhY2thZ2UvbGlid3BlL2xpYndwZS5tawo+ICA+ICsrKyBiL3BhY2thZ2UvbGlid3BlL2xpYndw
ZS5tawo+ICA+IEBAIC00LDcgKzQsOCBAQAo+ICA+ICAjCj4gID4gICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gIAo+ICA+IC1MSUJXUEVfVkVSU0lPTiA9IDEuMTUuMQo+ICA+ICsjIFRoZSBtaWRk
bGUgbnVtYmVyIGlzIGV2ZW4gZm9yIHN0YWJsZSByZWxlYXNlcywgb2RkIGZvciBkZXZlbG9wbWVu
dCBvbmVzLgo+ICA+ICtMSUJXUEVfVkVSU0lPTiA9IDEuMTQuMgo+ICA+ICBMSUJXUEVfU0lURSA9
IGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlcwo+ICA+ICBMSUJXUEVfU09VUkNFID0gbGli
d3BlLSQoTElCV1BFX1ZFUlNJT04pLnRhci54ego+ICA+ICBMSUJXUEVfSU5TVEFMTF9TVEFHSU5H
ID0gWUVTCj4gID4gLS0gCj4gCj4gID4gMi40My4wCj4gCj4gID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAgPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiAgPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKPiAKPiAtLSAKPiBCeWUsIFBldGVy
IEtvcnNnYWFyZAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4g
CgpDaGVlcnMsCuKAlEFkcmnDoW4K

--xEAhc/qeod6LaX1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZbLhygAKCRCRxVnb5MkS
O/yCAJsFkMTGgJcBN9lPKNJ+uvF6xLVSZgCdHD/AL9koK/cl2b0j/MEUgVNXeHs=
=DYWG
-----END PGP SIGNATURE-----

--xEAhc/qeod6LaX1U--

--===============4686365081285313870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4686365081285313870==--
