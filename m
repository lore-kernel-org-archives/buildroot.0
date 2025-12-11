Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DF5D41C33
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 12:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E1F40F8F;
	Thu, 11 Dec 2025 12:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZLV_hBMgIWg; Thu, 11 Dec 2025 12:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85B040F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765457148;
	bh=sXykwn8pXVUhZYN8eufPlVA+7+fMq9uMU5BdVnLFX4E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AdUjoV3pEewtZt5xLpote5RqlUJLGO0bfJew7f/YH/IZ8kVqy4rOctluA+yIEj7D8
	 29Kse0O4vclGsa/WWWNFcNaOn9TXY6AEKSE/n/bQ0XvDJ4b/NYZcuKsgEVeRPspce0
	 4tDkLSKlUdEBOU6Y9HJt9vp2tv/JSjOgAXdMX9S8VUMePWNajUBOyMTBDVAxcaqhhs
	 Oowi7oESwYON5aP8kOe3PscfhDmJ9Yd4VLUyhvFDLj4yn6U7IEtwoWmeRzfYD+E8Yq
	 9IKxke4xWu3C0yKeHRDy0GtNYBI+Sqyg2mK7vr4uGX2yhgoTYfbAgj32+ZrGmpo/DR
	 EEd3slf+VP1Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85B040F75;
	Thu, 11 Dec 2025 12:45:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1B02E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9390A40F75
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbJV4cmdHeEi for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 12:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7845640F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7845640F00
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7845640F00
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:45:46 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-37a3d86b773so519371fa.0
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 04:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765457144; x=1766061944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uODKp+j4sx8pSI0FIgWwbJNtSvrOsqTD8zKKWyx/Ggw=;
 b=pGQGq7w0MI5r2oXa1ZNjt0PTZPQZo5IByHeIGK25GxuL3vRqnMgkQhN5UQLvHcWK7i
 5V2IN+2l1C7/q/y9loXG46ivrQAc+jTtYK1IGOTIHXRPrhGr2foQNxUq099Lvz6UPHuZ
 0fFTT5xTVI6RwiL7ZmBGCBMqN0/wmGIKiShEPHqzPedWTDTr0T6QQSBRYkHr4KjTmez4
 062jYH1u5EG867cKqVM5NaTGWflZIFFeaYtO9+AXlFcU5Neko2ABPyGcX3UtBKO4RJqH
 lQ7stikpFwQq8dE+ZrduqeU7PpoDCnyRN8KejN+DIqato4QX1m2xGtZ49HiJ4hhZ8ZtH
 /Z9Q==
X-Gm-Message-State: AOJu0Yw66HUo/1t8ltfkydpxh9NZEgW4IAZqJ9CC0jlzL885I5xFhmM6
 TLM1I07JxYB6a16EnANqm6F3D6JvYDZRNcC4Hh3BwDeTZBF7BPkCJrHsS54kllZNkUU13iN5Cpq
 XIrd6
X-Gm-Gg: AY/fxX4+qhpxrYPtau7tqkC/4FO1VW0VeiInh14BVDXYJehW3xapxlqEuykeHIJJGW1
 7VNlXcv17H+IuujHvDN2ztfe3EE5gFTO6U7OFBuZRzzGL0agxmxVFzl/Xlx2EcYlJsg7ViV623S
 6of7354qGYqHcGjznIhwz+ix1D0XdWXDC3s88j0HH2v1G7wANQUvJwMyt4VnVoQ7W+MG2R/2qEU
 zaXUdJGS0F6OJac+E+lyapTLRL/ulBtXvNejsPyXbkD9hBy5CrF4akN0HHZm0TxrSRph2YC3KRG
 xx9rWcjdoVAMSAE+N7hhNi4n8fqtxseOWzuwg86R5yuW2eH8X+XDk8fLXuxR44YyyeuPUf1V4WF
 rp+ZcrvPXqtFuS5qctUCYMkyaTEWMZX5wISMUePFhbanQvwkLVlD9AbR3eiS+Gt7Xnl4AeVAfLw
 ==
X-Google-Smtp-Source: AGHT+IF34IBEkvEbGt5jOksSI3GrO+Jf1SfQ1g/p+B57QQ/LXR6u3/UGD1YO3onBHtmeBaM4N3+HUw==
X-Received: by 2002:a05:651c:31d8:b0:37b:9ff7:2a41 with SMTP id
 38308e7fff4ca-37fb1fe8c43mr18262181fa.8.1765457143520; 
 Thu, 11 Dec 2025 04:45:43 -0800 (PST)
Received: from nola.getinternet.no ([2a02:fe1:3379:6900::2])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fbca8cd3asm6703641fa.39.2025.12.11.04.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:45:42 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Date: Thu, 11 Dec 2025 13:45:39 +0100
Message-Id: <20251211124539.58728-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1765457144; x=1766061944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uODKp+j4sx8pSI0FIgWwbJNtSvrOsqTD8zKKWyx/Ggw=;
 b=Q8oCrvzTHMJAcct3lH6AaM+haG3wcLlrsC8km/zg6K9MA8a8SmgpY96wjVAnuVCvmY
 a43tydibev9c1lYDkEI3/SLvtWeUxr8r5OaY06CJ1Zo9O7pqMlaezAh2AKd8Q72DNdK/
 m34EHRgFjXWzS96B3ovLvJCvKT/ImCE6Gjc4A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=Q8oCrvzT
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2025.49
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtAcWJlZS5pbz4K
LS0tCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQogcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaCBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gK
aW5kZXggM2MwMjJiNTE2Ny4uNTNhMWYxYWM1NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgMzgzNzli
MDg2OWQwMTNmYmQyMjVkM2UwOTJmYTE2NzUxYzQxNGI4ZjQxMjQzN2MxYzRjN2YzYWYxMThmZWU0
YiAgcWJlZS1hZ2VudC0yMDI0LjUwLWdvMi50YXIuZ3oKK3NoYTI1NiAgNzVlMmZmZjIwNzdjZDEz
YzZkNDJiMmY0MmMyZGE1ZDA0ZmNlNDE0MDhlZmQ2Yjc3Y2FmMWUxM2NlZTgwMDczYyAgcWJlZS1h
Z2VudC0yMDI1LjQ5LWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCBjNWRmNTlhNjYzLi5mNDBkZDQwYmY4IDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC41MAorUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNS40
OQogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IDQzMDM0NjVkMTU1ZjA2ODA5NjhiNTdmZGY0NDIxOTcxNzg2MzU2YTQKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gOTQ5M2E1N2Y3ZjRmMmNiNGMwZGIzZGZkMTgxMjA0MmI5NjQ3OWZjMgogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
