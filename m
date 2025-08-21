Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9159BCA0EF8
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 12:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50BF683F3F;
	Thu, 21 Aug 2025 12:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1PcLnSzp2VQ; Thu, 21 Aug 2025 12:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8068A8406A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8068A8406A;
	Thu, 21 Aug 2025 12:02:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 437C97AD
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29FDF4187E
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJTqFbHNEFmu for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 12:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 441B841855
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 441B841855
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 441B841855
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:02:20 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afdf4c4a2beso251167866b.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 05:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755777738; x=1756382538;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYXUSHnDJgGcy7pLSZVAu1FEgvwxrWyydRFooVNfjjU=;
 b=iYVNhcag35S4hBhzaA11lZCu475jyalkgijk/dumoO9sHnGgdVA91e58MG2a7ajKPw
 7zUDm60urCeyIrL86gV1P2wQJZz0+KJA0qIcXj+Vg4iHOLIPpaNVZmWDPxn6ldbh0ihC
 e7AgYetcJjPuYfK9JCnvtKy0hCpQoKfsNkEO4pHAAOEx4gbgrakS4NlFK1WfA/mcaQDA
 /2rkIwzC9m2scTxLpiCuMK7ReflWX3kXCzqu087vquAPjUn5Sy3yBtoBfh/CN/i8sd3w
 SChJSKdl1ylhjfu0+ThCMbLfjJnCrOCPRg0Q22py/myd6pv6OwLx90xdwIoGtE5Rp5O8
 yfxw==
X-Gm-Message-State: AOJu0Yy0fIqgs/JKE5a0cKoqqyt1NojSDqpvQEhRqm3/nA9zixsEklqo
 fqgpTE1Ka6aQgHeqcBOL6Pi+AOTsqwNpm+5/lFD8xDGQYv1hU7NEfyaKvNWCCm3M
X-Gm-Gg: ASbGncsohP+nvEaeV40vesz7sGiqoC/zRIyvEoAmah2Kos1O2+jUPHxGHX7PWvohRdB
 ZKa1F6s5Q8QkPyWiGOA2gquH8WfRYP7sCxlDuqrgINAdU2CjWItTJfdJwYNe8OVvwzr4Mx0FQNN
 yPDyDJtzguDtKHVgY3zPfGWIKC6Igl/zqp2w9jPKm0eywgcBAIX6LT4Xe1SD0EK0g+T30ovvBVH
 XYJqg0vWoZgwSgfTz7fjJ7/xXrwqqRqs81iqDKPMrrRFltOysL5gUSiTEDdiBCjLgpQx7KSbjQ9
 bDRrLG5szZImhhzPfbwFzO1y28VMpcNs2/bVVfo6WZp2y6J2JchXPuEZgi8KdNht4zDLh+/7qxK
 IsI4sDILH+GB79NkKaF9sR+1uTbS5isQSQeZlzK5SP/b83A47ssmLD2m9sQ==
X-Google-Smtp-Source: AGHT+IFJsA1OmZjuzC157XBYtvR7r83L6qnpW5+bFJPBoCYjkVB6DsRCgfNVgK9pNMC00nIqZvBpEw==
X-Received: by 2002:a17:906:f583:b0:af9:3344:56d3 with SMTP id
 a640c23a62f3a-afe0baf76e3mr202552066b.22.1755777737327; 
 Thu, 21 Aug 2025 05:02:17 -0700 (PDT)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded2bad84sm374460466b.16.2025.08.21.05.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 05:02:16 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 14:01:59 +0200
