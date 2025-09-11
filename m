Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9011ACAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A9242710;
	Thu, 11 Sep 2025 21:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpcePMwW71IS; Thu, 11 Sep 2025 21:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9801A4272A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9801A4272A;
	Thu, 11 Sep 2025 21:28:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD1A325B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F52242397
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSzsKcHsVAew for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC99F42395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC99F42395
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC99F42395
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3e751508f21so912537f8f.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626080; x=1758230880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sI0ebbbdhUA5UVHuhN5Rv5iSDF/2CBv20N1dQMTeTdY=;
 b=E56Gxdqk/0Zl2BIatVHme5FYRRAD02/QDPq/wFGCU0AX8LSrS80a1vXGNC8BY04cpb
 AY0hJovKu6xyWx6xBC3yPZgWVdhJ2UckEXEajd9Cet5kNaM+3K++N/gxxKgZs9hW+kAz
 d7rHINLhvnGaev/gT0U9sUBo77QcsbseihMRicK11c7e+ZoutsZZIYWaqJhdUOXroXlu
 +rhqDBRUZjJLr/J+q6YcTdPFiBRptMJ4tsJArsU6GP3bGG5uUv39UG6e7CYU8QedABgE
 HVoAGzQMjRN9RzRu2Qn/re8BcsFeTZ11YQckNv0MVJihHIo7rS8wLJf1ej5PnnMCfv6T
 wwwQ==
X-Gm-Message-State: AOJu0YzmgI2MkpwCuywA8DEHQnO8TJD/s2j2atukNUzj9oBOWseQBNa/
 kU1pi/n6hmu/Z0c5ME9YcGrc7UVPM+sDW5pyDzeDxsQsgqUBRnuR7dXjWdUWTLytLD3rp6XXPPu
 MDMY/GF4=
X-Gm-Gg: ASbGncvBY9h8VGUUK1uQtHBBExYfycp0cZTmwVZBYaf/Xv+qq2zl7IFw4VtrsCZsixr
 fSdwwQXcl0ugeuH2ZZX4Hx41nfreYahUavWFc65quRi9LiYPJ/4hYWHHTNWI8UsXBmx5FncGkpv
 E4nOO7DwOLdi4Y5Q3nibC2XACppLRelmunntkSM3M+7ThFYeXImVd8oVdTjf1h9Z1sdszLcgY9Z
 SvuFUBihzNUUe9quKUnQJ1afJCQ5Yv16XYXs59REnw33oTILo8LLzaEB9xNqUyv1ZXVBBW2AfC4
 /+BdPjlsS83oaFfP6njNeGY7mJprYSTuysLeKw+e/yNqPCCNEH7B/L+f8g05UeGSoBpZNmSdfEP
 fNe/Z+yqTexNk8xMN9CYASHA=
X-Google-Smtp-Source: AGHT+IEt8NXL2DSjTwodFVa5wrAVb7WeMLjW0mY0sUuBU1gCdb1pW4MK8KIrcM3XUPO5oyFn/EvuQg==
X-Received: by 2002:a05:6000:430d:b0:3dc:1a8c:e878 with SMTP id
 ffacd0b85a97d-3e7657ba1demr617157f8f.18.1757626079944; 
 Thu, 11 Sep 2025 14:27:59 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e760786ceasm4017831f8f.16.2025.09.11.14.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E1CE55F832;
 Thu, 11 Sep 2025 22:27:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:46 +0100
Message-ID: <20250911212752.266940-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626080; x=1758230880; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sI0ebbbdhUA5UVHuhN5Rv5iSDF/2CBv20N1dQMTeTdY=;
 b=f8qZ1I8zcJlf4bVQ1o22c7TL3NWHCkzdAxxfu+kipBmU/BVIjIhGhCMiyn1saTsES1
 ossMVJKiuVyKc8ghNiH7a/ciJ8YA2rX/KfeuIrlyMAQKEckmXp3QI4TieH5zcOttkcLi
 BW7kABEJTkqiqn1a4X0Mfmebt1js9YBDBc/AHbHNKTKA2l/OF1rJLcAzPi8sYEbmQNQY
 G88cvnHAYwN69vFWtWBA2GYKhwctUUd7/FEm1poVSO7ilv0/IYV6Vnh0ONIGVRP4k1cc
 nWGOMgofiuLpRT75U0L5azHijxnyLEFC+AGYXtQdEPPYqRJunNRui3gnzv5ld/JJFUSe
 6RtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=f8qZ1I8z
Subject: [Buildroot] [PATCH v5 6/9] package/kvm-unit-tests: honour
 BR2_ARM64_PAGE_SIZE
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
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGxhdGVzdCBrdm0tdW5pdC10ZXN0cyBkZWZhdWx0cyB0byA0ayBidXQgdGhlcmUgaXMgbm8g
cmVhc29uIHdoeSB3ZQpzaG91bGRuJ3QgaG9ub3VyIHRoZSBzeXN0ZW0gcGFnZSBzaXplIGlmIGl0
IGlzIHNldC4KClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1pbHkub3JnPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0tLQog
cGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayB8IDggKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11
bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0t
dW5pdC10ZXN0cy5tawppbmRleCAxZDdlZWMyZDIxLi5lZmMzYzg1OWFhIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCisrKyBiL3BhY2thZ2Uva3Zt
LXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKQEAgLTQwLDYgKzQwLDE0IEBAIEtWTV9VTklU
X1RFU1RTX0NPTkZfT1BUUyA9XAogCS0tcHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BVKSIgXAog
CS0tZW5kaWFuPSIkKEtWTV9VTklUX1RFU1RTX0VORElBTikiCiAKK2lmZXEgKCQoQlIyX0FSTTY0
X1BBR0VfU0laRV80SykseSkKK0tWTV9VTklUX1RFU1RTX0NPTkZfT1BUUyArPSAtLXBhZ2Utc2l6
ZT00aworZWxzZSBpZmVxICgkKEJSMl9BUk02NF9QQUdFX1NJWkVfMTZLKSx5KQorS1ZNX1VOSVRf
VEVTVFNfQ09ORl9PUFRTICs9IC0tcGFnZS1zaXplPTE2aworZWxzZSBpZmVxICgkKEJSMl9BUk02
NF9QQUdFX1NJWkVfNjRLKSx5KQorS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTICs9IC0tcGFnZS1z
aXplPTY0aworZW5kaWYKKwogIyBGb3IgYWxsIGFyY2hpdGVjdHVyZXMgYnV0IHg4Ni02NCwgd2Ug
dXNlIHRoZSB0YXJnZXQKICMgY29tcGlsZXIuIEhvd2V2ZXIsIGZvciB4ODYtNjQsIHdlIHVzZSB0
aGUgaG9zdCBjb21waWxlciwgYXMKICMga3ZtLXVuaXQtdGVzdHMgYnVpbGRzIDMyIGJpdCBjb2Rl
LCB3aGljaCBCdWlsZHJvb3QgdG9vbGNoYWlucyBmb3IKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
