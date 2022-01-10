Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C8CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D2068316A;
	Mon, 10 Jan 2022 22:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNiA3wp9oJKG; Mon, 10 Jan 2022 22:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D5C831DA;
	Mon, 10 Jan 2022 22:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E63541BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D469F831DA
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETuDZE3wDK8M for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:49:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C4A38316A
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641854989;
 bh=JK6fmxwCBMJ7BrZv3+QC/BD3zwo96Z9DXtlpu0tuA5s=;
 h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
 b=GoMFpxnMi3cVBdzSROXH+7QVm82kAOBoT1Dd7d+TYQlNX/JGGi9WKXfbD4awuaRRo
 arcP2OaO3nfSHQGyJ6rdOwMq63zV+3MQG4ZGRYFpLTXCsRClJoNVpVRI7Jhb/JR3Hi
 M3DhZeF4veEtPL3/2q8qqB/n8fZvQhn2MWqQTIrE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.151]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dsb-1mJifJ3ubt-015ajy for
 <buildroot@buildroot.org>; Mon, 10 Jan 2022 23:49:49 +0100
Date: Mon, 10 Jan 2022 23:49:48 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20220110234948.347edf2d@gmx.net>
In-Reply-To: <20220110213901.13597-2-ps.report@gmx.net>
References: <20220110213901.13597-1-ps.report@gmx.net>
 <20220110213901.13597-2-ps.report@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:s8wetjQLEBWf4n9Ou2Nx+NzmfT82qOvC6UnLUnpDPrrsjSJqq5J
 tcTGpc0+WlFOzcS6mlySMk9ZBmBWrJbCsefytzpSkdV9AtIxcSNu6Z7riMh/9EirLlHLCLg
 FNeY5WXEpnKWLqxTI+A9toz4kQB051Txpdf28NFjppK6l/TquqCEmnibwvOY7LqVT8tX/0E
 YFHUpsq4x7Xc4fC8XeX1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MSkyXTiqSLk=:NbNUwD6FJ14/GV+UgtMgB0
 9AGbHuqr3f5lnYR+vZSuDiMckMSQ+m3KgmPP1IQXZTelU0lazQMJfjFnHfWJCR98vgFhWqBhL
 Yoj9MrBdYeKufMsIe22YxfULvk8WKPqv/Y8E1Xlri9dBNYfaNZ9lWPUT7fdICKmepwcQ9WEIz
 Zkero/eOUGGROfbET1PK2d0wF2as39m40nrcVDOumhWavJVRlw4+S42QIOPXAL4rDKkgl4vO5
 LJkEnkN+YsplDtYcGRfsIflfZjTGMKnz2W3x2Y9vQrpcKwcJoXQvRWRuRE1ehFR9TDwgQmbU0
 yQMQE2sFaF++1QQyVW3TZo6mYIuCEfWq5TGOarRSsc98ew28uUBJax035FONqDJvqfKhlTLdb
 +n/jetbYI/AVJt91rhW33RsQToAFjQP6PzHEzP2NszkjolZiydVQBFhyJLTGQyj9hIjb6/0Am
 xVQJJCLdmfqKAbif5J11X28MLr4a8FGSlrOoKghl2ySt3/0jRu5ztbOz1gao5F8jNCYoPHENd
 h2K04EJqJkJr9JSATl9/cNcD8XMhA1oSOOkUXhuEwG/7XfBuL14XkymvTK0ac60+/WejMoY8T
 MNMI6tdO0n7Chv66q8EeNzG3Rq2hs9OmJ5TPg5CDMfmhmc7XIBYWhp6LZzrJy9hT+JFRiXd9f
 ntX7+JZelTuzxf5Eenj5iJ73kskBzRP2RoRrmlhWfEpWi6n4h43L5QwcY0DQQNpfS/ayqmUYE
 xJ6F7Fdlzkaymy2dK/t+TOVE2CcraOWIqiKJYWrC0QEw7s/LOgxtKh2rFvXOv6aYUYfZyV/Cr
 nGt5klW+TWWoIhRG8jvEIKPlNdUkRLb0p/MgUQ1/wsEAQ4/no1taQbxxXCoGMVRa7ERo6rl8S
 SlW4bQa6HVdAHVNFywDREVs6xpM98/WtmrqvLX8IaXIMgh0fZEahZhGC5xCPs1Lsqqhwz/VJ0
 PaK3kezzYs8UNJ0O912C+D+/k4IDfmbkyYnQZclmfF5SD0TLVthLHzyZI6jeZ1JuaCsee2aSN
 O2clj2rb/F/lgLU7X1wSgkVDtA6at7OWtZw48Zu5BZUcJs/Hbwseg1KEuczTc1XnaLLdtKbko
 VFWFAg1EUPvitU=
