Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5B1C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 10:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6ED60B96;
	Fri,  3 Jul 2026 10:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_GQwwH2hLfA; Fri,  3 Jul 2026 10:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D753F60A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783074508;
	bh=fftSFsu/ApxJV8TJiubgJa+B26kYvQvZXEJY6x4N6B0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rzETugYhKZJiXKq40JZOK2afViPPlk57I4ddKqQI1EFPfW/p1VbBo00KSyJ/uCRa4
	 X4nI6YveMnW9RlEqVCjlWunV+aE6oC369iH5X0mpwnfVU3dyifnrz211tcPczOUaji
	 /rBNkwjHpVHxdqRghChGOGvjy5hEN+LRoEIN+3t6JGxH2ziTOUYzuUDOM1ZHVQjhkx
	 bg/8ivCF0uujuYUnAaVk4sLVjwKLMt+zBhM6ON3VtnLKjMXwyOyFkJr39C/H1zDHsU
	 qu+Tux7slz/A3e+lLlBegL315DEJksF4tbMmgCNSz1PLNHPTZ4EcZOsP8XfnwDKrFJ
	 ilHT8yh94SXHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D753F60A5C;
	Fri,  3 Jul 2026 10:28:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AED7C14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94A0E60A5C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONQRqP6Os_PY for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 10:28:26 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A53460A55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A53460A55
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A53460A55
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:24 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 829B6BDE60A1;
 Fri, 03 Jul 2026 12:28:20 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Fri,  3 Jul 2026 12:26:51 +0200
Message-ID: <20260703102732.782347-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783074501; bh=MEZZuvX6W+HA6uHNoEEkTSBk3Q+/ZVykB+0fpy8ikGE=;
 h=From:To:Cc:Subject:Date;
 b=iPUeHxeMviKBF53ZGFxmMMlfN1Pr3fa9Z0Rmr/pd192jOIorOQCJoKqbMv5XPb0/Z
 Ohq1G9H6k5Zo+M7XWWsCdrcSmZCGaKXFYEgLXpriCN9yxUomuXUh4PuEnvq3DFXuTI
 NYtjiriz/uHHzv0grRlbU1XAF4gleU453ze2oGgk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=iPUeHxeM
