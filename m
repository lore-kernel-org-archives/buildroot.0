Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742D5D44C5E
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 15:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29CE40FE5;
	Thu, 15 Jan 2026 15:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUKSrpSNyoXn; Thu, 15 Jan 2026 15:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E57F940FE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768489450;
	bh=KL4GWC0fdALCmI+bFmNmxxVKLZRZ+JlFPpV+bZ3GZ0o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=roQEdegmjl5UGi4jft5VPTqSLgSukuQOLSr4HL4nRIixs0guEGr33jnunWgy/IMHs
	 pA5o6T/wKj71NpMJM2dW/XC2p6td8sPUF2qkzO/MnG5L0VdqYSTLaK3iNeZIuKhUeS
	 ajk3RG2ErAJ2GViU0rq3zscZDwCpkfo0ETvqrcpeAAHjAkANk/iY6ly+y+rZ21GjYF
	 xARBOe31CLrOT3bVBVG9lTu3zzYk+ooO2KHG/j7r4aBV5H6JwSmJgc4vUp5MhE7E4a
	 H7G2xYOx9dxSvY92maGTHu2hLvXfbaWalmiyZ3EqUEF5ubSYBD9Fce+lyeXGBSPbvO
	 2/hLgQ2Txf1Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57F940FE0;
	Thu, 15 Jan 2026 15:04:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB8411CC
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 15:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD9BF841B4
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 15:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J15sRaqXKBhL for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 15:04:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91D2E841B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91D2E841B3
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91D2E841B3
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 15:04:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so12695205e9.0
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 07:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768489442; x=1769094242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OkaSA639SefgEIQY0U73YwMKCeyY/9QIoIm3Pvp4b7Q=;
 b=IroyqFzXgXq1Uj4H7HVB3UQYpX2UoqvW2FOyHGCv2E2XzTFxpt/XY0tOWr65gmf52V
 c1UKLHgn6AnEnS2Z5Sh26lRW6jR2MTmILcgi86SdwYACMut7o82AaipdcUqcG7LYHoIN
 J9PhO/FW3uzc/bVQhl0SxJwEKcv8O4gUk/UXIEClUFyJt74AGddpqd+LI0EVgr6WpFHP
 6VapKFEb0VgIVlbYNxNnWOraeEs63baV2xttPh8fCckaUSc4CPXY6KV7Jx1gas5kvcig
 5wVyD53ienhKqp3egz1xVBfx8fm+Heyzuv9eCWcB5P24Gcp2Gsp8DmE9OX7nL06Ja7ja
 iyxA==
X-Gm-Message-State: AOJu0Yzn0AQsE/qJljRwUWaSsZQ4niNFWazk3b8R9+31Fok5FV7WLPVD
 ZTh3Fco0CQtQnD/VgiTN+//PYdrX9WVu5BOXW0/RBfXluXFf1OKUTtWESg1wTK0C1XW6oZeJtOW
 wn4N+USI=
X-Gm-Gg: AY/fxX7bvY/umdwZQSEhHAo+UKhffl6qSab5sfPvpInfBGZ5JHr74bM8ai7s0H5zGcf
 iKu3q0JOte06w1o8xjUW/RGJxrxCqfSoBe2sQpbKXxjMLfx+YkLtbDWkpXktYsEp8domReWSXCe
 23kBgvqC/O4pm9Am3d7Ci+RXJ3BRGBd71vlig4rkGRhh5Rlxi0Ni3BFUAnrEJ2ZVhFnRgJMl+7S
 uC4mmrR90CTs3BXNjH5cnkpeKswrh1exU5ngpjxMwhERB5VR2Qmg17ZfR/pta+DnGSdrjkW94WW
 vRuRMahKlETel2K6wuLMQafh0lFMSu3NZiYhnImAlX8uAVvV/pJeyxgw9hDQi8H7AAyBJ+23wjM
 jgGMhCqsVtIls0eICXbyDH+LZ4ZIWoPuQa8nEWRTQocjoqj3LJQEupgIf6EtBZeHvbRxkQs53DS
 AlCDu7r9Fr5tlj7WFOXi9UlU+BEGzOgHdty0uaPM/oLUCGbrm38fLWmH8=
X-Received: by 2002:a05:600c:1d07:b0:477:7bca:8b34 with SMTP id
 5b1f17b1804b1-4801e2f8e8amr638155e9.6.1768489441907; 
 Thu, 15 Jan 2026 07:04:01 -0800 (PST)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428e4b38sm51914945e9.13.2026.01.15.07.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 07:04:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 16:03:26 +0100
