Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A4FD0BB40
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404D440716;
	Wed, 23 Oct 2024 21:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ko-JoaPzHOzH; Wed, 23 Oct 2024 21:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D36884070C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36884070C;
	Wed, 23 Oct 2024 21:48:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 599AC2073
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4674540148
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZNSxxTfzU6m for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:48:29 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 23 Oct 2024 21:48:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62C8B40102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62C8B40102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62C8B40102
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:48:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.23]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzuB-1tcE0U0RH5-00qSaw; Wed, 23
 Oct 2024 23:43:21 +0200
Date: Wed, 23 Oct 2024 23:43:20 +0200
MIME-Version: 1.0
Message-Id: <20241023-microblaze-v1-1-7ad68e2f271c@gmx.net>
X-B4-Tracking: v=1; b=H4sIAPdtGWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyNj3dzM5KL8pJzEqlRdAyOLNAND0ySj1BQTJaCGgqLUtMwKsGHRsbW
 1AICypDpcAAAA
X-Change-ID: 20241023-microblaze-028f015b2ed4
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729719800; l=2824;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=BrOXd6O8RI3Po0vIgVbv4rX/WlUUokDIC48OLxGq5sk=;
 b=lWxbUJc5wFw1kw49cfD9+Ys1wmTLlyRt5q4xAkXJzgj0ZJbDA0aIBJnEdOLlqFw/MGfHIte9u
 UKUcCvXDiVGAwD5ElzaNKu66U1Dof/ZDC6zz2GnjeAMDi5dQXOmXbkC
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:ZNI8lkQvhlM/9Y3D72blBl2NobOBNjxTfgFseJp7jhL0mldM+Xb
 v+fluhmUTupfkR/01Z5lhwH3yB0HgUwRAaWM4lSRm2XPUMUfrlECqWhWVeaUjIliTJbsepO
 m4TM+UT5Kv5NB0Ypgs0evcRXTrUXYSaJW143Anr/aEnGmiOH89SCjZ8vX20vxyi7tnfadIS
 DP8NPgHab0m7OQOWXUWFA==
UI-OutboundReport: notjunk:1;M01:P0:RiAIUMTpG7A=;vyDjApUEbdpk/UJSPDX8/uBqsNj
 niVBfEMv/BdfZLjOI9HHANzOeVLWCA0d6nZe4LoxBmhc0bCAeVDm7dnAJCty/uo+hhD7etFFs
 lf+QKXSnNNjFG4oT80kvqUHPjwos88num8l34QPShMT282XcZZlJjonP/W8DWk3PT4B8ikr5v
 UYO/XohWhBkCIVQDOgZ4EY1l6X1Q5rTvJ/OPAL1MKcrRlpG1Tv/Ur02iT2U1HgYWZKZdnNOeU
 X0c05q8ZKHpyfDnn1y9JlkUqLq6IpDXIYBBFbn2/Hc5edrMHVscv6ftQyc1HYmmX7ssWFCUuY
 DFTslPjiCLZyZ/rgkkzMOlWDObO3LVSMnSwoQZ13FGK9bggsfl9pIf1jkBXoPlOB3lvgPIzo9
 k+ZoZn85+G0O+dHK19r3zBCGxVunWO4GUGh3DSwRyvn5a9bG4ne7+5tBiqshSS+DX/JaIjMsH
 5yNzo7Wg11BY1jDnAzPT2GBh96nts31lD5bbx3TmdqrzAi+Px0Pv+FAKP6aDZJx++NvCjlgUC
 9bNSSNQ3T2Ptzq0q1JsOxL9DrGnd9S12P0Tv6BVsGFcyPhj/VHgKkrA1dow+2tSmdWPvVza8X
 2jdHv1VI9ciWmtOpVcZOPdc+k51xjVOx8aQYbWFoV0xnHzuxO4ZMmtBGQ8YQkhrEBq58Oyfbc
 OVsghrURe1aJ6z6xTLMzQKr/njrRyAomAqiynWE1MWvD6QTcVPsFXLK0k5Q+8Ag1sDhOGrwer
 s4i/kGHJhiR2ouHbTFOWtbGBCMITh10rRBXKb3h/x3EPatpWexxYzlekLB7L5sKhBcwjYCidG
 hycjyvFvsD1xLFD3+XmSChiA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1729720106; x=1730324906; i=j.neuschaefer@gmx.net;
 bh=5RjRMKA0/X2WEqw9kuilKJjHcT8rrAhPP1BmmrCgmXI=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=D/JsVxk7f1lPeKE+J2Dp+2Du0XJV47CXA8YJSEalyaG5V5ZX7Chn3b8MdyRejVaB
 3v4uFkQlehaMkdjvGDnte9K5zjbfK+Rsfs4ImVEPnh3WwH+IldkkF2APpZpVSbO6m
 TEPPXVhU+QOZQGpx78m3G8QLT4QNt2/xVaHV5HLMzJOUl/BokE5BzFXM0aCUbqv+l
 +5x7XcbavmEuFYvmaMJbq736bnMOdPSBkjpxv8cYfUXyWNpe5m+XQvYDIeVyC34lu
 fBBwXL+lZ4xAW6WBuUGo0TrdDzbyEB9zn2KO00ied8VzFF7qwAe1kWUltE3NEW1Hk
 V7W2PB8pl9ijqFdZow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=D/JsVxk7
