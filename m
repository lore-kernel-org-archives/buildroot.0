Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A243C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07111418CB;
	Fri, 16 Feb 2024 21:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ld1NBvBjTw2z; Fri, 16 Feb 2024 21:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CDFE421E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CDFE421E8;
	Fri, 16 Feb 2024 21:15:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 122F61BF287
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2BC941CD1
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITRI8bNgesYX for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4293141CB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4293141CB0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4293141CB0
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:15:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4124907f6fcso7307025e9.1
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708118117; x=1708722917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9qwp+9rh+B0R5IeYN89qYMCYT/I32QR0xpyr0AfoQY=;
 b=k8y2w6G0RG83dCh3jOG9XoE3q4Dytb9kz9Usxf6JV1kxonQc4q8wT2kUD4MqlCZ8Q2
 5xXvP+i17RyPYDTE63XM5xOz3SJa4Vp6OsRtdQV783+nqYP4BmCTg9Kdu2i4EvraOSyk
 Ynt86xGzi4JlgIt1bmJmNfTVQV2LwHSlFTQBu+WTfByGk7gK671CJR3Id0duuN58hSsx
 U3xhoCeRnRIOl0V2el04/L92zifU1J9Pt6uyUGcQPpPrBUOQVVkb7L8+9UV1CysZXQzW
 j+CEw+e0Diyl5hg5R9IG5zukOXgd2oyQ3gQMRhozVcPG0YYPS5AT/+SRTu4ZEIFm6a7X
 xZnA==
X-Gm-Message-State: AOJu0YwynGNQMS0vaYZOaxTCvi07E09uXeaOOn2cuzemEq5f/wvcDZn6
 Yyl/F7dYG5fojjgkBYAWC8vm3B6iehOZd+8+eeRmKITPP7jZVPZH/peUSCMeV7pOmSOIWLWFz0g
 1JDJNzg==
X-Google-Smtp-Source: AGHT+IEGqP0PL7Fcq2YzdX9QbsPzJdLJ+MTuEAZ0698YiNmC2Ze5t/MyJJKjr14uQj4aHMjW3fQHWA==
X-Received: by 2002:a05:600c:a385:b0:40e:c06a:3ed5 with SMTP id
 hn5-20020a05600ca38500b0040ec06a3ed5mr4931411wmb.2.1708118117374; 
 Fri, 16 Feb 2024 13:15:17 -0800 (PST)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00410d7e55e5asm3451234wmn.3.2024.02.16.13.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 13:15:16 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 22:13:39 +0100
Message-Id: <20240216211344.1807353-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240216211344.1807353-1-raphael.melotte@mind.be>
References: <20240216211344.1807353-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1708118117; x=1708722917; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9qwp+9rh+B0R5IeYN89qYMCYT/I32QR0xpyr0AfoQY=;
 b=CVvWXbkNMQFpsf6oEAnfG+UDgvOMpRtQQOzlFPODZ7vO70JOuDrQzlR8H4wrfKyX1/
 +MCeJWAPScuQZox5ZOylStj5fu5jdt123XYAgvZe/QL5pbSCH+9m9UrZizdoxZ9W0wEl
 kW7rw7dDsHihKlmXVf+zvwwLXYAHaQ2wtjzFqVjaEyK4Gx/HjmtoUsqojcW2bHJT1iM3
 O2i2HKCFCOrClXh5s2c2gr45LJRWjC62+xgQOsXyXv8f+5y5AGYF+OCXdzrhquVF0XKY
 Rim1lT6rezNX5gkyO6cVd5JOfbOX9ID8SgmPDwF6SH5bpP01XGihIDm36cHvry0adjXQ
 zB0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CVvWXbkN
Subject: [Buildroot] [PATCH 1/5] package: python-pymupdf: add missing
 python-zlib dependency
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
Cc: james.hilliard1@gmail.com,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgdHVybnMgb3V0IHRoYXQgcHl0aG9uLXB5bXVwZGYgZG9lc24ndCByZXF1aXJlIHpsaWIgZGly
ZWN0bHksIGJ1dCBpdApkb2VzIHJlcXVpcmUgdGhlIHpsaWIgcHl0aG9uIG1vZHVsZS4KClRoaXMg
Zml4ZXMgdGhlIGZvbGxvd2luZyBydW50aW1lIGVycm9yOgoKVHJhY2ViYWNrIChtb3N0IHJlY2Vu
dCBjYWxsIGxhc3QpOgogIEZpbGUgIjxzdGRpbj4iLCBsaW5lIDEsIGluIDxtb2R1bGU+CiAgRmls
ZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL2ZpdHovX19pbml0X18ucHkiLCBs
aW5lIDIyLCBpbiA8bW9kdWxlPgogIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNr
YWdlcy9maXR6L2ZpdHoucHkiLCBsaW5lIDM0MDIsIGluIDxtb2R1bGU+CiAgRmlsZSAiL3Vzci9s
aWIvcHl0aG9uMy4xMS9nemlwLnB5IiwgbGluZSA5LCBpbiA8bW9kdWxlPgpNb2R1bGVOb3RGb3Vu
ZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ3psaWInCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBN
w6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9weXRob24tcHlt
dXBkZi9Db25maWcuaW4gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL0NvbmZpZy5p
biBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCmluZGV4IGVjYWE1NDk2YjUuLjM4
MzFhMjU0NTEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCisr
KyBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCkBAIC03LDcgKzcsNyBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZTVVQREYKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9T
V0lHCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0ZSRUVUWVBFCiAJc2VsZWN0IEJSMl9QQUNLQUdFX01V
UERGCi0Jc2VsZWN0IEJSMl9QQUNLQUdFX1pMSUIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9O
M19aTElCICMgcnVudGltZQogCWhlbHAKIAkgIFB5dGhvbiBiaW5kaW5ncyBmb3IgdGhlIFBERiBy
ZW5kZXJpbmcgbGlicmFyeSBNdVBERi4KIAotLSAKMi4zNy4zCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
