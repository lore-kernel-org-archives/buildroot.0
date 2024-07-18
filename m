Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199E7C3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE53E606D5;
	Thu, 18 Jul 2024 20:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqvjrVHh6tXF; Thu, 18 Jul 2024 20:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE87606D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE87606D9;
	Thu, 18 Jul 2024 20:33:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA2A1BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F00C0404A3
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiZ_7IzQP1kg for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BFD34048B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BFD34048B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BFD34048B
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:33:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9nxn-1sQwud3BfJ-002qbI; Thu, 18
 Jul 2024 22:33:30 +0200
Date: Thu, 18 Jul 2024 22:33:23 +0200
MIME-Version: 1.0
Message-Id: <20240718-ztext-v4-1-15a9744f1edb@gmx.net>
X-B4-Tracking: v=1; b=H4sIABJ8mWYC/1XNTQ6DIBRG0a0YxqV5oCh01H00HSA/yqDaACG2x
 r0XTa3p8HvhXGYUjHcmoEsxI2+SC24c8qhOBVK9HDqDnc4bUaAVVKTB72imiJlUqpVtTRRIlN8
 +vbFu2jq3e969C3H0ry2byHrdC+JbSAQTLLlmiiqrLGuu3WM6Dyai1Sd6GEZ/hmLAnArOoKSW1
 OLflIdpoNpNmf8RRDANteKthsMsy/IBPUUxggABAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721334810; l=2292;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=ncULdTHRSQBwAL9QqV4ScMwWPVRTBV5NeyZGLihMPvc=;
 b=HvKBSek671oORoujmKWLyHYDfCA1Klzxfzanvbs9jNH2473ULcwiRET6CeMlxWoQWIBanLwkE
 HO5JH3wJGT4AcsvpHhLs4WTAla1MsDA1e421mNv2okB16gMnm8OWueJ
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:PrcZrnaMUvxhqtFxrOb5oUcE3h6iPCNx1sCPrbFRAOyvYt4Thkv
 E/N0muYHSaOwts05lp4EzFafGhxvM496uR4LffMJaXvCfr0mwx7ORXxTLtKd00XyzHJbcXr
 WFlM1h9XCQOdR9YVYVCpEhFi91hArb9Jz5evGq6Z+X4LnXsZCCq/0k1Xs4eEAwFnm53FXXj
 eSh2JUy0UAVUcML773B+A==
UI-OutboundReport: notjunk:1;M01:P0:/NeWtxg07V8=;bJldITi/vksDPXjIXvBCANT9BP3
 N63JO7plPY236q9EB/LpSCsmPJ2NOXlEEOrKOq7f4qsWwJ3sX7pLUifil74xxH4zZghARXaqy
 W1VtHH2YWrcbw2jOl+PRtIFxu9IIBh+Tv3rohuyq8el2OTsTzHzSzChS5Kf9QoLGo2xdaFlBW
 eQU32yUq2IOfUXZMPw0ybqXQf8H9RjrDzzVwuu0Us4uKfSDrGZC63j5v1J1fNsKnSE5kLwH7U
 AqeaDSdG2B4NG2jagU/Cl83EBkjzaEqojp0HHe+9xw4xJ3KvU0CzI0dVdNE6biS2h83Mvejar
 ktNqgG3l4Ott/zdvVN785fFx5TtVO85koYPz8sug6yGx1aJFI5ytopgWNdHfjaA6MW9BG4bxt
 vjeGkNWu47WI6ALy8ssW04eDMvRJQaQ+myQfYAtJSbbmFHc6QHXOuXCwzoX1lEx2pCRqsaHsN
 bw0QQCAJJoKDnjFuQrk1ex+7DJGHmgUMYrt9PEYcrHgWSwbjqO3O6AAq6HNKEWUDDue6t6cJh
 YuaIrweFrr3Jcb/BUQ+nIdsm1Y4DFGrxIv0U/0jPSTEtzAuqzhxIAXSKbRg2Rmf2wkv0FZiPO
 Ef21MWnpME1OfknLcIcTGC2gSED6bPA8vdWL8O9zZxfRmhJaZ4Zz3zkWx05pnArI8mPjyFT9d
 p1kJ6VpTZhEfUNhrmAPP/pvq5NeRPnDarFNUrsUcKOc0vBX9hL2kykP1ne9ZF0FPVXgv9mTP3
 iLTnzVDpV3y0kxyaKEQRJvOxXQpic49qWtN8bjHDmxn+hZ6gXqawT2At2e/0PhxLpdhJaguqe
 nbudvcZR5/E99kdecXgmFCOQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721334810; x=1721939610; i=j.neuschaefer@gmx.net;
 bh=RnlKSpsVk6RMYCd00NLGm06W2Rync1UBPqIq6kVq6ZE=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JUjNpXbx0D6r4HZm4sGnm3TGzq08emMLG1jOuwEof4SGoqXBIJVlAZuqBmdgkwd/
 NmPyUzoC79+7XOcfGi8KI2+wQH0EZMgplYEho2Fe4ZppQWbDFET59tvZrVZFk7iCK
 nFBL9e+vYVE//lUqEaZb9Ti8nlLtJ71Sh8/9BsJM5THdXzXlgq28lNG9LLLZ/KayP
 uPHQszL2CG9G4tt1FXrvqHcciNzM7IyxAqbWi7aIgLrncrwHLx2bAJCq8tfbkP2Jb
 bu4AIh5nrNULLGg3rTlEXMS0DizXOhBL6IWJARPoha0jxPxcnKI/pTD2YIWyf9+JQ
 gcmp1DYVjB5jNJdVqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=JUjNpXbx
