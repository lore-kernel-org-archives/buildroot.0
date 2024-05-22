Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A11C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64AA7820BE;
	Wed, 22 May 2024 07:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zvXywHWS-ou; Wed, 22 May 2024 07:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C9881F8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C9881F8A;
	Wed, 22 May 2024 07:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 561B31C584B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CE978201B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYaDKgeVP3c4 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48AC2819BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AC2819BC
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48AC2819BC
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so13114812a12.2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361370; x=1716966170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC+7BN3SYtiVf8WzgBwWyUmb3uS6MMYR6Bt9YkUNYHI=;
 b=HKIm4Hm7uGJeVUm+bTDudauHihIAf2oLO4piaKx6JdvNoHvYkITIL7lOIYmgPv6GtG
 qSlgNifc6BuI5oyN9+ERaiwtNgDD85d8vrlopazdWl5yoHviRgLjIot/Lw/3xugGncup
 J8ZcET2fDIlUxiAioTrplkZk8AcE8kTmkrU7wFjj/RPRpswXQh/m5UCfnkibfHmRLwmj
 7mFzq1/nDv4b0x+v3cocdK+uot68/IFNDZPNx3fmXlof1QEFyREd4foUsrMkbPeV2yj6
 CfJs89zMX9blGvuhSwUWnyATiarZm8SQC26kY5EQTq6X5OICuFmmTapJAgUKC9wK9BWF
 sO6Q==
X-Gm-Message-State: AOJu0YxtbB8mTb+sUbC5WYYQEXwEF/0z+YPU+64g6PSX73EOySBWBFn5
 k2X7ArYh/A00G/OTSj6C56Wj5EjJ7q18bQDyjgS4RB1znADWrx+fOoeRTwqL3P6tIzYuSODQUV1
 hoxs=
X-Google-Smtp-Source: AGHT+IGGhjMhvYLH4INcLF0XuW1TKrzuSDpM7Ew3op2u+00yxfI9HMlA/7G8uAn4u0BSxcO5G9FDOQ==
X-Received: by 2002:a05:6402:11c6:b0:578:34f8:cc04 with SMTP id
 4fb4d7f45d1cf-57834f8cc0amr949552a12.4.1716361370231; 
 Wed, 22 May 2024 00:02:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:23 +0200
Message-ID: <20240522070238.3282121-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361370; x=1716966170;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZC+7BN3SYtiVf8WzgBwWyUmb3uS6MMYR6Bt9YkUNYHI=;
 b=jEHlXnkQHklw0ixe39mifTMLfl3nBiDSpLVn2c/3kdfe43MY+TQvZS16MiY+ggvHgp
 P7lMK9W8ZBsfUL1Sf/3Fa1/mtbyLEB8rY81MZuekmNguUjfjiX0i9rZkX+soB1eopwv+
 03Hj8XLL5C2VIUAYgGOvgSAYFv2JhPqg4wYeA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jEHlXnkQ
Subject: [Buildroot] [PATCH v2 04/18] package/alsa-lib: update the patch to
 be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb21taXQgYWxsb3dzIHRoZSBwYWNrYWdlIHBhdGNoIHRvIGJlIGFwcGxpZWQgd2l0aCBm
