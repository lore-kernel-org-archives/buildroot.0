Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A186DC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 17:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0143C6FA33;
	Thu, 30 Nov 2023 17:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0143C6FA33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dzrhEQEPR9h; Thu, 30 Nov 2023 17:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B196FA30;
	Thu, 30 Nov 2023 17:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66B196FA30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8EAA1BF3DF
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 17:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA79E84666
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 17:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA79E84666
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVhtwOuvFyYT for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 17:54:05 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43C7D84661
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 17:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43C7D84661
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso1003355a12.3
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 09:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701366842; x=1701971642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whlTwKYzBx0La7LZ5QNkGoH8EFzAUhBOoaamF7SnV+A=;
 b=pL+yCpdKTNW9KrbyPdQX8/lAHemGBUHVS/7/9xdS/gYBmrb1wBm8eZsri/acJZkAXY
 EQZo6WM+x5AGECYs8yYUu/iuFLE3z1kgHmSyl2zpRWMgSWgdpWVvYEQzu30/EtI84LVf
 NpIS1QU+bSiNzVMM5yeGp+9IYWJBBcqxOGlQY++eEBJtp2MONNNZh+28wsITkHK0qcTw
 b94YTPtee6aCyMw85vwihD3hF9ZjG3MR69ZOrxFSI2bs+eES7xkpFEdJZpzMHoh/KZOs
 KAQW6bQCSgPFJePrK2Ck5GEfkcB6+HcYboP5SJ13Bv4HeXUwOy7xvcvsk3fxQNmHkMJP
 ZZ0Q==
X-Gm-Message-State: AOJu0Yw4h58Gd5S+UevaR1ljLKi0/Zbp4Sxw75V8FVuGVH2iAQduMwUC
 wjFHkmM4AcU4xOiRY+sVdXL8ZTrUI258ZsrTe2RqoQ==
X-Google-Smtp-Source: AGHT+IFeW2CgmAJRH2WFekkART+tFCykkSthG7j2GpJXHWSjnbTToygW7jpqugazJCk7a2r9ZBcdsA==
X-Received: by 2002:a05:6a20:918e:b0:18b:8dfa:8895 with SMTP id
 v14-20020a056a20918e00b0018b8dfa8895mr27999743pzd.17.1701366842617; 
 Thu, 30 Nov 2023 09:54:02 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a63df0e000000b005b4b70738e5sm1555625pgg.8.2023.11.30.09.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 09:54:02 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 14:53:33 -0300
Message-ID: <20231130175333.206625-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1701366842; x=1701971642;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=whlTwKYzBx0La7LZ5QNkGoH8EFzAUhBOoaamF7SnV+A=;
 b=fkpQxbBLESARfHGXUrkh1KeGCbaj9D3xU2by9VkNMv0jv8m1uwBjHZH/H3wtS8qyDE
 yEXZZG4HlnUK12vSOP6Oe5BxOtFZFb3sdE55uj1s4tD56+rndHYcPGyk8rQa6Dm1mVns
 R7cH2BLGYdDq3v7YHOwEBGbJ+3DFe2pRSUjIvrwZide+vB+BYfu3iZ7Q3FwwXi74mOQn
 0aFuhxDpssdi2dEO+893QOKzAZByvKmpVmffG/ivOpSRQ3T8V5WmZgg0Sv/f5NgDHGWI
 3OnBCiSHqUCtozds7ipgCkcjVyHTs2dLODwBfEChlXxDGNeOofFBWTuiLIJlgLd8JMIs
 znyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fkpQxbBL
Subject: [Buildroot] [PATCH 1/1] configs/asus_tinker-s_rk3288_defconfig: use
 zImage by default
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWlncmF0ZXMgdGlua2VyLXMgYXdheSBmcm9tIGRlcHJlY2F0ZWQgdUltYWdlCgpTaWduZWQtb2Zm
LWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KLS0t
CiBib2FyZC9hc3VzL3Rpbmtlci1zL2V4dGxpbnV4LmNvbmYgICAgICB8IDIgKy0KIGNvbmZpZ3Mv
YXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib2FyZC9hc3VzL3Rp
bmtlci1zL2V4dGxpbnV4LmNvbmYgYi9ib2FyZC9hc3VzL3Rpbmtlci1zL2V4dGxpbnV4LmNvbmYK
aW5kZXggNWEyZDA1YjgxMS4uNjFlYmU1MGM3MSAxMDA2NDQKLS0tIGEvYm9hcmQvYXN1cy90aW5r
ZXItcy9leHRsaW51eC5jb25mCisrKyBiL2JvYXJkL2FzdXMvdGlua2VyLXMvZXh0bGludXguY29u
ZgpAQCAtMSw0ICsxLDQgQEAKIGxhYmVsIFRpbmtlciBsaW51eAotICBrZXJuZWwgL2Jvb3QvdUlt
YWdlCisgIGtlcm5lbCAvYm9vdC96SW1hZ2UKICAgZGV2aWNldHJlZSAvYm9vdC9yazMyODgtdGlu
a2VyLXMuZHRiCiAgIGFwcGVuZCBjb25zb2xlPXR0eVMyLDExNTIwMG44IHJvb3Q9MTc5OjEgcm9v
dHdhaXQKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmln
IGIvY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcKaW5kZXggOTZmYzc5ZWU4
NS4uNjhiNGIyNDIxMiAxMDA2NDQKLS0tIGEvY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9k
ZWZjb25maWcKKysrIGIvY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcKQEAg
LTI1LDggKzI1LDYgQEAgQlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9WRVJTSU9OPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMS4z
OCIKIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJtdWx0aV92NyIKLUJSMl9MSU5VWF9LRVJO
RUxfVUlNQUdFPXkKLUJSMl9MSU5VWF9LRVJORUxfVUlNQUdFX0xPQURBRERSPSIweDAyMDAwMDAw
IgogQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CiBCUjJfTElOVVhfS0VSTkVMX0lOVFJF
RV9EVFNfTkFNRT0icmszMjg4LXRpbmtlci1zIgogQlIyX0xJTlVYX0tFUk5FTF9JTlNUQUxMX1RB
UkdFVD15Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
