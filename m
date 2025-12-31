Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665FDEE645E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 19:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E870404C8;
	Wed, 31 Dec 2025 19:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBFyHKdijlVq; Wed, 31 Dec 2025 19:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FC26404D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767208433;
	bh=ncdRjDF10qr5BwUHqZNEJ5MHsGoULM85IQOLGlgxwVA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=H6jQzEwtwQhzEm2AbR5tUouVE8k0WnU7429xCjnVvEHpKSGNFapnMOFR3id1rdFhv
	 moFBgCtIXIHONSF/ULsCDaU1orsB2v98lh9b3n7pPwG6vcqft6VELzmuUCOSidu7fn
	 RhFrmjMSalKiQkjjX6CVVhgeMh3PmH0LevqdHLJEdvQUExwhny+Q5qpKUJotrk/zxZ
	 j0Pce6ZsareNh0CwuIZosuXoJxsIkZWO5ssfhg0tdLT/BoHrdYWhl76SrBOoGqJids
	 sHfMHPbAgI1dfaA/BqdCSjLH3V801QIVLP2Vks1oGaSDz450JwHwlrfKObAWINBllV
	 90q21NDxjK1lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FC26404D7;
	Wed, 31 Dec 2025 19:13:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36299D8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C10D404D7
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2mF21TcmvTP for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 19:13:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3813F404C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3813F404C8
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3813F404C8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:13:49 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-3ec4d494383so7875293fac.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767208429; x=1767813229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DEg/Mttl3qybC/nknLHl70OJxArjC5OKO5AyHVHyyE=;
 b=Q5GLTEu4ayQ3tdD0CYeBJVLiWVkKYp4UDdmUYQAMbBU/CllImxF4MhRMPm3VTZya1J
 z+byB82I3u2JD1CgYrgh9vw5uZo/XU2nmwCkx/cI5Wt1ITFg54oBpa5OAOvHJTsSabPw
 55xBldlD++6btGNFym5YqwCLZ9vnete8t6uErvRuiWi2elM7Kq4gQ/5wzoAqhX46UjS8
 PIEUJbnzcd5jnVJmQg5tIaafHP5QRTADvM7gaI8h++Vvmh7cpOU+BRataJX/GyLUSKIi
 1SrC9tvbFsJyn2+PJ5syIBTxZe8kuKtkKWSILmtWe0RMwzWReKT4KiELiMaU0nig9jQ4
 MUwA==
X-Gm-Message-State: AOJu0Yzwbdb0YyVfz4t3JD4DZfimIIdUjf/lw6dlZGvYLOcjvgDEN/63
 CjatJX0el9phrqNfW3IA3PJ4Sdc0JUuY6TlNyIWsr2CfxZ3WgDK31QCmnDQyFyIqFaw=
X-Gm-Gg: AY/fxX7b3RzqIpCNHiHDVvJpUcHgj0iqR8dX24bDm72PhhFr9YxTLnFOxcUJyp3A5O8
 eHc60MHpMltMrbxUHX4hM7Iw0/9xPDHB+OYwJIjR9hg050n/hn5c3UV2azkAcpjiqUtREehXP1R
 RwvnaT2B3Xj9vfwHvLmTLBUdMB+ziVkriu41qx2lWvF2GyFU/W2fZSQIIj318V2iQkl8aJerCRu
 b791ZTvZRt9f0XUQ4pTbhwpaZp6tYqu1s5GGJxxQFcIg+94lJXhw1FQkrX4EaJ6o+1rd5x+bEJE
 tvUozEPkvwyrHcydTucaEX4MTVZr+vQ+B9Js/AV2ALMi2fUDQfT7LLlk5acbANUU/+/Vr0ddvTd
 MGw1+iiaR2XRFP4hpqN522B4PezuT7vvPFcKCRvvPYieZxQ7GwoA97oT5Ee2+IjkhMJVH0xOFkA
 pA8uLEgqVk/ga5TM2ZcDQb1OswE06DPgOTpM1HtFXY2gemGyApUxxECE75W8cAp2c7Z9riHQzk3
 JAfWAE1rWWydqiXLGJJZajYhgZmnZ2UFyebAPgL4H0ClCBKloq4/F4=
X-Google-Smtp-Source: AGHT+IEOh8pmt8yVhM/qrUFde3sO6l0ad9WUpnEZoL6jxEPO6ufNW9cu0y5CwZl0t+uCBuJHF0HZGQ==
X-Received: by 2002:a05:6820:16a1:b0:659:9a49:8eff with SMTP id
 006d021491bc7-65d0e94d552mr15954047eaf.16.1767208428769; 
 Wed, 31 Dec 2025 11:13:48 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f3f8812sm22087639eaf.1.2025.12.31.11.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 11:13:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:13:45 -0700
Message-ID: <20251231191345.3991740-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767208429; x=1767813229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4DEg/Mttl3qybC/nknLHl70OJxArjC5OKO5AyHVHyyE=;
 b=U5RDc6UF6Bg6PhJOanyBcuQP7brXRZblzTqyd0ziTrAgcCrAFXS8Lum8TuuDUfHFku
 cnPifcJvWYvwFSZeKVxKACop+khOnjJ9pQLi0/WQguXpbM1ctUcRqcvv3IY8lEpPYcp/
 j2glas7mXtnYyjTQRtE3BGTM1B4qblSWj8aUZ21jFuZF8CqHaNmxPHEAYYrCDGVdymWC
 b3Tz2yPSF1BxdaxAmB9bhyLL3wecRWanQVlGN3V0jkfUBL18Xf4uG07QkSk3gPqWqVK3
 /48Z2w48MsLVVfuQq44i35WAlSRkyn15lF28Pkd48HZK8sjZO93N6eaRBG5pTB5GpO0D
 qfcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U5RDc6UF
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 2.0.45
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 6b7351f6ce..cfc42fd77d 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  7659edd862c2b507f9fc4b466d319a4d  sqlalchemy-2.0.44.tar.gz
-sha256  0ae7454e1ab1d780aee69fd2aae7d6b8670a581d8847f2d1e0f7ddfbf47e5a22  sqlalchemy-2.0.44.tar.gz
+md5  9df94d7a8629cf43d2190d5e511fa47f  sqlalchemy-2.0.45.tar.gz
+sha256  1632a4bda8d2d25703fdad6363058d882541bdaaee0e5e3ddfa0cd3229efce88  sqlalchemy-2.0.45.tar.gz
 # Locally computed sha256 checksums
 sha256  9821720b58d4a565b61321007a8ad43ab6991a3959e66cd5db4dd9eae69c7dfc  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 0a7371188e..cf5440a715 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.44
+PYTHON_SQLALCHEMY_VERSION = 2.0.45
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/f0/f2/840d7b9496825333f532d2e3976b8eadbf52034178aac53630d09fe6e1ef
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/be/f9/5e4491e5ccf42f5d9cfc663741d261b3e6e1683ae7812114e7636409fcc6
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
