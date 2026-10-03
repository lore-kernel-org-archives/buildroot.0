Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6156ACA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E6F60DE6;
	Sat,  3 Oct 2026 01:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tap2KJzYgijj; Sat,  3 Oct 2026 01:34:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4B7B660DC6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991240;
	b=sBln5qXEZapbRIDbPXZAz/ZVa9+jsqqU7FbNT+n9xJrlSqRyvZw55S2jwN+HCHpEDRdK
	 GAhuNUClIQjdQQfkCnO8/N7uaKLXLYwyUzULh1H6WutERuSLz3VnK6+QLZggB4d6UBB7K
	 dmo4TnpUd2PssBypo/EfQm0/wZsgpK8kq3JDB9NZ1dG8Q2HcHXk14ZaWm5Sap2pKaJjc6
	 oY8gp/TYB0mZ9qEkCKSIM5RNeT4DknqNP9vCgoTUBHTt66WpJ7y2zjwNV3zKcMQW3ZpBU
	 n/O4RnOwUOoD+fGr8gTePRhn5ELpbshilsN+eXU35YXu04DKNB0+dcLVTan2414wsqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zJdUolPo4RYetnPSozc1LQSZ1fHmoPBNoOgQX6sN0dw=;
	b=UOK55g5WogSRTv9EMF4CiWUS/F3mvgjCH+Msl0B5ITm3/1N1euywFTElhIZcPm3WGcuL
	 RzVmTcVCea2NOJd6okVw2Lhe75Qv7CTNg2wnud3AmDSKHFaCyC4jdZENBSXwCgKGq8JA7
	 25PERuYxhJMREKiPEchMCiDIaUyCvFIMVU5cSpP1u3sdOXh+q7nEB3IX/gvHumPnhBAUt
	 WJaKBaNN/aAbzRTieKfg6YFNTN2jhMW9V/p9LFhDm6Nw7eRYidlU/iiJcmyxCcHZUnxoC
	 siVZlhoJXxpL360z6Or62vHDDBGiJNtxlWWl/vkkNnQLZUeQ6UB2doSo9eu/fgZn7cA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991240;
	bh=zJdUolPo4RYetnPSozc1LQSZ1fHmoPBNoOgQX6sN0dw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jeVbZyHEX2m6CXQJnKa2AXQ5mfDKeVrX/S+NR2jPZXFcWAo38KoAZRTLnpSsZ+se7
	 zthW6c6kGw4xxU46JFAtDuc0SzXujh+VR+jfsxqN0A+WBsGuP7XAlY+iAYVP4Bfyfs
	 cRlEtDaMyAwAPju8ILEGNvQ+qmyWaeqdKvk+RyUJy8HNJJLVxaB5pVk9Fnh0BUd6iD
	 Pkta6utPMF7l8YGer1LChUnlh6TwcslCqYFe7Bj/63/WYDrK75nyGu5Zn7x24p/wSk
	 iGwTg5itkCnagzVdxbAP7WIAbkVvtFFsiDaq1QLVOd5YFGV3z+LrrU3JQh9f2gDPBo
	 p3zWj/aC+tqIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B7B660DC6;
	Sat,  3 Oct 2026 01:34:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBE902E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACF21813A7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWGtT_sQpCYX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B72AC813C6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991237;
 b=bAoeIbaQr3qe5XP4NbCq587+otYVi3/gcoJlfyrzJIVrGU9zzRAIwADK5LqzdWmMZhST
 FDOcVS0XHgo5bYcubL/LNk2OHapZ4jqRBotcuGS3iAwCckftLolvC54iQhnpZ3hzQLq0M
 0d6sAGNqsO//AIsu6cedMLlRNykS6aqZqngh3JdVYmoEZswFOOayJjCL/kOmJ4ejSlvb2
 XUCxuVC5ppIcWbH5hAQOp2UiAL+b+oi07BG/MzUieGXArdn9dXpOkQs6nGF3SbXpA3kyW
 fMKTSoJ1zW/zxgTZl2GgzX2wFWnlcjZhnuZxC2jP7XMJQ+GWRtVqrfA4P77jpcsCR5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991237;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+LnXfVQRkal2YDS8wyIpD5YgsjXUz+WXzxRGcqB9G2Y=;
 b=Jk1NQHeEh0wIj2rdPdJ+V8+Qldi9cwoq/+cnbmFrvC5P1z3nyYheKOQb+XLj+deNu8JT
 DCaARKrcWzvue02NK7aWpZ4UpSYZL/dLmi4bJzjMtSJGP2P7uo8AxjBQUyx6mDfCgU4/s
 RjM1fbLeE3EGf8yFnOzSiQsFe1lVikxT0fHX0hRUPF0ppxlN8yOvvONwclFDCbuU1e7BL
 u4O5BCiZnvuLF1mNgGW8vovM2pxcrXZX8HggA6xCNrj3MWS+t0XAKLumceKbWMFRCCpfV
 ZaceOnyHNMLIy3birTxRTOHh7GQDuAK1N9yGAm8oEeMIhk7UJiDPBcidqVT9LMK9XdA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eOphqVLn; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eOphqVLn
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B72AC813C6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:57 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6d821901872so263914eaf.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991236; x=1791596036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+LnXfVQRkal2YDS8wyIpD5YgsjXUz+WXzxRGcqB9G2Y=;
 b=eOphqVLnlLnvo9nIKVqm01GH3vXpsb/zszPQUwBx7KEhqk3NQpCU/IqIKkdqK5eVom
 V1PD3FSKmQfCQzUSHKD94m5hTie2OIIkzHsTlSCoLmKN1efVRaEO/uAR9fEPut0dy6gr
 W22CiyVb9HCg7NyQRX/8ux4sljSzUBPHVYk8o7sc9aP7v6ZFKwW/n9KTRyczUCwC0hMh
 L4NaB8CgDZRF1JayM6t1+hbTlmgpevcjCdNmEwEd33lUfItHuc5QUufzs59yF3d9gDhN
 3pm9TD27eTosVbS1SEdP73NWaCXRVqUCRO1856SwZT/Nr8EA4Eoth5CQQDYWvlEsuqvy
 8efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991236; x=1791596036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+LnXfVQRkal2YDS8wyIpD5YgsjXUz+WXzxRGcqB9G2Y=;
 b=PO5giBvZTWsWnhF379Kfd6orkK/EOgH22xIw0XhFJRKSUllKTtP43xevTwYF5rnt1w
 zZerWceYP3KvkxB3xaamjZoqNpbOfB9h12/nI0JqTE1azKL4Bm2yvZaDHkXy/sTXgYHG
 Qc/w8PhNnVRvjX5U73lvbBzhzjOPi/UNy0KxSo5+CkERYZO6FFEOMgArzKTzslSW3ca5
 wtZn2db6oTtgbpVB+sD73mIhtf6qF1IglfbAUJ80Vrvb7APHwWhWScjdfUIbIKkHFq+V
 yvA8pzvpCHQ8p0cOkW6/YZxLGUEIjYQ72lC77QqEYh3WKjV2VZtaAbxJWgY96nRdIwwl
 YJOA==
