Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7640EEB569
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 18:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AB8B40279;
	Wed, 31 Dec 2025 18:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-JLhdpxMf_f; Wed, 31 Dec 2025 18:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C546E40295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767207051;
	bh=8mpo2/IQJZ0udFhEMc/RzU5vYizxnZhn2PA5GmQwPnk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=D+VX0AFR5s9FxyMMX154lnp1HI12Ya1vxmJWggpDVQMhmL/iszzZQFhASWh4Q3TYm
	 swRzM9l2BWA7gvDVGfcKt473deCTXjGSEaPBnLnqqoy0X3FSeC4E/w2M2XJNvEJZB0
	 k+QmMH/LY71tdyxTtmVAZNHegjder42JY6JiKX1rpA5lctVuN7a1C8au676374vKPv
	 lnJf/wcxrIIaZQ6jG1UW+AMWi8HfZLVBbeTR3lf87kc5FZoml0o3D1+kT7e8/WSu+F
	 dxr+UiZrXkBruBEYwlmfXxGqlMLXnx5xVDSLKEUKNXf2QDBAbo5t1HmmENrinyyN/t
	 wuROV4VNjneAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C546E40295;
	Wed, 31 Dec 2025 18:50:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 205C7249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0730E80875
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8IdJNodTlmP for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 18:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25006807FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25006807FE
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25006807FE
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:50:49 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-4558f9682efso7184402b6e.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 10:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767207049; x=1767811849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y+L/Cr+WQHdjW8z4M84RUEjVgfoJ+wLHYuReytKtO6I=;
 b=XmOvQtwdIOKb5+KfOTfSrOBZAIQnKioFS9ibkPyHNSSg0Iz4JbF04KWEf6RgtuRPx1
 41xEP+jQ5ICHkCejKyEpYerULanaY+OAN2Kp08NtkRdIaKBENfcmfVdTBWYDWVKB40Zo
 kygmtCs5vLJyoT0Dt65erKizOMmFSO0hv61WUZlyYlVTz53XlTTs9DKAE2RcYnAl4rn/
 8RbAvtGxXX20lu0v2KfcRnJ9UjDI129tTiByh9gVvMQb1xiZGTDQbSkDgP4NtqTAv0Hg
 EYQ8DTO8J28l95NJdE2XFuqsfOXcyaD5gPiSvT4fNKWNUn8EwNhBmvnwFHH1F005wj3y
 shIA==
X-Gm-Message-State: AOJu0YzyMHC2LocElC3aBPjpQvf0UNVow9RBWsf7kB5dp5WLCxXNz1hA
 PzL50YN1mjgA/L/0aLwkk5s/qZfTdBA0Xvo3L3Wd3wzZlKxI0t6PFON+rdSnEpaUKak=
X-Gm-Gg: AY/fxX6GZsRXlq/WH8dPXDw/Ga+rUPf/gCRDCaM6XjUmakQSOeFVfcJ+N4BGyBFilR7
 XTXXrvWM6TJMFOTBIVD2nleqiXm+jQTxqkjujRtnk+HanJutJ5Yikj8+W5eBA3YFCiSHh/zYIn3
 2ZZYVLp7uS7HlKzBUF5OACsScxumhZAkH6F6XGEwCzc8N+II5vFi3dpLmnLb35Styv8IKYlF/4T
 3Gw39gUK0B48o8MrgNl9Gm9e76AOd9SUHtgoTvjE7xsgzuEpnbWznDTppwipBbkAbX2gUJwx6sp
 jcqLOdhUYVj78ZsERRdlLSIccbcOrtGEImEUptU5x3VrFi1EWMvo4upiFk/TyrAlMN042v+LRRp
 dyDkN0tg/SAuFWMXUi1FvSexuxMUk/eGyTHs01TbRy7enDWlc+jCqy36MvursPuexcAlDqpinKu
 SOrI1GnfS29ZDQDm3shVjRblX8EGTOeiGVbiTfb3JmPugeLX8TkQ8FfUeH4w12Eb1LZJPwhrIn7
 8Bgae4yR0VfpoPlF3sBLUb988fovA8y+PBMF8d2SsX5bhFYADuEL+A=
X-Google-Smtp-Source: AGHT+IGAYUiTniqviQxX+X9YnTJ+PiKkruocYvQFphwxlb95PtBU/ZM2ms1dW5zJItc8Mfsl6FstQA==
X-Received: by 2002:a05:6808:191b:b0:450:42c9:4cd0 with SMTP id
 5614622812f47-457b20f8f9cmr17062189b6e.49.1767207048902; 
 Wed, 31 Dec 2025 10:50:48 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6680358asm25552721a34.30.2025.12.31.10.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 10:50:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 11:50:47 -0700
Message-ID: <20251231185047.3955846-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767207049; x=1767811849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y+L/Cr+WQHdjW8z4M84RUEjVgfoJ+wLHYuReytKtO6I=;
 b=gCENWMibB3pBmT2mCvFvFk41HvrRR3XuTx/kWfTidI/oghTLsjI+xQt9cN6X+vkvmd
 iImr7H2WXYJLROKYFnfIGdgrr6Aqr74VN9VsEqcEhEWf70CuUVYFxOiGozPNAe2/iPRf
 b2iJw9Ymsrd7FXpGfkqg2ECM9l79SinM4CHceXDZ2Owuyq5fhuH1cH3sr5IOkt4Zo7Wn
 c9vnAyr3JxusDZOKjiJGqQMQjQ/qvAS/WQJzdghewdLP5SdAwzZXBQB007OtxMgD8EXo
 p8lGUl+h8f5/eqLK0wlxddEsBFgV6lz2wsblkvIyPO5jcPAOAFTL5YEGVs6B508hZreV
 P+qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gCENWMib
Subject: [Buildroot] [PATCH 1/1] package/python-termcolor: bump to version
 3.3.0
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
 package/python-termcolor/python-termcolor.hash | 4 ++--
 package/python-termcolor/python-termcolor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index d73588d22c..725bbdfe2c 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  50ce238ff23fb53077f746b751b7ba7b  termcolor-3.2.0.tar.gz
-sha256  610e6456feec42c4bcd28934a8c87a06c3fa28b01561d46aa09a9881b8622c58  termcolor-3.2.0.tar.gz
+md5  30b9a5ef79026a6073009f045e17f04c  termcolor-3.3.0.tar.gz
+sha256  348871ca648ec6a9a983a13ab626c0acce02f515b9e1983332b17af7979521c5  termcolor-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index e0a6677241..e0ec72c98b 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 3.2.0
+PYTHON_TERMCOLOR_VERSION = 3.3.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/87/56/ab275c2b56a5e2342568838f0d5e3e66a32354adcc159b495e374cda43f5
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/46/79/cf31d7a93a8fdc6aa0fbb665be84426a8c5a557d9240b6239e9e11e35fc5
 PYTHON_TERMCOLOR_SETUP_TYPE = hatch
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
