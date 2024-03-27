Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198C9C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 15:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27368131F;
	Wed, 27 Mar 2024 15:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQ8PhMdowkH1; Wed, 27 Mar 2024 15:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D00CA815E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D00CA815E7;
	Wed, 27 Mar 2024 15:07:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDC441BF418
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 15:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA73D4015A
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 15:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vLFST-A8Lu1 for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 15:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=cleger@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B543D400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B543D400D0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B543D400D0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:06:58 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d6f9ce80a9so1677551fa.1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 08:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711552015; x=1712156815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CYqEBZbspVY/pkFPPmtQhQRWq4ROUJN2msIbTaHCq08=;
 b=qAG1JRHM97W+JZE5/6L2ELdLl+sFpEL45yu3dkfn8gX70HkzHRoJV8fm+teVhp+BLG
 FChQhkPnIj3rb6tBupxfq2ncaNf6DXkQ6DGyGBIaBQqQgQhptRSb9O48s4hdvZ0slHJP
 rBAjpJFtSXWSsFWiGMKmuvKrFgQToRo6n6KjlpzosvS88K7HhHjkxFsmERYCOmhIZO6t
 gsMhsvk4K9AtnAgqjBbsPn9ggzQNngmft1axsoLjGXSIuNU4fFY+m2E8a3n7C06bJCRe
 DW3QSaD2SOdRcq2Pn7dcsB5T6COiswKIBWAe44RZmGJZ35lAnPU7Q3X2xOSlR5nMBLHV
 +TiQ==
X-Gm-Message-State: AOJu0Yyajd/BXBzIhInGdHYXjDmELSTY7J2JE4AwvSKzA48/1D/3lzeA
 EP9WSfp2QTYJU/NVy02xzRAeu/tp14qdc4AajxdlD1fxsCoPD7oWhyrPP18Sk4RUiMPGnpC05AN
 Zejs=
X-Google-Smtp-Source: AGHT+IHi7+YK546GlNp8GxqkPJd/UngZjp+8pw2SeF7fcRR+2ZkFNBRJIb9Oy4WavyCzB6S2g7JuyQ==
X-Received: by 2002:a2e:9b8e:0:b0:2d4:6bef:1850 with SMTP id
 z14-20020a2e9b8e000000b002d46bef1850mr188672lji.4.1711552015397; 
 Wed, 27 Mar 2024 08:06:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9678:f1de:fff7:3af5])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c00cf00b00414041032casm2766172wmm.1.2024.03.27.08.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 08:06:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 16:06:11 +0100
Message-ID: <20240327150616.39345-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711552015; x=1712156815;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CYqEBZbspVY/pkFPPmtQhQRWq4ROUJN2msIbTaHCq08=;
 b=tzcGaMJtz2//dUH6dEEfWY3yXAf8XjHeXQyr3xf0qIvYEZcnVBh/39K09CoqzHQJ7y
 o8iC7uiTrHkmZsJe7P6vcvZIfQJdy9XZ9l9D9rhsvOnN8/qdGn93jsjnVnkMYeM9p8XU
 Bi4UvtpDFMKwDcRo7iYRNv3Hqd4YT72pBz3duUs4Z6ZeWZDKAO9TDgoSXNWZNmq+mLMa
 DozRsdm3wy+hi1F0qvcTd8Mirmfp+hmkqo8zzUgynylz5ljH3HZhHTq04CM1NjbyKzFj
 UzsC2gBR8IxiTy5/ZMhgDl8BRTWNkosZiQ6udieZSzKd5jKtD9CGn4hirY/8ZtNomhrd
 16LA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=tzcGaMJt
Subject: [Buildroot] [PATCH 0/2] Update kvmtool and add support for riscv
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBrdm10b29sIHRvIGEgcmVjZW50IHZlcnNpb24gKGN1cnJlbnQgb25lIGRhdGVzIGJhY2sg
dG8gMjAxNykgYW5kCmVuYWJsZSByaXNjdiBzdXBwb3J0LgoKQ2zDqW1lbnQgTMOpZ2VyICgyKToK
ICBwYWNrYWdlL2t2bXRvb2w6IGJ1bXAgcGFja2FnZSB2ZXJzaW9uIHRvIDRkMmMwMTdmNDEKICBw
YWNrYWdlL2t2bXRvb2w6IGVuYWJsZSBidWlsZCBmb3IgcmlzY3YKCiBwYWNrYWdlL2t2bXRvb2wv
Q29uZmlnLmluICAgIHwgNyArKysrLS0tCiBwYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5oYXNoIHwg
MiArLQogcGFja2FnZS9rdm10b29sL2t2bXRvb2wubWsgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
