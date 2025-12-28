Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC0AE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF37C813F5;
	Sun, 28 Dec 2025 18:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiHXQTqkSWL7; Sun, 28 Dec 2025 18:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE0D81416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948215;
	bh=I9rC8dmp/mEp2THAZUvIcMfFpxqsXb8fYxND4CTHRNQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n/e9xafLNGM9qzkjOQtT94hkv8w1zws9CFpygWjibK5hvCeuOJJyDdvDbTbSxL3C5
	 9OzV7SvZDywGxTC/bAI6R5DxR5fQdc2EBzTCC5NmPObACC21jX/c47a3cCRySss/zk
	 EzyuRQfJ45BdAKBSCrSR7Ct4YWOCTWtmdZi1iL+0KIEBSzrxsTWxQvP1IadKuNVnaI
	 GYIIzbXdPMa6b1XvIFaBQ3cVxPzgj57edz4k+6uUB6+OKlAC9IIax1aThnOPxYfcQx
	 g/k5gQoaluILJqH9OO9Wwfc7z94ztjlZkoQqyzVIvuRg5uJ22n3QZB3w0Hjma/UEhD
	 NcEIwLYHMRRrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCE0D81416;
	Sun, 28 Dec 2025 18:56:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC44B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A01E4060B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Xvulm0XNJNu for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 054AA405C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054AA405C3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 054AA405C3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so49549865e9.0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948205; x=1767553005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x6LhuTDnsLbrLyfdz550uh5fmdhJEaBKPuihX1jHs58=;
 b=wz+Wh3RmsZUUJlzQHWKOp3uS7AFp9IlHakvNvRMnSdgb9OW6ARLpbZ7Fo6savd3fpq
 ClK4aSkzk8BONeqEtNaJmfu0MPxAgrblqk0jktJeQyBSC5mnFFQCleUbNm8Ef5kJ9WWm
 tYp4oKHJjaLcdo2bWuDjTR7lBZdedbF+UFWtk3UXQM4n5LxPgoEEtGV02463JtF12gk0
 Tz7pyFlczV4Q0DDRb+etli9oi+NaIVJxFIYtQT1/JmT2AcWe+aGA5LmgrYDI7MXcsh42
 hfiI0Gsv6B0tcGDtaozccIZKeqBs+mATw61MWanM1AvzFEYmo0Jppyi3e9/zRGeprFjJ
 rymQ==
X-Gm-Message-State: AOJu0YxaSctQbTn2xJHN3qKfmsdjniFejVFHEC7wfj3WskKiVQAwd2ag
 4D+9NileA5IM2a159sXrDjMr9FlPOYmGnxCTShQgOIQLMn34Nn2mfczcZrXUSHhjpiyH/xn+McK
 BEp3dsOc=
X-Gm-Gg: AY/fxX5j8kGkzS1jiwCUenpDw9lvRxNAy7AqI+Ei78I2H97mdKCvz/bQJfV+eXCZYAD
 tkOJY+GlfiFxK7LA0C0Vj0YL2mSstDTTcagr6sCkt4vacjWatmI0804vj9DvRvAswF6MTbzi63f
 R+Yceq96om/p+0VqJuyz9OFkqH6+cqEeBxYJmTjrsw4w8J6QWKGhPa5mD07j6VAE44CJP4mZMK2
 n2fLtAmMJSqiYzz+L0tPUPbzYvn2tTjZCkTL1tdFG9hmnmJOU1aAzzNIkqMxmN6HP+URkujbsJ8
 ol5kaNvSI9mDejaJAHw3c1HMSIOKjZh7QvdaFFCyXhIkmBf3SoZQtQ6GZuIt4JLJbwS7ebe06Bx
 fbq9LX9N11CIuJHtrCmyhrnxF4Ag7SFk92CMapH0aWD2/3iBUeXlycBLl6YCdufhLfTm+jYYlSQ
 m2dFZoWnphIGvYGUpTgTtotPnjeq1Ic3aEKphQ/vs97RYaV5EmdeThNTE6KqCm9UUkbWA/BTY5
X-Google-Smtp-Source: AGHT+IGKNkk8+lsX8sB+wvUFiIhdRMwIZPPv8Zi1rvIJIgZKKE9r5vpjUJlVZ48/Pr7wpH8W9ZUCjg==
X-Received: by 2002:a05:600c:468f:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-47d269c7019mr286393225e9.18.1766948204863; 
 Sun, 28 Dec 2025 10:56:44 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:44 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:34 +0100
Message-ID: <20251228185637.58072-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948205; x=1767553005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6LhuTDnsLbrLyfdz550uh5fmdhJEaBKPuihX1jHs58=;
 b=TwwtVODjSmpio0P3MbB1rdQ38itppJz3cv+kdKV4KlriiFlUQmqD1+q+X3/fIJRlZH
 hIkvIO/W8dehWEhh1KYhL+KdPcaYadpcTU0Xx9LLtwj0nqQppCkbDa5ga5w8v7QTfI7j
 MuBBMpxXVASdzd4mFlZB8RfCKPISQXInAc7rAXB3sWjoin17UympDzPsctyPU3UyJjcC
 7xc81APukYrfmlJ3DkFvzunDqWO7wJixyP71Njrtbw0UENK5cymw3qRKyHxY6gNIlXmg
 XQEcY6pYmiuFBWjuYZTuYpj3+ApptDrAg62pJ9xa8dxtXyfylTMzT7AOdefvBCZGjTpK
 Pxsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TwwtVODj
Subject: [Buildroot] [PATCH 09/10] package/musl: add CVE trailer in patch
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

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...04-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch | 1 +
 ...05-iconv-harden-UTF-8-output-code-path-against-input-de.patch | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
index dbfd87db76..a0418e1df8 100644
--- a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
+++ b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
@@ -17,6 +17,7 @@ buffer.
 bug report was submitted in private by Nick Wellnhofer on account of
 potential security implications.
 
+CVE: CVE-2025-26519
 Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=e5adcd97b5196e29991b524237381a0202a60659
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
diff --git a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
index a14041364a..8250790d4f 100644
--- a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
+++ b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
@@ -14,6 +14,7 @@ output byte count overflow, moving the output position backwards,
 potentially past the beginning of the buffer, without storing any
 bytes.
 
+CVE: CVE-2025-26519
 Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=c47ad25ea3b484e10326f933e927c0bc8cded3da
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