Subject: Re: [Buildroot] [PATCH v1 2/2] package/iwd: bump version to 1.21
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

T24gTW9uLCAxMCBKYW4gMjAyMiAyMjozOTowMSArMDEwMCwgUGV0ZXIgU2VpZGVyZXIgPHBzLnJl
cG9ydEBnbXgubmV0PiB3cm90ZToKCj4gLSBhZGQgMDAwMS1kcHAtZml4LWltcGxpY2l0LWRlY2xh
cmF0aW9uLW9mLWZ1bmN0aW9uLWV4cGxpY2l0X2J6LnBhdGNoCj4gCj4gLSBDaGFuZ2Vsb2cgKHNp
bmNlIDEuMjAsIGZyb20gWzFdKToKPiAKPiAgIHZlciAxLjIxOgo+ICAgRml4IGlzc3VlIHdpdGgg
aGFuZGxpbmcgZGlzY29ubmVjdCBldmVudHMgaXNzdWVkIGJ5IEFQLgo+ICAgQWRkIGV4cGVyaW1l
bnRhbCBzdXBwb3J0IGZvciBEUFAgZmVhdHVyZS4KPiAKPiBbMV0gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL25ldHdvcmsvd2lyZWxlc3MvaXdkLmdpdC90cmVlL0NoYW5nZUxvZwo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiAtLS0K
PiAgLi4uLWRlY2xhcmF0aW9uLW9mLWZ1bmN0aW9uLWV4cGxpY2l0X2J6LnBhdGNoIHwgMzkgKysr
KysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL2l3ZC9pd2QuaGFzaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQo+ICBwYWNrYWdlL2l3ZC9pd2QubWsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2l3ZC8wMDAxLWRwcC1m
aXgtaW1wbGljaXQtZGVjbGFyYXRpb24tb2YtZnVuY3Rpb24tZXhwbGljaXRfYnoucGF0Y2gKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pd2QvMDAwMS1kcHAtZml4LWltcGxpY2l0LWRlY2xhcmF0
aW9uLW9mLWZ1bmN0aW9uLWV4cGxpY2l0X2J6LnBhdGNoIGIvcGFja2FnZS9pd2QvMDAwMS1kcHAt
Zml4LWltcGxpY2l0LWRlY2xhcmF0aW9uLW9mLWZ1bmN0aW9uLWV4cGxpY2l0X2J6LnBhdGNoCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mYzFlNjdmZTljCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvaXdkLzAwMDEtZHBwLWZpeC1pbXBsaWNpdC1kZWNs
YXJhdGlvbi1vZi1mdW5jdGlvbi1leHBsaWNpdF9iei5wYXRjaAo+IEBAIC0wLDAgKzEsMzkgQEAK
PiArRnJvbSA2ODA1ODg0NzQzNjQ1ZDhkMTYxODZkYmIwZGU3ZDljZDUwY2ZkOWE1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5u
ZXQ+Cj4gK0RhdGU6IE1vbiwgMTAgSmFuIDIwMjIgMjI6MjA6NTMgKzAxMDAKPiArU3ViamVjdDog
W1BBVENIXSBkcHA6IGZpeCBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiBleHBsaWNp
dF9iemVybwo+ICsgd2FybmluZwo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAo+ICsKPiArLSBhZGQgbWlzc2luZyBzcmMvbWlzc2luZy5oIGluY2x1ZGUgZm9yIGV4cGxp
Y2l0X2J6ZXJvLCBmaXhlcyB1Y2xpYmMKPiArICBjb21waWxlL2xpbmtpbmcKPiArCj4gK0ZpeGVz
Ogo+ICsKPiArICBzcmMvZHBwLmM6MTY2OjI6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mIGZ1bmN0aW9uIOKAmGV4cGxpY2l0X2J6ZXJv4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRl
Y2xhcmF0aW9uXQo+ICsgICAgMTY2IHwgIGV4cGxpY2l0X2J6ZXJvKGRwcC0+cl9ub25jZSwgZHBw
LT5ub25jZV9sZW4pOwo+ICsgICAgICAgIHwgIF5+fn5+fn5+fn5+fn5+Cj4gKwo+ICtbVXBzdHJl
YW06IGh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9pd2RAbGlzdHMuMDEub3Jn
L3RocmVhZC9IWFYyQjdMM1JYRElGTUtGWlRJNzJUS1pSSzJJTVVQUF0KClVwc3RyZWFtIGFwcGxp
ZWQ6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9uZXR3b3JrL3dpcmVsZXNzL2l3ZC5n
aXQvY29tbWl0Lz9pZD02Y2U0MWY2MjExNTRlZmYwMTQ1ZGFiNDEzMDhiYzE0NWMwNDQwZjE2CgpS
ZWdhcmRzLApQZXRlcgoKPiArU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9y
dEBnbXgubmV0Pgo+ICstLS0KPiArIHNyYy9kcHAuYyB8IDEgKwo+ICsgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjL2RwcC5jIGIvc3JjL2RwcC5j
Cj4gK2luZGV4IDg0ZTg5ZjZjLi44MDkxZGVkMSAxMDA2NDQKPiArLS0tIGEvc3JjL2RwcC5jCj4g
KysrKyBiL3NyYy9kcHAuYwo+ICtAQCAtMzAsNiArMzAsNyBAQAo+ICsgCj4gKyAjaW5jbHVkZSAi
bGludXgvbmw4MDIxMS5oIgo+ICsgCj4gKysjaW5jbHVkZSAic3JjL21pc3NpbmcuaCIKPiArICNp
bmNsdWRlICJzcmMvZGJ1cy5oIgo+ICsgI2luY2x1ZGUgInNyYy9uZXRkZXYuaCIKPiArICNpbmNs
dWRlICJzcmMvbW9kdWxlLmgiCj4gKy0tIAo+ICsyLjM0LjEKPiArCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvaXdkL2l3ZC5oYXNoIGIvcGFja2FnZS9pd2QvaXdkLmhhc2gKPiBpbmRleCA1ODIyNDE3
MGU2Li44ZTM0ZDI5ODNmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvaXdkL2l3ZC5oYXNoCj4gKysr
IGIvcGFja2FnZS9pd2QvaXdkLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgIyBGcm9tIGh0dHBz
Oi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4L25ldHdvcmsvd2lyZWxlc3Mvc2hh
MjU2c3Vtcy5hc2MKPiAtc2hhMjU2ICA3ZDUxZTJjY2FiZTdjNTAwZTQ0MDYxYWM3MjVkYmQ0ZjZi
MGZiNTE4YjVlM2RlMTY4MTA2M2QwZjE1ZDMwNTBmICBpd2QtMS4yMC50YXIueHoKPiArc2hhMjU2
ICBiYWM4OTFkZjkxYzYwNTI3MWU5MWI3M2NmMDAxNWUxYmE4NmZmNzg0MzQ3ZTUzZmM2NzYwMTM2
Njg1OWIzODUxICBpd2QtMS4yMS50YXIueHoKPiAgCj4gICMgTGljZW5zZSBmaWxlcwo+ICBzaGEy
NTYgIGVjNjBiOTkzODM1ZTJjNmI3OWU2ZDkyMjYzNDVmNGU2MTRlNjg2ZWI1N2RjMTNiNjQyMGMx
NWEzM2E4OTk2ZTUgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pd2QvaXdkLm1rIGIv
cGFja2FnZS9pd2QvaXdkLm1rCj4gaW5kZXggNDJmMTc2YjA1Yi4uYTcwZGE4NmVjYyAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2l3ZC9pd2QubWsKPiArKysgYi9wYWNrYWdlL2l3ZC9pd2QubWsKPiBA
QCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtSVdE
X1ZFUlNJT04gPSAxLjIwCj4gK0lXRF9WRVJTSU9OID0gMS4yMQo+ICBJV0RfU09VUkNFID0gaXdk
LSQoSVdEX1ZFUlNJT04pLnRhci54ego+ICBJV0RfU0lURSA9ICQoQlIyX0tFUk5FTF9NSVJST1Ip
L2xpbnV4L25ldHdvcmsvd2lyZWxlc3MKPiAgSVdEX0xJQ0VOU0UgPSBMR1BMLTIuMSsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
