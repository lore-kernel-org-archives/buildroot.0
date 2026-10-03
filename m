Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5A5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 03:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 371B040D8D;
	Sat,  3 Oct 2026 03:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUZ-KLJMdHCd; Sat,  3 Oct 2026 03:56:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4883A40D82
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790999768;
	b=YARogelNtTyCOR45/A+5SulbVpjWCzCcA+ZLBLDzMCmThdkCG3dEMH/duXhQBWw2Qa/b
	 H5dtYl+uc562QtTUPE18+4Za7FbQ1FW4wKAnpu+qvY+ScC4Ca1vEsXw1gmxaZPebPA58o
	 nlck7CpwM6LQ/UjwYXcHwWlrZCUvGKKiGLjzEX1UkCiSATyOAGbCSpYrEftrdtfPWh6Ir
	 8OTBvh6gHgJt/jDF4qYeYSQKyGSjZrarYH0ZLLjVPGTR97caup8BnanBk8E00UicpcqGN
	 O5ZzKtyirXWqtSrsh+2xTuwAOrEPSGJbb5OtkmvUXLtWB2wZ5lCTwuw1CEKiPu/niHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790999768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cDkSa8lBKdu+HcbQjBzFtr+Fp7jcVpVdSn4QbuDt0SY=;
	b=fSVZ5ooA6KXI1HrHP6Ze5NeFILJXzudRI7bigVGi5YoR5gCkLFmjxQ6xpJWfSi4AarBI
	 vShIKjlcHklaFjBrgTGqr+k6ZwrnyX5tqUAW0D3lDt99SyGjLQKwviU/LRbZXMSgwQVK4
	 g40alKSyxeB3qHLb9eHv1pq5RqZYajNbc2JOllfQ3ZOII4c+3egNkOdhc8w5vDRVPUqr1
	 y1ol97zQbnYcVcIDMv2+CUeRgpgStyI0mtXVPqSUwsx7xrpmZqoXOVJao0jcp04cVuTqL
	 yMSRYQDmWJIwT/iHPwDMbcRPJQSWN4NBQaEA23rFYvzPDQo0apyJMaoyuk2ajZSYckA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790999768;
	bh=cDkSa8lBKdu+HcbQjBzFtr+Fp7jcVpVdSn4QbuDt0SY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Q3EATNKrwH0gI1wPiVwBOO4t57AAvcF8XS15HZL0OYwxQzIA7XFxz08seg80RXlb+
	 I20ubZTrBc4OP2QBkwRuhE9MMqxpGZ05uepyDOLRe0kWYAGVtIIQiDiTsMb/f+HuCY
	 p0nZdsT3jaCiqMbnLQxHjxFyffvn/Etq2z7Nc+NzETlXqiYO68cW/5B2lKUbCaK20u
	 6G4w2k2ze40nwXe4lH5lV527mWLpknRF0Be3OyIczAkSpar9U4JI8jB0zl1gEtOxdG
	 Lx+/rmHCP8nYo8Pep9dDQTXzhueP8IsHQ0CnbBCbwHZfF4pho00om3hNQxRE1Rm73V
	 Gy5wKFJYosLtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4883A40D82;
	Sat,  3 Oct 2026 03:56:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24DE734E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A6FB60645
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWmusmmFmhJw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 03:56:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1C57060642
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790999765;
 b=HXhN1lTSxZhUNdYhtA/3om2ZQUNMIYMRYX1QUL6HnJlRSa+p2N6bvY/kUjKfglwUgsO3
 4BafZ7rq5omuCV5bNgQynQ0imNANUfg8ZJ1Wkrhr1ig/4GAScny75RJzwNcWSanf1u6og
 xHng1lB/8yRxUCHBtq0Ng8pNNecAVLIatlW1l2CBwA4uYJTtSfmprHDKa0FnjLLD+yCU/
 l2xbdcJ2ILzF3apuMZK1fm0L77I8D2IiVYIz5PrFjYL3A3A/rJpyYdFk0Hdtr8LGG+e8T
 jYyNzHjxDZupGCimIipeeaiVd7c9YI/10YSnXBrfgYuc+DYcT1bJ+zEJogwbGEv+WwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790999765;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JYyfichmzJljffCLrsGuSXTD4vL1rN4VVXVsFvvFlfE=;
 b=TBE98DaY4cWrpjrWYMQQw2s+DZXoUcnwxaWVn++YynmMALctUgLsShEgh/ReYLKpkibV
 p3EicUI70ujcrGCqtbr5TbnFEKAZtCUFQ/jH50i+db8lAOJID2rfIbuCFZwQ/FJ93RIrK
 D+5KBIJsvER7EStfBDqXSqSVxtMcCAdzR2++RYeS7gvG+kpNsqZ+uuwWvLEZcX8z5p6uu
 D9S8CCZhiGcvIXkyfcsdUCWh+THOm63njcnY06mEE3TW/lUIWzaxjUzAr5ydM3I5fgSmU
 64rNCHH7zVY0iWi1sWGdaHUHrrxLocHeYz7Hd/HLhWu7jkHhsZXfd/+1cReoaRCxIgw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="XPWh/TRN"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XPWh/TRN
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C57060642
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:56:04 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-82389b6da4dso486675a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 20:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790999763; x=1791604563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JYyfichmzJljffCLrsGuSXTD4vL1rN4VVXVsFvvFlfE=;
 b=XPWh/TRNQhSNiGGxx6SkyvSWTDC5r36B0MUDJ6id/zQzGmpZtUFolMdoZzXMKbhYKf
 Cr8ZeepZXvn0RovmsxyBs+p3yGqypda4xI+raQbeVoHf+qgHnUOIyBYYBLSiQaERzWJx
 ybvWnpba6efv8vYQITOhOYBWrIjn/CKrtXge/4Dnopcm+kS7MorqQZeJfu/vTn9tmQC+
 Z1DGtMV7+4PgWKhK39M3oT5EM+YIemv8S0W8v/YwStgtnZAHkQ2ZvJvUZFCN/ryeI6Fo
 WBD2dOHPDx6OvhWf7YPi0bi09BHQTKBKllCz5JnXZjDrtcncEPXGmjLQ74Rh1ul1JLln
 QHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790999763; x=1791604563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JYyfichmzJljffCLrsGuSXTD4vL1rN4VVXVsFvvFlfE=;
 b=djGm+oP28g6Ri9hdxpjSgMJT0hwfnrhwitypP2eWGMG5rJWRIiZ0CceCX80JQpGK1l
 LCNYUKNgKX+1SnhFhJHJC82R9M7ZsW/cWnBTyyTiV+foP47QIzAO8nQE4rxgmodN2ccm
 tCsgUkI490uCrcShUUL/BXhBgn9SOEbP3YAyoL3ymlXb9cZ1kazns/x3tMf0j8RBXDRw
 x+4lhL14dhy4q+Vy/Y5lxKKlUUMRdK/DxNCKk0CG8uMoXr0EIOZ5VAX3GH9WgO0qQ4Q9
 hjONqyLore3Ab8rCsRVPmmnVFP53fT7JVWvFTDcSBvyEvevulH8rnxTm5TJRuEOpV6ri
 XzsQ==
