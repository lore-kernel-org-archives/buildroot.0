Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC8DCC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CA580ECF;
	Tue, 13 Oct 2026 16:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-wgvhOG4HkB; Tue, 13 Oct 2026 16:43:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1C57B80E25
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909831;
	b=XCfE7jT7L6DwXywsD+Im8ldKlv6bxDoOxp0hj/ENtGIREXwJ07+8EcsLgjzy62gOdIds
	 JdjbiHjIF0J3AY0BhiijCLb1Ivd/Gf6R2kLuPx68Bfqqz9ozV0Yjltz34hpFKqKjG/9WF
	 8hfxp8q7axTI5Ez7ULJNBEHToXk7n0XsA2HSrZAf8AW6VfGi8B05fpBAv0aCIDdJ+7upq
	 7j66lD7+pd9OuX8LdtvrvAn/0+jblUohSFFs5GH/+Esmz+JuNMdvXN1GXNIgyXOiKnuHs
	 iKhVxFTLcZupYLdAG0kvrXlo27C6vmk+pAWA5L6QDef6grcITyIEmwmsWzWbCtlu3bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bdz7uN/iH0ycd0Tx5Ci+96WTTJdXRW0DJSgcNGt+Ins=;
	b=Wwkg22svta3UF8gG5/dBJOTJAyIBkv5kjzFtjwex/7wg/LBBUaATUjR99alebSctxS+J
	 sPjbtd5RKzS6D6h651V5oh0iQyEMDvB9xfNmTHexhX6/QMy1Piwm8kWSgbtrPRoL14WxC
	 /lCo5LivOOKHB/cOnGYqBgH8BfU08GCbyKQXyc/8DsEaknXclnzM/0Y0dOT7eQXxd4nAD
	 FzmS0c5ZaLCnzOMumA3b5/HumT0yIq49XIjh2LXdCoXbuoLJuJC/6DNP3oYm7QwK8CWj5
	 4RWb8i1JTDXhgBgonJvgTZV0fLON/xC0Xl/8FqzS+hECDQeuRuBzGI4P4sU2bn3ImPQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909831;
	bh=bdz7uN/iH0ycd0Tx5Ci+96WTTJdXRW0DJSgcNGt+Ins=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=X9iyN/WigZXPSNsfykVP6jtaMQk6mSVQxU/eRLM6zrJLg0kAfXPiAGVOeluVC6AZV
	 58mmlMo+Gi8mX2es84jngHugApNheJxpp7IrNoUoQiNsIZuEymlbh/5c7Dgd/ZxYUE
	 nCM4jo1Gs6h6NNqA4m6Z2TxMHDT6Gr6JrjXdLbYY0MiV4/d/UbKpb9a9ZQMBsVuIgI
	 tBWd9rbGycVvgIqpYltD7git4Cv5BEikvv1aptlqtqNzQV/sHtPkPdT5ozM1OZDViJ
	 N9op1e2L/KDPNH5uRPgixVlCoMvyd0wIvX3tdFF2MOnCNLqKAil5d2i8WWm64npeX1
	 JfPYdaaImptBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C57B80E25;
	Tue, 13 Oct 2026 16:43:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0F541DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 875A44007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUHeBevYGhLZ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A00DD40049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909824;
 b=akHU66k3Ch1r02r5W/H+SHJwlTmWR2j/tfkpOvS/ynG4oyvyTVjIisD42U1jpuphZKud
 FNiEjYm8GEOCJZ4IZEkjJjvapPV8rANFwxr23CJ/2XxEGlgwYPED52+87mOw2fqyoyLCY
 LejZgWTK0ShXKapc8bHBvXvHCrnTmydKW0IL/atarm3K408kwxFXyxlbnVARj8D7EVHtK
 7ZYNOJR5h9XW6IkfzGKKvgOikBjf3zAFjCGflvAqxAfnVica/ovbde3ez8LU7q+z0g9Tl
 peOGV2btc3ZSUV8hYHwpvti41ksF+puILWBK3EJ1T0FBwe04yYgnRGwRodXToFLQQbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909824;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=qLOgj7eccuhjca15Me0lW/LKkoaWW2MPx7jZqPFJslc=;
 b=BMPC1RYq0LYXHazX9g9I11Om1kmOMM0BBCrt+cA38XfWErqNIJX069UQa/tGcP+ur64o
 +oAPrDBDMKwGvESafhPnbZPXAGJmFwzFPMSIGfPNdlP5BS5YMF2csoRNEJX5jAWLY16zV
 svRhGOLnV5RW0bOz3Ym3uLuDo+o07k67ULx1XRpcePldr0xgTcS6aZaflmcnifdtkju6k
 76/8CtO/tVrK9YuiOS5mktx+j2SXDe6NZZyANpoiAImLW7guwSpPOdLTV9Nw3QAMMTSeC
 wn72AOMS1HRSnA+ORMrCxpzDHU7zumlv6iV5lJNQXuEv0Hi/CHJqxJrNr5wTFDCmBpA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CHr8SWVQ; 
 arc=none smtp.remote-ip="2001:4860:4864:20::30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CHr8SWVQ
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A00DD40049
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:44 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-48eee44b908so1896499fac.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909823; x=1792514623; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qLOgj7eccuhjca15Me0lW/LKkoaWW2MPx7jZqPFJslc=;
 b=CHr8SWVQdQ9SH78bJtgU8Zh6rxCK55kADNC+bRU5cqhL7Q79/s75EPZmQek0p2ihJX
 nNyHodNpFjVJN60vHAMa0Rtt081+Hci2bXcTBZVpoGxq4QrlgRvPNpfih4NzV/iB3/+G
 mKBm22BDMHrqjqMRZY3gY8ws2xHsdWpV+9zbfIAZ+iYm5TXZYstNRQWVjjg3H+i+M5+W
 OGi+G1uYf6GZV2aNBUyfAiyKiU9/wbXQSs2C3DqCq9h/4QSlhWCHgKWo1LpdvndC9RN6
 Nc+EAZ/OIih70W+bJ81bkp7H9frqjXTBh3uoIis34XSFPNn+QCMdH6bR8Vn4CrRpaEie
 BqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909823; x=1792514623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qLOgj7eccuhjca15Me0lW/LKkoaWW2MPx7jZqPFJslc=;
 b=nAN7lxl/Q5DV6lsADg8IxHGCaU3kNmbr1FkVvKG62c1nAZfjIdrOg1pP3qmNfLPmfU
 o6g4EfXOTzuwv9ILrEsohSdMmPKVrJbW0IT+8DykmTpB/WrofMXKXzLmRVdJqwoa8JSR
 fBwBzt/BhhuL4L5Ik5eotm/3BYrAF7AwCC66IZwRcJA1nayYTmOJ6RZAOIsFOh79FA8N
 d3PV0yD9GijjcDyvADOTS6uf4+vcBlKIO7o2Qyipp5viFWGOVxvJ0MexUukMyYiTrDQk
 tq8Pdg3F1dBiyub7VIdbpR7LNTmPYfGCap29jzwCABVeUTfiDeJyxI3ul5HLSw3PDKdu
 Pp3w==
