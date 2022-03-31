Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C82CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 20:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89CD961270;
	Thu, 31 Mar 2022 20:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBLPe6-QquaG; Thu, 31 Mar 2022 20:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98B7060F05;
	Thu, 31 Mar 2022 20:12:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59FF71BF384
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 20:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5151A424CF
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 20:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEb8s4cpMiPS for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 20:12:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F6F7424CA
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 20:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648757552;
 bh=Q98yNZ1iDpRzx3XKBQmZBL/ZejWTz7wzqWyDANeNWNQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=VGR1fc/VzZK28tZHeFP6BxPoa7U2SvXUiuufnKak2po6XmRHz/CfpZyh4v+ezyMEa
 mhwAGn4121OW0hHTmEDCe9mZe5Yue1KpkCSzJdJOPnVcChsU96d+WIyk04V8/5rTLl
 rSBwhU+7EO4ncNnhfooQbymGhs0nVXCSFA7IwdlU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.131]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N4QsY-1nz0eH3Dz4-011T0k for <buildroot@buildroot.org>; Thu, 31 Mar 2022
 22:12:31 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 22:12:31 +0200
Message-Id: <20220331201231.26526-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ohrrdCrop9mZtpDhMr1UHucAbj9MzuMaBpa6TBhVQnumf8zL29V
 Y3drhvq1FPbuBdz48hRevZFNTtcklBh/KWpfczMY5S7AMCI8vYBNB2CbG/azd3m2Xmh/Jsf
 BhwA5SfLn/HI2SYNSUHTfiuORlglejULMxQx+W6gB9pV0VAn23QzChLfnmS2p1k4ySKnIv6
 IiXV1gdqKOTb7F5lV7uTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3xZKi2we8Zc=:m4PRR9V9GAnXkRgxDG2Lac
 dGQ1vxR7fxdDRO0dBYeHTgGO+gt4sh2ySl3poqSLNhN4ZMOBeFjUdjIEgjixOxKRpEz0/w0jJ
 /5sqKNiDjaomxFw27AnPh+9vTwEbAxDkNYSnVDoH+CAliN2FHuYDyJqE1b1eDRFvdv3wEIPjd
 5VwQZpyzkPcL+2IYvA5BvQytUeNdhYaDUwZOKScbaS/1XnAVZa5336Wrlo4DCoiP7GijkPLcU
 do1QEhBOZ8rM2NCkv3STXpCPvkDiS+lto8HqlRKgMZxXvX5dpuLJOngyPXfH1VyKuil91JQis
 4WtFSCdrFp9rabQhBRHk33gyIo8mzuQBX80hpx9wjaCkpw6h2xBmNDjfMahWK+zcRNI22MJGr
 Dk86mO2wi5V8GbJHtUS3VXmaZ0W0P9splMSPc4lBETUn4uri6R3t//1Izgn2v7CzRpRiZuOqk
 kNi/YBuqc/E84LwpAqGxNte81fWF++JWkANgzNt5HoYDmKxgiPB3dCrS4iQDL8c1tpOuJ99Y3
 qyV//vE4n5QpWIB02iDX6k3QtY3kwdylJcXDd0VVi4IyxM79yWbreSdBraAxKlf7kvb6XJcQl
 pZrleF4NfEc5dkvviIiaFNRz1EI8+FoKZU6Jlfe7w1ZOxmNZyiVHpP1YwpUiwwfU2qWFwpTyi
 gbNL4usUePGmeh5eujHK4uow5klXaWIZ72IkXATRhKHkN7hWaxc6b9kU8Ryv9tiD2mwE7mkYE
 HeaXAdeLzOuBMQr45Pc1eZubOoPDtc0GJx+F84ao3D13AWOSApx932OuN8wJWqVn7+50rGTNF
 Nw1pmN/lISLWED/M6/+EpcuingI7r/t9+uTM1e0Sg9NaCy140GOv6CJOsyjD2bxPVo5Cb69jY
 KGu7CN5tMPkFmZu+HpbUi0pt4mg36941GTY5cJ4gosaac+d6DhqoR615K/qrLl1jUiQtHcnOw
 vwgWKfbptJ5rzjd/g3XfVIp8zpSurx2REn2BT03+mnFAbDuPExwa4zf/Apev/65Z1qOyJ81S1
 tPLArx+6izX3SG7BcHD5w83JoKXEkv3i8n21j7913seW4yW4sVtDjwJS1At/MaXTcu++XsFKp
 tr9joFPPLICdmw=
