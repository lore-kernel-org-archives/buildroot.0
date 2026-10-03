Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A63CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CB1D8138E;
	Sat,  3 Oct 2026 01:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYHfOe-wfbUk; Sat,  3 Oct 2026 01:33:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4E6B681380
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991218;
	b=QcW6cIXzM7Tb1u/tIcWKpyUAmd1Hzgx981lJSjBlR5YHmblQkiKp4oHIL70fgHoUS45o
	 rhVzerhmAWeOBj2tHtvIuFOlVJCbYgMEEjr46DmAt30gzYuG7E8uyhIe6Vqz5lazu6e1g
	 sod10hMYuPRtNJ9ekxND3xofypWYsNAJaYPpmhxgCh/VjFAevoFgrDFwIsbyGZKz6kkBP
	 1BLauLeXRmF7C/bSDLFXxPBfWm/U3IL9OHoxUUav+nEKP4GxLRViTMybxC1z48SghJYVO
	 bPSEbbatKbyZa+9OdcrMw7KRaHWLjY4AkHnnRI+4YSRpVWjv1I2iY/AgXqajemO9isA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZTYJ5Rt3N/SWngQbDM8M6G43h8YO4xfrv///rw7IJQU=;
	b=S//PPnXkp228SrEZ2wrE0eXKptJAAnD7lYXhhFPOMIDKHASq7sKdmys2hz6Njf7pvSh9
	 DnfkXDldnbD1hwBpCsZRw1oLHXIaifNCaGV8+Q+FJ4vApL5nxlVrZvUIYOKQI1hKqgYPD
	 pJ1jSFCUFF5NeMoQJ+0StFS9kyf5cydfJGJGkYN9HnTIuFwMj56nSXlWLEur+7zMSduZT
	 nzxiWOmy3YW4oMaLZrfmz6EvRgEZzY/iW2Ad52C0vWWQcbK8AfYfgJmJoY1Wt6kX1SeKY
	 m23FBPKXdPBU28ICCo9y+JYmdtZ/cA9grKNOsndVlVJG+vZ581t1/55pLUEb3MeWTDQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991218;
	bh=ZTYJ5Rt3N/SWngQbDM8M6G43h8YO4xfrv///rw7IJQU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HnilkX532UUTc/PouCXtjY5er0gnjeK6HxGTEDhEHMEG7K1/fLnwawSPsh7f4k+kk
	 qI9GVCB29slmVpx9Qe/5Ake7O3iS/niyoczZ7pi15He6kAhZ2meDMyZpRZX8gEf9Es
	 5GAcLQuSzIKqoDka+33vRDyZexNeYB6J24Hlmol6r35Erl8RU0SXlR8tZ0Wfm5SKCG
	 uqQFddKBUw7nGy2+xX7SJfxLEB81S5UpISZLB3uo/6pZWBoaAFT/SBwH835kvD2QHk
	 dO/XbeTqjLses5M9XI4aizX1Eu5iAXRgE7IwKfI6qkm5yZ58Joikoc1RAKaBrZ11b3
	 0OIqZ6JivETWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6B681380;
	Sat,  3 Oct 2026 01:33:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3DE179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AC9E60DD4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyJz9GTQpbQz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C8B8F60DBB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991215;
 b=CQnn+Y02S/qxiyEg56PowlkI2rXi3HWx2W9eB2Hp2y/zspOovHgnk/sJqLqdDG+IQZKJ
 K9khGe7F6DQcx1x5B6aMEi98k1fty7UCr/0IXtLCphfD1Dic17m4tj0OZhAYupar9SnsR
 biqW618zzxD5kRstvVcG3f0NosE4AhqA1XiBI7TL81IRiA55/TK8bofeCKB3E19S+2z4t
 g5yAb38TTopA8HlnyzXCe5tCdpUO+Q39VdthH0uAm2C/tkEs0yMSLo12iU/bMIqyrMDZU
 ysPy0D7jbQOUEbxnzyHy8ysTNiQrxnIPZ16eux4m9MFfUBPMGht/+wexi7bBYoji/eg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991215;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=s0Tl4T+qgn+1e83aBSIpxbmDVSujR6vrqy4ObvKg+04=;
 b=Uea8RaXSsncKbsoRW7fQ4B27uz18rB2+WRpJ008S7oEhIEQLpkI3khwOtLMqH0q8ZmiQ
 ECt6IOGKyLLvB4a79Cr316pyAlqzBcb0yFJIjYlkxAlqUno7uHg3Qr3Lu3tPyTwjo/WTa
 HuzVgWopg5EXXlAdKvR5jU8+NWDNJilVMysyzyNXO19UxQ89syX4vtGLYaxIEA+iHz9Tt
 O6ulpCEjTDUupBWTlIhHJT8NjRuoyPt5zot4AI6I0N+1/6R/d35Iv90OO10wyu1JH711K
 zQV3biGoOeuqOZItcVTL+Bo84QOqy5KvI2Hhkmz/oMfBIBLzllG7lmzfC394DpqVskA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FHA7hlqE; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FHA7hlqE
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8B8F60DBB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:34 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-81ae6aefdceso325190a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991213; x=1791596013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=s0Tl4T+qgn+1e83aBSIpxbmDVSujR6vrqy4ObvKg+04=;
 b=FHA7hlqEvJBCjXPZ1As0bYaUnNC2VKPSTsr+1N13BICZKpF7lD3rY+fT7sHw2YMYqe
 YzoxSWuH2bf3sBSRHldXSDq5Q2EtddEV7gqrdNwLPCgw8l94hrYTh6GVMMSVlv/0VKmu
 u0g5Hme3HilCSqhuqsv0QEOElcnbSBzfr3g01JDPwSo1Uk0jwYMMPrzlXksDxLh0QshM
 IYndCpUIzoOIBj6lPn3CpmcqLvTEpzva25V0LY8I9Grqf95//IS3QZszxY+zcJy5NZ6f
 Snie1y9yxvKhgjMjPTDBhRKagODt4db2kwMFABzG7olMeHH3b3GvGCKrBTtYpm3HDmzd
 +PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991213; x=1791596013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=s0Tl4T+qgn+1e83aBSIpxbmDVSujR6vrqy4ObvKg+04=;
 b=0oYTdAdyqPq6Y6q7AiEeZA4oHdW09B6QP8cbF3ph1KM3ePZqm26Ue+lAsmg59BZGjy
 qNTYYyFX0kIdnFRm2Sd5htH4wnDVhR7kZ7xNhkQh7mFCA+UHdjMot9OhJcgjA6d7JwgA
 LlK5kAD++Cet7Zmv+ESG+yaJfPSxfSbI2c3vwf65PbDzGAVfP4JnJMub20Q74kC2r8ne
 VS0MjPmtp/5pifjVA61f62EIL5Mnfg078BLEQSyfrM46x4ETEKIVwmWcB3BvRW9v3lm3
 5g3g5xdmS+agD4+3qAy90odqG1rzx0h1sppGU9VFUOc4Sp6/YCJlJ9+WTtsU5bEv/QT9
 hWUA==
