Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8303BD5B156
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52F8040B9B;
	Sat, 13 Dec 2025 11:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pp2CGGIKN_-C; Sat, 13 Dec 2025 11:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A0B840AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627028;
	bh=7eh/G43woVxvHyWoR47EoOT5DJ265C8WyECCxiH6Lkw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VSWhaqMODRpQThGw4/kyJxC33dpK2dNUbo943dWakJ6LPFaCXRBf3+Ed7qb2CHRdd
	 wBhVDxmKK38Msz5aDDwd9tu0b4bmlBu6wB8tK7l96hJ/CM5W7tExQK7qtdiQWo2oxi
	 7YCFs0dQnMoP4EcB1VGxzeIUCKuUaJZUjh/pKxG69jNOtiAUw+0yvrRtwU4qUu5g7P
	 2uGFvduMREPAutO6Om1Bzt3pzhySZx5HQd9RfvskDmlrw3utLwma9yiwO2TYKWLj7e
	 H/WZNpP/vPvY2fLHzsv2eSEjTjLE+987HThC7o5xwHKB7CYpa/6KNaLW1Gi2EQEuca
	 Qq7fx7jf/11+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A0B840AB2;
	Sat, 13 Dec 2025 11:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D498F13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBB9A40AB2
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBNVmEP0VS4t for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:57:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2A5A40AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A5A40AA7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2A5A40AA7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64D92A4C341C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:57:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37308)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOFD-000000006tb-0Dbv
 for buildroot@buildroot.org; Sat, 13 Dec 2025 11:57:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:57:00 +0100
Message-ID: <20251213115703.1277141-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627023;
 bh=wCeJrHpzSLo70si/7PeN8Q3MG/eFNFE9ZdmxpIegEGQ=;
 h=From:To:Subject:Date:From;
 b=JefNzOoXUqf+YNjoyZSan4bUdk6RRUDwwPGtGQYeVNDLRQFC5+00kIOAAlKxyFtOu
 +B/ADiRNfLfHQO9sHG58N3yoRYxTOmfUpHPtUAm+pcCJIYS7NnnOW/AUIy25qy9KDx
 bfTqStdnwu/ZfPcpAI8BqqVCgJxbJ0zlunKVidmOT25Yjsk5jtJF8up+28+4oVkdkj
 UH9OkP04ib1L1RYCiDKhNy/3RVCz+aj6vcw2Ltzd0pGXicmHgCMhNvAMXjCuYsxTQl
 Zb3RtZYO5uz7SvmOawUv5aNxcWeAR5jyb/EW7DTYGAgTG5emXvirXKpjDVKXN0XNHn
 PPimzqGfVXoCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JefNzOoX
Subject: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.15
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

aHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy93aWtpL0NoYW5nZXNfdjEuMi4xNF92MS4yLjE1
I2Fsc2EtbGliCgpSZWJhc2VkIHBhdGNoIDAwMDEuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgotLS0KIC4uLi9hbHNhLWxpYi8wMDAxLURvbi10LXVzZS1mb3Jr
LW9uLW5vTU1VLXBsYXRmb3Jtcy5wYXRjaCAgfCA3ICsrKy0tLS0KIHBhY2thZ2UvYWxzYS1saWIv
YWxzYS1saWIuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBwYWNrYWdl
L2Fsc2EtbGliL2Fsc2EtbGliLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAr
LQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9hbHNhLWxpYi8wMDAxLURvbi10LXVzZS1mb3JrLW9uLW5vTU1VLXBs
YXRmb3Jtcy5wYXRjaCBiL3BhY2thZ2UvYWxzYS1saWIvMDAwMS1Eb24tdC11c2UtZm9yay1vbi1u
b01NVS1wbGF0Zm9ybXMucGF0Y2gKaW5kZXggODdhZGQ5ZmY1Ni4uNGU4NDU4NTY4NiAxMDA2NDQK
LS0tIGEvcGFja2FnZS9hbHNhLWxpYi8wMDAxLURvbi10LXVzZS1mb3JrLW9uLW5vTU1VLXBsYXRm
b3Jtcy5wYXRjaAorKysgYi9wYWNrYWdlL2Fsc2EtbGliLzAwMDEtRG9uLXQtdXNlLWZvcmstb24t
bm9NTVUtcGxhdGZvcm1zLnBhdGNoCkBAIC0xMCwxMSArMTAsMTAgQEAgU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KIFtKw7ZyZzog
dXBkYXRlIHBhdGNoIGZvciAxLjEuNl0KIFNpZ25lZC1vZmYtYnk6IErDtnJnIEtyYXVzZSA8am9l
cmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgogVXBzdHJlYW06IGh0dHA6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fsc2EtZGV2ZWwvMjAxOC1Ob3ZlbWJlci8xNDEzNzYuaHRt
bAotW0Jlcm5kOiB1cGRhdGUgcGF0Y2ggZm9yIDEuMi40ICYgMS4yLjddCi1TaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+CitbQmVybmQ6IHVwZGF0ZSBw
YXRjaCBmb3IgMS4yLjE1XQorU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4KIFtEYXJpbzogbWFrZSB0aGUgcGF0Y2ggdG8gYmUgYXBwbGllZCB3aXRoIGZ1enogZmFj
dG9yIDBdCiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1h
cnVsYXNvbHV0aW9ucy5jb20+Ci0KIC0tLQogIGNvbmZpZ3VyZS5hYyAgICAgICAgIHwgIDIgKysK
ICBzcmMvcGNtL3BjbV9kaXJlY3QuYyB8IDEwICsrKysrKysrKy0KQEAgLTQxLDcgKzQwLDcgQEAg
aW5kZXggZTUzZTU5MjM4MTE5Li5jZjk0YzdjMWRiZjAgMTAwNjQ0CiAgCQljbG9zZShkbWl4LT5z
ZXJ2ZXJfZmQpOwogIAkJcmV0dXJuIHJldDsKICAJfQotLQkKKy0KICsKICsjaWZkZWYgSEFWRV9G
T1JLCiAgCXJldCA9IGZvcmsoKTsKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWxzYS1saWIvYWxzYS1s
aWIuaGFzaCBiL3BhY2thZ2UvYWxzYS1saWIvYWxzYS1saWIuaGFzaAppbmRleCAyNmQ1NGI2ZTFi
Li5kZjRmMzc4NDU1IDEwMDY0NAotLS0gYS9wYWNrYWdlL2Fsc2EtbGliL2Fsc2EtbGliLmhhc2gK
KysrIGIvcGFja2FnZS9hbHNhLWxpYi9hbHNhLWxpYi5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgYmU5Yzg4YTBiMzYwNDM2N2RkNzQxNjdhMmI3NTRh
MzVlMTQyZjY3MDI5MmFlNDdhMmZkZWYyN2EyZWU5N2EzMiAgYWxzYS1saWItMS4yLjE0LnRhci5i
ejIKK3NoYTI1NiAgODM3NzA4NDE1ODVlNzY2YTYwYzk5ZmQyM2Y4YzU3NGMyMjY0M2FlMGNiMWYy
ZDIwYjc5M2MzZDg0ZWI5NWE4ZCAgYWxzYS1saWItMS4yLjE1LnRhci5iejIKIHNoYTI1NiAgMzI0
MzRhZmNjODY2NmJhMDYwZTExMWQ3MTViZmRiNmMyZDVkZDhhMzVmYTRkM2FiOGFkNjdkOGY4NTBk
MmYyYiAgQ09QWUlORwogc2hhMjU2ICBiZmUxNmNmODIzYmNmZjI2MWZjNmEwNjJjMDdlZTk2NjYw
ZTNjMzk2NzhmNDJmMzlhNzg4YTY4ZGJjMjM0Y2VkICBhc2VydmVyL0NPUFlJTkcKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvYWxzYS1saWIvYWxzYS1saWIubWsgYi9wYWNrYWdlL2Fsc2EtbGliL2Fsc2Et
bGliLm1rCmluZGV4IDM0YzE2ODhlOTguLjZjMjAxMjAxN2UgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
YWxzYS1saWIvYWxzYS1saWIubWsKKysrIGIvcGFja2FnZS9hbHNhLWxpYi9hbHNhLWxpYi5tawpA
QCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUFMU0FfTElCX1ZF
UlNJT04gPSAxLjIuMTQKK0FMU0FfTElCX1ZFUlNJT04gPSAxLjIuMTUKIEFMU0FfTElCX1NPVVJD
RSA9IGFsc2EtbGliLSQoQUxTQV9MSUJfVkVSU0lPTikudGFyLmJ6MgogQUxTQV9MSUJfU0lURSA9
IGh0dHBzOi8vd3d3LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMvcHViL2xpYgogQUxTQV9MSUJfTElD
RU5TRSA9IExHUEwtMi4xKyAobGlicmFyeSksIEdQTC0yLjArIChhc2VydmVyKQotLSAKMi40Ny4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
