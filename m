Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92DDC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 21:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84471408CD;
	Sat, 15 Oct 2022 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84471408CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTQo3BKPOUkR; Sat, 15 Oct 2022 21:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6208E408C5;
	Sat, 15 Oct 2022 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6208E408C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 673801BF368
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FEA781836
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FEA781836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KuI2Rlv3_nk for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 21:23:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F9EC81852
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F9EC81852
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 21:23:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b4so12750497wrs.1
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z2QdWQhoh/jvzk33/lx6cnzw4sgHjvMqw4gUUC3FBTE=;
 b=pbjYjegoo2w75e9LCy1WV7NiG7Oyyg+9Kbyuvcd2fH+nY7sEkINPVRgjsGwSLe2h2d
 Y7NmEFdeqXsHVXggfWpFqorWEXvmeISoRT77rZeIyeX/bqVxyRSg17KRBpoIP8KtQIQP
 gLdUEfVEw6ZVQpIxeH8vFwyeajdYp/1SifyWBD/4RqkqIvDCWqRN/RT1dlRLYpKMM50T
 WKrosSfia0ScZJ403IrterWqHdDq6Orpsp/RKR83QZas9gXus8msZ5XTD/JftXIt6Unq
 uNAMK7YG0mdGyX0Yn9FdaNfkWbR05kZyZna9J+ux75uckI+RutW0m2LEjBDzlS+5Ju8F
 CmRQ==
X-Gm-Message-State: ACrzQf2GdcY4gmQGM9KgccgpR6F4mTxK+2wSnGeqHsNmyD++o33E5dwf
 cK7vSeK+IS53AfX00uCIWSsig0Qp8zM=
X-Google-Smtp-Source: AMsMyM5XihRmTQYEpnh6mWYirZJVYDFuE2kUcAvl95Jd2KH1TmLQf5DunTMN3PXb+AjNgGnPZylC8w==
X-Received: by 2002:a5d:59a2:0:b0:22f:f2eb:ea86 with SMTP id
 p2-20020a5d59a2000000b0022ff2ebea86mr2269542wrr.635.1665868994626; 
 Sat, 15 Oct 2022 14:23:14 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b003a601a1c2f7sm11276374wmq.19.2022.10.15.14.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 14:23:14 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 23:23:11 +0200
Message-Id: <16a20e2a0d976faf2aee7ab8ebb6cfe0e9d8422d.1665868987.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665868987.git.yann.morin.1998@free.fr>
References: <cover.1665868987.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2QdWQhoh/jvzk33/lx6cnzw4sgHjvMqw4gUUC3FBTE=;
 b=qbcB/5+QADY1k4gEr3v+rcQd6Ui4waQE9ItW5bPHuZEEZTAefYW/U/nihlAy/YgiI1
 AH/jvFS1u5cTEQy1rb2iktC4h7ldH75HxU5rn+VWx6VjeEBzNvBltD32EgjVudYzhcdf
 1Tae/Be5K6gbkA7YmJRcFyjcgDlwS5wF8qT7aCtqElH9yop6LVauhFxYGO+RWILTE2dk
 RchZJcazSHFiYkSpcNohE3DoCWnt+Oh0JPj04J6Mj4d9jDnWRelk+GLE6uNWCQ+jjxhk
 8verAuZpSzi1U+8oddZnrmxtq53E88xKuEa6XY3Oan+8TggR6P9NJafZyVdVUZtt8GXi
 Te3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qbcB/5+Q
Subject: [Buildroot] [PATCH 3/4] package/skeleton-systemd: host the tmpfiles
 preparation script
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
Cc: =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, "Yann E . MORIN" <yann.morin@orange.com>,
 Norbert Lange <nolange79@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDBkOWI4NGI3YTgzZiAocGFja2FnZS9zeXN0ZW1kOiBpbnZva2Ugc3lzdGVtZC10bXBm