Subject: [Buildroot] [PATCH v2] package/libcamera-apps: fix X11 preview
 compile (conversion from Window to EGLNativeWindowType)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBhZGQgMDAyLXByZXZpZXctZml4LWVnbF9wcmV2aWV3LWNvbXBpbGUtY29udmVyc2lvbi1mcm9t
LVdpbmQucGF0Y2gKCkZpeGVzOgoKICAuLi4vYnVpbGQvbGliY2FtZXJhLWFwcHMtMmQxMDA5ZTNi
YWRjYzgwNDczNjFmZjgxMTQ5YWQ2Y2JhM2I5MTFiNS9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcDoz
Mjk6Njk6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNpb24gZnJvbSDigJhXaW5kb3figJkge2FrYSDi
gJhsb25nIHVuc2lnbmVkIGludOKAmX0gdG8g4oCYRUdMTmF0aXZlV2luZG93VHlwZeKAmSB7YWth
IOKAmGZiZGV2X3dpbmRvdyrigJl9IFstZnBlcm1pc3NpdmVdCiAgICAzMjkgfCAgICAgICAgIGVn
bF9zdXJmYWNlXyA9IGVnbENyZWF0ZVdpbmRvd1N1cmZhY2UoZWdsX2Rpc3BsYXlfLCBjb25maWcs
IHdpbmRvd18sIE5VTEwpOwogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+CiAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgV2luZG93IHtha2EgbG9uZyB1bnNpZ25l
ZCBpbnR9CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+
Ci0tLQpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gYWRkIHBhdGNoIHdpdGggcHJvcGVyIHR5cGUgY2Fz
dCBpbnN0ZWFkIG9mICctZnBlcm1pc3NpdmUnIGNvbXBpbGVyCiAgICBjb21tYW5kIGxpbmUgb3B0
aW9uIChzdWdnZXN0ZWQgYnkgQXJub3V0IFZhbmRlY2FwcGVsbGUpCi0tLQogLi4ucHJldmlldy1j
b21waWxlLWNvbnZlcnNpb24tZnJvbS1XaW5kLnBhdGNoIHwgMzkgKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2xpYmNhbWVyYS1hcHBzLzAwMDItcHJldmlldy1maXgtZWdsX3ByZXZpZXctY29tcGls
ZS1jb252ZXJzaW9uLWZyb20tV2luZC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliY2Ft
ZXJhLWFwcHMvMDAwMi1wcmV2aWV3LWZpeC1lZ2xfcHJldmlldy1jb21waWxlLWNvbnZlcnNpb24t
ZnJvbS1XaW5kLnBhdGNoIGIvcGFja2FnZS9saWJjYW1lcmEtYXBwcy8wMDAyLXByZXZpZXctZml4
LWVnbF9wcmV2aWV3LWNvbXBpbGUtY29udmVyc2lvbi1mcm9tLVdpbmQucGF0Y2gKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uY2M5MDY5YWE4NgotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UvbGliY2FtZXJhLWFwcHMvMDAwMi1wcmV2aWV3LWZpeC1lZ2xfcHJldmlldy1j
b21waWxlLWNvbnZlcnNpb24tZnJvbS1XaW5kLnBhdGNoCkBAIC0wLDAgKzEsMzkgQEAKK0Zyb20g
NjA3MTU3NjljZDUzNjhhNjNiMmJkYzJlNmQ2YmI2ZGYwMDMwYTU0ZCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb206IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KK0RhdGU6
IFRodSwgMzEgTWFyIDIwMjIgMjE6NDQ6MjIgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gcHJldmll
dzogZml4IGVnbF9wcmV2aWV3IGNvbXBpbGUgKGNvbnZlcnNpb24gZnJvbSBXaW5kb3cgdG8KKyBF
R0xOYXRpdmVXaW5kb3dUeXBlKQorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAor
CitGaXhlczoKKworICAuLi4vYnVpbGQvbGliY2FtZXJhLWFwcHMtMmQxMDA5ZTNiYWRjYzgwNDcz
NjFmZjgxMTQ5YWQ2Y2JhM2I5MTFiNS9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcDozMjk6Njk6IGVy
cm9yOiBpbnZhbGlkIGNvbnZlcnNpb24gZnJvbSDigJhXaW5kb3figJkge2FrYSDigJhsb25nIHVu
c2lnbmVkIGludOKAmX0gdG8g4oCYRUdMTmF0aXZlV2luZG93VHlwZeKAmSB7YWthIOKAmGZiZGV2
X3dpbmRvdyrigJl9IFstZnBlcm1pc3NpdmVdCisgICAgMzI5IHwgICAgICAgICBlZ2xfc3VyZmFj
ZV8gPSBlZ2xDcmVhdGVXaW5kb3dTdXJmYWNlKGVnbF9kaXNwbGF5XywgY29uZmlnLCB3aW5kb3df
LCBOVUxMKTsKKyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KKyAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwKKyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdpbmRvdyB7YWthIGxvbmcgdW5zaWduZWQgaW50
fQorCitbVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saWJjYW1lcmEt
YXBwcy9wdWxsLzI4M10KK1NpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRA
Z214Lm5ldD4KKy0tLQorIHByZXZpZXcvZWdsX3ByZXZpZXcuY3BwIHwgMiArLQorIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvcHJl
dmlldy9lZ2xfcHJldmlldy5jcHAgYi9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcAoraW5kZXggYjkz
NmU1Ny4uNTkzNTgzZCAxMDA2NDQKKy0tLSBhL3ByZXZpZXcvZWdsX3ByZXZpZXcuY3BwCisrKysg
Yi9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcAorQEAgLTMyNiw3ICszMjYsNyBAQCB2b2lkIEVnbFBy
ZXZpZXc6Om1ha2VXaW5kb3coY2hhciBjb25zdCAqbmFtZSkKKyAJd21fZGVsZXRlX3dpbmRvd18g
PSBYSW50ZXJuQXRvbShkaXNwbGF5XywgIldNX0RFTEVURV9XSU5ET1ciLCBGYWxzZSk7CisgCVhT
ZXRXTVByb3RvY29scyhkaXNwbGF5Xywgd2luZG93XywgJndtX2RlbGV0ZV93aW5kb3dfLCAxKTsK
KyAKKy0JZWdsX3N1cmZhY2VfID0gZWdsQ3JlYXRlV2luZG93U3VyZmFjZShlZ2xfZGlzcGxheV8s
IGNvbmZpZywgd2luZG93XywgTlVMTCk7CisrCWVnbF9zdXJmYWNlXyA9IGVnbENyZWF0ZVdpbmRv
d1N1cmZhY2UoZWdsX2Rpc3BsYXlfLCBjb25maWcsIHJlaW50ZXJwcmV0X2Nhc3Q8RUdMTmF0aXZl
V2luZG93VHlwZT4od2luZG93XyksIE5VTEwpOworIAlpZiAoIWVnbF9zdXJmYWNlXykKKyAJCXRo
cm93IHN0ZDo6cnVudGltZV9lcnJvcigiZWdsQ3JlYXRlV2luZG93U3VyZmFjZSBmYWlsZWQiKTsK
KyAKKy0tIAorMi4zNS4xCisKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
