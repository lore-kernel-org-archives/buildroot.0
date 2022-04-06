Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC42CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5100140192;
	Wed,  6 Apr 2022 21:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kw4gVyDh8228; Wed,  6 Apr 2022 21:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63A714051D;
	Wed,  6 Apr 2022 21:18:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCA571BF57C
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAA1580C2B
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 21:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ6QkSPwvOh9 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 21:18:55 +0000 (UTC)
X-Greylist: delayed 00:08:15 by SQLgrey-1.8.0
Received: from libero.it (smtp-36.italiaonline.it [213.209.10.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE4B380C21
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 21:18:54 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([87.0.15.73])
 by smtp-36.iol.local with ESMTPA
 id cCvEncowhc2f5cCvFnHSfQ; Wed, 06 Apr 2022 23:10:37 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1649279437; bh=Egk5A05zpuHCFs7CkdrVCQrjXDp2MozWdlh22Ccbfcs=;
 h=From;
 b=SKLGzDW4/N3WZBKvTqMoI/l50ZLIbshb3FGdfEjjYjtmDOcKTzXOzJpRYgDRQm+hf
 cQa9Omaze+Mg+TRdCHIqTHg0w/sfMcvEQD4bpnI6dydhLZQoTGsPqwcXNM2WMoceEv
 T+8pbd0ATQKWlwBorJ2/UsO5+rKzzUAaK3ovGFwI6mB37klVBDOyNp7GV6RkIvOfX7
 vxUUDNdH+xfaF4uYT+yfnRdCCs7GEWQGjoItMzNBSyUBb2HyikFacCQznOO3y9nO5u
 Gfy14G1kb802q5onsnBt3Ol2XQONlvBStd8ZeOi8nKpBUSzSvam5at/2XaOd3LrhDV
 f1GI3oW/8Sj0g==
X-CNFS-Analysis: v=2.4 cv=Z6kpoFdA c=1 sm=1 tr=0 ts=624e01cd cx=a_exe
 a=h5x6SpL9bzIPZN26QICeQA==:117 a=h5x6SpL9bzIPZN26QICeQA==:17
 a=IkcTkHD0fZMA:10 a=iP-xVBlJAAAA:8 a=DfNHnWVPAAAA:8 a=cwGjoA9uAAAA:20
 a=fxJcL_dCAAAA:8 a=Ixn1CAxRAAAA:8 a=20KFwNOVAAAA:8 a=RBMF9Utmho6PYluNFSwA:9
 a=JOWeiY5itpwPQvuQ8dm/GawRuwE=:19 a=QEXdDO2ut3YA:10 a=lHLH-nfn2y1bM_0xSXwp:22
 a=rjTVMONInIDnV1a_A2c_:22 a=_0vDLAJOulx5KDpLVjVP:22
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 23:10:34 +0200
Message-Id: <20220406211034.3672-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNh+ZDcgxQiJ/fa0F4aGSMMRQ0BjMJJnVLFCKV10E+pjBYSxE/16csY8BQXg2rv4hyoiRs8NUe+qyCnQldmSzNomjyBVfA7Xvz3WfS2fA/UFAs1yHLT8
 SVRLFFI/K+VIgSwR2+B1QIGBTXvP6Yo89jhT+jTGofrd1wHkfUcw1VTDYlrA4tmU81U/EmcNWPCWiPo96JDcvmjzPouO+60SXTfEqDFFTvwQb2tOw5BDYu56
 TL2iLzr1pnFht+ia74ZJKl3xqUFPXl4vu77jq/3F10seUYnK8ajZZMBwqGjT3EbyGA/eaNc78VYbyMVBJG6BGeCGGNyS+mGJ8qRhefzKKIzZfN3hqBsgRDW4
 eP+oQNta
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix host-qemu compilation
 with recent GCC
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6CmNjMTogZXJyb3I6IOKAmC1mY2YtcHJvdGVjdGlvbuKAmSBpcyBub3QgY29tcGF0aWJs
ZSB3aXRoIHRoaXMgdGFyZ2V0CgpUaGUgbmV3IFVidW50dSBHQ0MgcGFja2FnZXMgKGUuZy4gVWJ1
bnR1IDExLjIuMC03dWJ1bnR1MiwgMTEuMi4wKSB0dXJuCm9uIOKAmC1mY2YtcHJvdGVjdGlvbuKA
mSBnbG9iYWxseSwgd2hpY2ggY2F1c2VzIGEgYnVpbGQgZmFpbHVyZSBpbiB0aGUgeDg2CnJlYWxt
b2RlIGNvZGUuIFR1cm4gaXQgb2ZmIGV4cGxpY2l0bHkgb24gY29tcGlsZXJzIHRoYXQgdW5kZXJz
dGFuZCB0aGlzCm9wdGlvbi4KClNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpb2Jp
bkBsaWJlcm8uaXQ+ClNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2No
aUBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiAuLi5hYmxlLWZjZi1wcm90ZWN0aW9uLW9uLW1h
cmNoLTQ4Ni1tMTYucGF0Y2ggfCA0OSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNDkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcWVtdS8wMDAy
LWJ1aWxkLWRpc2FibGUtZmNmLXByb3RlY3Rpb24tb24tbWFyY2gtNDg2LW0xNi5wYXRjaAoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS8wMDAyLWJ1aWxkLWRpc2FibGUtZmNmLXByb3RlY3Rpb24t
b24tbWFyY2gtNDg2LW0xNi5wYXRjaCBiL3BhY2thZ2UvcWVtdS8wMDAyLWJ1aWxkLWRpc2FibGUt
ZmNmLXByb3RlY3Rpb24tb24tbWFyY2gtNDg2LW0xNi5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi43YTg0MWZjYjYwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2Fn
ZS9xZW11LzAwMDItYnVpbGQtZGlzYWJsZS1mY2YtcHJvdGVjdGlvbi1vbi1tYXJjaC00ODYtbTE2
LnBhdGNoCkBAIC0wLDAgKzEsNDkgQEAKK0Zyb20gOTU4NGQzZDAwYTQ1NGY0N2IwMzQxNDY1MTQy
YmNmMDczNWQ3MzRhZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENocmlzdGlhbiBF
aHJoYXJkdCA8Y2hyaXN0aWFuLmVocmhhcmR0QGNhbm9uaWNhbC5jb20+CitEYXRlOiBXZWQsIDIz
IE1hciAyMDIyIDEwOjA3OjEzICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIGJ1aWxkOiBkaXNhYmxl
IGZjZi1wcm90ZWN0aW9uIG9uIC1tYXJjaD00ODYgLW0xNgorTUlNRS1WZXJzaW9uOiAxLjAKK0Nv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAorCitTb21lIG9mIHRoZSByb21zIGJ1aWxkIHdpdGggLW1hcmNoPWk0ODYg
LW0xNiB3aGljaCBpcyBpbmNvbXBhdGlibGUKK3dpdGggLWZjZi1wcm90ZWN0aW9uLiBUaGF0IGlu
IHR1cm4gaXMgY2FuIGJlIHNldCBieSBkZWZhdWx0LCBmb3IKK2V4YW1wbGUgaW4gVWJ1bnR1IFsx
XS4KK1RoYXQgY2F1c2VzOgorIGNjMTogZXJyb3I6IOKAmC1mY2YtcHJvdGVjdGlvbuKAmSBpcyBu
b3QgY29tcGF0aWJsZSB3aXRoIHRoaXMgdGFyZ2V0CisKK1RoaXMgd29uJ3Qgd29yayBvbiAtbWFy
Y2g9aTQ4NiAtbTE2IGFuZCBubyBtYXR0ZXIgaWYgc2V0IG9yIG5vdCB3ZSBjYW4KK292ZXJyaWRl
IGl0IHRvICJub25lIiBpZiB0aGUgb3B0aW9uIGlzIGtub3duIHRvIHRoZSBjb21waWxlciB0byBi
ZQorYWJsZSB0byBidWlsZCByZWxpYWJseS4KKworRml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9x
ZW11LXByb2plY3QvcWVtdS8tL2lzc3Vlcy84ODkKKworWzFdOiBodHRwczovL3dpa2kudWJ1bnR1
LmNvbS9Ub29sQ2hhaW4vQ29tcGlsZXJGbGFncyNBLWZjZi1wcm90ZWN0aW9uCisKK1NpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBFaHJoYXJkdCA8Y2hyaXN0aWFuLmVocmhhcmR0QGNhbm9uaWNhbC5j
b20+CitSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9y
Zz4KK1Jldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KK01lc3NhZ2Ut
SWQ6IDwyMDIyMDMyMzA5MDcxMy4xMDAyNTg4LTEtY2hyaXN0aWFuLmVocmhhcmR0QGNhbm9uaWNh
bC5jb20+CitTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29t
PgorLS0tCisgcGMtYmlvcy9vcHRpb25yb20vTWFrZWZpbGUgfCA0ICsrKysKKyAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9wYy1iaW9zL29wdGlvbnJvbS9N
YWtlZmlsZSBiL3BjLWJpb3Mvb3B0aW9ucm9tL01ha2VmaWxlCitpbmRleCA1ZDU1ZDI1YWNjYTIu
LmYxZWY4OTgwNzM1NSAxMDA2NDQKKy0tLSBhL3BjLWJpb3Mvb3B0aW9ucm9tL01ha2VmaWxlCisr
KysgYi9wYy1iaW9zL29wdGlvbnJvbS9NYWtlZmlsZQorQEAgLTE0LDYgKzE0LDEwIEBAIGNjLW9w
dGlvbiA9ICQoaWYgJChzaGVsbCAkKENDKSAkMSAtYyAtbyAvZGV2L251bGwgLXhjIC9kZXYvbnVs
bCA+L2Rldi9udWxsIDI+JjEKKyAKKyBvdmVycmlkZSBDRkxBR1MgKz0gLW1hcmNoPWk0ODYgLVdh
bGwKKyAKKysjIElmIC1mY2YtcHJvdGVjdGlvbiBpcyBlbmFibGVkIGluIGZsYWdzIG9yIGNvbXBp
bGVyIGRlZmF1bHRzIHRoYXQgd2lsbAorKyMgY29uZmxpY3Qgd2l0aCAtbWFyY2g9aTQ4NgorK292
ZXJyaWRlIENGTEFHUyArPSAkKGNhbGwgY2Mtb3B0aW9uLCAtZmNmLXByb3RlY3Rpb249bm9uZSkK
KysKKyAjIEZsYWdzIGZvciBkZXBlbmRlbmN5IGdlbmVyYXRpb24KKyBvdmVycmlkZSBDUFBGTEFH
UyArPSAtTU1EIC1NUCAtTVQgJEAgLU1GICQoQEQpLyQoKkYpLmQKKyAKKy0tIAorMi4zMi4wCisK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
