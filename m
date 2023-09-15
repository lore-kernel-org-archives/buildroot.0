Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445B9EEEC01
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 19:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC98F400D7;
	Fri, 15 Sep 2023 19:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC98F400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfyIzNuw_gkK; Fri, 15 Sep 2023 19:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13ACB40153;
	Fri, 15 Sep 2023 19:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13ACB40153
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46D271BF5D7
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 19:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26FE840153
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 19:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26FE840153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukqnxHPDDmlB for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 19:23:22 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADA66400D7
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 19:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADA66400D7
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5C5B713F88F;
 Fri, 15 Sep 2023 21:23:17 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 21:23:07 +0200
Message-ID: <20230915192308.1432032-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694805798;
 bh=eHAanh6lxPYxgAjLYi6MCrGrjL98V1/KmK052mgr8PQ=;
 h=From:To:Cc:Subject:Date:From;
 b=WA7DjI82alHcy0fRNNSb9PBL4bikFLDUFVD0P17pA5xFa9OY8EtHw04TrDhA1BiUy
 TQQZjnyJer7FiVQ8O0cfxuQD4azKyKUuXG+HMcjlgtXGAMCsQL8/lyrTI1G8mdpJGd
 6Oirm8irH63jrVZLCazvuQ8i+ps2p4a7wCVBeQFLWkuohlkp9NOfHnwVTuStPqVFkw
 5ye3oyO5gs7R7q7JztnkDKVn5j3C+JG0Ag16ED6rj5Q4Yp3kr0wn+JGg9nNjuiPR70
 V40VuY1jNRmrJ5+4967OzzZAarHVWaXazLtFZ9Id2A8vKXR23xdC3hSIAANtj2y/kR
 N68ckLKsb5lxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WA7DjI82
