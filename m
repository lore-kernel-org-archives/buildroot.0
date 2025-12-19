Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00180E668A0
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27124046E;
	Fri, 19 Dec 2025 22:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYA14AT4hdsL; Fri, 19 Dec 2025 22:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018414030A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184616;
	bh=8X7vuz2NObkC4p4TGmEHVUYKeLWEJUSTQN1H6qCuDgk=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FdQlLZhZkmpOcZfVQupccICHiWj+4l1cqVtQ36c1xTrhjnTbw33BFSbWb7Edrt4R6
	 PZIAp3WCDemUIMD0gTu98w++B5T+D3tOBA4Ayp1gtn2OpPfxRa/tiq7MT/cvyyBtM1
	 DnOuJTaJBdS3aSzIDYmndxkg5cS3bBitla9t63hkih7KtLnGs2gnlfsMYLkC9uZD6Z
	 iX/kuTYrfE4c7XmApUib9fV166LpxB/eOLRwK35fJc8Kjf1JeSe/yqxu+UVWaw9eex
	 p+T6PBXhm0i5b+2/1ulOK4DG+dlfgKj8TOWYNut1T0+f97B+wlBN7KCoXDVc9ePryg
	 ztWmHdc7BUIXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018414030A;
	Fri, 19 Dec 2025 22:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05BF4119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E033D4007F
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74TLAJ9JYMTa for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 617F64003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 617F64003A
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 617F64003A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:08 +0000 (UTC)
Received: from [91.116.119.59] (helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vWjIT-00EoXy-Rx
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 23:50:06 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 3faf9e7d
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:04 +0000 (UTC)
Date: Sat, 20 Dec 2025 00:50:03 +0200
Message-ID: <20251220005003.GD762893@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20251219164127.3999273-1-aperez@igalia.com>
References: <20251219164127.3999273-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JIt2/ltqIlfIoofUsrK0SEPXzkIaJlkqxVSiQaBMdOg=; b=juN/EUVv4GHjBoGggdNboqI0+b
 0cKkbkKAg7iHIMp27q3yi55mJy9f66eBN0kACIQt0VkdX0xCvn+hN+bWNk90EKesh48/+H3lqrE5q
 Yj7Btg4qANVu9yjGmyoqI9fOVpOhc6zNN4Eo729e5AJfzszjBPB0MRK66n06HMK5NW8I+RPiOTKWG
 yWSl5mZqaytxAi/RXTL2V9iQwYVV3OBii3EyPQZRZqYYJVTXhldJdQRKyg6U1IQAPbNtyTbPjMg18
 VONhPeZ0K8qKVP7GoK/diZd8zUjb5A+cRSMvLXRI9dhd9kZu+xVnHDjd2eUJFS7uYneq1GPXzTvHe
 enLwYhbA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=juN/EUVv
Subject: Re: [Buildroot] [PATCH] package/wpebackend-fdo: bump to version
 1.16.1
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
Content-Type: multipart/mixed; boundary="===============3105069293318755031=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3105069293318755031==
Content-Type: multipart/signed; boundary="XX8Na7EpdUWBNwMU"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--XX8Na7EpdUWBNwMU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBGcmksIDE5IERlYyAyMDI1IDE4OjQxOjI1ICswMjAwIEFkcmlhbiBQZXJleiBkZSBD
YXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiBUaGlzIG1haW50ZW5hbmNlIHJlbGVh
c2UgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBuZXdlciB2ZXJzaW9ucyBvZiB0aGUKPiBNZXNhIGxp
YnJhcnkuIFJlbGVhc2Ugbm90ZXM6Cj4gCj4gICBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFz
ZS93cGViYWNrZW5kLWZkby0xLjE2LjEuaHRtbAo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQ
ZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKRG8gbm90IG1lcmdlIHRoaXMgeWV0
LCBJIGhhdmUgZm91bmQgYXQgbGVhc3Qgb25lIGNvbmZpZ3VyYXRpb24gd2hlcmUKdGhlIHVwZGF0
ZWQgcGFja2FnZSBmYWlscyB0byBidWlsZCBkdWUgdG8gYSBtaXNzaW5nICNpbmNsdWRlLiBJJ2xs
IGFkZAphIHBhdGNoIGZvciBpdC4KCgoKPiAtLS0KPiAgcGFja2FnZS93cGViYWNrZW5kLWZkby93
cGViYWNrZW5kLWZkby5oYXNoIHwgOCArKysrLS0tLQo+ICBwYWNrYWdlL3dwZWJhY2tlbmQtZmRv
L3dwZWJhY2tlbmQtZmRvLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwZWJhY2tl
bmQtZmRvL3dwZWJhY2tlbmQtZmRvLmhhc2ggYi9wYWNrYWdlL3dwZWJhY2tlbmQtZmRvL3dwZWJh
Y2tlbmQtZmRvLmhhc2gKPiBpbmRleCBmMDU3ODgwOGM0Li41ZTM2MTM3NTI0IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2Uvd3BlYmFja2VuZC1mZG8vd3BlYmFja2VuZC1mZG8uaGFzaAo+ICsrKyBiL3Bh
Y2thZ2Uvd3BlYmFja2VuZC1mZG8vd3BlYmFja2VuZC1mZG8uaGFzaAo+IEBAIC0xLDcgKzEsNyBA
QAo+IC0jIEZyb20gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2VzL3dwZWJhY2tlbmQtZmRv
LTEuMTYuMC50YXIueHouc3Vtcwo+IC1tZDUgIDM4ZjQ4OGFhYTZkNjgyNTJiNTkzYjY1YmEzZTJk
OWQxICB3cGViYWNrZW5kLWZkby0xLjE2LjAudGFyLnh6Cj4gLXNoYTEgIDhhMDZlNTFhZWIyYzk0
YjRjZjI1NGQ4NjZjMTllY2E1ODdkM2NkMzcgIHdwZWJhY2tlbmQtZmRvLTEuMTYuMC50YXIueHoK
PiAtc2hhMjU2ICBiZWRkZjMyMTIzMmQ1YmQwODEwNmMxNzlkYmM2MDBmOGNlODhlYjM2MjBiNGE1
OWE2MzI5MDYzYjc4ZjY0NjM1ICB3cGViYWNrZW5kLWZkby0xLjE2LjAudGFyLnh6Cj4gKyMgRnJv
bSBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZXMvd3BlYmFja2VuZC1mZG8tMS4xNi4xLnRh
ci54ei5zdW1zCj4gK21kNSAgYTExMjM1ODE2OGUwM2FiZjQ5MzdjMGNlY2ZlMWRjOWQgIHdwZWJh
Y2tlbmQtZmRvLTEuMTYuMS50YXIueHoKPiArc2hhMSAgNGVkOWQxZDU2OGVmODA1Zjc5YjY5MWJh
YTBkMWNiZGZmMTdlZjQ1MyAgd3BlYmFja2VuZC1mZG8tMS4xNi4xLnRhci54ego+ICtzaGEyNTYg
IDU0NGFlMTQwMTJmOGU3ZTQyNmI4Y2I1MjJlYjBhYWFhYzgzMWFkN2MzNTYwMWQxY2YzMWQzNzY3
MGUwZWJiM2IgIHdwZWJhY2tlbmQtZmRvLTEuMTYuMS50YXIueHoKPiAgCj4gICMgSGFzaGVzIGZv
ciBsaWNlbnNlIGZpbGVzOgo+ICBzaGEyNTYgIGM5ZjY4MDMzNzEwNDdmYWQzZTcyMjAwZWM2Y2Qy
MjYzMjlhNWVlMDhhYzYxMTA0YzgyMTFjMjc2MWZiNDY4MjUgIENPUFlJTkcKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS93cGViYWNrZW5kLWZkby93cGViYWNrZW5kLWZkby5tayBiL3BhY2thZ2Uvd3Bl
YmFja2VuZC1mZG8vd3BlYmFja2VuZC1mZG8ubWsKPiBpbmRleCBlNTk3Mjc1NGY2Li42ZGJlNmVk
ZmUzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd3BlYmFja2VuZC1mZG8vd3BlYmFja2VuZC1mZG8u
bWsKPiArKysgYi9wYWNrYWdlL3dwZWJhY2tlbmQtZmRvL3dwZWJhY2tlbmQtZmRvLm1rCj4gQEAg
LTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLVdQRUJB
Q0tFTkRfRkRPX1ZFUlNJT04gPSAxLjE2LjAKPiArV1BFQkFDS0VORF9GRE9fVkVSU0lPTiA9IDEu
MTYuMQo+ICBXUEVCQUNLRU5EX0ZET19TSVRFID0gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVh
c2VzCj4gIFdQRUJBQ0tFTkRfRkRPX1NPVVJDRSA9IHdwZWJhY2tlbmQtZmRvLSQoV1BFQkFDS0VO
RF9GRE9fVkVSU0lPTikudGFyLnh6Cj4gIFdQRUJBQ0tFTkRfRkRPX0lOU1RBTExfU1RBR0lORyA9
IFlFUwo+IC0tIAo+IDIuNTIuMAo+IAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--XX8Na7EpdUWBNwMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaUXWmwAKCRCRxVnb5MkS
OyKNAJ964UMvmH8rARlpLz8uK9Bnu5Aa/gCfSSZGR+SX1oG7fJwUYH09NXPBc9o=
=XnPr
-----END PGP SIGNATURE-----

--XX8Na7EpdUWBNwMU--

--===============3105069293318755031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3105069293318755031==--
