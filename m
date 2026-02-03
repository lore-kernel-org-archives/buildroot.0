Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9404E8B375
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DB5A40BCC;
	Tue,  3 Feb 2026 22:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeDcvcLk4a4V; Tue,  3 Feb 2026 22:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 627E040BEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770158669;
	bh=qdyH5JnwwZraxDpIauxrkwcypN4zAU2rFMxPeLcL+/Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VuO5ETOzm/AnnZfv/CCsG4byB+MRvOmExVwRigH0RyP/RdJh39ifImIegSpIGzjEQ
	 DqP/U05HW0/O4t4lOyq8isN2g+a3WkN7+IhcByYeAnRJFtsy43q2EULbgckl1wk0TK
	 a1U7zuEDXhIN/iWRJnmfXNyTw8Bl9Sm7+TTnebhna6KKH5Mg+wfGoKEhjZDIyA3ACJ
	 0ZKDyHW9ej4Wr2Dt8wrPnxaISkuKA87FNJiDkhhynqu1oprCiKqFDt9+QWHZbWvlXR
	 XcKm9TezZK5csG/VVaKIRCdDkm7r6i7QdxNWeWfrdkz/H8waWcjisthDkKfzHhI7RA
	 IP/1XKM1799Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627E040BEF;
	Tue,  3 Feb 2026 22:44:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2BFCF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E15C4608AE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewrvlnVzOizy for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6069607F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6069607F7
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6069607F7
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:44:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-480706554beso66687985e9.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 14:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770158663; x=1770763463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QBHxQLX88hD2K/Gs4cK7/j4Yk5vr6lCJPt6X+pNA6dc=;
 b=UHfTqLIyFM4Y4pS5V0teE3dsb+W9iyUx87V78Ji0K0Ll9ekQK0M3ll+LAQsSMbJ0pE
 y2jzHICzVPOPpx4cf2/OyCGuhxKwzQ+kcDBlEk+gDpUQA+Skx/ucw/5fqs+GnwuRJXGp
 zMWj+c5C6xuxgcNQPUz6Cibqqmw2V69pQO/n2eL9hTiPt6g8AIzT0R19wy9NqcY71NaF
 O5B1PnvfWc7918Q/OgARV6jf3sBvR0Y5ASsfIxVZrvgfVbqcX0s4OTyneEUxlvyW+h7A
 eDX1L1mkYiq5FDHzCe6Boqe4VdV6bMFMveqrIEC3wuau6Oogw4HFy9eHkKxXy0Zc7L1R
 VTaA==
X-Gm-Message-State: AOJu0YwVie4nH+CH8Ea4CRo47abuMJvZYjXqeGFB+1xvAeQRCR5nUKTq
 WJ4t+6mBH0zN1MJovh2YwY6JBio/0BDLs2Y4y/u+izBwdJF+vWJ7ZXBI2oai8Q==
X-Gm-Gg: AZuq6aIdUcxJi9FhggvNOP0QChgMGeNmq/kfCkZOEJRxWwJcxCSfOznU+EOpaD62DWR
 29+QfgOnNMfq4WwJ54BkK2sVrRmreKB/DMi5JrjFxrkKWAV5D8LzcCfW07d8h1bHLXG/G41pedq
 mZIWZZIaOe6eGKrDfGGl0FS1SDMi8d5jHu56cWrG774Mjg+S4EDAvkd0f9Mi4swiu4Bg7K/lSQD
 ctnothoeuY35Y271FYtZANHeKZ4zdumc8JNXOuGx+aj4oRqmclBPVwU1uQ+nihcz7HVjx67jfz+
 q3WCftzDKLJdHS0PSfttsPLzxfBNnjhha8sj8Hd7u5XyhTFblZ4KJEwJQtqYHCic5P04pYnx71D
 Ou7n1+S9sui4mOeOgSp7hPN9U1yk72LYbTAfbjArNuFwQcPBsG9ke/VUfoiKBMF6giPcf0uBykV
 qSMAaDdR8Xln9FCP2cg0YPXmIRI6D9rD7p7bS/4mhpHJNZbrY=
