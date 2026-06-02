Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BCECD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 20:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3777782F19;
	Tue,  2 Jun 2026 20:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FONxth7G-JFQ; Tue,  2 Jun 2026 20:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF31F82EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780431807;
	bh=OiZI5EVhstUIiXj8R3BpXcxCCzx7uOAZT84LCT4Ge/s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=oawwVtAhxKqMifKm7JV4XoeRgA1/kfBdtc10286xbEgsS6TLjNTwR2HPGtFluT7gX
	 EPcMswdngcqolmVnPIwZlUG14QVNLRKY0+ymJamI+Wc/221XQoH5A1GKsQHSk+97dS
	 LHKDD/CwglRlwqRYkkrjDUP+uJKf3MOfqWNDgATFXvpb3CTE+UzOWXclB+a7uznNXG
	 oTi8QgtugxJI8aJb4epdC8D8/m5xYnGQeoW55hqMSc4gWM3ALiGbsf7JOqmVLCmOLn
	 perk/IBtYAJAuPfKJ8IOnUSNpMXu+l4nRS5qW3Y/khhFCrI7oN/g2qwBDtfs9H2PMj
	 Tiv0c9eWp+Mvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF31F82EF1;
	Tue,  2 Jun 2026 20:23:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D34D3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AAF760D69
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfUK0_Gl76pZ for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 20:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8600D60B34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8600D60B34
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8600D60B34
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:23:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so3693937f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 13:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780431803; x=1781036603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w785cA4ql6fbJq4J0vLUAIgE/0WFFUCLvXgSZ2a52Q4=;
 b=EfZ7zZEXpVQdebjmTiRxy0/2znOCjEvQGqH1sJgeWvJwYRlJYT/1SIEfbmDXKja/yD
 jjxhaxZ2tvY/l63yVjtWmEGMR44tKKe6bfbYFpUVSjuZipSl4NHyUDfA9heO6up4T/ZR
 DOeSM00NvG1avtJ2lpBRYKiHfhnSUM3bte0xz79LTYegVPz2CngXA2wsWZFNIvAjUPNq
 CzSuY862PsbbKOT6Iqtd66nDwIV67slAaVPy8qila9mIkH+/9SJ6BJhmob51YR7M1IEh
 J7jtA1IBUKtrz0yoANY4qlDc2KthuuRzBQB78g5TjgMKsBRLytB7PjRvnjmbqdR/EKSU
 WQBg==
X-Gm-Message-State: AOJu0YzdzI+ZzFbR+kMT+KSDZCDrqgAZVoTZkqqw+USLVHf673Wp0smi
 UVzuD2jhZxR57T7BLfj+kVvczhS0mAwMvdWxUg9hqUz21JdLAx1SOYdG/v07LAvXItihASpqKQs
 ggp1M
X-Gm-Gg: Acq92OH1COi93mNppXNz1X9ls5TARePMKNdAUQSHrAjgD3UBc+zwiwT03lY4xpunCm1
 Ls6uvKvtVwSj+E6GoY5iAc4vedvTZEQl5mLgtgInjPPvr7iK1mhsxnQgs9b92rN31W8GUHpno4U
 yRJs6paYh8olCjytGGIfsjL3uWLibuVdon9uXeFL2H43zThseBA3unEB5jnKkuYjqLkYkK68KKR
 UBN58nX7zqKE3jLLA8JZwkGbPu+W5dJCF6ItRumhL+yI7TZBVjb6NqIoqv4aCYJaVYo/zrz1Msu
 DZEB05aNjFH9bcEU66I2uuX3eDsOMNehDA9M6iG30aOwRqcIPCrge2hw2ZUSlATTFzudZfnvvCe
 nYxs8s2/YXMAGw3paDxQ6fujMAM/nOy+jkaxo9vG3uy+sdRaAADwKVHg6CJ7nGZin6RyWbPe5TR
 h2imuiSMGllk/txQzs0t9hmpP2dFC/tkDhQd0tw0mvNidB9kBUC0di8oJbgg==
X-Received: by 2002:a05:6000:701:b0:460:11a7:f82e with SMTP id
 ffacd0b85a97d-460212cd4dfmr358071f8f.8.1780431803337; 
 Tue, 02 Jun 2026 13:23:23 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344541sm1512081f8f.22.2026.06.02.13.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 13:23:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Tue,  2 Jun 2026 22:23:22 +0200
Message-ID: <20260602202322.52208-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780431803; x=1781036603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w785cA4ql6fbJq4J0vLUAIgE/0WFFUCLvXgSZ2a52Q4=;
 b=TANrWpSxJ8728D+DzGJN0GySO82ZEUtnUN94EEWeURw7Pv1BrfqwYIZgct/JDScKUD
 y62uygsX9xpTNfP70J/giYIoRpl6/k5mY4Q6q84WFbq8KroSKCFERN3Yr1N+C6I6eS6g
 0+oFtv3X8zepCo5CNrSCsQ3752uJKLYzfZM1WOF8lzYHiQMdy3xe3HnNXSxVy3d9IOiI
 WeHyJt/jKgfNqu6THkl6PBijiQOfZYAMJSdORMG6iCWMUEp+aSimHvoIxaYpEsH5NvWc
 J2zJHPkwDrVL8YLNNP9r11n0aIxZJUtK7RBzucD/htv0GCaIZticvWI4OZZgxKGqJuo7
 k6DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TANrWpSx
Subject: [Buildroot] [PATCH] package/ntp: ignore CVE-2015-7977
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The NVD database schema has the following entry

```
{
  "vulnerable": true,
  "criteria": "cpe:2.3:a:ntp:ntp:*:*:*:*:*:*:*:*",
  "versionEndIncluding": "4.2.8",
},
```

Which make every patch revision of the package ntp match to the
CVE-2015-7977.

This commit ignore this entry.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ntp/ntp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index f481c5d79b..29770642a0 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -25,6 +25,9 @@ NTP_CONF_OPTS = \
 	--with-yielding-select=yes \
 	--disable-local-libevent
 
+# NVD Entry incorrectly match on every patch revision. Fixed in 4.2.8p6.
+NTP_IGNORE_CVES += CVE-2015-7977
+
 # 0002-ntp-syscalls-fallback.patch
 NTP_AUTORECONF = YES
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
