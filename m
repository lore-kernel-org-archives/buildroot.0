Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A26CD64061
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 23:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D046072D;
	Tue, 16 Dec 2025 23:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBepxaqqJgfD; Tue, 16 Dec 2025 23:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806E4607B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765926916;
	bh=O457Pi9ucCPlGu4wE0LLhk38EWrxVRlGbt0LMypQQMQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ktdRGrIPu988SF9rm3AH3KEnESrlvLz7BsH7Z9S1N5U2REgG8tPX8rWRyQTbdFM3g
	 0tVgWymJBSv/TIcYW+K5xeR225qE8SYdVmVuzNEH/M06Rl26RGVarGTs51hNYZ1VTP
	 55hkHnft5XICTtBe7q2KcedTcOfMUmNjf0S8/SnqLxd0t5nCzoFue8Zu07gjf3UyYD
	 lMRG37eVHYuoMzu+xihtBjP5DXs371Pb6kqKO+BG3azkCObbWOLc/y/d4aOC2x/dXE
	 LRlUpts9XO1jy9pSOhMhBn0pjpZ6PHlYkVuK+xUVfSbRCkkzb+YT7Hi+o8LbHj+n/Q
	 de027K+ICbL8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 806E4607B5;
	Tue, 16 Dec 2025 23:15:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 238BB364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2153040CAE
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXVEm2qKh-4F for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 23:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D22D740AC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D22D740AC0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D22D740AC0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:13 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6903D19F58A;
 Wed, 17 Dec 2025 00:15:09 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 17 Dec 2025 00:14:44 +0100
Message-ID: <20251216231456.347739-2-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216231456.347739-1-ju.o@free.fr>
References: <20251216231456.347739-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765926911;
 bh=hxCFyVkLVHI9hem+0rkdAudgveXiS94tSZzLQH4zvTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dD1mRu7p2mq0vUMt15qrZed6NNcIencZVoviMxg1Dikmnol26pXEEglgYHoM59E5Y
 YwIVdBttocU2vQGopF/We9UEMXY4GKKjTTCcz4HtZRsyuAog1D3sVMEPCaqZMRzCFG
 5xxY+/7ISuTwg36nI/3BKhucoyZ1tFhH+QitH/6WI+PUG3iMmknIWJtw6LN9jdg1AL
 oHyNL4+mSfvCaXN/aT1ioB7f/UxQizGIUa4x3CgrMO2R/B6lss/XLta21nm57ydWLU
 kDMiDPLMosm3ThWGL54BmiV4vJjFhaU/Jb4RqSTSZ4XFVFtEuG8AKJpgNfjmh4/CKz
 RMu8MxtmIV7jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dD1mRu7p