Message-ID: <20260115150328.713835-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768489442; x=1769094242; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OkaSA639SefgEIQY0U73YwMKCeyY/9QIoIm3Pvp4b7Q=;
 b=Jw14Q8yGx24C/iwD8sR+wr7DplzcjFOyP9rYI72h1cVxHAQz9NawRXif/SUFVqFbJr
 BcTKamPW3513MNUPJvaX39MPimQ17NF0cvTogaytH7+W0wfEhdh/N6wl4GwAg10TC61l
 O6Db9IxSyvx/eHJDQVj6lUtjHGhz0J6DHY4GL4bHbTUui71f6hB7LuwdLoPHylY51CbF
 I/mvby87Bot6kLbYb0qSyIGle6TfaEG0LdBUGkMlE0k5bpwTQbFXaxmaJqRW8vZP+jR0
 kQu8QnRtr06y4NHGg9K8VgcF2Gl8guYbXpevWb42b1oi0dzc2nNUmeIGOCShWw4DeXP+
 mnyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Jw14Q8yG
Subject: [Buildroot] [PATCH 1/1] package/libpagekite: bump to version
 0.91.251215
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly9naXRodWIuY29tL3BhZ2VraXRlL2xpYnBhZ2VraXRlL2NvbXBhcmUvdjAuOTEuMjAx
MTEwLi4udjAuOTEuMjUxMjE1CgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9saWJwYWdla2l0ZS9saWJwYWdla2l0
ZS5oYXNoIHwgMiArLQogcGFja2FnZS9saWJwYWdla2l0ZS9saWJwYWdla2l0ZS5tayAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJwYWdla2l0ZS9saWJwYWdla2l0ZS5oYXNoIGIvcGFja2FnZS9s
aWJwYWdla2l0ZS9saWJwYWdla2l0ZS5oYXNoCmluZGV4IDJjMmU1YzliNTkuLjcwYWE1MTc0Yzkg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlicGFnZWtpdGUvbGlicGFnZWtpdGUuaGFzaAorKysgYi9w
YWNrYWdlL2xpYnBhZ2VraXRlL2xpYnBhZ2VraXRlLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExv
Y2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBkYjgzNWQ0OWJlY2ViYzAwZDQ2MmYyZjQ3YWVmYzFm
MWQzYTRlMGUwOTY0ODdjYjNiNDI0ODEzNDE4NWRmNzE1ICBsaWJwYWdla2l0ZS0wLjkxLjIwMTEx
MC50YXIuZ3oKK3NoYTI1NiAgYmFiM2ViYjdjOTg2MWVkYTMzMTgxZWNkNmVjYmFmMjlhMjg3Zjg4
YTE2NjdkOWY5ODNhMTRmNmIwNDA3NDk5OCAgbGlicGFnZWtpdGUtMC45MS4yNTEyMTUudGFyLmd6
CiAKICMgTGljZW5zZSBmaWxlcywgbG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIGJhNDQzYjlj
OWQ0MjczZDA2YWFlM2UxNDdlOWFkMWVjMTk5Y2M5YzIzNDU1ZjQ4NmEwMzk1MzZkNDdmNTdlZWQg
IGRvYy9DT1BZSU5HLm1kCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnBhZ2VraXRlL2xpYnBhZ2Vr
aXRlLm1rIGIvcGFja2FnZS9saWJwYWdla2l0ZS9saWJwYWdla2l0ZS5tawppbmRleCBiYjIzNWJh
MWYzLi4zYmQyOTcwOGU5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnBhZ2VraXRlL2xpYnBhZ2Vr
aXRlLm1rCisrKyBiL3BhY2thZ2UvbGlicGFnZWtpdGUvbGlicGFnZWtpdGUubWsKQEAgLTQsNyAr
NCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJQQUdFS0lURV9WRVJTSU9O
ID0gMC45MS4yMDExMTAKK0xJQlBBR0VLSVRFX1ZFUlNJT04gPSAwLjkxLjI1MTIxNQogTElCUEFH
RUtJVEVfU0lURSA9ICQoY2FsbCBnaXRodWIscGFnZWtpdGUsbGlicGFnZWtpdGUsdiQoTElCUEFH
RUtJVEVfVkVSU0lPTikpCiAKICMgcGtyZWxheSBpcyBBR1BMLTMuMCsgYnV0IGlzIG5vdCBidWls
dAotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