X-Gm-Message-State: AFuF++nQ86FGK5sTtk7WXPocoPoYZJSC/m3XIjopY0oNuMMrAsR1RA4v
 l0u0gavrPd7P+4PUWnPcsv5X8oyh1CAzLPQ7Q3EGhlFs5JkaxyTj+AV0JiYEkg==
X-Gm-Gg: AYBFou1X5t102MtNN26BUX+srjZQn1vsXt7luMQ8ZTddB+eCh0iWNrpb4AX6iZQm4l9
 t5zoBFBIYtAu4+oGHZlEaIAtI03Ijx9YZPr5R/ULzyQyshqOaUQECv3+j+2ZgL2cbYb8zVvw+vZ
 wB0d5RTvxin8XtlLMVBHi1RxN6D0vdJ1NScmCqiq73AxRFZrnsx3jNb3POgXqTybsit7fCpEwF3
 Kix9kVXS2QCmydIAXWq9uAmBbeprgp/UU1slloQY4FC6ygAr2vgruTFSfOOxJpSjwLnQTM1YzcV
 PsWH6MBenb8ft03+Uu+K4VlgU5KpxyM+qefTelHqmitucxjGO8bQE+J8TTX4XdrN/sjb1oAP1kE
 9mNr3AeFM6/Jm0e21jkKKmLcfE0t/o9KXcAovFOlAD/5xhKWIHax56L/DURstjChxQNTrlvYAEZ
 JvHQxX5oeAk3IkA8JjBRAFG86YyI5gofuNVKl8ANdPG1bYIesxpF267StWUYI7l0meeiAJFVlbQ
 qMHQLiKgOWgiiHXC/Bg/E7drlF5poi4pSRz4ppDkfOEpGOdzcDXV+bRFhko9QpIC/+Y54QaE+ad
 tjtrJEs/HFzUuDDHh16Cwm5xsQplcNmD4QUl8I7aXF7Jsdh0hGdkEVcrEmC97A2MZidp8grkogD
 Uy3OQCbHFCyAoFDKaGWtAC7SVhl8yuQssHIm0AKaIlNNVIKbQQk7o
X-Received: by 2002:a05:6820:2089:b0:6c1:f832:9b45 with SMTP id
 006d021491bc7-6df330990c4mr3095607eaf.25.1790999763138; 
 Fri, 02 Oct 2026 20:56:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a1cfa53sm4658394eaf.5.2026.10.02.20.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 20:56:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 21:55:54 -0600
Message-ID: <20261003035555.463812-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-pydantic-core: bump to
 version 2.46.5
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 92e97f6755..3c164a3dbf 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  a79f876fbf65e2568c30c9b8a5be0a2817bd314c2aa483b4aaeb80ba8443cc4d  python-pydantic-core-2.46.3-cargo6.tar.gz
+sha256  cdb7b581d5d92bb77c831b50d39cdd561b45649056e0ee0f67ea0c56cc33c831  python-pydantic-core-2.46.5-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 333c73a21a..0b5631f0f7 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.46.3
+PYTHON_PYDANTIC_CORE_VERSION = 2.46.5
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/2a/ef/f7abb56c49382a246fd2ce9c799691e3c3e7175ec74b14d99e798bcddb1a
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/af/f9/8a06bea35ef8daf588f707784c973a7046e0034c8d8cfb08828eeffb8b75
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
