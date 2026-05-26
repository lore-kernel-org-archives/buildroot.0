Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AA9CD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 19:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB79408B7;
	Tue, 26 May 2026 19:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNHAefK4o87B; Tue, 26 May 2026 19:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7800D40868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779825444;
	bh=i8QEPKlpqAOEghz3vYvJpF6upGVU2yLzHXsymczUGv0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=prFjdvZpwJfkQdbhonD04siy8oZ5AAq9qqK5PHevJp6xExLlvV8w2xAizAvkFpM7f
	 5Q1V3rbdFlkORzIiI6pTHCwb/iBj+aDd9iA+08+oxaP5SXw6N2n0WvbL9ak3I3e20r
	 V4JT2eraUhyHWM9XgfX1F1MGjiKvqFzqZrluV7TWPaz6YgqTmJFrPwLCtq110o/dPh
	 5Tsp8OmBnOdMyocpgcz2T/aRMwTdRRph2o6UAlYq4UDARGMuGLfMdZCbflo9n8gXHp
	 K1WWs/bD9XJIFHe8lWxK0YEgPM8qn3fjOQ34/B1c5OdHTCM69AZAIw0r+Q+NnIR858
	 mbzkQT8rcS6CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7800D40868;
	Tue, 26 May 2026 19:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C4A297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C48BD61099
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7cFZtX7k2lz for <buildroot@buildroot.org>;
 Tue, 26 May 2026 19:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBB9B61098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB9B61098
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBB9B61098
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:57:22 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7de7dc85b74so10399028a34.2
 for <buildroot@buildroot.org>; Tue, 26 May 2026 12:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779825442; x=1780430242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pGR74Sg4jin9VwQJpLEqW2Bmn2ubedsYFubgmG36yE=;
 b=kPBOq41Rc0aFP+zX80JQga1rouH81dI405MvXeMLpPzkCOjYKhHHd+kEVONitd4eKl
 VCBZSLIdWx2Sp9LGK8UGN8Xdi5SBCreMEPJ/PUESxg6abmM9dQUnrl1VzNoUNC79sZ1K
 6NOaLKDIldxkULF9AQGGOkn2PGcsmN77raTPQFegHjnxk4A3ZVBBILkbK5aOoICEyS6w
 j0emOReCDKtjF/ePvzAsta6lscQPcIkpH8WhH0DU/jPWd7oN9R2VqL/fa5wcEM2S5ER5
 /W0221mRwoIim1WrBtZBbRMKhpwGvNWBfpnDfuP0uPvyOoh4elvyll8a8RIgdbe0dyuy
 cJ2A==
X-Gm-Message-State: AOJu0Yxblmps/UVhOGJ77uAbtyVvEHCsl5WrnQyc8YHnTkDG/T8yDt/Z
 UAxTLe59KaX4QgZoli2L9foAMFXU2S58ligNJRcX9sTxABm9QM1phqHVwZOrgQ==
X-Gm-Gg: Acq92OHrrpSvYFoW0SY4dDBcFA/krYFYgjN6SDcUxjcGaa40J5BH+x/S2CdHY193sqC
 nzAqKY8qjfTSCxTPd+u5OfZBy1ky5fbT4iwCoejXy59PVLgkXwSktVnwD7cU6pwCcPabZsPUdmZ
 O0DzC3p15a44qu54lcCSwQel809E/t7/OemnRiHghAbdN1LMozx9ZONGoJiEMvXFldwRsGXON3B
 bvOo4aeZA5kJoSl2nf54UdoIobQwD4fOHKHhUioZE1hrndx+TmVxBx4uAJjxRF71yPi9lrc9k7C
 fBOS3+ZCIDOXP83IzgUbvj1oJXh7Ov+vTZxPBJHd3R123KI0+ZX6n1VmXx1iWz8QznLmNn7VvEb
 pjyvB/hqrRgZoO2P4sFGMGl0Wxh44OM/dMw7cDFTDFzHIwYmHnZkYTSFCGIeyY9ezJf5oZb5oej
 HMEFkdfISpYlyRDdEEzUVaKTWTzrEKtoeJ+UWOiFYpuAzHkOuV/NfrnBWm1RCKDaYqFAP3MNT74
 X5h8L7MJPkQPLTwZnG7QAeQiaHsLTJsWWQrS3HlfLjLud76OCpnsbWGvnVJjKhwdgZp99u4K90i
 fopU
X-Received: by 2002:a05:6830:3707:b0:7dc:cb67:cb57 with SMTP id
 46e09a7af769-7e5fee981d4mr12122516a34.16.1779825441542; 
 Tue, 26 May 2026 12:57:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-131-78.hlrn.qwest.net.
 [184.96.131.78]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e606459dc5sm10109489a34.6.2026.05.26.12.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 12:57:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 13:57:16 -0600
Message-ID: <20260526195716.371653-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779825442; x=1780430242; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/pGR74Sg4jin9VwQJpLEqW2Bmn2ubedsYFubgmG36yE=;
 b=PbNw6Q3jhyHQC3GHoVWtFFkWeqVYGYDVLSjsw6mZ/ldGeFWtACKjR2aOVeHTRPeU14
 EW4Goaz37SQWnCkEXRckE2w1MmqGydVoU52TVdrf+0hmjTSv9HZ0ta1BX+phcV+IADx9
 BGQ2exi6vvAsRrFV8x7cKTbtfvrXE0h8/8D4Ahg0QT0J3W4gsWLZY9icYP5zsrsbbTDh
 HJMicK3uNlI+1gbc2HdaAAnzYGGaM/uAOlaQMIfWdj348ldv3ib37h2nSQp/0iFgQKUv
 1Yh6ZQGIeiMB7n9rHDUiZqNzN1y/DUWEcQfLxl/qBVnHpRQ2bX0IinI4/xMmpwVH3/lC
 kkFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PbNw6Q3j
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 48.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index bd91df3abe..4498dfd45d 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  6cfe2745f466960344bf699234a12e16d6cd16f87e50cc2d15857351732daeb0  python-cryptography-47.0.0-cargo5.tar.gz
+sha256  99bb9d438282237d394309a95f1effa4f91ca1f64f7ad0a0cff0f35e294d07b4  python-cryptography-48.0.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1d5dad3367..bb4a5084cc 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 47.0.0
+PYTHON_CRYPTOGRAPHY_VERSION = 48.0.0
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/ef/b2/7ffa7fe8207a8c42147ffe70c3e360b228160c1d85dc3faff16aaa3244c0
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9f/a9/db8f313fdcd85d767d4973515e1db101f9c71f95fced83233de224673757
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