X-Gm-Message-State: AFuF++mFUjcvCQrrDbKqckeHKMmmLI7YruGN6Cd0HH3Uiy/x8X1CMZmE
 UPDCI8kogr94xv/c4FobWfxr1KltB8SWdq6muQK8Md/ydU+0M9hNrEGaUz+g+g==
X-Gm-Gg: AYBFou1GGXbfSfjAwHR93PpJpp5FVhjiYvEtxCZKL0x0GPfOcet6ikLczEHkkuK03xi
 heSO0BHkpJy727fvdPjE7Gq9VJplbf5d8nalXDxFszsTuVTBtwfQ+d/aywvw7Lw8ULHLrwfUI8N
 lT4r40Ky7CRYE/qOZ0h+iDixAUqUZmdRCWpAoodDevuBN7mceTe4mG88008vnO5SuC+GhkuiLF+
 LPu/IIiizs/yUlbeT4TPU9SoKBrKmFu27FzCcCOJiP0ZF09p20hIeZ4l4Lmo/FjnMUIWowqC2Jk
 GDqJ7bg+kmYfD8lBb2RzE7Zt+D+UqI7j3ktBKalIXeiHXiinsQgT5TlPPagZNtQvbAaE/TCgMO3
 8I6SFi4g5bH5Q7tfT6Or9xS318WRjvxbG5lpyHNYu2bm8TYZvzxOsdn6ZhnyBAbhG/AorYwMk/y
 Gg1rohgLE9sq77VPtShNcaXOYFAFz/R8agldncLA6Lv+ozPfD3wmpV1DBRtdN+/b9KNbXrN1tL0
 Mqt3AdCq9BMcT9wNFtd/AnjF8By00SJtvZ6tjrHdoyNPHLp93f98Ir3uXp1bSmEIqxBJhXfV+aU
 5ynG5mISiVsYNBqYs+4BfK/DapPCP/C14CGfIiipY6oVRZWx3Rn1w3CuZMLvkoSc1MovEHrISRK
 Zhznd3c7mccZ2G4VqQQPhywumNVD0tVTxoCMJgHKU2ugggQXaH4zs
X-Received: by 2002:a05:6820:627:b0:6b6:5bf3:e22e with SMTP id
 006d021491bc7-6ddba79416bmr5503405eaf.10.1790991236363; 
 Fri, 02 Oct 2026 18:33:56 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:30 -0600
Message-ID: <20261003013304.400979-30-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-typing-inspection: bump to
 version 0.4.4
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
 .../python-typing-inspection/python-typing-inspection.hash    | 4 ++--
 package/python-typing-inspection/python-typing-inspection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
index 71ee5943a8..ba13d7b128 100644
--- a/package/python-typing-inspection/python-typing-inspection.hash
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspection/json
-md5  9271faadd8476a3600e9cf9d428d812c  typing_inspection-0.4.2.tar.gz
-sha256  ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464  typing_inspection-0.4.2.tar.gz
+md5  9eb41f5bca1969b126f61febeb516a51  typing_inspection-0.4.4.tar.gz
+sha256  547274fa6b0a561ccf549cc9524b999a578e737d015d8709d021f9d0d13bea47  typing_inspection-0.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  804b59b25f2c31bd278f9202a19ae49a3945aa2664387e2d0a128c7cacc61ec3  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index c0af54056d..74db189565 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECTION_VERSION = 0.4.2
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.4
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/a3/26/b09b8010994eccc3c09092e6b34058f36a460eea2d4c3e8b910c695975a0
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