aWxlc2Qgb24gZmluYWwKaW1hZ2UpIGZvcmNlZnVsbHkgaW50cm9kdWNlZCBhIGNhbGwgdG8gc3lz
dGVtZC10bXBmaWxlcyBhcyBhIHBlci1yb290ZnMKaG9vaywgb24gdGhlIHByZW1pc2UgdGhhdCB3
b3VsZCBoZWxwIHdpdGggcmVhZC1vbmx5IHJvb3Rmcy4KCkhvd2V2ZXIsIHRoYXQgZGlkIG5vdCBh
Y2NvdW50IGZvciB0aGUgdGhlbi1wcmUtZXhpc3RpbmcgaGFuZGxpbmcgb2YgL3ZhcgphcyBhIGZh
Y3Rvcnkgd2hlbiB0aGUgdXNlciBvcHRlZCBub3QgdG8gcmVtb3VudCAvIHJlYWQtd3JpdGUgKGJ5
IG5vdApzZXR0aW5nIEJSMl9UQVJHRVRfR0VORVJJQ19SRU1PVU5UX1JPT1RGU19SVykuCgpUaGlz
IG1lYW5zIHRoYXQsIGZvciB1c2VycyB3aG8gd2FudCB0byB1c2UgYSBmYWN0b3J5IGZvciAvdmFy
LCB0aGUKZ2VuZXJhdGVkIGZpbGVzeXN0ZW0gY29udGFpbnMgdGhlIGZhY3RvcnkgZmlsZXMgdHdp
Y2U6IG9uY2UgYXMgc3RvcmVkIGluCnRoZSBmYWN0b3J5LCBhbmQgb25jZSBhcyBwb3B1bGF0ZWQg
Ynkgc3lzdGVtZC10bXBlZmlsZXNkLgoKSW4gdGhlIGhvcGUgdG8gcmVjb25jaWxlIHRoZSB0d28g
c29sdXRpb25zLCB3ZSBtb3ZlIHRoZSBoYW5kbGluZyBvZgpjYWxsaW5nIHN5c3RlbWQtdG1wZmls
ZXNkIHRvIHRoZSBza2VsZXRvbi1pbml0LXN5c3RlbWQgcGFja2FnZSwgd2hlcmUgd2UKYWxyZWFk
eSBoYW5kbGUgdGhlIC92YXIgZmFjdG9yeS4gSGF2aW5nIHRoZSB0d28gaW4gdGhlIHNhbWUgcGFj
a2FnZSB3aWxsCm1ha2UgaXQgZWFzaWVyLCBpbiB0aGUgZnV0dXJlLCB0byBwcm92aWRlIHRoZSB1
c2VyIHdpdGggYSBjaG9pY2Ugd2hldGhlcgp0byB1c2Ugb25lIG9mIHRoZSBvdGhlci4KCk5vdGUg
dGhhdCBpdCBpcyB2ZXJ5IGltcG9ydGFudCB0byBrZWVwIHRoZSBvcmRlciBvZiB0aGUgaG9va3Mg
YXMgdGhleQphcmUuCgpJbmRlZWQsIHNrZWxldG9uLWluaXQtc3lzdGVtZCBzb3J0cyBiZWZvcmUg
c3lzdGVtZCwgc28gaXRzIGhvb2tzIHdlcmUKcmVnaXN0ZXJlZCBiZWZvcmUgc3lzdGVtZCdzIGhv
b2tzOyBub3cgdGhhdCB3ZSBtb3ZlIHRoZSBDUkVBVEVfVE1QRklMRVMKaG9vaywgd2UgbXVzdCBl
bnN1cmUgaXQgaXMgY2FsbGVkIGFmdGVyIHRoZSBQUkVfUk9PVEZTX1ZBUiBvbmUsIHNvIHRoYXQK
dGhlIGJlaGF2aW91ciBvZiBhY3Rpbmcgb24gdGhlIHZhciBmYWN0b3J5IHJlbWFpbnMuCgpBcyBh
IGZpbmFsIG5vdGU6IHdlIGNob3NlIHRoZSBtb3ZlIHRoaXMgd2F5LCByYXRoZXIgdGhhbiBtb3Zl
IHRoZSB2YXIKZmFjdG9yeSBpbnRvIHRoZSBzeXN0ZW1kIHBhY2thZ2UsIGJlY2F1c2UgaXQgaXMg
bW9yZSByZWxhdGVkIHRvIHRoZQpzeXN0ZW0gaW50ZWdyYXRpb24gb24gdGhlIEJ1aWxkcm9vdCBz
aWRlLCByYXRoZXIgdGhhbiB0aGUgaW50ZWdyYXRpb24Kb2YgdGhlIHN5c3RlbWQgcGFja2FnZSBp
biBCdWlsZHJvb3QuCgpTaW1pbGFybHksIHRoZSBvdGhlciBmb3VyIHJvb3RmcyBob29rcywgU1lT
VEVNRF9MT0NBTEVfUFVSR0VfQ0FUQUxPR1MsClNZU1RFTURfVVBEQVRFX0NBVEFMT0dTLCBTWVNU
RU1EX1JNX0NBVEFMT0dfVVBEQVRFX1NFUlZJQ0UsIGFuZApzcGVjaWFsbHkgU1lTVEVNRF9QUkVT
RVRfQUxMLCBzaG91bGQgYWxzbyBiZSBtb3ZlZCBvdXQgb2YgdGhlIHN5c3RlbWQKcGFja2FnZSwg
YmVjYXVzZSB0aGV5IHRvbyBhcmUgbW9yZSByZWxhdGVkIHRvIHRoZSBCdWlsZHJvb3Qgc3lzdGVt
LApyYXRoZXIgdGhhbiB0byB0aGUgc3lzdGVtZCBwYWNrYWdlIGl0c2VsZjsgYnV0IHRoZSBmcm9u
dGllciBpcyB2ZXJ5CnBvcm91cyBpcyBlaXRoZXIgd2F5LCBmb3Igc3VjaCBhIHBhY2thZ2UgYXMg
c3BlY2lhbCBhcyBzeXN0ZW1kLgoKU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+CkNjOiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29t
PgpDYzogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0QG1pbmQu
YmU+CkNjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KQ2M6IEplzIFyZcyB
bXkgUm9zZW4gPGplcmVteS5yb3NlbkBzbWlsZS5mcj4KQ2M6IFlhbm4gRS4gTU9SSU4gPHlhbm4u
bW9yaW5Ab3JhbmdlLmNvbT4KLS0tCiAuLi4ve3N5c3RlbWQgPT4gc2tlbGV0b24taW5pdC1zeXN0
ZW1kfS9mYWtlcm9vdF90bXBmaWxlcy5zaCB8IDAKIHBhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0
ZW1kL3NrZWxldG9uLWluaXQtc3lzdGVtZC5tayAgICAgIHwgNiArKysrKysKIHBhY2thZ2Uvc3lz
dGVtZC9zeXN0ZW1kLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNiAtLS0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVu
YW1lIHBhY2thZ2Uve3N5c3RlbWQgPT4gc2tlbGV0b24taW5pdC1zeXN0ZW1kfS9mYWtlcm9vdF90
bXBmaWxlcy5zaCAoMTAwJSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvZmFrZXJvb3Rf
dG1wZmlsZXMuc2ggYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9mYWtlcm9vdF90bXBm
aWxlcy5zaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gcGFja2FnZS9zeXN0ZW1k
L2Zha2Vyb290X3RtcGZpbGVzLnNoCnJlbmFtZSB0byBwYWNrYWdlL3NrZWxldG9uLWluaXQtc3lz
dGVtZC9mYWtlcm9vdF90bXBmaWxlcy5zaApkaWZmIC0tZ2l0IGEvcGFja2FnZS9za2VsZXRvbi1p
bml0LXN5c3RlbWQvc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rIGIvcGFja2FnZS9za2VsZXRvbi1p
bml0LXN5c3RlbWQvc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rCmluZGV4IDk3MDk1MWQ1NTMuLjg5
YTI4ZDE3ODAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1kL3NrZWxl
dG9uLWluaXQtc3lzdGVtZC5taworKysgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9z
a2VsZXRvbi1pbml0LXN5c3RlbWQubWsKQEAgLTU4LDYgKzU4LDEyIEBAIFNLRUxFVE9OX0lOSVRf
U1lTVEVNRF9ST09URlNfUFJFX0NNRF9IT09LUyArPSBTS0VMRVRPTl9JTklUX1NZU1RFTURfUFJF
X1JPT1RGU19WCiAKIGVuZGlmCiAKK2RlZmluZSBTS0VMRVRPTl9JTklUX1NZU1RFTURfQ1JFQVRF
X1RNUEZJTEVTX0hPT0sKKwlIT1NUX1NZU1RFTURfVE1QRklMRVM9JChIT1NUX0RJUikvYmluL3N5
c3RlbWQtdG1wZmlsZXMgXAorCQkkKFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9QS0dESVIpL2Zha2Vy
b290X3RtcGZpbGVzLnNoICQoVEFSR0VUX0RJUikKK2VuZGVmCitTS0VMRVRPTl9JTklUX1NZU1RF
TURfUk9PVEZTX1BSRV9DTURfSE9PS1MgKz0gU0tFTEVUT05fSU5JVF9TWVNURU1EX0NSRUFURV9U
TVBGSUxFU19IT09LCisKIGRlZmluZSBTS0VMRVRPTl9JTklUX1NZU1RFTURfSU5TVEFMTF9UQVJH
RVRfQ01EUwogCW1rZGlyIC1wICQoVEFSR0VUX0RJUikvaG9tZQogCW1rZGlyIC1wICQoVEFSR0VU
X0RJUikvc3J2CmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayBiL3BhY2th
Z2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCmluZGV4IDFkNzQ1MmRlMTkuLmU0YTgxMTQyMjEgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCisrKyBiL3BhY2thZ2Uvc3lzdGVtZC9z
eXN0ZW1kLm1rCkBAIC03MzksMTIgKzczOSw2IEBAIGRlZmluZSBTWVNURU1EX1JNX0NBVEFMT0df
VVBEQVRFX1NFUlZJQ0UKIGVuZGVmCiBTWVNURU1EX1JPT1RGU19QUkVfQ01EX0hPT0tTICs9IFNZ
U1RFTURfUk1fQ0FUQUxPR19VUERBVEVfU0VSVklDRQogCi1kZWZpbmUgU1lTVEVNRF9DUkVBVEVf
VE1QRklMRVNfSE9PSwotCUhPU1RfU1lTVEVNRF9UTVBGSUxFUz0kKEhPU1RfRElSKS9iaW4vc3lz
dGVtZC10bXBmaWxlcyBcCi0JCSQoU1lTVEVNRF9QS0dESVIpL2Zha2Vyb290X3RtcGZpbGVzLnNo
ICQoVEFSR0VUX0RJUikKLWVuZGVmCi1TWVNURU1EX1JPT1RGU19QUkVfQ01EX0hPT0tTICs9IFNZ
U1RFTURfQ1JFQVRFX1RNUEZJTEVTX0hPT0sKLQogZGVmaW5lIFNZU1RFTURfUFJFU0VUX0FMTAog
CSQoSE9TVF9ESVIpL2Jpbi9zeXN0ZW1jdGwgLS1yb290PSQoVEFSR0VUX0RJUikgcHJlc2V0LWFs
bAogZW5kZWYKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