Subject: [Buildroot] [PATCH 0/5] package/mpd: add runtime test
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGVzdGluZyBNUEQgaW4gYSByZWFsIHdvcmxkIHNpdHVhdGlvbiBpcyBmYWlybHkgc3RyYWlnaHRm
b3J3YXJkOiBidWlsZCwKZGVwbG95LCBwbGF5IHNvbWUgbXVzaWMuIFJlcHJlc2VudGluZyB0aGlz
IHNpbXBsZSB0ZXN0IHdpdGhpbiBhIHRlc3QKZnJhbWV3b3JrIGlzIHF1aXRlIGNvbXBsZXguCgpJ
IHRyaWVkIHRvIGJyZWFrIGRvd24gbXkgc2ltcGxlIHRlc3QgY2FzZSBpbnRvIGEgZmV3IGF0b21p
YyBzdGVwcyB0aGF0CmludGVyYWN0IHdpdGggTVBEIHZpYSB0aGUgYnVpbHQtaW4gcHJvdG9jb2wu
IFRoZSBuZWNlc3NhcnkgdGVzdCBkYXRhIHdhcwpnZW5lcmF0ZWQgd2l0aCBmZm1wZWcgYW5kIGlt
YWdlbWFnaWNrIGFuZCBpcyByb3lhbHR5LWZyZWUgOi1ECgpXb3JraW5nIG9uIHRoaXMgYWxzbyB0
cmlnZ2VyZWQgc29tZSBjaGFuZ2VzIGluIHRoZSBCdWlsZHJvb3Qgc2V0dXA6CgpUaGUgY29uZmln
dXJhdGlvbiBmaWxlIHN1cHBsaWVkIGJ5IEJ1aWxkcm9vdCBpcyBvbmx5IGEgc2FtcGxlOyBpdCB3
aWxsIG5vdApzdGFydCBNUEQgb24gYSBkZWZhdWx0IGluc3RhbGxhdGlvbi4gVXN1YWxseSBhIGN1
c3RvbSBtcGQuY29uZiBpcyBzdXBwbGllZAppbiBhIHJvb3RmcyBvdmVybGF5LiBEcm9wIHRoZSBC
dWlsZHJvb3QgY29uZmlndXJhdGlvbiBmaWxlIGFuZCBpbnN0YWxsIHRoZQpzYW1wbGUgc3VwcGxp
ZWQgYnkgTVBEIGluc3RlYWQsIGl0IGlzIG1vcmUgY29tcGxldGUsIGNvbnRhaW5zIHVzZWZ1bApl
eGFtcGxlcyBhbmQgaXMgdXBkYXRlIHJlZ3VsYXJseS4KCkFmdGVyIHZhcmlvdXMgdXBkYXRlcyBz
aW5jZSB2ZXJzaW9uIDAuMjAsIG1vc3QgZGVwZW5kZW5jaWVzIHBsYWNpbmcKcmVzdHJpY3Rpb25z
IG9uIHN1Yi1jb21wb25lbnRzIGFyZSBub3cgc3VwZXJzZWRlZCBieSByZXN0cmljdGlvbnMgcGxh
Y2VkIG9uCk1QRCBpdHNlbGYuIEV4YW1wbGU6IGlvX3VyaW5nIG5lZWRzIGtlcm5lbCBoZWFkZXJz
ID4gNS4xOyBNUEQgbmVlZHMga2VybmVsCmhlYWRlcnMgPiA1LjYuIFJlbW92ZSBkZXBlbmRlbmNp
ZXMgZnJvbSBzdWItb3B0aW9ucyBpZiB0aGV5IGFyZSBhbHJlYWR5CmltcG9zZWQgb24gTVBELiAK
Ck1QRCBoYXMgOTkgY29uZmlndXJhYmxlIG9wdGlvbnM7IG9mIHRoZXNlLCA0NCBhcmUgZXhwb3Nl
ZCBpbiBCdWlsZHJvb3QncwpDb25maWcuaW4uIFNvcnQgb3JkZXIgYW5kIGdyb3VwaW5nIG9mIHRo
ZXNlIG9wdGlvbnMgYXJlIGRpZmZlcmVudCB3aXRoaW4KdGhlIE1QRCBwcm9qZWN0IGFuZCBCdWls
ZHJvb3QsIHdoaWNoIG1ha2VzIGEgY29tcGFyaXNvbiBkaWZmaWN1bHQuClJlb3JkZXIgZW50cmll
cyBpbiBDb25maWcuaW4gdG8gcmVmbGVjdCB0aGVpciBvcmRlciBpbiBtZXNvbl9vcHRpb25zLnR4
dC4KQWxzbyB1cGRhdGUgYXQgbGVhc3Qgc29tZSBvZiB0aGUgaGVscCB0ZXh0cyB0byBtb3JlIGNs
b3NlbHkgcmVzZW1ibGUgd2hhdAppcyBwdWJsaXNoZWQgaW4gdGhlIE1QRCBtYW51YWwuCgpBbmRy
ZWFzIFppZWdsZXIgKDUpOgogIHBhY2thZ2UvbXBkOiBpbnN0YWxsIHByb3ZpZGVkIHNhbXBsZSBj
b25maWd1cmF0aW9uIGZpbGUgYXMgbXBkLmNvbmYKICBwYWNrYWdlL21wZDogcmVtb3ZlIGRlcGVu
ZGVuY2llcyBmcm9tIHN1Yi3DvHB0aW9ucyB0aGF0IGFyZSBhbHJlYWR5CiAgICBzYXRpc2ZpZWQg
YnkgdGhlIG1haW4gb3B0aW9uCiAgcmVvcmRlciBjb25maWcgaXRlbXMgdG8gcmVmbGVjdCBvcmRl
cmluZyBpbiBtZXNvbl9vcHRpb25zLnR4dAogIHN1cHBvcnQvdGVzdGluZzogYWRkIHRlc3QgZm9y
IG1wZAogIERFVkVMT1BFUlM6IGFkZCBlbnRyeSBmb3IgdGVzdF9tcGQKCiBERVZFTE9QRVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogcGFja2FnZS9tcGQvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzY0ICsrKysrKysrKy0tLS0tLS0tLQog
cGFja2FnZS9tcGQvbXBkLmNvbmYgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMyIC0tCiBw
YWNrYWdlL21wZC9tcGQubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXBkLnB5ICAgICB8ICA1NCArKysKIC4u
Li90ZXN0cy9wYWNrYWdlL3Rlc3RfbXBkL2J1c3lib3guZnJhZ21lbnQgICB8ICAgNCArCiAuLi4v
dGVzdF9tcGQvcm9vdGZzLW92ZXJsYXkvZXRjL21wZC5jb25mICAgICAgfCAgMTQgKwogLi4uL3Rl
c3RfbXBkL3Jvb3Rmcy1vdmVybGF5L3Jvb3QvdGVzdF9tcGQuc2ggIHwgIDc0ICsrKysKIC4uLi9t
dXNpYy9hcnRpc3QgMS9hbGJ1bSAxLzEga0h6IHNpbmUuZmxhYyAgICB8IEJpbiAwIC0+IDM4MjAw
MyBieXRlcwogLi4uL2xpYi9tcGQvbXVzaWMvYXJ0aXN0IDEvYWxidW0gMS9jb3Zlci5wbmcgIHwg
ICAxICsKIC4uLi9tcGQvbXVzaWMvYXJ0aXN0IDEvYWxidW0gMi8xIGtIeiBzaW5lLndhdiB8IEJp
biAwIC0+IDUyOTMyNjIgYnl0ZXMKIC4uLi9saWIvbXBkL211c2ljL2FydGlzdCAxL2FsYnVtIDIv
Y292ZXIucG5nICB8ICAgMSArCiAuLi4vdmFyL2xpYi9tcGQvbXVzaWMvYXJ0aXN0IDEvY292ZXIu
cG5nICAgICAgfCBCaW4gMCAtPiAxMzAwNDY4IGJ5dGVzCiAxMyBmaWxlcyBjaGFuZ2VkLCAzNDEg
aW5zZXJ0aW9ucygrKSwgMjA3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvbXBkL21wZC5jb25mCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9tcGQucHkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X21wZC9idXN5Ym94LmZyYWdtZW50CiBjcmVhdGUgbW9kZSAxMDA2
NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tcGQvcm9vdGZzLW92ZXJsYXkv
ZXRjL21wZC5jb25mCiBjcmVhdGUgbW9kZSAxMDA3NTUgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9tcGQvcm9vdGZzLW92ZXJsYXkvcm9vdC90ZXN0X21wZC5zaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXBkL3Jvb3Rmcy1v
dmVybGF5L3Zhci9saWIvbXBkL211c2ljL2FydGlzdCAxL2FsYnVtIDEvMSBrSHogc2luZS5mbGFj
CiBjcmVhdGUgbW9kZSAxMjAwMDAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9t
cGQvcm9vdGZzLW92ZXJsYXkvdmFyL2xpYi9tcGQvbXVzaWMvYXJ0aXN0IDEvYWxidW0gMS9jb3Zl
ci5wbmcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X21wZC9yb290ZnMtb3ZlcmxheS92YXIvbGliL21wZC9tdXNpYy9hcnRpc3QgMS9hbGJ1bSAy
LzEga0h6IHNpbmUud2F2CiBjcmVhdGUgbW9kZSAxMjAwMDAgc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9tcGQvcm9vdGZzLW92ZXJsYXkvdmFyL2xpYi9tcGQvbXVzaWMvYXJ0aXN0
IDEvYWxidW0gMi9jb3Zlci5wbmcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X21wZC9yb290ZnMtb3ZlcmxheS92YXIvbGliL21wZC9tdXNpYy9h
cnRpc3QgMS9jb3Zlci5wbmcKCi0tIAoyLjUzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