X-Gm-Message-State: AFuF++nqDr4Spd52FC35ArZj7ZFbaygIg3IgyyUzGiAXHhUApm+5yhwE
 aFuKq8084OxPoVegV9nCIIvPLfS7IGcWuz2UaRbbBJH3emkzbm2c/c3upPXF0A==
X-Gm-Gg: AYBFou07+rIeYsQgHesSWyysoOtnxRltw34lsoLJoYN5I8MTuRIZInbeHQXtd4hSfuR
 c0nV107vooJaclfqLNRMsQZO9CRd1kLMcpqFsMXQaNlQX7UZc454YY30Z+CGencYLSx9pSa1p6F
 DyqQmcpnBNxci4hpIC4fGtHwuQCbjdq/uzID4psSFnZ+zoigseYCt0N9qexwjjeO4cyZfZ85UvA
 HAyUEa3nzYhfwEmaEtqyiJryOFKGQL5tA7eSVW8ABCa11mf5BegDgLMKV37fIqo5+UTb/TmZLKu
 yiuAF9qAdGBa+Kwbv4Yqh0FbIF/o9fJqnWw45FxOkf9vGTHRvJMisOqE3nDJQ15DQmBfToh2R/j
 r/BHQme/8b9EUBrSLDegEQ2SAHSjLz0vnnGCCusaLrIZGJx11ihMKvSjOl0mWT+jp3t+evNj8aF
 E5Xbxxs4MgIAP4hWegTLyiTLRyfNR8MNm9CIgklyz8vLk7/QOe6/JB35NA5xkAJwIWBxIaehYzJ
 pbOkd+x1K0bfa0ZFcLLNXE3yqIYgltPdKwLIQH5MeuDeOi7b2g9ggbUuWg9tQCpOAegEpWnRW3+
 6RkA4gM3Ab4smNBwPEGMUGYo+3dQLlZgFdFQweTeaPvmFuqpe+UlEv8TxWf2XA/zrZy8TqjpewK
 gHhZ1BoZABFT8Hv+n06MZOrqpz3Vx+HRWVAM6qcObkA==
X-Received: by 2002:a05:6830:2105:b0:822:45a8:4c73 with SMTP id
 46e09a7af769-823fde0bf41mr1084845a34.30.1790991213383; 
 Fri, 02 Oct 2026 18:33:33 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:17 -0600
Message-ID: <20261003013304.400979-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyaml: bump to version 26.7.0
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
 package/python-pyaml/python-pyaml.hash | 4 ++--
 package/python-pyaml/python-pyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyaml/python-pyaml.hash b/package/python-pyaml/python-pyaml.hash
index d761e088ba..c8a8be241e 100644
--- a/package/python-pyaml/python-pyaml.hash
+++ b/package/python-pyaml/python-pyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyaml/json
-md5  c3bf0c6966734fe2283cb4c8f312178a  pyaml-26.2.1.tar.gz
-sha256  489dd82997235d4cfcf76a6287fce2f075487d77a6567c271e8d790583690c68  pyaml-26.2.1.tar.gz
+md5  43c7fbff45613df7e7c5378cd0c96543  pyaml-26.7.0.tar.gz
+sha256  11cda3a796efc6dbce0d56836be56cfd26289dad07bcd78e9904086729929c93  pyaml-26.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc1342cc1cb49e24c1c9e8a495acc9625ce2e04146c116279af0ab0949cd829c  COPYING
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
index a299bd3618..34a9c12335 100644
--- a/package/python-pyaml/python-pyaml.mk
+++ b/package/python-pyaml/python-pyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYAML_VERSION = 26.2.1
+PYTHON_PYAML_VERSION = 26.7.0
 PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
-PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/38/fb/2b9590512a9d7763620d87171c7531d5295678ce96e57393614b91da8998
+PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/15/6a/acfdf17de0d6947b419da8696e02b781b18de2cf49e0472298b50e1f0711
 PYTHON_PYAML_SETUP_TYPE = setuptools
 PYTHON_PYAML_LICENSE = WTFPL
 PYTHON_PYAML_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
