Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D315E63F1E
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 23:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AD5A823C6;
	Sun, 15 Feb 2026 23:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5LdjuhKV36w; Sun, 15 Feb 2026 23:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A2E382384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771197057;
	bh=iynmhu1KVrQotFAKjwHOUfB9J6u5OrqOIXBKUjObSvM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U1Vf3GIJFws07fqVW+tjtRpQFSRd0kTMyyM4RlJ3ni+iB1IabnHUplJFJazrUeCXM
	 tDWBs4xcex+gIIOvCm6O9WJGdzAephLK6jgu10wpssL1HWRnTdtlOEAfc/GsWyAcys
	 JbNMzlUy+vDdr049yegJQvWmLg1qbpoRxBQckRZrqV/Z3tkGeMbzBT//1Rh6s8rWOY
	 awPr9eZakxWmtD/P80sN4a7qK7cPif2poKQQiE3GjJajzLrIsDoyiqenknGz9Rdqtp
	 Ga0qQi7WS5SFLhvbaF7WSqNzhYMu1mvm8oh+LGxclGBleQPuppD6D2s5PYbbWAI1Yg
	 /1KlEgoPu43FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A2E382384;
	Sun, 15 Feb 2026 23:10:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A191270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69E6240A2E
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjxR8IhHF1TA for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 23:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66EE340A1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66EE340A1D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66EE340A1D
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso9206285e9.2
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 15:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771197049; x=1771801849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/zMDWC82oA+5/tFNV2Pyz5wAzEKh/oqlTwqk0ZnZJEE=;
 b=aCAXQiwAMfQSuSzzw9POsgrg8ItDitTX0CeLPhAgJo29mY9KSjKBxbJi1fxFvc8gJ9
 9LmQYJtJ2c1HgWSNnMC8lZa8An47jsIejsPNFJCMSP6p2lArW+qxf9LbMv7y4c2EnRQS
 KQ2N4f/YAv3m/ZlDTkITnXZNPPOeTIPW3lTQwSbjuGf3fTDfx8e7dsSkpdVprWhfh0Qi
 5eyP9mztWimFF7RaY4AaNVjGY/u54AvjuOWyA+3WG0OTmU69IlQG3AlB5yKhLfU0bLao
 nmHRRs5h0r7R32mqLbwcQe9Cn0kej3K/cwfZfuS8HbgY3FRIF5SSwdFIxdFHCzqp1ej0
 M9oQ==
X-Gm-Message-State: AOJu0YxJxgP/nhNU0uRi+WpWy7FwYgqNW7++WF/O2psEGVY/+MfopoYi
 ICcda9B73LxQiT8/Q7Bg3dVTRfV1dYVGSiatdo0Pc9eAIzOgeU4y7mt/6ognmg==
X-Gm-Gg: AZuq6aKpZ+gYezvLDsHazbcULJbz44hAfyqxDmeSthUo1DY1YwAHiril4/gwSisc/Ik
 PeZrgbv2h5vCpDHqRGjcWgVk6zfV2q2UaGbv7AVz0V+o1Wm7ZsZOscWGL3W3/Njok2TQNHb0iAF
 qrKB7Y8F2C3DRFcFPvwnJ1eGvTp0hrcuT8gxoDqZGIc5dkTpmv4MDTMq9IB+HR5GnJfbqLZ+PC2
 jes774RZqeizhfmPxqb0UHr9j3eys6ICLYVxmWy1qmvq2e7qyxUhcvTPQSGvnTh4mPps3YDDlJX
 eJAjx0rRhhWUwAaLG9A8rZCYiedhb7TlhLRh/wcwKiYQoq8ghwCEkj2C7EkbIlwsLigvPXux/m6
 0LBHsfe9OBofhVVRH7/tK5OQT3rZTSUXSISyY3CfgSgDnBROYc4OTbeJPO9jS7AEHIWXkOR4TOW
 JvK6c9yHxv5VB6LbUvbhYuEs3haY5TzTcH5+pKWw==
X-Received: by 2002:a05:600c:620d:b0:480:3bba:1cac with SMTP id
 5b1f17b1804b1-48371043046mr140030245e9.6.1771197049205; 
 Sun, 15 Feb 2026 15:10:49 -0800 (PST)
Received: from localhost ([78.208.235.85]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfb28dsm354300305e9.11.2026.02.15.15.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:10:48 -0800 (PST)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 00:10:37 +0100
Message-ID: <20260215231040.1010538-3-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215231040.1010538-1-mattianarducci1@gmail.com>
References: <20260215231040.1010538-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771197049; x=1771801849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zMDWC82oA+5/tFNV2Pyz5wAzEKh/oqlTwqk0ZnZJEE=;
 b=eHhG5jv2vp80niu7mvyN89MLVILdkrs98SxfNGMN+K7j5yJwWun6BBesuklLVggoB+
 AkJaWkJ8/ZfgzYQXdV5ki4VHHbbfPiZZj9ai+haObzRfYC4UBCGEiCvURGqrCLF3eZxK
 mRvE5PUkFJx8dfjV2soM8WyV/2uvkmU4i3MQzzLHfjaAV599ZjbNgtwf1GlizwI9brqS
 zI1RaPHNNA3eCVzLiwj2OuSF+5gqEYH7F9l5a9qEh9d+HdvnkT+U9iIRbpIv7SEVkwVN
 +9wpm8+CekdmQ6+nfNqzTpgneK2jY78xeTJyU7W9FvAR5Qn9bJe21Q1UnssXP/5Hstz7
 3inA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eHhG5jv2
Subject: [Buildroot] [PATCH 3/4] package/gensio: add portaudio optional
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Portaudio is an optional dependency which is enabled by default since
version 2.7.3 when alsa-lib is not available:
https://github.com/cminyard/gensio/commit/71eef5e3cef2232eed85c5cb604bdf5fe3ebf580

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 0a45a872cb..034a3e29be 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -62,6 +62,13 @@ else
 GENSIO_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+GENSIO_DEPENDENCIES += portaudio
+GENSIO_CONF_OPTS += --with-portaudio
+else
+GENSIO_CONF_OPTS += --without-portaudio
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GENSIO_CONF_ENV += LIBS=-latomic
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