Subject: [Buildroot] [PATCH 1/1] package/libjxl: fix riscv build
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGlianhsIHdhcyBmYWlsaW5nIHRvIGJ1aWxkIGZvciByaXNjdiB0YXJnZXRzLCBzaW5jZSBjb21t
aXQgZmY3YzM3ZTU3CiJwYWNrYWdlL2xpYmp4bDogc2VjdXJpdHkgYnVtcCB0byB2ZXJzaW9uIDAu
OC4xIi4gQnVpbGQgd2FzIGZhaWxpbmcgd2l0aApvdXRwdXQ6CgogICAgL2J1aWxkL2xpYmp4bC0w
LjguMS9saWIvanhsL2VuY194eWIuY2M6IEluIGZ1bmN0aW9uICdqeGw6OkltYWdlM0YganhsOjpO
X1NDQUxBUjo6VHJhbnNmb3JtVG9MaW5lYXJSR0IoY29uc3QganhsOjpJbWFnZTNGJiwgY29uc3Qg
anhsOjpDb2xvckVuY29kaW5nJiwgZmxvYXQsIGNvbnN0IEp4bENtc0ludGVyZmFjZSYsIGp4bDo6
VGhyZWFkUG9vbCopJzoKICAgIC9idWlsZC9saWJqeGwtMC44LjEvbGliL2p4bC9lbmNfeHliLmNj
OjIyMzoyMTogZXJyb3I6IHZhcmlhYmxlICdzdGQ6OmF0b21pYzxib29sPiBvaycgaGFzIGluaXRp
YWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5cGUKICAgICAgMjIzIHwgICBzdGQ6OmF0b21pYzxib29s
PiBva3t0cnVlfTsKICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICBefgoKVGhpcyBidWls
ZCBmYWlsdXJlIHdhcyBkdWUgdG8gYSBtaXNzaW5nIDxhdG9taWM+IGhlYWRlciBpbmNsdXNpb24u
IEZvcgpzb21lIHJlYXNvbiwgdGhlIGJ1aWxkIGZhaWx1cmUgd2FzIG9ic2VydmVkIG9ubHkgd2l0
aCBSSVNDLVYgdG9vbGNoYWlucy4KClRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSBhZGRp
bmcgYW4gdXBzdHJlYW0gY29tbWl0LCBub3QgeWV0IGluIGEKcGFja2FnZSByZWxlYXNlLiBTZWUg
WzFdLgoKRml4ZXM6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzEyMS8x
MjEwN2JjN2FlYTdhZmFlMWQyZmI5MzVkMzFiNDRlZWU2ZWExNTAxCgpbMV0gaHR0cHM6Ly9naXRo
dWIuY29tL2xpYmp4bC9saWJqeGwvY29tbWl0LzIyZDEyZDc0ZTdiYzU2YjA5Y2ZiMTk3M2FhODll
YzhkNzE0ZmEzZmMKClNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+
Ci0tLQpQYXRjaCB0ZXN0ZWQgb24gYnJhbmNoIG1hc3RlciBhdCBjb21taXQgMzU1N2E3YiB3aXRo
IGNvbW1hbmRzOgoKICAgIG1ha2UgY2hlY2stcGFja2FnZQogICAgLi4uCiAgICAwIHdhcm5pbmdz
IGdlbmVyYXRlZAoKICAgIHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAogICAgICAgIC1kIGRs
IC1vIG91dHB1dF9mb2xkZXIgXAogICAgICAgIHRlc3RzLnBhY2thZ2UudGVzdF9saWJqeGwKICAg
IC4uLgogICAgT0sKCiAgICB1dGlscy90ZXN0LXBrZyAtYSAtcCBsaWJqeGwKICAgIC4uLgogICAg
NDUgYnVpbGRzLCAxMSBza2lwcGVkLCAwIGJ1aWxkIGZhaWxlZCwgMCBsZWdhbC1pbmZvIGZhaWxl
ZCwgMCBzaG93LWluZm8gZmFpbGVkCiAgICAKTm90ZTogdGhpcyBwYXRjaCB3YXMgYWxzbyB0ZXN0
ZWQgb24gdG9wIG9mIHRoZSBwYXRjaCBwcm9wb3NlZCBhdDoKaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDkxNDIxNTYwNi4zMDk3MzUtMS1m
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8KLS0tCiAuLi5pYy1jb250ZW50LXRvLWZpeC1nY2Mt
Y29tcGlsYXRpb24tZm8ucGF0Y2ggfCA0NyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlianhs
LzAwMDItQWRkLW1pc3NpbmctYXRvbWljLWNvbnRlbnQtdG8tZml4LWdjYy1jb21waWxhdGlvbi1m
by5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlianhsLzAwMDItQWRkLW1pc3NpbmctYXRv
bWljLWNvbnRlbnQtdG8tZml4LWdjYy1jb21waWxhdGlvbi1mby5wYXRjaCBiL3BhY2thZ2UvbGli
anhsLzAwMDItQWRkLW1pc3NpbmctYXRvbWljLWNvbnRlbnQtdG8tZml4LWdjYy1jb21waWxhdGlv
bi1mby5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iODU2YjAw
NzI4Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9saWJqeGwvMDAwMi1BZGQtbWlzc2luZy1h
dG9taWMtY29udGVudC10by1maXgtZ2NjLWNvbXBpbGF0aW9uLWZvLnBhdGNoCkBAIC0wLDAgKzEs
NDcgQEAKK0Zyb20gNDJlOTQ0YTQ3MTY3MmRhZTg1MjJmYmNmMTYxOTQxODk1YmExNjYzMiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEVhc3Rkb25nIDwzMTkyMDkyNStJRUFTVEB1c2Vy
cy5ub3JlcGx5LmdpdGh1Yi5jb20+CitEYXRlOiBUaHUsIDIzIEZlYiAyMDIzIDA2OjA4OjM2ICsw
ODAwCitTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNzaW5nIDxhdG9taWM+IGNvbnRlbnQgdG8gZml4
IGdjYyBjb21waWxhdGlvbiBmb3IgUklTQ1YKKyBhcmNoaXRlY3R1cmUuICgjMjIxMSkKKworKiBB
ZGQgbWlzc2luZyA8YXRvbWljPiBjb250ZW50IHRvIGZpeCBnY2MgY29tcGlsYXRpb24gZm9yIFJJ
U0NWIGFyY2hpdGVjdHVyZS4KKworKiBhZGQgbmFtZSB0byBBVVRIT1JTCisKKyogbGludCBmaXgK
KworQ28tYXV0aG9yZWQtYnk6IE1vcml0eiBGaXJzY2hpbmcgPGZpcnNjaGluZ0Bnb29nbGUuY29t
PgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJqeGwvbGlianhsL2NvbW1pdC8yMmQx
MmQ3NGU3YmM1NmIwOWNmYjE5NzNhYTg5ZWM4ZDcxNGZhM2ZjCitTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgorLS0tCisgQVVUSE9SUyAgICAgICAgICAgIHwgMSAr
CisgbGliL2p4bC9lbmNfeHliLmNjIHwgMSArCisgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKKworZGlmZiAtLWdpdCBhL0FVVEhPUlMgYi9BVVRIT1JTCitpbmRleCA0NGRjYzQwOS4u
MzM0MDQyMmQgMTAwNjQ0CistLS0gYS9BVVRIT1JTCisrKysgYi9BVVRIT1JTCitAQCAtMzAsNiAr
MzAsNyBAQCBEYW5pZWwgTm92b21lc2vDvSA8ZG5vdm9tZXNreUBnbWFpbC5jb20+CisgRGF2aWQg
QnVybmV0dCA8dmFyZ29sc29mdEBnbWFpbC5jb20+CisgRGlyayBMZW1zdHJhIDxkaXJrQGxlbXN0
cmEub3JnPgorIERvbiBPbG1zdGVhZCA8ZG9uLmoub2xtc3RlYWRAZ21haWwuY29tPgorK0Rvbmcg
WHUgPHhkb25nMTgxQGdtYWlsLmNvbT4KKyBFdmVuIFJvdWF1bHQgPGV2ZW4ucm91YXVsdEBzcGF0
aWFseXMuY29tPgorIEZyZWQgQnJlbm5hbiA8Y29weXBhc3RlQGtpdHRlbnMucGg+CisgSGVpa28g
QmVja2VyIDxoZWlyZWNrYUBleGhlcmJvLm9yZz4KK2RpZmYgLS1naXQgYS9saWIvanhsL2VuY194
eWIuY2MgYi9saWIvanhsL2VuY194eWIuY2MKK2luZGV4IGM3MzEwNzY1Li4yZmQ1ZDAyNSAxMDA2
NDQKKy0tLSBhL2xpYi9qeGwvZW5jX3h5Yi5jYworKysrIGIvbGliL2p4bC9lbmNfeHliLmNjCitA
QCAtNiw2ICs2LDcgQEAKKyAjaW5jbHVkZSAibGliL2p4bC9lbmNfeHliLmgiCisgCisgI2luY2x1
ZGUgPGFsZ29yaXRobT4KKysjaW5jbHVkZSA8YXRvbWljPgorICNpbmNsdWRlIDxjc3RkbGliPgor
IAorICN1bmRlZiBIV1lfVEFSR0VUX0lOQ0xVREUKKy0tIAorMi40MS4wCisKLS0gCjIuNDEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