X-Received: by 2002:a05:600c:1f16:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-4830e9897dcmr17063085e9.31.1770158662574; 
 Tue, 03 Feb 2026 14:44:22 -0800 (PST)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310841614sm2321035e9.3.2026.02.03.14.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 14:44:22 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 23:44:13 +0100
Message-ID: <20260203224414.192218-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260203224414.192218-1-petr.vorel@gmail.com>
References: <20260203224414.192218-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770158663; x=1770763463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QBHxQLX88hD2K/Gs4cK7/j4Yk5vr6lCJPt6X+pNA6dc=;
 b=fcbhamdHWWS72EiWnmHdami+Bm++aI5cY6R1mbNFmPLOgg7kJE/6lni2dayMTdq/t7
 pah0p+GltFhmIkjSuTn6Hl3wvWi91ckSJORsPdFaTs5FbOMVC6Ij2o6kuJS7ns95TeVm
 g9vwwhKtoGV0vxfDwWFdaq5bh/eNmcJMBehvVK2w/ANwRnYJx9xcra3pqjn2Ano/I0cI
 zqEXxHGQJqEb+DUK+qtZH276ZIBUtb4mMTrTDhCZnlK9dyRWk6DEQ4esSFaYa3lH5R71
 Ptwo3pqLJ+muzV9QRzEKOEeGZuyk8Rm4219I8ccPj/sZixstVVzZHd6LzmJXmgb9LwpK
 NZGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fcbhamdH
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: bump version to
 20260130
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+Ci0tLQpIaSBh
bGwsCgp0aGVyZSBhcmUgc2lsbCBzb21lIGZhaWx1cmVzOgoqIGJyLWFybS1iYXNpYyBbMjgvMzVd
OiBGQUlMRUQKZmNudGwzMS5jOjEyMjoyMjogZXJyb3I6IOKAmEZfR0VUT1dOX0VY4oCZIHVuZGVj
bGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmEZfR0VU
T1dO4oCZPwogIDEyMiB8ICBURVNUKGZjbnRsKHRlc3RfZmQsIEZfR0VUT1dOX0VYLCAmb3JpZ19v
d25fZXgpKTsKZmNudGwzMS5jOjE4MjoyMjogZXJyb3I6IOKAmEZfU0VUT1dOX0VY4oCZIHVuZGVj
bGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmEZfU0VU
T1dO4oCZPwogIFRFU1QoZmNudGwodGVzdF9mZCwgRl9TRVRPV05fRVgsICZvcmlnX293bl9leCkp
OwoKVGhlIGNvbmZpZyBoYXZlOgpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0hFQURFUlNfNV85PXkK
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9DVVNUT01fVUNMSUJDPXkKCkkgd2FzIHRoaW5raW5nIGFi
b3V0IHNvbWV0aGluZyBsaWtlOgoJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9VU0VTX1VDTElC
QyB8fCBCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfP18/CgpidXQgaXQncyBub3QgYWJv
dXQga2VybmVsIGhlYWRlcnMgKGluY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy9mY250bC5oCmNvbnRh
aW5zIGJvdGggRl9HRVRPV05fRVggYW5kIEZfU0VUT1dOX0VYIGluIDIuNiksIGJ1dCBtb3JlIGFi
b3V0IHRoZQpmYWN0IHRoYXQgdUNsaWJjLW5nIHZlcnNpb24gaW4gdGhlIHRvb2xjaGFpbiBpcyAx
LjAuMzYsIGJ1dCA8ZmNudGwuaD4KcmVxdWlyZXMgbmV3ZXIgdUNsaWJjLW5nLCBhcyBpdCB3YXMg
YWRkZWQgaW4gdjEuMC40NToKOTg1NzZhYjhkICgiZmNudGwuaDogZGVjbGFyZSBmX293bmVyX2V4
IGZvciBhbGwgYXJjaGl0ZWN0dXJlcyIpCgpIb3cgdG8gZXhwcmVzcyB0aGlzIGRlcGVuZGVuY3kg
aW4gQnVpbGRyb290PwpBbHNvLCBJIGNvdWxkIGZpeCBpdCBpbiBMVFAgdXBzdHJlYW0gaWYgeW91
IHRoaW5rIDEuMC4zNiBpcyBzdGlsbCBuZXcKZW5vdWdoIGFuZCB0aGVyZSBhcmUgdXNlcnMgd2hv
IGFjdHVhbGx5IHVzZSBMVFAgd2l0aCB0aGVzZSBvbGRlcgp0b29sY2hhaW5zLgoKS2luZCByZWdh
cmRzLApQZXRyCgogcGFja2FnZS9sdHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUuaGFzaCB8IDQg
KystLQogcGFja2FnZS9sdHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUubWsgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1aXRlLmhhc2ggYi9wYWNrYWdlL2x0
cC10ZXN0c3VpdGUvbHRwLXRlc3RzdWl0ZS5oYXNoCmluZGV4IGI5NmUxZjQ2ZmEuLmUxODYxYWU0
ZTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1aXRlLmhhc2gK
KysrIGIvcGFja2FnZS9sdHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUuaGFzaApAQCAtMSw0ICsx
LDQgQEAKLSMgRnJvbTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAv
cmVsZWFzZXMvZG93bmxvYWQvMjAyNTA5MzAvbHRwLWZ1bGwtMjAyNTA5MzAudGFyLnh6LnNoYTI1
Ngotc2hhMjU2ICAwNDhmYTRkNjlkZGJlOGE5NGFhMTVkYTliZGM4NTcxM2FiMDdhMGFiYmMzZGUy
YjhiZGQ5NzU3NjQ0YWVmMWU0ICBsdHAtZnVsbC0yMDI1MDkzMC50YXIueHoKKyMgRnJvbTogaHR0
cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvcmVsZWFzZXMvZG93bmxvYWQv
MjAyNjAxMzAvbHRwLWZ1bGwtMjAyNjAxMzAudGFyLnh6LnNoYTI1Ngorc2hhMjU2ICA1ZWZmYzlk
M2ViM2Y1Y2Q0NWQ0N2U4YWMzZDc4ZjU5Y2I4ZjNmNzNjODU5OGEyZjE4MmVmNWI0MGRkZmZmMzEx
ICBsdHAtZnVsbC0yMDI2MDEzMC50YXIueHoKICMgTG9jYWxseSBjb21wdXRlZAogc2hhMjU2ICA4
MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFi
ODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x0cC10ZXN0c3VpdGUvbHRwLXRl
c3RzdWl0ZS5tayBiL3BhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1aXRlLm1rCmluZGV4
IDEyZGI4ZjJkM2IuLjJlNDc2N2IxYTUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbHRwLXRlc3RzdWl0
ZS9sdHAtdGVzdHN1aXRlLm1rCisrKyBiL3BhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1
aXRlLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTFRQ
X1RFU1RTVUlURV9WRVJTSU9OID0gMjAyNTA5MzAKK0xUUF9URVNUU1VJVEVfVkVSU0lPTiA9IDIw
MjYwMTMwCiBMVFBfVEVTVFNVSVRFX1NPVVJDRSA9IGx0cC1mdWxsLSQoTFRQX1RFU1RTVUlURV9W
RVJTSU9OKS50YXIueHoKIExUUF9URVNUU1VJVEVfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9s
aW51eC10ZXN0LXByb2plY3QvbHRwL3JlbGVhc2VzL2Rvd25sb2FkLyQoTFRQX1RFU1RTVUlURV9W
RVJTSU9OKQogCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