Subject: [Buildroot] [PATCH] package/musl: Fix -ztext build failures on
 microblaze
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhcnRpY3VsYXIgY29tYmluYXRpb24gb2YgTFZNMiAod2hpY2ggZW5hYmxlcyAtUElFKSwg
bXVzbC1saWJjIHdpdGgKZHluYW1pYyBsaW5raW5nIChhbmQgdGh1cyAtenRleHQsIGJhbm5pbmcg
VEVYVFJFTHMpLCBhbmQgbWljcm9ibGF6ZQpsZWFkcyB0byBhbiBlcnJvciBiZWNhdXNlIGEgVEVY
VFJFTCBpcyBwcm9kdWNlZCBpbiBtdXNsLWxpYmMncyBTY3J0MS5vLgoKVGhlIHVwc3RyZWFtIHBh
dGNoIGFkZGVkIGluIHRoaXMgY29tbWl0IGZpeGVzIChvciB3b3JrcyBhcm91bmQpIHRoZQpwcm9i
bGVtLgoKRml4ZXM6IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzViYjI4
M2VmZjRiNGEyYjE3ZDEwMjhiYmUwYjNlMWJlYThmYmViYTgvClNpZ25lZC1vZmYtYnk6IEouIE5l
dXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci0tLQogLi4udmlzaWJpbGl0eS1mb3It
Qy1lbnRyeS1wb2ludC1mdW5jdGlvbi1fc3QucGF0Y2ggfCA0MiArKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbXVzbC8wMDAzLXVzZS1oaWRkZW4tdmlzaWJpbGl0eS1mb3ItQy1lbnRyeS1wb2ludC1mdW5j
dGlvbi1fc3QucGF0Y2ggYi9wYWNrYWdlL211c2wvMDAwMy11c2UtaGlkZGVuLXZpc2liaWxpdHkt
Zm9yLUMtZW50cnktcG9pbnQtZnVuY3Rpb24tX3N0LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmMzZjRmMWRl
ZjA1MDAyMDBlN2Y2MTZjNTZjYzQxODNkNmIxNDQwZjgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNr
YWdlL211c2wvMDAwMy11c2UtaGlkZGVuLXZpc2liaWxpdHktZm9yLUMtZW50cnktcG9pbnQtZnVu
Y3Rpb24tX3N0LnBhdGNoCkBAIC0wLDAgKzEsNDIgQEAKK0Zyb20gOWM3ODU1N2FmMGE1ZTUyMWNk
YjQ2YTRjYTc2MzBmMjk4N2QyNTIzZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJp
Y2ggRmVsa2VyIDxkYWxpYXNAYWVyaWZhbC5jeD4KK0RhdGU6IFNhdCwgMTAgQXVnIDIwMjQgMTk6
NDk6MjQgLTA0MDAKK1N1YmplY3Q6IFtQQVRDSF0gdXNlIGhpZGRlbiB2aXNpYmlsaXR5IGZvciBD
IGVudHJ5IHBvaW50IGZ1bmN0aW9uIF9zdGFydF9jCisKK3RoZSBmaWxlLWxldmVsIGNydF9hcmNo
LmggYXNtIGZyYWdtZW50cyBnZW5lcmFsbHkgbWFrZSBkaXJlY3QKKyhub24tUExUKSBjYWxscyBm
cm9tIF9zdGFydCB0byBfc3RhcnRfYywgd2hpY2ggaXMgb25seSB2YWxpZCB3aGVuCit0aGVyZSBp
cyBhIGxvY2FsLCBub24taW50ZXJwb3NhYmxlIGRlZmluaXRpb24gZm9yIF9zdGFydF9jLiBnZW5l
cmFsbHksCit0aGUgbGlua2VyIGlzIGV4cGVjdGVkIHRvIGtub3cgdGhhdCBsb2NhbCBkZWZpbml0
aW9ucyBpbiBhIG1haW4KK2V4ZWN1dGFibGUgKGFzIG9wcG9zZWQgdG8gc2hhcmVkIGxpYnJhcnkp
IG91dHB1dCBhcmUgbm9uLWludGVycG9zYWJsZSwKK21ha2luZyB0aGlzIHdvcmssIGJ1dCBoaXN0
b3JpY2FsbHkgdGhlcmUgaGF2ZSBiZWVuIGxpbmtlciBidWdzIGluIHRoaXMKK2FyZWEsIGFuZCBt
aWNyb2JsYXplIGlzIHJlcG9ydGVkbHkgc3RpbGwgYnJva2VuLCBmbGFnZ2luZyB0aGUKK3JlbG9j
YXRpb24gZm9yIHRoZSBjYWxsIGFzIGEgdGV4dHJlbC4KKwordGhlIGVxdWl2YWxlbnQgX2Rsc3Rh
cnRfYywgY2FsbGVkIGZyb20gdGhlIHNhbWUgY3J0X2FyY2guaCBhc20KK2ZyYWdtZW50cywgaGFz
IGFsd2F5cyB1c2VkIGhpZGRlbiB2aXNpYmlsaXR5IHdpdGhvdXQgcHJvYmxlbSwgYW5kCitzZW1h
bnRpY2FsbHkgaXQgc2hvdWxkIGJlIGhpZGRlbiwgc28gbWFrZSBpdCBoaWRkZW4uIHRoaXMgZW5z
dXJlcyB0aGUKK2RpcmVjdCBjYWxsIGlzIGFsd2F5cyB2YWxpZCByZWdhcmRsZXNzIG9mIHdoZXRo
ZXIgdGhlIGxpbmtlciBwcm9wZXJseQorc3BlY2lhbC1jYXNlcyBtYWluIGV4ZWN1dGFibGUgb3V0
cHV0LgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXQubXVzbC1saWJjLm9yZy9jZ2l0L211c2wvY29t
bWl0Lz9pZD05Yzc4NTU3YWYwYTVlNTIxY2RiNDZhNGNhNzYzMGYyOTg3ZDI1MjNlCitTaWduZWQt
b2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgorLS0tCisgY3J0
L2NydDEuYyB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKKworZGlmZiAtLWdpdCBhL2NydC9jcnQxLmMgYi9jcnQvY3J0MS5jCitpbmRleCA4ZmU4
YWI1ZC4uMTA2MDEyMTUgMTAwNjQ0CistLS0gYS9jcnQvY3J0MS5jCisrKysgYi9jcnQvY3J0MS5j
CitAQCAtMTEsNyArMTEsNyBAQCB3ZWFrIHZvaWQgX2ZpbmkoKTsKKyBpbnQgX19saWJjX3N0YXJ0
X21haW4oaW50ICgqKSgpLCBpbnQsIGNoYXIgKiosCisgCXZvaWQgKCopKCksIHZvaWQoKikoKSwg
dm9pZCgqKSgpKTsKKworLXZvaWQgX3N0YXJ0X2MobG9uZyAqcCkKKytoaWRkZW4gdm9pZCBfc3Rh
cnRfYyhsb25nICpwKQorIHsKKyAJaW50IGFyZ2MgPSBwWzBdOworIAljaGFyICoqYXJndiA9ICh2
b2lkICopKHArMSk7CistLQorMi40NS4yCisKCi0tLQpiYXNlLWNvbW1pdDogNGE5YTRjM2NkNWY0
MTZiNDRiOGFiNmMzYzdjZGZjM2NjOTkxYTVkZQpjaGFuZ2UtaWQ6IDIwMjQxMDIzLW1pY3JvYmxh
emUtMDI4ZjAxNWIyZWQ0CgpCZXN0IHJlZ2FyZHMsCi0tCkouIE5ldXNjaMOkZmVyIDxqLm5ldXNj
aGFlZmVyQGdteC5uZXQ+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