dXp6IGZhY3RvciAwLgpUaGUgZnV6eiBmYWN0b3Igc3BlY2lmaWVzIGhvdyBtYW55IGxpbmVzIG9m
IHRoZSBwYXRjaCBjYW4gYmUgaW5leGFjdGx5Cm1hdGNoZWQsIHNvIHRoZSB2YWx1ZSAwIHJlcXVp
cmVzIGFsbCBsaW5lcyB0byBiZSBleGFjdGx5IG1hdGNoZWQuCgpTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogLi4u
MDEtRG9uLXQtdXNlLWZvcmstb24tbm9NTVUtcGxhdGZvcm1zLnBhdGNoIHwgMTkgKysrKysrKysr
KystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hbHNhLWxpYi8wMDAxLURvbi10LXVzZS1mb3JrLW9u
LW5vTU1VLXBsYXRmb3Jtcy5wYXRjaCBiL3BhY2thZ2UvYWxzYS1saWIvMDAwMS1Eb24tdC11c2Ut
Zm9yay1vbi1ub01NVS1wbGF0Zm9ybXMucGF0Y2gKaW5kZXggMGQyYjQ3OTUzNGEwLi44N2FkZDlm
ZjU2NjYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYWxzYS1saWIvMDAwMS1Eb24tdC11c2UtZm9yay1v
bi1ub01NVS1wbGF0Zm9ybXMucGF0Y2gKKysrIGIvcGFja2FnZS9hbHNhLWxpYi8wMDAxLURvbi10
LXVzZS1mb3JrLW9uLW5vTU1VLXBsYXRmb3Jtcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NDFjMDI5NzU1NTAyYWNmMDFlZDYzNGRiNDM3YWMwNmQwOWJlNmM0MSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZmZjNTY3Yjc5MDAwNTg1MGM1NjFmOWY2NTkwYjA2OWI2MWY1YmEyMCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+CiBEYXRlOiBGcmksIDEzIEFwciAyMDE4IDA5OjAyOjM3ICsw
MjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHVzZSBmb3JrKCkgb24gbm9NTVUgcGxhdGZvcm1z
CkBAIC0xMiwxOCArMTIsMjEgQEAgU2lnbmVkLW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5r
cmF1c2VAZW1iZWRkZWQucm9ja3M+CiBVcHN0cmVhbTogaHR0cDovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9waXBlcm1haWwvYWxzYS1kZXZlbC8yMDE4LU5vdmVtYmVyLzE0MTM3Ni5odG1sCiBb
QmVybmQ6IHVwZGF0ZSBwYXRjaCBmb3IgMS4yLjQgJiAxLjIuN10KIFNpZ25lZC1vZmYtYnk6IEJl
cm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KK1tEYXJpbzogbWFrZSB0aGUgcGF0
Y2ggdG8gYmUgYXBwbGllZCB3aXRoIGZ1enogZmFjdG9yIDBdCitTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CisKIC0tLQog
IGNvbmZpZ3VyZS5hYyAgICAgICAgIHwgIDIgKysKICBzcmMvcGNtL3BjbV9kaXJlY3QuYyB8IDEw
ICsrKysrKysrKy0KICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXgg
Y2NlMTk1YWUuLjBjODUyNDM0IDEwMDY0NAoraW5kZXggN2ExNTJhNGFiZDIwLi4zY2Y4OGMzN2Ri
NTYgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTUy
LDYgKzUyLDggQEAgZG5sIENoZWNrcyBmb3IgbGlicmFyeSBmdW5jdGlvbnMuCi0gQUNfQ0hFQ0tf
RlVOQ1MoW3VzZWxvY2FsZV0pCi0gQUNfQ0hFQ0tfRlVOQ1MoW2VhY2Nlc3NdKQorQEAgLTU2LDYg
KzU2LDggQEAgQUNfQ0hFQ0tfRlVOQ1MoW2VhY2Nlc3NdKQorIGRubCBFbmFibGUgbGFyZ2VmaWxl
IHN1cHBvcnQKKyBBQ19TWVNfTEFSR0VGSUxFCiAgCiArQUNfQ0hFQ0tfRlVOQyhbZm9ya10pCiAr
CkBAIC0zMSwxMCArMzQsMTAgQEAgaW5kZXggY2NlMTk1YWUuLjBjODUyNDM0IDEwMDY0NAogIEFD
X1NVQlNUKExJQlRPT0xfVkVSU0lPTl9JTkZPKQogIAogZGlmZiAtLWdpdCBhL3NyYy9wY20vcGNt
X2RpcmVjdC5jIGIvc3JjL3BjbS9wY21fZGlyZWN0LmMKLWluZGV4IDJiMDdlZmY5Li40ZGMzZWEy
NiAxMDA2NDQKK2luZGV4IGU1M2U1OTIzODExOS4uY2Y5NGM3YzFkYmYwIDEwMDY0NAogLS0tIGEv
c3JjL3BjbS9wY21fZGlyZWN0LmMKICsrKyBiL3NyYy9wY20vcGNtX2RpcmVjdC5jCi1AQCAtNDM3
LDEzICs0MzcsMjEgQEAgaW50IHNuZF9wY21fZGlyZWN0X3NlcnZlcl9jcmVhdGUoc25kX3BjbV9k
aXJlY3RfdCAqZG1peCkKK0BAIC00NDIsMTMgKzQ0MiwyMSBAQCBpbnQgc25kX3BjbV9kaXJlY3Rf
c2VydmVyX2NyZWF0ZShzbmRfcGNtX2RpcmVjdF90ICpkbWl4KQogIAkJY2xvc2UoZG1peC0+c2Vy
dmVyX2ZkKTsKICAJCXJldHVybiByZXQ7CiAgCX0KQEAgLTU4LDUgKzYxLDUgQEAgaW5kZXggMmIw
N2VmZjkuLjRkYzNlYTI2IDEwMDY0NAogIAkJCXNlcnZlcl9qb2IoZG1peCk7CiAgCQlfZXhpdChF
WElUX1NVQ0NFU1MpOwogLS0gCi0yLjE0LjMKKzIuNDMuMAogCi0tIAoyLjQzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
