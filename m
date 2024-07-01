Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072EBC3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 14:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 778F740DD7;
	Mon,  1 Jul 2024 14:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PveootcP2Rq; Mon,  1 Jul 2024 14:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28BA040E18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28BA040E18;
	Mon,  1 Jul 2024 14:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B58F1BF97A
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 14:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 684BC40524
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 14:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJquzdGKqkhR for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 14:57:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6486404E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6486404E7
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6486404E7
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 14:57:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-364c9ec17d1so1779827f8f.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 07:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719845844; x=1720450644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyvbT9wTVrZhqiGaymhnH2Kjp190LQsFdNBoNLsgZns=;
 b=Ak1RCv1Z9ZrVSGxVPXvXX7AOEo9OKw3bMUor+H1RGUo0TmfuRAVLB5Wx6Md8kLosmZ
 XU7YOhgYNnKqOXXwu/CjQDRDJLl3GQGUWJqwHUdtFmY3ZwTb4LyTe1a4i5zkjzeMLWlK
 kxWCFQK8/DtFaL61GmEwBJSSlCDPysoUq48nc9wQFatvy5Fg1z7RGrcBO4iJaibZ/Szf
 hfrkfnULBO0ww5DUXTkXMRkWoHr4HtjvOTVckmKi85gqL5PpulEtA0L89eYo5tFykKO+
 m6mcUKp7ltJoCJA8qH7u/sXXaf9Z/JJGbBAvuqhqFda0Bv+CXlmD90qrNj880glVkPoa
 kcuQ==
X-Gm-Message-State: AOJu0Yyyk8kH7PATbVKFQJ1AFn8ZT5fucH3VgyzFjtYvDAdfwZsscX9/
 +S76t7zKJwA8UxQzntLIz0KLQTZXFKZOi+2u7G5jvc/qPePhsyzZnZMHAN1+HpvKrqExxLDXOkZ
 H3n4=
X-Google-Smtp-Source: AGHT+IGQ5YImka72UqOW15R3X5nlpdBVJAkT+X+FKMAC6Yjf1P8mnrV0VH47dsM6XQLK5qmPEf/bRw==
X-Received: by 2002:a05:6000:18a5:b0:366:e991:b9b7 with SMTP id
 ffacd0b85a97d-367756cf2e8mr4937039f8f.30.1719845844284; 
 Mon, 01 Jul 2024 07:57:24 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e141esm10153286f8f.58.2024.07.01.07.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 07:57:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 16:57:05 +0200
Message-Id: <20240701145708.2886402-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240701145708.2886402-1-raphael.melotte@mind.be>
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719845844; x=1720450644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gyvbT9wTVrZhqiGaymhnH2Kjp190LQsFdNBoNLsgZns=;
 b=ghoX7TbTltrolFdJO1q773izFUnUTfmuTMCKq35zCwrIMQSoAz0pWqE/WH7YxsJ5X/
 y1i3Pf2sJNQ1X3JnQUKxWmRk/gtDisg5tTTj8BaU+s62iH2xYB1YyIfTvaAMESny9xC7
 peNbn5fKhXNGwV4CtSexZDozd35j/4bdVzGctcUMpqADuQfWcAePqSqBwetY4Sdpw7Yy
 +2QVzndeLKV6GI5E2rcWsVOwQFTERtKqG3VGAkFM9JNk5+z4WjWQx6tHIwQHzcVwJLwb
 tfaJ0LNyHLvOh5Ydh1m0T9P5PVDblmLKlI8a00v++zIvvmo7WjCPofVHeMkTqLXEL7Tx
 R/+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ghoX7TbT