X-Gm-Message-State: AFq9FYIl58XjIUWruPsHZ0N37XTOns7I89hXYNkShZWIE/7bFibXxJSo
 JRWATzgYXUdbzsQX8FDKdbfR252lh6yfKKYV6NFL1ZQLM/31iCMr5UBDiBFJNQ==
X-Gm-Gg: AYBFou3BCAWyu/4cWg6qDLCh3+dGTQgpX1No9mBTCYbCvU3LXagqiBooYVgAjQS+9a2
 1DyF6eKTYmPtWVmNYZ3fElEX1RAMV/v9pLZyV9NqdZHf9mCSAX3oo9S+9OIUMkmMticXEs4ZY2T
 FnQZacnR+kTTKO5luUWxfDMUrKR3rwdBCt/fkAsfWHyX40iPOTEbNmid/tKT3J5AakCwwwpbOI0
 EfDdcjG+6vBzoNHrAo+q/HJ5mqk4MoUi5+XM1iB+etMiInQ22rBFyet8HjB5ybl/+E84Unnq7hM
 AKxasnHCoBKRxbccHzahSCSddYBTtUVJKIUHBlE7M3izwa3fr9nLbkKmN+dxvOav1QboTcnLwKl
 IdjnwCbc6bJdwRIng6BMjc/dslkLuahZqBIwzb4ljMLn9nrwmhxLstPqEkpebcaX8ApvCO/maX7
 1LMRj8qRE3O/YHXvCnphW8J6dogVALh58AQz3Or2yU4Hbus2mXaU5V24/jKaWmM9jvitqyva3q3
 cob9W1TIYyCsJvog3GxEX/P1jwMX49eWU3zEFwhpllbEZJJRIKJQ/rwm3Qs6TlUeoKr0xlFkCFG
 eT3etsEu8qATO15q14U1d2pUAiIh4A1BJm8dE+wpKLt/q2E8aONRNzXauAI+r3mAfnDCMIRk4ip
 B//mUN6QZPNjX09jIzlcBSI68vpL/TAyLv5XWTYbk78QRdVmR/k7m0Q==
X-Received: by 2002:a05:6870:b3c9:b0:49d:c8ae:35ca with SMTP id
 586e51a60fabf-4a2a89ffb41mr11508291fac.26.1791909823336; 
 Tue, 13 Oct 2026 09:43:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:16 -0600
Message-ID: <20261013164254.1476592-30-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-selenium: bump to version 4.51.0
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
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 4ac6965323..c17ad00388 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  6cf2734ba0e1651163a936122739140a4a9689226a58f1c57fd56ef67dcc3fac  python-selenium-4.50.0-cargo6.tar.gz
+sha256  56d83852139d542e3d53cdadbe52e80697e08e91b7c804e0d4d8f0a495d793da  python-selenium-4.51.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  307012b4481479a56605420e81db14686a0274d246d06d224c363ee09297d330  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index fdb9a5c7fe..e1d288cfe6 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.50.0
+PYTHON_SELENIUM_VERSION = 4.51.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/1f/6c/09a5bdf96a5f850a2bf69ee670a246ae30a132dca3975c7fb081aae09338
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/c3/d3/c925308af2c9b9a9ccf531cf23ffba4f38c0d750f088a06e560fb2ca0c59
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
