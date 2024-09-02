Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03C4CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A33D4032F;
	Mon,  2 Sep 2024 20:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvXFba29hJ6S; Mon,  2 Sep 2024 20:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5308940319
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5308940319;
	Mon,  2 Sep 2024 20:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD9711BF8B4
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA87680DA9
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NNw1yZje3fS for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:35:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D07080D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D07080D6C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D07080D6C
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:35:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42bbd3bed1bso4553995e9.1
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 13:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725309353; x=1725914153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W19N87FuqYls6hH8TLNLGINPXMhpTTPxBLE97FVQ+EI=;
 b=vfQS9OaPQ3BWqgLztvbV2hJCclTrlZEyrsw8AFdH5Qv+vb8VRcYTcBF5Gb4Mv6l/On
 nHePK3PoBAc4FbfXCpYJ+axfz/a95XR0n98DgPUbW1diS+WmaUKaT88VVoe3WaiZHorh
 B+FdZRePl7u78Ul/OdWbasd6kRM0LgnLwJuthzdnVoY5T9zIBfwSnpqWDpKBdLh1kYjw
 QumjRkxy6xNN+pt2tFA2I/hEOxRcA3QeIFGMAbDOkS2j9FPttUGr8+jhsbL67eYWRhCc
 m3z+Ug/PsJKmdphCcz7Fe6NvqIJcWe3Hsxkr20u01GChT8BtZBwz6bXEo+I/br5kF0qc
 th/g==
X-Gm-Message-State: AOJu0Yy09phm7M5OZgv2999q6y9Nqomrv08NrUnSha8Tm9EtEaJi0mEb
 hGu60g3liVtx1jktku9IGY2meoLDyV4+WLFcJ/PClm7OEj9bprzU5ZOEKFW5Jts=
X-Google-Smtp-Source: AGHT+IGGVECpYz7zy33F3c4/Th2ZNnMNFnSo4PvvdzqHw2flpZo0FPFrvDw/BxY6Mw7HQ9wwkSAsHQ==
X-Received: by 2002:a05:600c:4fd6:b0:426:6cd1:d116 with SMTP id
 5b1f17b1804b1-42bbb435e82mr44860805e9.3.1725309352605; 
 Mon, 02 Sep 2024 13:35:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbc8de253sm96609475e9.0.2024.09.02.13.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:35:51 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 22:35:32 +0200
Message-ID: <20240902203533.3961108-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902203533.3961108-1-gael.portay@rtone.fr>
References: <20240902203533.3961108-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725309353; x=1725914153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W19N87FuqYls6hH8TLNLGINPXMhpTTPxBLE97FVQ+EI=;
 b=aEKO9B5QDVWRaziAf81MP6k2XkVNa6RNh/XdtNK6BuNLWeCGxNrIbRY6+coUD6+OUE
 XoMDgmBzbEuTvYu9vmxcuTQE2d0XOkHdqyHYHBjmOxQ3RVXO6GH4wsyWnat0hg198GiO
 rcXDLC8LHssNuRyP1MtZH+rfkECYOoxLpEK4EXo+Mi6rpw0QPr2w0ut3tyMMgh5ObYIG
 ibA/mdzUTlei+p1lRVIeuSr/Uarl6z+2SEYWDCcUwUJOn9LjGWqCWZj6tPz7YzsVdC1v
 smi1loVsDV9CNTNdQz9Hxh7Wf/RbZFoMOjR90xIkY6hy4WShnHV6wkLFbvQVm3iGwgHW
 J3Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aEKO9B5Q
Subject: [Buildroot] [PATCH 1/2] linux: add device-tree blob overlays support
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Fiona Klute <fiona.klute@gmx.de>, Michael Walle <michael@walle.cc>,
 Christian Stewart <christian@aperture.us>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGRldmljZS10cmVlIGJsb2Igb3ZlcmxheSBpcyBhbiB1cHN0cmVhbSBmZWF0dXJlOyBvbmUg