Subject: [Buildroot] [PATCH 3/4] package/python-sdbus-networkmanager: new
 package
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9Db25maWcuaW4g
ICAgICB8ICA4ICsrKysrKysrCiAuLi4vcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyLmhhc2gg
ICAgICAgICAgICAgICB8ICA1ICsrKysrCiAuLi4vcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2Vy
Lm1rICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQs
IDI5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1zZGJ1
cy1uZXR3b3JrbWFuYWdlci9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5
dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIuaGFz
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2Vy
L3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMg
Yi9ERVZFTE9QRVJTCmluZGV4IDE0NmM2ZmZlYTUuLjlhYmYyZDQ5MGIgMTAwNjQ0Ci0tLSBhL0RF
VkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjY2OSw2ICsyNjY5LDcgQEAgRjoJcGFja2Fn
ZS9weXRob24tcHltdXBkZi8KIEY6CXBhY2thZ2UvcHl0aG9uLXJzYS8KIEY6CXBhY2thZ2UvcHl0
aG9uLXMzdHJhbnNmZXIvCiBGOglwYWNrYWdlL3B5dGhvbi1zZGJ1cy8KK0Y6CXBhY2thZ2UvcHl0
aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyLwogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2Uvc2FtcGxlX3B5dGhvbl9qbWVzcGF0aC5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2Uvc2FtcGxlX3B5dGhvbl9yc2EucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3NhbXBsZV9weXRob25fczN0cmFuc2Zlci5weQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25m
aWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA0NWQ4YThjN2VjLi4xNmEwODc0NWNmIDEw
MDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAt
MTMzNSw2ICsxMzM1LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCiAJc291cmNl
ICJwYWNrYWdlL3B5dGhvbi1zY2hlZHVsZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5
dGhvbi1zY2lweS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1zZGJ1cy9Db25m
aWcuaW4iCisJc291cmNlICJwYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9Db25m
aWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1zZG5vdGlmeS9Db25maWcuaW4iCiAJc291
cmNlICJwYWNrYWdlL3B5dGhvbi1zZWNyZXRzdG9yYWdlL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvcHl0aG9uLXNlZS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1z
ZGJ1cy1uZXR3b3JrbWFuYWdlci9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3
b3JrbWFuYWdlci9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uY2U3MTM3MzY0ZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzLW5l
dHdvcmttYW5hZ2VyL0NvbmZpZy5pbgpAQCAtMCwwICsxLDggQEAKK2NvbmZpZyBCUjJfUEFDS0FH
RV9QWVRIT05fU0RCVVNfTkVUV09SS01BTkFHRVIKKwlib29sICJweXRob24tc2RidXMtbmV0d29y
a21hbmFnZXIiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9ORVRXT1JLX01BTkFHRVIgIyBydW50
aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9TREJVUyAjIHJ1bnRpbWUKKwloZWxwCisJ
ICBOZXR3b3JrTWFuYWdlciBiaW5kcyBmb3Igc2RidXMuCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNv
bS9pZ285NTg2Mi9weXRob24tc2RidXMKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNkYnVz
LW5ldHdvcmttYW5hZ2VyL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci5oYXNoIGIvcGFja2Fn
ZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2Vy
Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZGE2NWUzY2RhNAot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyL3B5
dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci5oYXNoCkBAIC0wLDAgKzEsNSBAQAorIyBtZDUsIHNo
YTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zZGJ1cy1uZXR3b3JrbWFuYWdlci9qc29u
CittZDUgIGNlMjc5MDg1NTlmMjAwMjE5YTA5MGI2MTUwM2MyZWY2ICBzZGJ1cy1uZXR3b3JrbWFu
YWdlci0yLjAuMC50YXIuZ3oKK3NoYTI1NiAgMzU3MmFjM2E4MTg5YzY4M2VjMDQxNmFjYjE0ODc2
MTc3M2E4ZjA4ODFhZDNkNzhiNmQ2ZjY4NjRlZmY5YzUwYiAgc2RidXMtbmV0d29ya21hbmFnZXIt
Mi4wLjAudGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcworc2hhMjU2
ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1
MjFiODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3
b3JrbWFuYWdlci9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIubWsgYi9wYWNrYWdlL3B5dGhv
bi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIubWsKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uODMzYzA4MDQzNAotLS0gL2Rldi9u
dWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyL3B5dGhvbi1zZGJ1
cy1uZXR3b3JrbWFuYWdlci5tawpAQCAtMCwwICsxLDE0IEBACisjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIworIworIyBweXRob24tc2RidXMtbmV0d29ya21hbmFnZXIKKyMKKyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCisKK1BZVEhPTl9TREJVU19ORVRXT1JLTUFOQUdFUl9WRVJTSU9OID0gMi4wLjAK
K1BZVEhPTl9TREJVU19ORVRXT1JLTUFOQUdFUl9TT1VSQ0UgPSBzZGJ1cy1uZXR3b3JrbWFuYWdl
ci0kKFBZVEhPTl9TREJVU19ORVRXT1JLTUFOQUdFUl9WRVJTSU9OKS50YXIuZ3oKK1BZVEhPTl9T
REJVU19ORVRXT1JLTUFOQUdFUl9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzLzMxL2FiL2U4NjRjNmMyZWI3NzhjMTk0Y2ZiNTZjZDlkOThiNTU5NGRjMDA1NzMy
MTBmZGY2YjQ0OTA0NzQ1YTBiZgorUFlUSE9OX1NEQlVTX05FVFdPUktNQU5BR0VSX1NFVFVQX1RZ
UEUgPSBzZXR1cHRvb2xzCitQWVRIT05fU0RCVVNfTkVUV09SS01BTkFHRVJfTElDRU5TRSA9IEdO
VSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2MiBvciBsYXRlciAoTEdQTHYyKykKK1BZ
VEhPTl9TREJVU19ORVRXT1JLTUFOQUdFUl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORworCiskKGV2
YWwgJChweXRob24tcGFja2FnZSkpCi0tIAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
