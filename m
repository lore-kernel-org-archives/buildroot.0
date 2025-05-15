Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BF7C3ABC3
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 06:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F202941557;
	Thu, 15 May 2025 06:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZArpdIBVB4t; Thu, 15 May 2025 06:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2697441547
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2697441547;
	Thu, 15 May 2025 06:05:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BF6D153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1190A40D99
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebxseEOt2ppW for <buildroot@buildroot.org>;
 Thu, 15 May 2025 06:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D79C414F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D79C414F5
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D79C414F5
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:05:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a0bcb1f1afso80165f8f.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 23:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747289137; x=1747893937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RjiTLnnTGHsEFtCgDCo3rtD/uhEn4St+Dw8PPwILzf0=;
 b=K/2zV5+9+NLqI5I28ZaOImsGc9anFsju3dvydEU0Qvp/luu8HblNxmygy4aEpbkObL
 Wn5IKL+K8CPOpTFhAMJ/UgFTYIDXKBMuY1CvUeg3PnZJ+d/M092/5QcJ7hCr7eb4p8dY
 E/g096yXXga1Xe3HYO9lBgIzwYQA7ArCdQCVdtXBTaJTgIdv8yKujRTIu5V4u11OeMrI
 B77MLemnPuSgbZYXph4ZULUPKCGN6anuqUBgDLo0nLw2cVUQN8g5O2bzxZrcgYgDe2wV
 Q7hKrumU6L/p188PMS3MrZNUFs5uFMPksKmpx8802qqiH4s6RRbhGrLXBmG8N7SwtX3S
 +laQ==
X-Gm-Message-State: AOJu0YxOdGvA63i8fYeUHtxxqBRUTVLPRhoa8PJLOB0Y/EApPQllDaxM
 4oPJJUgDA9zDPFCfVghG2DN0ZCGMuOrV0GDqEJ07OTLn2hOPh7/41D+3kxYxFl0=
X-Gm-Gg: ASbGncs2Vl1VG0EBm1DYR+P1WFlUR49Gg1WeNzRkZYcvv2vMo7LDfoD1wQsrv2fIduw
 QtWcU+vS8wAt3vMvdJuO7qRrM9q3mULfOToGL3BmYGPctYIls2M+zZgaKOYHLADpuTQFh9Rd8vL
 ggVT5ymPpeYbCHpPS8FA2vmymfLevZrkGEeRxWv0z1e48MurdaLeTyzUWLstAUsnFTyoM32r5/I
 P0tvCl8cJTlxnaU14T1l7thYtet7jw/ZEKVVpXwinaCsOZVC0mpC2t0Yxb9xkNEU0eT0afrULmW
 U0nGIjLOD73eB3Mwb5KbkZVk6FhOif+5SXF271VbKuhzJq4RGndOT6K7G2sgrZu62aWS6Js9usZ
 5tNRTtCA99fEckIuC2c7M5Ts=
X-Google-Smtp-Source: AGHT+IG5tG8LJ/Nbjyd370mo7O/y78e9jAsv4zfAJ9f7Dvjf9wiDUMhdppdFPoOQKZFzspbXL260QA==
X-Received: by 2002:a05:600c:3c8c:b0:442:e608:12a6 with SMTP id
 5b1f17b1804b1-442f20bfcc8mr21529145e9.1.1747289136983; 
 Wed, 14 May 2025 23:05:36 -0700 (PDT)
Received: from archlinux.. (etr91-h01-123.dsl.sta.abo.bbox.fr.
 [176.148.127.123]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3380615sm54837285e9.16.2025.05.14.23.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 23:05:36 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Thu, 15 May 2025 08:05:28 +0200
Message-ID: <20250515060528.1355475-3-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515060528.1355475-1-gael.portay+rtone@gmail.com>
References: <20250515060528.1355475-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747289137; x=1747893937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjiTLnnTGHsEFtCgDCo3rtD/uhEn4St+Dw8PPwILzf0=;
 b=PlVEc88HjfgC7wv3bedvri6Hhwjcosh2fqzc4e8qen5nDLlEtlLGf7EReXw2ij9O3A
 EI+2+hJ5+7mvCp2tDTmGEkFf62nbMrNza3/LKz7wnBvTnELS0D/yMHGs/PYjbuYvixq6
 s/Zh+gvK/D5wQqOF+WXW6QdWp++twfk4PzBUrxeopwoLdBUBP3RV8+AE6qWbVtanZiDw
 c4j0y8xzkGdzlzKc8NRLuZ1nv322FouYDzQwqNdmawVqgTG9hNJI3PlH7OB57C5ag08S
 EHYmaw7MpPtJh8yEh/tJDIqAoO6o3ClUwuANfja+p02lWFgbUyocyfWfR3kl2cF8BFFd
 tB8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PlVEc88H
Subject: [Buildroot] [PATCH v2 2/2] package/mesa3d: update vc4/v3d drivers
 help messages
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

VGhpcyB1cGRhdGVzIHRoZSBWQzQvVjNEIGRyaXZlciBtZXNzYWdlcyB3aXRoIHRoZSBhZGRpdGlv
biBvZiB0aGUKY3VycmVudCBzdXBwb3J0ZWQgaGFyZHdhcmVzIChWaWRlb0NvcmUgYW5kIFJhc3Bi
ZXJyeSBQaSkuCgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25l
QGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL21lc2EzZC9Db25maWcuaW4gfCA1ICsrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgppbmRl
eCBkZDAxNmM4YjBmLi4zN2QyMjIxOTQ2IDEwMDY0NAotLS0gYS9wYWNrYWdlL21lc2EzZC9Db25m
aWcuaW4KKysrIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCkBAIC0yNDgsNyArMjQ4LDcgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9WM0QKIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1ZDNCAjIHJ1bnRpbWUKIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0wKIAloZWxwCi0JICBEcml2ZXIgZm9yIEJyb2FkY29t
IFZDNiAocnBpNCkgR1BVcyAobmVlZHMgdmM0KS4KKwkgIERyaXZlciBmb3IgQnJvYWRjb20gVkM2
LzcgKHJwaTQvNSkgR1BVcyAobmVlZHMgdmM0KS4KIAogCSAgSXQgcmVxdWlyZXMgYSBrZXJuZWwg
NC4xOCsgd2l0aCBEUk0gVjNEIHN1cHBvcnQgZW5hYmxlZDoKIApAQCAtMjYzLDcgKzI2Myw4IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVkM0CiAJc2VsZWN0IEJS
Ml9QQUNLQUdFX0xJQkRSTV9WQzQKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9F
R0wKIAloZWxwCi0JICBEcml2ZXIgZm9yIEJyb2FkY29tIFZDNCAocnBpMi8zKSBHUFVzLgorCSAg
RHJpdmVyIGZvciBCcm9hZGNvbSBWQzQgKHJwaTAvMS8yLzMpIEdQVXMuCisKIAkgIEl0IHJlcXVp
cmVzIGEgdmFuaWxsYSA0LjUrIGtlcm5lbCB3aXRoIGRybSB2YzQgKG9wZW4pIHN1cHBvcnQuCiAK
IGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVklSR0wKLS0gCjIuNDku
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
