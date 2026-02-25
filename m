Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B856F55432
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD0B941E4E;
	Wed, 25 Feb 2026 10:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSPThYWSDAcF; Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1D5841E6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772016947;
	bh=zhvIk0BLxzOjqqJSkMmmU3BzH+rC9/tNCKWDMs6SzSc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VF38/F56AICgkCvgrWg1a+iIxhR7jhxMbCHNXOm8rJqpHvajDkiRnWUBd49nuUiyS
	 ARWGwXYR1/g+ds/TQ4AEjGBIbWgQUmnfdDpQB1U3XfqUwHSD7/v9IGGtUBx3oeJo74
	 XAEzv/S+OQDU7lfPobDeuWIC0SoZRa5ia3nbodVRGU//u7VPhFq8/5DAtRig8/r3gl
	 bDBF+a3H8urcovtyhlr5yVZKG1u52WdQ7eWywMOmhdm5AduDm+Y8S3eE2S/9K+4Mt3
	 7dQMWuUnWBF8n9z6oEN+rxn+Q54Lr98/9srdbBbIeSTlsgs3xbUWuZbmOS6eaukVrq
	 tD6G0+QHjDMQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1D5841E6C;
	Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 365D81B8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C2EC60FB4
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_qlQ7ckmYfm for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:55:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48F0E60DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48F0E60DE6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48F0E60DE6
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:44 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b8f96f6956aso909986266b.3
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016941; x=1772621741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sI0ebbbdhUA5UVHuhN5Rv5iSDF/2CBv20N1dQMTeTdY=;
 b=HvWYMeT8mwyfF/j2LIk7z8ArmM8tplqn6pxt4eoGzLfKkxoBcEDxFtu+WlsUl4tpu4
 8+HotOJs2QeAPTp1N+fK34D0YUJaUPDm6EUMrJgxLkD8jS3pqo5jKc0rMHhgbLBEG3pc
 FfhIwx4kaRz4CPt8dhc+PCAzl9Np23zW4aYoh/DBN49UT3HBqurzyuR4ulifNyDpiHGt
 5CbcuxilG/4KrZyZ1VApw+vPwOROcdGQDk/hvt38s5YS3HT/dUUD9n++17KhECsom5yi
 D2hcWeNoa7ILFr5HxWZZNXTWNV8zq0KM0Rdv8++CqJywO3Pry3oXAyLmpcDrtXDXrzDa
 Dm8g==
X-Gm-Message-State: AOJu0YwUxmn/dYXZ25fQFT72PxKlG5uZQkbTTpNgaUNGqmUGIBRn4TtB
 1P9KAbN0ZExInkqSPvD6f/y4Av5wLTT5ycLM2xZ2qcwjVhnkPyU9QkzVw0geaqB4gGpNtZuSN/v
 kXxyK
X-Gm-Gg: ATEYQzxBXZEgDAQ8JovVlhu8gkqCu8Dc9xCf38LapBe8I8tmOcUTjdmkLYQcE6Zjj6S
 PPbU+cBtiGxZ3m7Qk/jMspkuPp8YIcfLCd+N/iDhvdt4XNizOgSlSKe5Kz1O+pIzv8F8lS3oYCx
 kjTBK43DXhPt24/iLn9r+QmVAvkJaGJGwJOn4vNFbhxyOCBGQbYnuYuHU0flHtwSFObyDaQhExA
 gNh9UJ30XfdcdxKOuwR+UEHpoG1EejERFJs9/jezeHqZjxYVkjvuLnmPUr+WrHZLV5XAZMupnbc
 BEaO6gFJpRnpU6ti0WBqyTiVJKdUjLaIHlbDfJIZ4DROrLmGXKiLB5qH8DfHOvD8HQ1jQ91wBCU
 86Vh2I5CX51drJ5su6iHEtWue481wmDusRHp8ErAUuM/fx60pXaJo7zSh7TDkaXvHA9rihG59FF
 fn8sLAl96P3TbxZhe5RKloCrw=
X-Received: by 2002:a17:907:97ca:b0:b8f:d13:dec8 with SMTP id
 a640c23a62f3a-b90819c076dmr1022268266b.22.1772016941299; 
 Wed, 25 Feb 2026 02:55:41 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084e4bf73sm510365166b.43.2026.02.25.02.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:55:40 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BACCC5F8D0;
 Wed, 25 Feb 2026 10:55:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 10:55:33 +0000
Message-ID: <20260225105537.1420002-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225105537.1420002-1-alex.bennee@linaro.org>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772016941; x=1772621741; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sI0ebbbdhUA5UVHuhN5Rv5iSDF/2CBv20N1dQMTeTdY=;
 b=vwGLiVtDIfRGSKqV3SCG+Q8XWtMQJ/AgRItoJ0/NaJ1JXg96CvCyQ6qXlk9CLBknNJ
 KrJsnzcD+6hBsNicEqtmtwW1f83bt0gzF0d0mXocUIlYyhasdAl3AUwrSPPShvhlqEfV
 uYLOHeFHm3dEGnmX5ABjVI0znxXzg0QGRrYtwXRpeCEzVvrtSFxTXmmeDUu0GVaB9XkX
 TAj2gBypVXcxT+1JXaJ6Ud20wAmOrVlo/CsTmutwcAEH//5o48mWKYnP2DkFJxgQ8b70
 n0mVqHDENCe1erqo6NHH8vytB2V93P1BQ318Yl3fQEW7siJo62RvzZCNvt1xq1w4cHRz
 VprA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=vwGLiVtD
Subject: [Buildroot] [PATCH v6 4/6] package/kvm-unit-tests: honour
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