Subject: [Buildroot] [PATCH 2/3] package/kvmtool: bump to git version
 7ad32e5514
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHRoZSBjb21taXQgbG9nLCBzZWU6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3dpbGwva3ZtdG9vbC5naXQvbG9nLz9pZD03YWQzMmU1NTE0YWNhMmI2
ZDE5Mzk4ZmQzYWU1YTdjNWUwZTFjZTI0CgpUaGlzIGNvbW1pdCBhbHNvIHJlbW92ZXMgcGFja2Fn
ZSBwYXRjaGVzIHdoaWNoIGFyZSBub3cgdXBzdHJlYW0uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
T2xpdmFpbiA8anUub0BmcmVlLmZyPgotLS0KIC4uLmx1ZGUtbGliZ2VuLWgtZm9yLW11c2wtY29t
cGF0aWJpbGl0eS5wYXRjaCB8IDQ4IC0tLS0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2Uva3ZtdG9v
bC9rdm10b29sLmhhc2ggICAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL2t2bXRvb2wv
a3ZtdG9vbC5tayAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDUwIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2Uva3ZtdG9vbC8wMDAyLXZmaW8taW5jbHVkZS1saWJnZW4taC1mb3ItbXVzbC1jb21wYXRpYmls
aXR5LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm10b29sLzAwMDItdmZpby1pbmNsdWRl
LWxpYmdlbi1oLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9wYWNrYWdlL2t2bXRvb2wv
MDAwMi12ZmlvLWluY2x1ZGUtbGliZ2VuLWgtZm9yLW11c2wtY29tcGF0aWJpbGl0eS5wYXRjaApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTc1ZWRlNmFmMS4uMDAwMDAwMDAwMAotLS0g
YS9wYWNrYWdlL2t2bXRvb2wvMDAwMi12ZmlvLWluY2x1ZGUtbGliZ2VuLWgtZm9yLW11c2wtY29t
cGF0aWJpbGl0eS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ4ICswLDAgQEAKLUZyb20gYmE2
ODMwZWVjMGY1YWI3MzRiMDkzNjU3YjE2YjU1NWUwNDM3YjkyNyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKLUZyb206IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KLURhdGU6
IFN1biwgMjkgSnVuIDIwMjUgMjI6MjI6MjEgKzAyMDAKLVN1YmplY3Q6IHZmaW86IGluY2x1ZGUg
bGliZ2VuLmggKGZvciBtdXNsIGNvbXBhdGliaWxpdHkpCi1NSU1FLVZlcnNpb246IDEuMAotQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Ci1Db250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOiA4Yml0Ci0KLVN0YXJ0aW5nIEdDQzE0ICdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbicgYXJlIHRyZWF0ZWQgYXMgZXJyb3JzIGJ5Ci1kZWZhdWx0LiBXaGVuIGJ1aWxkaW5nIGt2
bXRvb2wgd2l0aCBtdXNsIGxpYmMsIHRoZSBmb2xsb3dpbmcgZXJyb3IKLW9jY3VycyBkdWUgdG8g
bWlzc2luZyBkZWNsYXJhdGlvbiBvZiAnYmFzZW5hbWUnOgotCi12ZmlvL2NvcmUuYzo1Mzc6MjI6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhiYXNlbmFtZeKAmSBb
LVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLSAgNTM3IHwgICAgICAgICBncm91cF9u
YW1lID0gYmFzZW5hbWUoZ3JvdXBfcGF0aCk7Ci0gICAgICB8ICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+Ci12ZmlvL2NvcmUuYzo1Mzc6MjI6IHdhcm5pbmc6IG5lc3RlZCBleHRlcm4gZGVj
bGFyYXRpb24gb2Yg4oCYYmFzZW5hbWXigJkgWy1XbmVzdGVkLWV4dGVybnNdCi12ZmlvL2NvcmUu
Yzo1Mzc6MjA6IGVycm9yOiBhc3NpZ25tZW50IHRvIOKAmGNoYXIgKuKAmSBmcm9tIOKAmGludOKA
mSBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29udmVy
c2lvbl0KLSAgNTM3IHwgICAgICAgICBncm91cF9uYW1lID0gYmFzZW5hbWUoZ3JvdXBfcGF0aCk7
Ci0gICAgICB8ICAgICAgICAgICAgICAgICAgICBeCi0KLVRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlz
c3VlIGJ5IGluY2x1ZGluZyB0aGUgYXBwcm9wcmlhdGUgaGVhZGVyLCBlbnN1cmluZwotY29tcGF0
aWJpbGl0eSB3aXRoIG11c2wgYW5kIEdDQzE0LgotCi1TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVy
YWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Ci1SZXZpZXdlZC1ieTogQWxleGFuZHJ1IEVsaXNl
aSA8YWxleGFuZHJ1LmVsaXNlaUBhcm0uY29tPgotTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MDYyOTIwMjIyMS44OTMzNjAtMS10aG9tYXMucGVyYWxlQG1pbmQuYmUKLVNpZ25l
ZC1vZmYtYnk6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Ci1VcHN0cmVhbTogaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lsbC9rdm10b29sLmdp
dC9wYXRjaC8/aWQ9YmE2ODMwZWVjMGY1YWI3MzRiMDkzNjU3YjE2YjU1NWUwNDM3YjkyNwotU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgotLS0tCi0g
dmZpby9jb3JlLmMgfCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlm
ZiAtLWdpdCBhL3ZmaW8vY29yZS5jIGIvdmZpby9jb3JlLmMKLWluZGV4IDNmZjJjMGIwLi44Zjg4
NDg5OCAxMDA2NDQKLS0tLSBhL3ZmaW8vY29yZS5jCi0rKysgYi92ZmlvL2NvcmUuYwotQEAgLTMs
NiArMyw3IEBACi0gI2luY2x1ZGUgImt2bS9pb3BvcnQuaCIKLSAKLSAjaW5jbHVkZSA8bGludXgv
bGlzdC5oPgotKyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAKLSAjZGVmaW5lIFZGSU9fREVWX0RJUgkJ
Ii9kZXYvdmZpbyIKLSAjZGVmaW5lIFZGSU9fREVWX05PREUJCVZGSU9fREVWX0RJUiAiL3ZmaW8i
Ci0tLSAKLWNnaXQgMS4yLjMta29yZwotCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bXRvb2wva3Zt
dG9vbC5oYXNoIGIvcGFja2FnZS9rdm10b29sL2t2bXRvb2wuaGFzaAppbmRleCA4ZGY2ZjkyOWRm
Li42YTQyMTkzNzJmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5oYXNoCisr
KyBiL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY29tcHV0ZWQKLXNoYTI1NiAgMTg4NDFjNDE0ZTgyYjQwNWEwYmQ2ZjVjNTQ2YmMwODhiZWNk
Mjk4YzExNDVhMmJhYzk3NTYzZTY5OTIzMTkyNSAga3ZtdG9vbC0xMTE3ZGJjOGNlYjIxYWJjNmU4
Y2Q5ODYxNDUwNjk1OTk1ODUyMjkwLWdpdDQudGFyLmd6CitzaGEyNTYgIDY1NWY3NjkxZmM4MDQx
NjE2MWIxZDgzMjU3NWFiZmNkMTIyM2ZiZWZhMjkwMDY1M2VkNWRkYWFiM2VlNzM4ZWMgIGt2bXRv
b2wtN2FkMzJlNTUxNGFjYTJiNmQxOTM5OGZkM2FlNWE3YzVlMGUxY2UyNC1naXQ0LnRhci5negog
c2hhMjU2ICAwZDViZjM0NmRmOWU2MzVhMjlkY2RkZGY4MzJkYzViMDAyY2E2Y2RjMWM1YzljNmM1
NjdkMmE2MWJiMGM1YzE1ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bXRvb2wva3Zt
dG9vbC5tayBiL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLm1rCmluZGV4IDU4Y2EyZDM2NDIuLjgw
MjQ4ODA3ZTEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLm1rCisrKyBiL3Bh
Y2thZ2Uva3ZtdG9vbC9rdm10b29sLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotS1ZNVE9PTF9WRVJTSU9OID0gMTExN2RiYzhjZWIyMWFiYzZlOGNkOTg2
MTQ1MDY5NTk5NTg1MjI5MAorS1ZNVE9PTF9WRVJTSU9OID0gN2FkMzJlNTUxNGFjYTJiNmQxOTM5
OGZkM2FlNWE3YzVlMGUxY2UyNAogS1ZNVE9PTF9TSVRFID0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lsbC9rdm10b29sLmdpdAogS1ZNVE9PTF9TSVRF
X01FVEhPRCA9IGdpdAogS1ZNVE9PTF9ERVBFTkRFTkNJRVMgPSBcCi0tIAoyLjUyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
