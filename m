Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51959C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 09:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C09AF41B41;
	Thu,  8 Feb 2024 09:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pH8i_csu3lEI; Thu,  8 Feb 2024 09:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 080DA404DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 080DA404DD;
	Thu,  8 Feb 2024 09:28:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6671BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 296D6404DD
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CFk4_tEYddPr for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 09:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1390E40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1390E40012
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1390E40012
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 09:28:37 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rY0hs-00F89k-FC; Thu, 08 Feb 2024 10:28:32 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3d15aba4;
 Thu, 8 Feb 2024 09:28:30 +0000 (UTC)
Date: Thu, 8 Feb 2024 11:28:26 +0200
Message-ID: <20240208112826.GB3464513@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240208070939.493203-1-peter@korsgaard.com>
References: <20240208070939.493203-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=scd0fvs8RFqONrzJB8j73EHj5FThuvxSBlYBiMKvaRs=; b=Yvif+W6PaG5yKDI+gspIitlROh
 7P+WKUv8dwdnmL07kxByi244klg4xVLLnl1jcV0SF/6tm//Q2paPelS8k7RIBAUAP4FURTVIxbhiG
 R4t6N1nOjLmCHHZ33oFeKOburYrThcX0sQuJ/tf5M9/urGq7Gu/lTTXfeT/qJgnGyZb+u3U89hrZu
 tzAy5vEpkX9JSnrUmyQwp96kw0DeCApvgeeFi+y5bAM7NI/MClGqwNMTDMfLhwYecNq8R8Mw2XW8W
 2v/VrIOI/kAmyxxIEIa+9ziwNj4zMc0wo3O9Si0ek/bC22b3j0e5OobqKFg5S/4P5QUY7XMOuJIKB
 KxgZYMDg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Yvif+W6P
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: security bump to version
 2.42.5
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
Content-Type: multipart/mixed; boundary="===============8355051907075641578=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8355051907075641578==
Content-Type: multipart/signed; boundary="OD7hZJXAI0Bu5ze8"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--OD7hZJXAI0Bu5ze8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsCgpJIHdhcyBhYm91dCB0byBzdWJtaXQgYmFzaWNhbGx5IHRoZSBzYW1lIHBhdGNo
LCB5b3UgaGF2ZSBiZWF0ZW4gbWUgdG8gaXQuClRoYW5rcyEKCihMYXRlciB0b2RheSBJIHRvIHN1
Ym1pdCB0aGUgd3Bld2Via2l0IHVwZGF0ZSBhcyB3ZWxsIDpEKQoKT24gVGh1LCAwOCBGZWIgMjAy
NCAwODowOTozOSArMDEwMCBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
b3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgo+IAo+IGh0dHBzOi8v
d2Via2l0Z3RrLm9yZy9zZWN1cml0eS9XU0EtMjAyNC0wMDAxLmh0bWwKPiAKPiAtIENWRS0yMDI0
LTIzMjIyOiBQcm9jZXNzaW5nIG1hbGljaW91c2x5IGNyYWZ0ZWQgd2ViIGNvbnRlbnQgbWF5IGxl
YWQgdG8KPiAgIGFyYml0cmFyeSBjb2RlIGV4ZWN1dGlvbi4gIEFwcGxlIGlzIGF3YXJlIG9mIGEg
cmVwb3J0IHRoYXQgdGhpcyBpc3N1ZSBtYXkKPiAgIGhhdmUgYmVlbiBleHBsb2l0ZWQuICBEZXNj
cmlwdGlvbjogQSB0eXBlIGNvbmZ1c2lvbiBpc3N1ZSB3YXMgYWRkcmVzc2VkCj4gICB3aXRoIGlt
cHJvdmVkIGNoZWNrcy4KPiAKPiAtIENWRS0yMDI0LTIzMjA2OiBBIG1hbGljaW91c2x5IGNyYWZ0
ZWQgd2VicGFnZSBtYXkgYmUgYWJsZSB0byBmaW5nZXJwcmludAo+ICAgdGhlIHVzZXIuICBEZXNj
cmlwdGlvbjogQW4gYWNjZXNzIGlzc3VlIHdhcyBhZGRyZXNzZWQgd2l0aCBpbXByb3ZlZCBhY2Nl
c3MKPiAgIHJlc3RyaWN0aW9ucy4KPiAKPiAtIENWRS0yMDI0LTIzMjEzOiBQcm9jZXNzaW5nIHdl
YiBjb250ZW50IG1heSBsZWFkIHRvIGFyYml0cmFyeSBjb2RlIGV4ZWN1dGlvbi4KPiAgIERlc2Ny
aXB0aW9uOiBUaGUgaXNzdWUgd2FzIGFkZHJlc3NlZCB3aXRoIGltcHJvdmVkIG1lbW9yeSBoYW5k
bGluZy4KPiAKPiAtIENWRS0yMDIzLTQwNDE0OiBQcm9jZXNzaW5nIHdlYiBjb250ZW50IG1heSBs
ZWFkIHRvIGFyYml0cmFyeSBjb2RlCj4gICBleGVjdXRpb24uICBEZXNjcmlwdGlvbjogQSB1c2Ut
YWZ0ZXItZnJlZSBpc3N1ZSB3YXMgYWRkcmVzc2VkIHdpdGgKPiAgIGltcHJvdmVkIG1lbW9yeSBt
YW5hZ2VtZW50Lgo+IAo+IC0gQ1ZFLTIwMjMtNDI4MzM6IFByb2Nlc3Npbmcgd2ViIGNvbnRlbnQg
bWF5IGxlYWQgdG8gYXJiaXRyYXJ5IGNvZGUgZXhlY3V0aW9uLgo+ICAgRGVzY3JpcHRpb246IEEg
Y29ycmVjdG5lc3MgaXNzdWUgd2FzIGFkZHJlc3NlZCB3aXRoIGltcHJvdmVkIGNoZWNrcy4KPiAK
PiAtIENWRS0yMDE0LTE3NDU6IFByb2Nlc3NpbmcgYSBmaWxlIG1heSBsZWFkIHRvIGEgZGVuaWFs
LW9mLXNlcnZpY2Ugb3IKPiAgIHBvdGVudGlhbGx5IGRpc2Nsb3NlIG1lbW9yeSBjb250ZW50cy4g
IERlc2NyaXB0aW9uOiBUaGUgaXNzdWUgd2FzCj4gICBhZGRyZXNzZWQgd2l0aCBpbXByb3ZlZCBj
aGVja3MuCj4gCj4gaHR0cHM6Ly93ZWJraXRndGsub3JnL3NlY3VyaXR5L1dTQS0yMDIzLTAwMTIu
aHRtbAo+IAo+IC0gQ1ZFLTIwMjMtNDI4ODM6IFByb2Nlc3NpbmcgYSBTVkcgaW1hZ2UgbWF5IGxl
YWQgdG8gYSBkZW5pYWwtb2Ytc2VydmljZS4KPiAgIERlc2NyaXB0aW9uOiBUaGUgaXNzdWUgd2Fz
IGFkZHJlc3NlZCB3aXRoIGltcHJvdmVkIG1lbW9yeSBoYW5kbGluZy4KPiAKPiAtIENWRS0yMDIz
LTQyODkwOiBQcm9jZXNzaW5nIHdlYiBjb250ZW50IG1heSBsZWFkIHRvIGFyYml0cmFyeSBjb2Rl
Cj4gICBleGVjdXRpb24uICBEZXNjcmlwdGlvbjogVGhlIGlzc3VlIHdhcyBhZGRyZXNzZWQgd2l0
aCBpbXByb3ZlZCBtZW1vcnkKPiAgIGhhbmRsaW5nLgo+IAo+IGh0dHBzOi8vd2Via2l0Z3RrLm9y
Zy9zZWN1cml0eS9XU0EtMjAyMy0wMDExLmh0bWwKPiAKPiAtIENWRS0yMDIzLTQyOTE2OiBQcm9j
ZXNzaW5nIHdlYiBjb250ZW50IG1heSBkaXNjbG9zZSBzZW5zaXRpdmUgaW5mb3JtYXRpb24uCj4g
ICBBcHBsZSBpcyBhd2FyZSBvZiBhIHJlcG9ydCB0aGF0IHRoaXMgaXNzdWUgbWF5IGhhdmUgYmVl
biBhY3RpdmVseQo+ICAgZXhwbG9pdGVkLiAgRGVzY3JpcHRpb246IEFuIG91dC1vZi1ib3VuZHMg
cmVhZCB3YXMgYWRkcmVzc2VkIHdpdGggaW1wcm92ZWQKPiAgIGlucHV0IHZhbGlkYXRpb24uCj4g
Cj4gLSBDVkUtMjAyMy00MjkxNzogUHJvY2Vzc2luZyB3ZWIgY29udGVudCBtYXkgbGVhZCB0byBh
cmJpdHJhcnkgY29kZQo+ICAgZXhlY3V0aW9uLiAgQXBwbGUgaXMgYXdhcmUgb2YgYSByZXBvcnQg
dGhhdCB0aGlzIGlzc3VlIG1heSBoYXZlIGJlZW4KPiAgIGFjdGl2ZWx5IGV4cGxvaXRlZC4gIERl
c2NyaXB0aW9uOiBBIG1lbW9yeSBjb3JydXB0aW9uIHZ1bG5lcmFiaWxpdHkgd2FzCj4gICBhZGRy
ZXNzZWQgd2l0aCBpbXByb3ZlZCBsb2NraW5nLgo+IAo+IEFkZCBhbiB1cHN0cmVhbSBwb3N0LTIu
NDIuNSBwYXRjaCB0byBmaXggYW4gaXNzdWUgd2l0aCBhbiBpbnZhbGlkIGJhY2twb3J0Cj4gY2F1
c2luZyBhIGJ1aWxkIGlzc3VlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8
cGV0ZXJAa29yc2dhYXJkLmNvbT4KCkFja2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxh
cGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIC4uLnZlbEludGVycHJldGVyLmNwcC0zMzktMjEt
ZXJyb3ItdDYtdy5wYXRjaCB8IDM5ICsrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS93ZWJr
aXRndGsvd2Via2l0Z3RrLmhhc2ggICAgICAgICAgICAgIHwgIDYgKy0tCj4gIHBhY2thZ2Uvd2Vi
a2l0Z3RrL3dlYmtpdGd0ay5tayAgICAgICAgICAgICAgICB8ICAyICstCj4gIDMgZmlsZXMgY2hh
bmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2Uvd2Via2l0Z3RrLzAwMDEtR1RLLTIuNDIuNS1Mb3dMZXZlbEludGVycHJldGVy
LmNwcC0zMzktMjEtZXJyb3ItdDYtdy5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dl
YmtpdGd0ay8wMDAxLUdUSy0yLjQyLjUtTG93TGV2ZWxJbnRlcnByZXRlci5jcHAtMzM5LTIxLWVy
cm9yLXQ2LXcucGF0Y2ggYi9wYWNrYWdlL3dlYmtpdGd0ay8wMDAxLUdUSy0yLjQyLjUtTG93TGV2
ZWxJbnRlcnByZXRlci5jcHAtMzM5LTIxLWVycm9yLXQ2LXcucGF0Y2gKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmM5NjY3ZmVkYmQKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvcGFja2FnZS93ZWJraXRndGsvMDAwMS1HVEstMi40Mi41LUxvd0xldmVsSW50ZXJwcmV0
ZXIuY3BwLTMzOS0yMS1lcnJvci10Ni13LnBhdGNoCj4gQEAgLTAsMCArMSwzOSBAQAo+ICtGcm9t
IDNkNTM3MzU3NTY5NWIyOTNiODU1OTE1NTQzMWQwMDc5YTYxNTNhZmYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCj4gK0Zyb206IE1pY2hhZWwgQ2F0YW56YXJvIDxtY2F0YW56YXJvQHJlZGhhdC5j
b20+Cj4gK0RhdGU6IE1vbiwgNSBGZWIgMjAyNCAxMTowMDo0OSAtMDYwMAo+ICtTdWJqZWN0OiBb
UEFUQ0hdID0/VVRGLTg/cT9bR1RLXT0yMFsyLjQyLjVdPTIwTG93TGV2ZWxJbnRlcnByZXRlci5j
cHA6MzM5Oj89Cj4gKyA9P1VURi04P3E/MjE6PTIwZXJyb3I6PTIwPUUyPTgwPTk4dDY9RTI9ODA9
OTk9MjB3YXM9MjBub3Q9MjBkZWNsYXJlZD0yMGluPz0KPiArID0/VVRGLTg/cT89MjB0aGlzPTIw
c2NvcGU9MjBodHRwczovL2J1Z3Mud2Via2l0Lm9yZy9zaG93PTVGYnVnLmNnaT0zRmlkPz0KPiAr
ID0/VVRGLTg/cT89M0QyNjg3Mzk/PQo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGlu
ZzogOGJpdAo+ICsKPiArVW5yZXZpZXdlZCBidWlsZCBmaXguIFNlZW1zIGEgYmFja3BvcnQgd2Vu
dCBiYWRseSwgYW5kIHdlIGRpZG4ndCBub3RpY2UKPiArYmVjYXVzZSB0aGUgY29kZSBpcyBhcmNo
aXRlY3R1cmUtc3BlY2lmaWMuCj4gKwo+ICsqIFNvdXJjZS9KYXZhU2NyaXB0Q29yZS9sbGludC9M
b3dMZXZlbEludGVycHJldGVyLmNwcDoKPiArKEpTQzo6Q0xvb3A6OmV4ZWN1dGUpOgo+ICsKPiAr
VXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9XZWJLaXQvV2ViS2l0L2NvbW1pdC8zZDUzNzM1
NzU2OTViMjkzYjg1NTkxNTU0MzFkMDA3OWE2MTUzYWZmCj4gK1NpZ25lZC1vZmYtYnk6IFBldGVy
IEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiArLS0tCj4gKyBTb3VyY2UvSmF2YVNj
cmlwdENvcmUvbGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAgfCAyIC0tCj4gKyAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQgYS9Tb3VyY2UvSmF2YVNj
cmlwdENvcmUvbGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAgYi9Tb3VyY2UvSmF2YVNjcmlw
dENvcmUvbGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAKPiAraW5kZXggNTA2NGVhZDZjZDJl
Li45YTJlMjY1M2IxMjEgMTAwNjQ0Cj4gKy0tLSBhL1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9sbGlu
dC9Mb3dMZXZlbEludGVycHJldGVyLmNwcAo+ICsrKysgYi9Tb3VyY2UvSmF2YVNjcmlwdENvcmUv
bGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAKPiArQEAgLTMzNiw4ICszMzYsNiBAQCBKU1Zh
bHVlIENMb29wOjpleGVjdXRlKE9wY29kZUlEIGVudHJ5T3Bjb2RlSUQsIHZvaWQqIGV4ZWN1dGFi
bGVBZGRyZXNzLCBWTSogdm0sCj4gKyAgICAgVU5VU0VEX1ZBUklBQkxFKHQyKTsKPiArICAgICBV
TlVTRURfVkFSSUFCTEUodDMpOwo+ICsgICAgIFVOVVNFRF9WQVJJQUJMRSh0NSk7Cj4gKy0gICAg
VU5VU0VEX1ZBUklBQkxFKHQ2KTsKPiArLSAgICBVTlVTRURfVkFSSUFCTEUodDcpOwo+ICsgCj4g
KyAgICAgc3RydWN0IFN0YWNrUG9pbnRlclNjb3BlIHsKPiArICAgICAgICAgU3RhY2tQb2ludGVy
U2NvcGUoQ0xvb3BTdGFjayYgc3RhY2spCj4gKy0tIAo+ICsyLjM5LjIKPiArCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoIGIvcGFja2FnZS93ZWJraXRndGsv
d2Via2l0Z3RrLmhhc2gKPiBpbmRleCA1OTc4MjczMmMzLi5hYzQ3OTlkNGNmIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4gKysrIGIvcGFja2FnZS93ZWJr
aXRndGsvd2Via2l0Z3RrLmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAtIyBGcm9tIGh0dHBzOi8v
d3d3LndlYmtpdGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLTIuNDIuMi50YXIueHouc3Vtcwo+
IC1zaGExICAwNWJlYzZhODI0ZTQ2ZjA0M2I4NjU0Nzg3MzViYzgzOTUyNDk1MTBlICB3ZWJraXRn
dGstMi40Mi4yLnRhci54ego+IC1zaGEyNTYgIDU3MjBhYTNlODYyN2YxYjlmNjMyNTIxODdkNGRm
MGY4MjMzYWU3MWQ2OTdiMTc5NmViZmJlNWNhNzUwYmQxMTggIHdlYmtpdGd0ay0yLjQyLjIudGFy
Lnh6Cj4gKyMgRnJvbSBodHRwczovL3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzL3dlYmtpdGd0
ay0yLjQyLjUudGFyLnh6LnN1bXMKPiArc2hhMSAgYzNmZmIyYmVhYWM1NmYxMDg5MDI5ZjIyNTQ0
ODJmNDhkOWUzZGIzNyAgd2Via2l0Z3RrLTIuNDIuNS50YXIueHoKPiArc2hhMjU2ICBiNjQyNzhj
MWYyMGI4Y2ZkYmZiNWZmNTczYzM3ZDg3MWFiYTc0YTFkYjI2ZDliMzlmNzRlODk1M2ZlNjFlNzQ5
ICB3ZWJraXRndGstMi40Mi41LnRhci54ego+ICAKPiAgIyBIYXNoZXMgZm9yIGxpY2Vuc2UgZmls
ZXM6Cj4gIHNoYTI1NiAgMGI1ZDNhN2NjMzI1OTQyNTY3MzczYjBlY2Q3NTdkMDdjMTMyZTBlYmQ3
Yzk3YmZjNjNmN2UxYTc2MDk0ZWRiNCAgU291cmNlL1dlYkNvcmUvTElDRU5TRS1BUFBMRQo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsgYi9wYWNrYWdlL3dlYmtp
dGd0ay93ZWJraXRndGsubWsKPiBpbmRleCA2MTFkN2Y2NWQzLi4wNzVhMzY2NTRmIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+ICsrKyBiL3BhY2thZ2Uvd2Vi
a2l0Z3RrL3dlYmtpdGd0ay5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gIAo+IC1XRUJLSVRHVEtfVkVSU0lPTiA9IDIuNDIuMgo+ICtXRUJLSVRH
VEtfVkVSU0lPTiA9IDIuNDIuNQo+ICBXRUJLSVRHVEtfU0lURSA9IGh0dHBzOi8vd3d3LndlYmtp
dGd0ay5vcmcvcmVsZWFzZXMKPiAgV0VCS0lUR1RLX1NPVVJDRSA9IHdlYmtpdGd0ay0kKFdFQktJ
VEdUS19WRVJTSU9OKS50YXIueHoKPiAgV0VCS0lUR1RLX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+
IC0tIAo+IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--OD7hZJXAI0Bu5ze8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZcSeugAKCRCRxVnb5MkS
O/6tAJ9F+8cQ6JDABcM4wBe9WpAoEGI7iQCePqwi3O03Xo1OcU7Qwyyiwug+aHc=
=o1hd
-----END PGP SIGNATURE-----

--OD7hZJXAI0Bu5ze8--

--===============8355051907075641578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8355051907075641578==--
