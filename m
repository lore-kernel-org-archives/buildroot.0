Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFECBC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 14:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60EA940165;
	Thu,  9 Nov 2023 14:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60EA940165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUo_zqF8rJav; Thu,  9 Nov 2023 14:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18FE3416D2;
	Thu,  9 Nov 2023 14:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18FE3416D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6526F1BF31F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 14:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E303613B3
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 14:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E303613B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JB8EV4fiujw4 for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 14:20:33 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02FAA613B0
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 14:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02FAA613B0
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507a5f2193bso1025462e87.1
 for <buildroot@buildroot.org>; Thu, 09 Nov 2023 06:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699539630; x=1700144430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g8Di3Q0wrSmFTH1ju3Uhf5sZploBfYXqDDsBZuxujCE=;
 b=fxC1m9qsPC1O+IoLO+WxbzDGUUAUKUbUgl8PLIiB+QvhHE0uPxegDJA5ITdB/ouXDv
 Em8qcj10b2ChD3UGfCRC3OJHaqoTjk4GFgRjf9+WYYk896KWEYnkbikcK/P7aZU/Jw4D
 7vA/xjCwWleGQngcHrjTrrTGETAxjYjIdrKufvnJmClj2bEK/carkeUz/f2vywQ+OpRa
 ufzHM2GGgb5ktWNn6o78kin0/tWlHl2jDwCJuyJQs/n9QLn8m1i5ifwUfLyP9b7j5aAV
 rtbPGz1AGdk/APjJlKGoxc1rONkh+++PKUr6CobLP0OM6yM1rJwgnGdKoAJhJu45wJ0a
 qylQ==
X-Gm-Message-State: AOJu0Yym89eI+cMVHE3FRxSpfSxjqwbyHcW7g/o9ucHTHd6UjxOJUuYF
 2LzO04Kqny4+7HF8VQ6WKR+hX1r9t6cdT5Rc5TI=
X-Google-Smtp-Source: AGHT+IFbCjIiu5IkLnpN23r75AT7iypRYu9i2ZeYuEy/rHbVydYrtXlCdBgUCcFsVK5ID/evNckOqA==
X-Received: by 2002:a05:6512:ac2:b0:501:b929:48af with SMTP id
 n2-20020a0565120ac200b00501b92948afmr1040229lfu.34.1699539630547; 
 Thu, 09 Nov 2023 06:20:30 -0800 (PST)
