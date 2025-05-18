Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51763C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 18:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12AB81E76;
	Sun, 18 May 2025 18:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4Zt2EaO2fUG; Sun, 18 May 2025 18:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F56781E62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F56781E62;
	Sun, 18 May 2025 18:34:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26F02DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 18:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D44D60B4B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 18:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcqR7QEQQmqz for <buildroot@buildroot.org>;
 Sun, 18 May 2025 18:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D62F60AE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D62F60AE7
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D62F60AE7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 18:34:40 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uGiqK-009w7x-Ct; Sun, 18 May 2025 20:34:36 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id d51c416a;
 Sun, 18 May 2025 18:34:33 +0000 (UTC)
Date: Sun, 18 May 2025 21:34:29 +0300
Message-ID: <20250518213429.GB769321@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250517202418.3516858-1-peter@korsgaard.com>
References: <20250517202418.3516858-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4RQrqpfBUa6KYyY8Ajs8Rzi8RxysDmPnVHWPAxyx+Jg=; b=kypbFhAPDUhU0CMJheC3L/JTuU
 Abx9rRjbjEcsSeUot2pGduF4OGi2w2Ynf4ZizorLNyQtCNMIqXhEcDhge6abj6CwgOPF3BQmrBfmK
 fRMbH1AR+Ms02m+ULzhepcTW+j0yyOPdXQoWQ7dFzQ6NGsVVA29PY9fVwlpV1uRCjuJN6FkzTS3d/
 012wEumWIAuko1c6auDnX+pV22grMeC30XLxgbDDQCoNFnU9GIbq54KZoiva+EsJ+3R89YEkpimSf
 I+kpXM+w44fPBNmoPZKcvSrnCUbjKVZffC65VGgdJrf8dssDw71SkD8tXiuD6nq4ggzysKQYudBNE
 RdyUp+uQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=kypbFhAP
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: security bump to version
 2.48.2
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
Content-Type: multipart/mixed; boundary="===============2124983265531471222=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2124983265531471222==
Content-Type: multipart/signed; boundary="d+hMQzJYIWB+ftDZ"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--d+hMQzJYIWB+ftDZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBTYXQsIDE3IE1heSAyMDI1IDIyOjI0OjE3ICswMjAwIFBldGVyIEtvcnNnYWFyZCA8
cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0
eSBpc3N1ZXM6Cj4gCj4gQ1ZFLTIwMjUtMjQyMjMKPiAgICAgVmVyc2lvbnMgYWZmZWN0ZWQ6IFdl
YktpdEdUSyBhbmQgV1BFIFdlYktpdCBiZWZvcmUgMi40OC4yLgo+ICAgICBDcmVkaXQgdG8gcmhl
emEgKEBnaW5nZ2lsQmVzZWwpIGFuZCBhbiBhbm9ueW1vdXMgcmVzZWFyY2hlci4KPiAgICAgSW1w
YWN0OiBQcm9jZXNzaW5nIG1hbGljaW91c2x5IGNyYWZ0ZWQgd2ViIGNvbnRlbnQgbWF5IGxlYWQg
dG8KPiAgICAgbWVtb3J5IGNvcnJ1cHRpb24uIERlc2NyaXB0aW9uOiBUaGUgaXNzdWUgd2FzIGFk
ZHJlc3NlZCB3aXRoCj4gICAgIGltcHJvdmVkIG1lbW9yeSBoYW5kbGluZy4KPiAgICAgV2ViS2l0
IEJ1Z3ppbGxhOiAyODc1NzcKPiAKPiBDVkUtMjAyNS0zMTIwNAo+ICAgICBWZXJzaW9ucyBhZmZl
Y3RlZDogV2ViS2l0R1RLIGFuZCBXUEUgV2ViS2l0IGJlZm9yZSAyLjQ4LjIuCj4gICAgIENyZWRp
dCB0byBOYW4gV2FuZyAoQGV0ZXJuYWxzYWt1cmExMykuCj4gICAgIEltcGFjdDogUHJvY2Vzc2lu
ZyBtYWxpY2lvdXNseSBjcmFmdGVkIHdlYiBjb250ZW50IG1heSBsZWFkIHRvCj4gICAgIG1lbW9y
eSBjb3JydXB0aW9uLiBEZXNjcmlwdGlvbjogVGhlIGlzc3VlIHdhcyBhZGRyZXNzZWQgd2l0aAo+
ICAgICBpbXByb3ZlZCBtZW1vcnkgaGFuZGxpbmcuCj4gICAgIFdlYktpdCBCdWd6aWxsYTogMjkx
NTA2Cj4gCj4gQ1ZFLTIwMjUtMzEyMDUKPiAgICAgVmVyc2lvbnMgYWZmZWN0ZWQ6IFdlYktpdEdU
SyBhbmQgV1BFIFdlYktpdCBiZWZvcmUgMi40OC4yLgo+ICAgICBDcmVkaXQgdG8gSXZhbiBGcmF0
cmljIG9mIEdvb2dsZSBQcm9qZWN0IFplcm8uCj4gICAgIEltcGFjdDogQSBtYWxpY2lvdXMgd2Vi
c2l0ZSBtYXkgZXhmaWx0cmF0ZSBkYXRhIGNyb3NzLW9yaWdpbi4KPiAgICAgRGVzY3JpcHRpb246
IFRoZSBpc3N1ZSB3YXMgYWRkcmVzc2VkIHdpdGggaW1wcm92ZWQgY2hlY2tzLgo+ICAgICBXZWJL
aXQgQnVnemlsbGE6IDI5MDk5Mgo+IAo+IENWRS0yMDI1LTMxMjA2Cj4gICAgIFZlcnNpb25zIGFm
ZmVjdGVkOiBXZWJLaXRHVEsgYW5kIFdQRSBXZWJLaXQgYmVmb3JlIDIuNDguMi4KPiAgICAgQ3Jl
ZGl0IHRvIGFuIGFub255bW91cyByZXNlYXJjaGVyLgo+ICAgICBJbXBhY3Q6IFByb2Nlc3Npbmcg
bWFsaWNpb3VzbHkgY3JhZnRlZCB3ZWIgY29udGVudCBtYXkgbGVhZCB0byBhbgo+ICAgICB1bmV4
cGVjdGVkIFNhZmFyaSBjcmFzaC4gRGVzY3JpcHRpb246IEEgdHlwZSBjb25mdXNpb24gaXNzdWUg
d2FzCj4gICAgIGFkZHJlc3NlZCB3aXRoIGltcHJvdmVkIHN0YXRlIGhhbmRsaW5nLgo+ICAgICBX
ZWJLaXQgQnVnemlsbGE6IDI5MDgzNAo+IAo+IENWRS0yMDI1LTMxMjE1Cj4gICAgIFZlcnNpb25z
IGFmZmVjdGVkOiBXZWJLaXRHVEsgYW5kIFdQRSBXZWJLaXQgYmVmb3JlIDIuNDguMi4KPiAgICAg
Q3JlZGl0IHRvIEppbWluZyBXYW5nIGFuZCBKaWthaSBSZW4uCj4gICAgIEltcGFjdDogUHJvY2Vz
c2luZyBtYWxpY2lvdXNseSBjcmFmdGVkIHdlYiBjb250ZW50IG1heSBsZWFkIHRvIGFuCj4gICAg
IHVuZXhwZWN0ZWQgcHJvY2VzcyBjcmFzaC4gRGVzY3JpcHRpb246IFRoZSBpc3N1ZSB3YXMgYWRk
cmVzc2VkIHdpdGgKPiAgICAgaW1wcm92ZWQgY2hlY2tzLgo+ICAgICBXZWJLaXQgQnVnemlsbGE6
IDI4ODgxNAo+IAo+IENWRS0yMDI1LTMxMjU3Cj4gICAgIFZlcnNpb25zIGFmZmVjdGVkOiBXZWJL
aXRHVEsgYW5kIFdQRSBXZWJLaXQgYmVmb3JlIDIuNDguMi4KPiAgICAgQ3JlZGl0IHRvIEp1ZXJn
ZW4gU2NobWllZCBvZiBMeW5jayBHbWJILgo+ICAgICBJbXBhY3Q6IFByb2Nlc3NpbmcgbWFsaWNp
b3VzbHkgY3JhZnRlZCB3ZWIgY29udGVudCBtYXkgbGVhZCB0byBhbgo+ICAgICB1bmV4cGVjdGVk
IFNhZmFyaSBjcmFzaC4gRGVzY3JpcHRpb246IFRoaXMgaXNzdWUgd2FzIGFkZHJlc3NlZCB3aXRo
Cj4gICAgIGltcHJvdmVkIG1lbW9yeSBoYW5kbGluZy4KPiAgICAgV2ViS2l0IEJ1Z3ppbGxhOiAy
OTA5ODUKPiAKPiBodHRwczovL3dlYmtpdGd0ay5vcmcvc2VjdXJpdHkvV1NBLTIwMjUtMDAwNC5o
dG1sCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQu
Y29tPgoKQWNrZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29t
PgoKPiAtLS0KPiAgcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2ggfCA2ICsrKy0tLQo+
ICBwYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0
Z3RrLmhhc2gKPiBpbmRleCBmZDk0MjBiYWQ5Li44MmI1Y2I0NjUxIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4gKysrIGIvcGFja2FnZS93ZWJraXRndGsv
d2Via2l0Z3RrLmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAtIyBGcm9tIGh0dHBzOi8vd3d3Lndl
YmtpdGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLTIuNDguMS50YXIueHouc3Vtcwo+IC1zaGEx
ICBmNzkzOWY5MjBmOTJmNmIxMzk1Yjg1NzNmMDY5ZDNmYjljMDg1YjNmICB3ZWJraXRndGstMi40
OC4xLnRhci54ego+IC1zaGEyNTYgIDk4ZWZkZjIxYzRjZGNhMGZlMGI3M2FiNWE4Y2I1MjA5M2I1
YWE1MmQ5YjFiMDE2YTkzZjcxZGJmYTFlYjI1OGYgIHdlYmtpdGd0ay0yLjQ4LjEudGFyLnh6Cj4g
KyMgRnJvbSBodHRwczovL3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzL3dlYmtpdGd0ay0yLjQ4
LjIudGFyLnh6LnN1bXMKPiArc2hhMSAgZTFhMjE2NTg4YWQ1ZWFmNzFiNTQ4YjAzNTY5OTMxOWY3
NGNiZDhkYSAgd2Via2l0Z3RrLTIuNDguMi50YXIueHoKPiArc2hhMjU2ICBlYzU4ZjZkZmMyNWQz
YjM2MDM4OGUxOTJmODY1MDY4ZDY5YWFiMDliNGQ3ZGYwMjFmOTBlMzE0ZDJmYTU0ZjM3ICB3ZWJr
aXRndGstMi40OC4yLnRhci54ego+ICAKPiAgIyBIYXNoZXMgZm9yIGxpY2Vuc2UgZmlsZXM6Cj4g
IHNoYTI1NiAgMGI1ZDNhN2NjMzI1OTQyNTY3MzczYjBlY2Q3NTdkMDdjMTMyZTBlYmQ3Yzk3YmZj
NjNmN2UxYTc2MDk0ZWRiNCAgU291cmNlL1dlYkNvcmUvTElDRU5TRS1BUFBMRQo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsgYi9wYWNrYWdlL3dlYmtpdGd0ay93
ZWJraXRndGsubWsKPiBpbmRleCAyYzIyYmZiNjA3Li4yNDZhZmFkM2NmIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3Rr
L3dlYmtpdGd0ay5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gIAo+IC1XRUJLSVRHVEtfVkVSU0lPTiA9IDIuNDguMQo+ICtXRUJLSVRHVEtfVkVS
U0lPTiA9IDIuNDguMgo+ICBXRUJLSVRHVEtfU0lURSA9IGh0dHBzOi8vd3d3LndlYmtpdGd0ay5v
cmcvcmVsZWFzZXMKPiAgV0VCS0lUR1RLX1NPVVJDRSA9IHdlYmtpdGd0ay0kKFdFQktJVEdUS19W
RVJTSU9OKS50YXIueHoKPiAgV0VCS0lUR1RLX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+IC0tIAo+
IDIuMzkuNQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4g
CgpDaGVlcnMsCuKAlEFkcmnDoW4K

--d+hMQzJYIWB+ftDZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaCooNQAKCRCRxVnb5MkS
O8vrAJ9dY+218nGhWp0+Pac29X6hffsD6gCfVPTKSUP3rdngZX0vY9C9A+Rc9ZE=
=vjHN
-----END PGP SIGNATURE-----

--d+hMQzJYIWB+ftDZ--

--===============2124983265531471222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2124983265531471222==--