Message-ID: <20250821120159.2156865-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755777738; x=1756382538; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BYXUSHnDJgGcy7pLSZVAu1FEgvwxrWyydRFooVNfjjU=;
 b=Via6YZYmRsCH8xMScGN2w5Wqio1DE9uDsbIrGIPlyckVXWeMwz/jFRp/sOaGeYFhYc
 PO50dUJ8A1iV3xRZQ3fk8KgXt9tkMZQmWyRyVB78PBDVo9CbfaBuaMO+BKXr14XOBFvq
 DpbOU02W/wDjlJ8VFgqRagP/5izPBRMo7lEoNr7UqH1NGyjfyyK02Xapp2bBAEf9mW+k
 KyzosNQTeTXQuRnhJT09qdJonGHS231FPPYuyEh2GIo8qERQHRP0UNp6jWGMw+cu3Dm6
 ptCpNNULsxHOszQHhUE1ZEWhV0BZsQdr28+wRKRQqtF+bKyJS7R4U1myOqjtJxCHs7IH
 ccrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Via6YZYm
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for
 mediatek MT7986 firmware (WiFi)
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGFuIG9wdGlvbiB0byBpbnN0YWxsIHRoZSBmaXJtd2FyZSBmaWxlcyBmb3IgV2lmaSBpbiBN
ZWRpYXRlawpNVDc5ODYgU09DLCB3aGljaCBhcmUgcHJlc2VudCBvbiBCYW5hbmFQaSByMy4KClNp
Z25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0KIHBh
Y2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgfCAgNSArKysrKwogcGFja2Fn
ZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayB8IDE2ICsrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGludXgtZmlybXdhcmUvQ29uZmlnLmluIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcu
aW4KaW5kZXggNzc4ZGZlZjhhMC4uMzM4NDRhMTkwZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51
eC1maXJtd2FyZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcu
aW4KQEAgLTQ0NCw2ICs0NDQsMTEgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJF
X01XSUZJRVhfUENJRVVTQjg5OTcKIAkgIEZpcm13YXJlIGZpbGVzIGZvciB0aGUgTWFydmVsbCBX
aWZpLUV4IDg5OTcgbW9kdWxlIG9uCiAJICBQQ0ktRS9VU0IuCiAKK2NvbmZpZyBCUjJfUEFDS0FH
RV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5ODYKKyAgICAgICBib29sICJNZWRpYVRlayBN
VDc5ODYgU09DIFdpRmkiCisgICAgICAgaGVscAorCU1lZGlhVGVrIE1UNzk4NiBTT0MgV2lGaQor
CiBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfTUVESUFURUtfTVQ3NjAxVQogCWJv
b2wgIk1lZGlhVGVrIE1UNzYwMVUiCiAJaGVscApkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1m
aXJtd2FyZS9saW51eC1maXJtd2FyZS5tayBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmUubWsKaW5kZXggNDA3NTgwNTRlNS4uYTc1ZmQ4NTlkOCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5taworKysgYi9wYWNrYWdlL2xpbnV4
LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCkBAIC0zOTksNiArMzk5LDIyIEBAIExJTlVYX0ZJ
Uk1XQVJFX0ZJTEVTICs9IG1lZGlhdGVrL1dJRklfTVQ3OTYxX3BhdGNoX21jdV8xXzJfaGRyLmJp
biBcCiBMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLm1lZGlhdGVr
CiBlbmRpZgogCisjIE1UNzk4NgoraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9N
RURJQVRFS19NVDc5ODYpLHkpCitMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBtZWRpYXRlay9tdDc5
ODZfZWVwcm9tX210Nzk3NV9kdWFsLmJpbiBcCisJCQltZWRpYXRlay9tdDc5ODZfZWVwcm9tX210
Nzk3Ni5iaW4gXAorCQkJbWVkaWF0ZWsvbXQ3OTg2X2VlcHJvbV9tdDc5NzZfZGJkYy5iaW4gXAor
CQkJbWVkaWF0ZWsvbXQ3OTg2X2VlcHJvbV9tdDc5NzZfZHVhbC5iaW4gXAorCQkJbWVkaWF0ZWsv
bXQ3OTg2X3JvbV9wYXRjaC5iaW4gXAorCQkJbWVkaWF0ZWsvbXQ3OTg2X3JvbV9wYXRjaF9tdDc5
NzUuYmluIFwKKwkJCW1lZGlhdGVrL210Nzk4Nl93YS5iaW4gXAorCQkJbWVkaWF0ZWsvbXQ3OTg2
X3dtLmJpbiBcCisJCQltZWRpYXRlay9tdDc5ODZfd21fbXQ3OTc1LmJpbiBcCisJCQltZWRpYXRl
ay9tdDc5ODZfd29fMC5iaW4gXAorCQkJbWVkaWF0ZWsvbXQ3OTg2X3dvXzEuYmluCitMSU5VWF9G
SVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLnJhbGlua19hX21lZGlhdGVrX2Nv
bXBhbnlfZmlybXdhcmUKK2VuZGlmCisKICMgTWVkaWF0ZWsgTVQ3OTIxIEJsdWV0b290aAogaWZl
cSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5MjFfQlQpLHkpCiBM
SU5VWF9GSVJNV0FSRV9GSUxFUyArPSBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5NjFfMV8yX2hk
ci5iaW4KLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