Y2FuIGJ1aWxkIGEKLmR0Ym8gZnJvbSAuZHRzbyB0aGFua3MgdG8gY29tbWl0IDM2MzU0N2QyMTkx
YyAoa2J1aWxkOiBBbGxvdyBEVEIKb3ZlcmxheXMgdG8gYnVpbHQgZnJvbSAuZHRzbyBuYW1lZCBz
b3VyY2UgZmlsZXMpWzFdIChsaW51eC02LjEtcmMyKS4KClRoaXMgaW50cm9kdWNlcyB0aGUgdGhy
ZWUgbmV3IGR0Ym8gY29uZmlncyB0byBidWlsZCBpbi10cmVlIG9yCm91dC1vZi10cmVlIGR0Ym9z
LCBhbmQgdG8ga2VlcCB0aGUgZGlyZWN0b3J5IG5hbWUuCgpUaGUgdGhyZWUgY29uZmlncyBhcmUg
dGhlIGVxdWl2YWxlbnQgdG8gZXhpc3RpbmcgZHRzIGNvbmZpZ3M6CiAtIEJSMl9MSU5VWF9LRVJO
RUxfSU5UUkVFX0RUU19PVkVSTEFZX05BTUVTIGlzIGVxdWl2YWxlbnQgdG8KICAgQlIyX0xJTlVY
X0tFUk5FTF9JTlRSRUVfRFRTX05BTUUgKGl0IHRha2VzIGluLXRyZWUgZmlsZXMgcmVsYXRpdmUg
dG8KICAgZHRzIGRpcmVjdG9yeSwgd2l0aG91dCBmaWxlIGV4dGVudGlvbjogaS5lLiB3aXRob3V0
IC5kdHMpCiAtIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19PVkVSTEFZX1BBVEggaXMgZXF1
aXZhbGVudCB0bwogICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCAoaXQgdGFrZXMg
b3V0LW9mLXRyZWUgZmlsZXMgcmVsYXRpdmUKICAgdG8gYnVpbGRyb290IGRpcmVjdG9yeSwgd2l0
aCBmaWxlIGV4dGVudGlvbiAuZHRzbykKIC0gQlIyX0xJTlVYX0tFUk5FTF9EVEJPX0tFRVBfRElS
TkFNRSBpcyBlcXVpdmFsZW50IHRvCiAgIEJSMl9MSU5VWF9LRVJORUxfRFRCX0tFRVBfRElSTkFN
RQoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzM2MzU0N2Qy
MTkxY2JjMzJjYTk1NGJhNzVkNzI5MDg3MTIzOThmZjIKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBP
UlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0tLQogbGludXgvQ29uZmlnLmluIHwgMjQgKysr
KysrKysrKysrKysrKysrKysrKysrCiBsaW51eC9saW51eC5tayAgfCAzNCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9saW51eC9Db25maWcuaW4gYi9saW51eC9Db25maWcuaW4KaW5kZXggNTI2
ZGQ5ZmYwMC4uNDFmNWViMjcxZCAxMDA2NDQKLS0tIGEvbGludXgvQ29uZmlnLmluCisrKyBiL2xp
bnV4L0NvbmZpZy5pbgpAQCAtNDQwLDYgKzQ0MCwzMCBAQCBjb25maWcgQlIyX0xJTlVYX0tFUk5F
TF9EVEJfT1ZFUkxBWV9TVVBQT1JUCiAJICBDaG9vc2UgdGhpcyBvcHRpb24gdG8gc3VwcG9ydCBE
ZXZpY2UgVHJlZSBvdmVybGF5cwogCSAgb24gdGhlIHRhcmdldCBzeXN0ZW0uCiAKK2NvbmZpZyBC
UjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfT1ZFUkxBWV9OQU1FUworCXN0cmluZyAiSW4tdHJl
ZSBEZXZpY2UgVHJlZSBTb3VyY2UgT3ZlcmxheSBmaWxlIG5hbWVzIgorCWRlcGVuZHMgb24gQlIy
X0xJTlVYX0tFUk5FTF9EVEJfT1ZFUkxBWV9TVVBQT1JUCisJaGVscAorCSAgTmFtZSBvZiBpbi10
cmVlIGRldmljZSB0cmVlIHNvdXJjZSBmaWxlLCB3aXRob3V0CisJICB0aGUgdHJhaWxpbmcgLmR0
cy4gWW91IGNhbiBwcm92aWRlIGEgbGlzdCBvZgorCSAgZHRzIGZpbGVzIHRvIGJ1aWxkLCBzZXBh
cmF0ZWQgYnkgc3BhY2VzLgorCitjb25maWcgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX09W
RVJMQVlfUEFUSAorCXN0cmluZyAiT3V0LW9mLXRyZWUgRGV2aWNlIFRyZWUgU291cmNlIE92ZXJs
YXkgZmlsZSBwYXRocyIKKwloZWxwCisJICBQYXRocyB0byBvdXQtb2YtdHJlZSBEZXZpY2UgVHJl
ZSBTb3VyY2UgT3ZlcmxheSAoLmR0c28pCisJICBhbmQgRGV2aWNlIFRyZWUgU291cmNlIEluY2x1
ZGUgKC5kdHNpKSBmaWxlcywgc2VwYXJhdGVkIGJ5CisJICBzcGFjZXMuIFRoZXNlIGZpbGVzIHdp
bGwgYmUgY29waWVkIHRvIHRoZSBrZXJuZWwgc291cmNlcyBhbmQKKwkgIHRoZSAuZHRzbyBmaWxl
cyB3aWxsIGJlIGNvbXBpbGVkIGZyb20gdGhlcmUuCisKK2NvbmZpZyBCUjJfTElOVVhfS0VSTkVM
X0RUQk9fS0VFUF9ESVJOQU1FCisJYm9vbCAiS2VlcCB0aGUgZGlyZWN0b3J5IG5hbWUgb2YgdGhl
IERldmljZSBUcmVlIE92ZXJsYXkiCisJZGVwZW5kcyBvbiBCUjJfTElOVVhfS0VSTkVMX0RUQl9P
VkVSTEFZX1NVUFBPUlQKKwloZWxwCisJICBJZiBlbmFibGVkLCB0aGUgZGV2aWNlIHRyZWUgYmxv
YiBvdmVybGF5cyBrZWVwIHRoZWlyCisJICBkaXJlY3RvcnkgcHJlZml4ZXMgd2hlbiB0aGV5IGdl
dCBjb3BpZWQgdG8gdGhlCisJICBvdXRwdXQgaW1hZ2UgZGlyZWN0b3J5IG9yIHRoZSB0YXJnZXQg
ZGlyZWN0b3J5LgorCiBlbmRpZgogCiBjb25maWcgQlIyX0xJTlVYX0tFUk5FTF9JTlNUQUxMX1RB
UkdFVApkaWZmIC0tZ2l0IGEvbGludXgvbGludXgubWsgYi9saW51eC9saW51eC5tawppbmRleCAx
NmQ5ZjE5NDcwLi5kM2VhNDI3MzM2IDEwMDY0NAotLS0gYS9saW51eC9saW51eC5taworKysgYi9s
aW51eC9saW51eC5tawpAQCAtMjAyLDYgKzIwMiwxOCBAQCBMSU5VWF9EVFNfTkFNRSArPSAkKGJh
c2VuYW1lICQoZmlsdGVyICUuZHRzLCQobm90ZGlyICQoY2FsbCBxc3RyaXAsJChCUjJfTElOVVhf
SwogCiBMSU5VWF9EVEJTID0gJChhZGRzdWZmaXggLmR0YiwkKExJTlVYX0RUU19OQU1FKSkKIAor
aWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX0RUQl9PVkVSTEFZX1NVUFBPUlQpLHkpCitMSU5VWF9E
VFNfT1ZFUkxBWV9OQU1FUyArPSAkKGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9JTlRS
RUVfRFRTX09WRVJMQVlfTkFNRVMpKQorCisjIFdlIGtlZXAgb25seSB0aGUgLmR0c28gZmlsZXMs
IHNvIHRoYXQgdGhlIHVzZXIgY2FuIHNwZWNpZnkgYm90aCAuZHRzbworIyBhbmQgLmR0c2kgZmls
ZXMgaW4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX09WRVJMQVlfUEFUSC4gQm90aCB3aWxs
IGJlCisjIGNvcGllZCB0byBhcmNoLzxhcmNoPi9ib290L2R0cywgYnV0IG9ubHkgdGhlIC5kdHNv
IGZpbGVzIHdpbGwKKyMgYWN0dWFsbHkgYmUgZ2VuZXJhdGVkIGFzIC5kdGJvLgorTElOVVhfRFRT
X09WRVJMQVlfTkFNRVMgKz0gJChiYXNlbmFtZSAkKGZpbHRlciAlLmR0c28sJChub3RkaXIgJChj
YWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19PVkVSTEFZX1BBVEgpKSkp
KQorCitMSU5VWF9EVEJPUyA9ICQoYWRkc3VmZml4IC5kdGJvLCQoTElOVVhfRFRTX09WRVJMQVlf
TkFNRVMpKQorZW5kaWYKKwogaWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX0lNQUdFX1RBUkdFVF9D
VVNUT00pLHkpCiBMSU5VWF9JTUFHRV9OQU1FID0gJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9L
RVJORUxfSU1BR0VfTkFNRSkpCiBMSU5VWF9UQVJHRVRfTkFNRSA9ICQoY2FsbCBxc3RyaXAsJChC
UjJfTElOVVhfS0VSTkVMX0lNQUdFX1RBUkdFVF9OQU1FKSkKQEAgLTQ2MiwxMCArNDc0LDI2IEBA
IGRlZmluZSBMSU5VWF9JTlNUQUxMX0RUQgogCQkJJCgxKS8kKGlmICQoQlIyX0xJTlVYX0tFUk5F
TF9EVEJfS0VFUF9ESVJOQU1FKSwkKGR0YiksJChub3RkaXIgJChkdGIpKSkKIAkpCiBlbmRlZgor
ZGVmaW5lIExJTlVYX0JVSUxEX0RUQk8KKwkkKExJTlVYX01BS0VfRU5WKSAkKEJSMl9NQUtFKSAk
KExJTlVYX01BS0VfRkxBR1MpIC1DICQoQEQpICQoTElOVVhfRFRCT1MpCitlbmRlZgorZGVmaW5l
IExJTlVYX0lOU1RBTExfRFRCTworCSQoZm9yZWFjaCBkdGJvLCQoTElOVVhfRFRCT1MpLCBcCisJ
CWluc3RhbGwgLUQgXAorCQkJJCh3aWxkY2FyZCAkKExJTlVYX0FSQ0hfUEFUSCkvYm9vdC9kdHMv
JChkdGJvKSkgXAorCQkJJCgxKS8kKGlmICQoQlIyX0xJTlVYX0tFUk5FTF9EVEJPX0tFRVBfRElS
TkFNRSksJChkdGJvKSwkKG5vdGRpciAkKGR0Ym8pKSkKKwkpCitlbmRlZgogZW5kaWYgIyBCUjJf
TElOVVhfS0VSTkVMX0FQUEVOREVEX0RUQgogZW5kaWYgIyBCUjJfTElOVVhfS0VSTkVMX0RUQl9J
U19TRUxGX0JVSUxUCiBlbmRpZiAjIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQKIAoraWZl
cSAoJChCUjJfTElOVVhfS0VSTkVMX0RUU19PVkVSTEFZX1NVUFBPUlQpLHkpCitkZWZpbmUgTElO
VVhfQlVJTERfRFRCTworCSQoTElOVVhfTUFLRV9FTlYpICQoQlIyX01BS0UpICQoTElOVVhfTUFL
RV9GTEFHUykgLUMgJChARCkgJChMSU5VWF9EVEJPUykKK2VuZGVmCitlbmRpZiAjIEJSMl9MSU5V
WF9LRVJORUxfRFRTX09WRVJMQVlfU1VQUE9SVAorCiBpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxf
QVBQRU5ERURfRFRCKSx5KQogIyBkdGJzIG1vdmVkIGZyb20gYXJjaC8kQVJDSC9ib290IHRvIGFy
Y2gvJEFSQ0gvYm9vdC9kdHMgc2luY2UgMy44LXJjMQogZGVmaW5lIExJTlVYX0FQUEVORF9EVEIK
QEAgLTUwOCwxMCArNTM2LDE0IEBAIGRlZmluZSBMSU5VWF9CVUlMRF9DTURTCiAJJChmb3JlYWNo
IGR0cywkKGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEgpKSwg
XAogCQljcCAtZiAkKGR0cykgJChMSU5VWF9BUkNIX1BBVEgpL2Jvb3QvZHRzLwogCSkKKwkkKGZv
cmVhY2ggZHRzbywkKGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX09W
RVJMQVlfUEFUSCkpLCBcCisJCWNwIC1mICQoZHRzbykgJChMSU5VWF9BUkNIX1BBVEgpL2Jvb3Qv
ZHRzLworCSkKIAkkKExJTlVYX01BS0VfRU5WKSAkKEJSMl9NQUtFKSAkKExJTlVYX01BS0VfRkxB
R1MpIC1DICQoQEQpIGFsbAogCSQoTElOVVhfTUFLRV9FTlYpICQoQlIyX01BS0UpICQoTElOVVhf
TUFLRV9GTEFHUykgLUMgJChARCkgJChMSU5VWF9UQVJHRVRfTkFNRSkKIAkkKExJTlVYX0JVSUxE
X0RUQikKIAkkKExJTlVYX0FQUEVORF9EVEIpCisJJChMSU5VWF9CVUlMRF9EVEJPKQogZW5kZWYK
IAogaWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX0FQUEVOREVEX0RUQikseSkKQEAgLTUzMyw2ICs1
NjUsNyBAQCBpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQpLHkpCiBkZWZp
bmUgTElOVVhfSU5TVEFMTF9LRVJORUxfSU1BR0VfVE9fVEFSR0VUCiAJJChjYWxsIExJTlVYX0lO
U1RBTExfSU1BR0UsJChUQVJHRVRfRElSKS9ib290KQogCSQoY2FsbCBMSU5VWF9JTlNUQUxMX0RU
QiwkKFRBUkdFVF9ESVIpL2Jvb3QpCisJJChjYWxsIExJTlVYX0lOU1RBTExfRFRCTywkKFRBUkdF
VF9ESVIpL2Jvb3QpCiBlbmRlZgogZW5kaWYKIApAQCAtNTQ3LDYgKzU4MCw3IEBAIGVuZGVmCiBk
ZWZpbmUgTElOVVhfSU5TVEFMTF9JTUFHRVNfQ01EUwogCSQoY2FsbCBMSU5VWF9JTlNUQUxMX0lN
QUdFLCQoQklOQVJJRVNfRElSKSkKIAkkKGNhbGwgTElOVVhfSU5TVEFMTF9EVEIsJChCSU5BUklF
U19ESVIpKQorCSQoY2FsbCBMSU5VWF9JTlNUQUxMX0RUQk8sJChCSU5BUklFU19ESVIpKQogZW5k
ZWYKIAogaWZlcSAoJChCUjJfU1RSSVBfc3RyaXApLHkpCi0tIAoyLjQ2LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