Received: from nola.getinternet.no ([84.209.57.13])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a056512250700b0050794b05c8asm1072864lfb.42.2023.11.09.06.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 06:20:30 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  9 Nov 2023 15:20:09 +0100
Message-Id: <20231109142009.3490104-2-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109142009.3490104-1-jonhenrik@qbee.io>
References: <20231109142009.3490104-1-jonhenrik@qbee.io>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1699539630; x=1700144430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8Di3Q0wrSmFTH1ju3Uhf5sZploBfYXqDDsBZuxujCE=;
 b=Jajvv0FvrWrdJQj24N2bglOnNZwIrr2wZoSYDa4ujiOyXa8aj+nLPAaLN/n6WDUfgm
 8zSo7VpCnXPlxQNoIPpbgET0phslOIkxf01NkNRtUbdLiUO84UjVod5U3hKIRG3LKswN
 PqB5V+AwGG7eSNoYaxv9D+gs5SCJlFgimeGTw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=qbee.io header.i=@qbee.io
 header.a=rsa-sha256 header.s=google header.b=Jajvv0Fv
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGQgcWJlZS1hZ2VudCwgYW4gb3BlbiBzb3VyY2UgZGV2aWNlIG1hbmFnZW1l
bnQgc29mdHdhcmUKZm9yIExpbnV4IGRldmljZXMuCgpTaWduZWQtb2ZmLWJ5OiBKb24gSGVucmlr
IEJqw7hybnN0YWQgPGpvbmhlbnJpa0BxYmVlLmlvPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMyArKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluICAgICAgIHwgMTcgKysrKysr
KysrKysrCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgIDIgKysKIHBhY2th
Z2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcWJlZS1hZ2VudC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIv
REVWRUxPUEVSUwppbmRleCAxMjI1N2ZhZThjLi44OGQ0YWEyMDVhIDEwMDY0NAotLS0gYS9ERVZF
TE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTE2MTUsNiArMTYxNSw5IEBAIEY6CXBhY2thZ2Uv
c2RidXNwbHVzLwogTjoJSm9uIFJpbmdsZSA8anJpbmdsZUBncmlkcG9pbnQuY29tPgogRjoJcGFj
a2FnZS9tYnBvbGwvCiAKK046CUpvbiBIZW5yaWsgQmrDuHJuc3RhZCA8am9uaGVucmlrQHFiZWUu
aW8+CitGOglwYWNrYWdlL3FiZWUtYWdlbnQvCisKIE46CUpvbmF0aGFuIEJlbiBBdnJhaGFtIDx5
YmFAdGtvcy5jby5pbD4KIEY6CWFyY2gvQ29uZmlnLmluLnh0ZW5zYQogRjoJcGFja2FnZS9hdXRv
ZnMvCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmlu
ZGV4IGNlNDZkMzBmZWQuLmYxNDZjOTY0NjQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmlu
CisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0yNzQxLDYgKzI3NDEsNyBAQCBtZW51ICJTeXN0
ZW0gdG9vbHMiCiAJc291cmNlICJwYWNrYWdlL3Byb2NzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvcHNtaXNjL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHdnZW4vQ29uZmlnLmlu
IgorCXNvdXJjZSAicGFja2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2th
Z2UvcXVvdGEvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9xdW90YXRvb2wvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS9yYXVjL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cWJlZS1hZ2VudC9Db25maWcuaW4gYi9wYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjA4ZjYwMzhjN2EKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluCkBAIC0wLDAgKzEsMTcgQEAKK2Nv
bmZpZyBCUjJfUEFDS0FHRV9RQkVFX0FHRU5UCisJYm9vbCAicWJlZS1hZ2VudCIKKwlzZWxlY3Qg
QlIyX1BBQ0tBR0VfT1BFTlNTSCBpZiAhQlIyX1BBQ0tBR0VfRFJPUEJFQVJfQ0xJRU5UICMgcnVu
dGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9JUFRBQkxFUyAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUyAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfU0hBRE9XICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9CQVNIICMgcnVudGltZQor
CWhlbHAKKwkgIFFiZWUgaXMgYSBkZXZpY2UgbWFuYWdlbWVudCBwbGF0Zm9ybSB0aGF0IGNvbXBy
aXNlCisJICBvZiBhbiBvcGVuLXNvdXJjZSBhZ2VudCBhbmQgYSBob3N0ZWQgU2FhUyBiYWNrZW5k
LgorCSAgVGhpcyBjb25maWcgaW5zdGFsbHMgcHJlLWJ1aWx0IHN0YXRpYyBiaW5hcmllcyBtYWRl
CisJICB3aXRoIHRoZSBvZmZpY2lhbCBwdWJsaWMgc2lnbmluZyBrZXkgZm9yIHFiZWUuaW8uIFRo
ZQorCSAgYmluYXJpZXMgd2lsbCB3b3JrIHNlYW1sZXNzbHkgd2l0aCB0aGUgcWJlZS5pbyBkZXZp
Y2UKKwkgIG1hbmFnZW1lbnQgYmFja2VuZC4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL3FiZWUt
aW8vcWJlZS1hZ2VudAorCSAgaHR0cHM6Ly9xYmVlLmlvCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Fi
ZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQu
aGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iN2UzMTE0MDVmCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaApAQCAt
MCwwICsxLDIgQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIGVkY2YzMTljNGNlMTdl
OTg0NGRmNTk4ZmE3OTZhYTg3MzAzYTFiZjIzODI5OWRiZWViNDFjOTRmZjVkZTVlMWQgIHFiZWUt
YWdlbnQtMjAyMy40NC50YXIuZ3oKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVl
LWFnZW50Lm1rIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYWRlZDZiNzJmNAotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rCkBAIC0wLDAgKzEsNDIgQEAKKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHFiZWUtYWdlbnQgcGFja2FnZQorIworIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKKworUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyMy40NAorUUJFRV9BR0VO
VF9TSVRFID0gaHR0cHM6Ly9jZG4ucWJlZS5pby9zb2Z0d2FyZS9xYmVlLWFnZW50LyQoUUJFRV9B
R0VOVF9WRVJTSU9OKS9iaW5hcmllcworUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAor
CitpZmVxICgkKEJSMl9hcm0pLHkpCitRQkVFX0FHRU5UX0dPQVJDSCA9IGFybQorZWxzZSBpZmVx
ICgkKEJSMl9hYXJjaDY0KSx5KQorUUJFRV9BR0VOVF9HT0FSQ0ggPSBhcm02NAorZWxzZSBpZmVx
ICgkKEJSMl9pMzg2KSx5KQorUUJFRV9BR0VOVF9HT0FSQ0ggPSAzODYKK2Vsc2UgaWZlcSAoJChC
UjJfeDg2XzY0KSx5KQorUUJFRV9BR0VOVF9HT0FSQ0ggPSBhbWQ2NAorZW5kaWYKKworUUJFRV9B
R0VOVF9TVFJJUF9DT01QT05FTlRTID0gMgorCitkZWZpbmUgUUJFRV9BR0VOVF9JTlNUQUxMX1RB
UkdFVF9DTURTCisJJChJTlNUQUxMKSAtbSAwNzU1ICQoQEQpL3FiZWUtYWdlbnQtJChRQkVFX0FH
RU5UX0dPQVJDSCkgJChUQVJHRVRfRElSKS91c3IvYmluL3FiZWUtYWdlbnQKKwkkKElOU1RBTEwp
IC1EIC1tIDA2MDAgJChARCkvc2hhcmUvc3NsL2NhLmNlcnQgJChUQVJHRVRfRElSKS9ldGMvcWJl
ZS9wcGtleXMvY2EuY2VydAorZW5kZWYKKworZGVmaW5lIFFCRUVfQUdFTlRfSU5TVEFMTF9JTklU
X1NZU1RFTUQKKwkkKElOU1RBTEwpIC1EIC1tIDA2NDQgJChARCkvaW5pdC1zY3JpcHRzL3N5c3Rl
bWQvcWJlZS1hZ2VudC5zZXJ2aWNlIFwKKwkJJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQv
c3lzdGVtL3FiZWUtYWdlbnQuc2VydmljZQorZW5kZWYKKworZGVmaW5lIFFCRUVfQUdFTlRfSU5T
VEFMTF9JTklUX1NZU1YKKwkkKElOU1RBTEwpIC1EIC1tIDc1NSAkKEBEKS9pbml0LXNjcmlwdHMv
c3lzdmluaXQvcWJlZS1hZ2VudCBcCisJCSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TOTlxYmVl
LWFnZW50CitlbmRlZgorCitkZWZpbmUgUUJFRV9BR0VOVF9MSU5VWF9DT05GSUdfRklYVVBTCisJ
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfVFVOKQorZW5kZWYKKworJChldmFsICQo
Z2VuZXJpYy1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