Subject: [Buildroot] [PATCH v4] Config.in: ban textrels on musl toolchains
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bXVzbC1saWJjIGRvZXNuJ3Qgc3VwcG9ydCBURVhUUkVMc1sxXSBhbmQgcHJvZ3JhbXMgd2l0aCBU
RVhUUkVMcyB3aWxsCmNyYXNoIG9uIHN0YXJ0LXVwIHVuZGVyIG11c2wuCgpUaGlzIHBhdGNoIGZv
cmJpZHMgdGhlIHVzZSBvZiBURVhUUkVMcyBvbiBtdXNsIHRvb2xjaGFpbnMgd2l0aCBkeW5hbWlj
CmxpbmtpbmcuCgpUbyB2ZXJpZnkgdGhpcyBwYXRjaDoKCi0gRGVsZXRlIHBhY2thZ2UvbWljcm9w
eXRob24vMDAwMS1weS1ubHJ0aHVtYi1NYWtlLW5vbi1UaHVtYjItbG9uZy1qdW1wLXdvcmthcm91
bmQtb3B0LnBhdGNoCi0gQnVpbGQgbWljcm9weXRob24gKGJlZm9yZSB2MS4yMykgd2l0aCBhIG11
c2wgdG9vbGNoYWluIGFuZAogIEJSMl9TSEFSRURfTElCUy4gVGhlIGJ1aWxkIHNob3VsZCBhYm9y
dCB3aGlsZSBsaW5raW5nIG1pY3JvcHl0aG9uLgoKWzFdOiBodHRwczovL3d3dy5vcGVud2FsbC5j
b20vbGlzdHMvbXVzbC8yMDIwLzA5LzI1LzQKClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVy
IDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci0tLQpDaGFuZ2VzIGluIHY0OgotIFJlbW92ZSBDb25m
aWcuaW4gb3B0aW9uLCBpbXBsZW1lbnQgdGhlIHdob2xlIGxvZ2ljIGluCiAgcGFja2FnZS9NYWtl
ZmlsZS5pbgotIERvY3VtZW50IGhvdyB0byB2ZXJpZnkKLSBMaW5rIHRvIHYzOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjQwNzA0LXp0ZXh0LXYzLTEtOTE5NWQwNmM4YmQwQGdteC5uZXQK
CkNoYW5nZXMgaW4gdjM6Ci0gZHJvcCBtaWNyb3B5dGhvbiBwYXRjaCAoYWxyZWFkeSBtZXJnZWQp
Ci0gcmV3cml0ZSB0byBwb3NpdGl2ZSBsb2dpYywgYXMgc3VnZ2VzdGVkIGJ5IFlhbm4gRS4gTU9S
SU4KLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNTI5LXp0ZXh0
LXYyLTAtODI5ODUwMzJmMTY5QGdteC5uZXQKCkNoYW5nZXMgaW4gdjI6Ci0gU2xpZ2h0bHkgZGlm
ZmVyZW50IHdvcmRpbmcKLSBFbmFibGUgdGhlIG9wdGlvbiBieSBkZWZhdWx0IG9uIG11c2wgdG9v
bGNoYWlucwotIEFkZCBwYXRjaCB0byBmaXggYnVpbGQgb2YgbWljcm9weXRob24KCkxpbmsgdG8g
djE6Ci0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDQxOS16dGV4dC12MS0xLWE4ZDVj
MmNmY2Y1N0BnbXgubmV0Ci0tLQotLS0KIHBhY2thZ2UvTWFrZWZpbGUuaW4gfCA5ICsrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
TWFrZWZpbGUuaW4gYi9wYWNrYWdlL01ha2VmaWxlLmluCmluZGV4IDQ3YTg5ZjFhZTEuLjM1ODc2
NjIwMTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvTWFrZWZpbGUuaW4KKysrIGIvcGFja2FnZS9NYWtl
ZmlsZS5pbgpAQCAtMTQ5LDYgKzE0OSwxNSBAQCBlbmRpZgoKIFRBUkdFVF9MREZMQUdTID0gJChj
YWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfTERGTEFHUykpCgorIyBtdXNsJ3MgZHluYW1pYyBsb2Fk
ZXIgZG9lc24ndCBzdXBwb3J0IERUX1RFWFRSRUwsIHdoaWNoIHJlc3VsdHMgaW4gYSBydW50aW1l
CisjIGNyYXNoIGlmIGl0IGdldHMgdXNlZC4gVGhlICIteiB0ZXh0IiBsaW5rZXIgb3B0aW9uIGlz
c3VlcyBhIGJ1aWxkLXRpbWUgZXJyb3IKKyMgd2hlbiBEVF9URVhSRUwgaXMgdXNlZCwgc28gd2Ug
Y2FwdHVyZSB0aGUgcHJvYmxlbSBlYXJsaWVyLgorIworIyBTZWUgYWxzbzogaHR0cHM6Ly93d3cu
b3BlbndhbGwuY29tL2xpc3RzL211c2wvMjAyMC8wOS8yNS80CitpZmVxICgkKEJSMl9UT09MQ0hB
SU5fVVNFU19NVVNMKSQoQlIyX0JJTkZNVF9TVVBQT1JUU19TSEFSRUQpLHl5KQorVEFSR0VUX0xE
RkxBR1MgKz0gLVdsLC16LHRleHQKK2VuZGlmCisKICMgQnkgZGVzaWduLCBfRk9SVElGWV9TT1VS
Q0UgcmVxdWlyZXMgZ2NjIG9wdGltaXphdGlvbiB0byBiZSBlbmFibGVkLgogIyBUaGVyZWZvcmUs
IHdlIG5lZWQgdG8gcGFzcyBfRk9SVElGWV9TT1VSQ0UgYW5kIHRoZSBvcHRpbWl6YXRpb24gbGV2
ZWwKICMgdGhyb3VnaCB0aGUgc2FtZSBtZWNoYW5pc20sIGkuZSBjdXJyZW50bHkgdGhyb3VnaCBD
RkxBR1MuIFBhc3NpbmcKCi0tLQpiYXNlLWNvbW1pdDogYzYyNGVlZTEyMGI2ZWUwYzgxZTYzNmJk
NDdhYmU5MjQ1MjYxMGNmNwpjaGFuZ2UtaWQ6IDIwMjQwNDE3LXp0ZXh0LTVhY2NiYWI2MWMwYQoK
QmVzdCByZWdhcmRzLAotLQpKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
