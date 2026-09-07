Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F4AC79F9E
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 12:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AFFF606B1;
	Mon,  7 Sep 2026 12:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hrh37fmAbPLA; Mon,  7 Sep 2026 12:24:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8F1B0606C1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788783877;
	b=HRUZAp229VLJuLoikNe0YUaNQ9bKePYvhDeXD6w/kplINnHkUg0lQ/XaXTfApmdY6V4T
	 Y/GgDtzMh+XcxvYm3n/UHl4GrpY4XdX+H/hz9Me9SpIfArCjqnX51Pjo5/cpYvLzMS/5D
	 KEZ1D8+PXFTX0kJl37sxHMvaZ4XS+UY9mFmuNSWxeFf5lPpcqAh8o10/7BYusdY/69N8X
	 Ah1gUJUPNQJaGA9qqxOfLQhqMt1Ugdqa2/sdVOdSxSqksEfMySQj4I/DearG7OllU2cx0
	 zQ1+j0MjWyuToRNnbGIUgDQkysX3li2TSOtnLJqJsC/RX1JKHVE4hPkPvCOPaXhWqDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788783877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4NuVCpRSu+X68w4CAqsiZiwf3uIh5g0qSUOdfhC01sk=;
	b=Vy0i1GzHxPKVUmokYR0niagEs9ymKdcbCIOISW2UvfrWoHHlcqgkD2H6vV1bROP28vTe
	 pxG/oYETx43IJOrtN6BYKzFNT/dOpj1ALvx4lyQLaFWVAgz1wZiiGsZhLcLi17ZM4Q7jj
	 IDM/HeTGQfF4QrdClL+wq3IYUzk89tqTrmDnmdkWX9up/8hGEUeLJJqTOl+2h8HirFO7D
	 4/qXDLfQfahcVdTx0HSjLEpc+jijZJ0fHA9Yz0ASIgnkhVWDk3ALmZeoMdcLc0OBywH3R
	 fN+JHCDNKexbLkdJwo2jqCs9ZFGVd8bkWAcPvnirggPZAnfbpqL6F/dTY1DftE2EnNQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788783877;
	bh=4NuVCpRSu+X68w4CAqsiZiwf3uIh5g0qSUOdfhC01sk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lXtLMyxq7a+AAURSE/72NpGWgtUqwoQX/u2+VD1YIBPdB7BBYr7Yk0CnJemVA7w8F
	 NTkW9IjmcT1x+YLOgyUUm0UCorYaX9V4sfSeCqk3etzZEaKTy5H+++l9ib95WrwguY
	 1ORzqqhpmKGnA6OI/2Arfs3VgwfCtmvldKmOzrg0JirkXfUBZvkAvsTnj3+mk1KA4T
	 SVMFJNYD5P6dRG8q+RonslPwKxI/Mg6a1JHdF7zSZ4SfvZoIK83vNS/H/0QQzbeylg
	 6EcTpLXlgW6A0t+ovl+awRfbWD3nfV2ora2QU0Ah3pnR/FU2UU6/i68QHEhGb7cntf
	 KRiv1CsZBbKVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F1B0606C1;
	Mon,  7 Sep 2026 12:24:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 842AFA48
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6764740135
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pozddExgA9oU for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 12:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 07DFF40133
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788783872;
 b=gaX7l88ZVx/s16UJu1c/9lqeUXPuh7cVbGQiLcURB2aD1H5LdABRlBZkUAzDCXeNzfwR
 H6B38MsR3sZ0rl7vbLfihQHmDDYsfuh4auwZY5Zljr+hGUnr+Icz0AuiDuaJg010d/gZv
 Kv1a9spJmwthAOw50hQu9ykblas/lkIzR+Xs/n+E51MdqR2NqSnBYmbOhzIp071PEAVrH
 VKZl04zPK1NeefeciWUk1J1WlxzU+w5dX90jOGPH/sooc9mPXYWdEL//lXxJUJHVa67Vv
 HuZrm0JyZZJCdTRK3Z2rgHX4ezV8lpX4MnkhErSNKQtyw5B9j2RyyDOjlZ84mW7wYqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788783872;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=aPSYFRv3bMs035hHfvhf6IMqa+DwKFOqQLBsj4cWoI4=;
 b=onyl7pzz9DSbvtZwhj1U0I7lB3dRi4llmMJUdtY04KYK3XfyxbNueL9qeHQtLfVEefA5
 PzlQvRjquW1tW4t9jXxNXZPWomnN7xk513E5T+GTa9U6rYD/dFkMaRaKahNDOBhmJ6zM+
 GS2OzWCd3+SlMnRgJmKbMng8PIprMIUbYGMDSevyR4zdi5f1gG6xsYpRmdMx0RCcJMsQ6
 YuV32g4phrZB86gM6Fomksih8bRyBMAjSrG+CMug/MccTqwt18z507HSAfV3O7penyEWR
 lOj6XLclCtopaiyy3bO6UIse3pG8EjfAzzERQgCCXnbxzGWnDKZ/NYhnXAEzWoywznQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aRVs6o2p; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aRVs6o2p
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07DFF40133
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:24:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-495590dde14so50132385e9.0
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 05:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788783867; x=1789388667;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aPSYFRv3bMs035hHfvhf6IMqa+DwKFOqQLBsj4cWoI4=;
 b=aRVs6o2pxQwpV1OlGmP3E6eo3V5GaqGTuF2+JpkXmEw1Aff9s4/KV58hx+jBQflcBF
 kRB1c8TAc5YZyOqauhrZwyClO5ZGg/XuMsVsbfQGcGDWgWXBqADloZjpsJTUiyV33k9V
 SiQ2JetYAVKOjEGyHyE+IEW6kh54RLVnFBRDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788783867; x=1789388667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aPSYFRv3bMs035hHfvhf6IMqa+DwKFOqQLBsj4cWoI4=;
 b=AWUge3GxzjtKzDxlsLN2YNN1i4iycA3nKLXMGZ2Cs5Uyy7dbYeSZC6WHRTp4lmNKP6
 sEegDFnWnEI7Ss7dzZtkFDkfm6atjg6H+tsG5vgDBikZ1JswJaasooW7tWvBmJVBd2P5
 Be0E4ljP66Ix+RyutLV+8mnyhLpA6Brf+C8wx9fkPZRony1Emv+rZtepGxTYgED0/n51
 FeQpLqeZvhI9x4X6qwl74jIL8DWSjQ59ZOsoTKaDs9u+seHZ5NcVtGZeYg7JrxQGIVIa
 /N45QTF/Y/81rgyFS+e1GAuuvnX2wz2piD27HmY56oHvZC5Z4Obs5V2RfGwF95VJno2Y
 XOQQ==
X-Gm-Message-State: AFuF++mG1mn6BnMYAQRsi028+TbCTpv78tvoAr44uikeIOItykj+3/xy
 WnGFAX9FUZHaUk66GM9AHoHRhedRUHNkcZByK7bO7uclb/qjerUpUpkqpjuf+kQ0TWgviWJR12G
 PN0+1aCg=
X-Gm-Gg: AYBFou0p9hhQauG3b/NxwM8sLdBXcOyaDlKABCJ3wktdNhaNqy6Dtd/hY3xaQR6qsDh
 B3PmXbGYYNWE3uubAGNL0Df607X8gQn/P+1VePppVt42nQw0fKaHpwCO5BwzpLxPM3z+9EXsqYL
 lwRm1O6zLvz3GVYjgFOeaJbQaO5NlX3D4hWP1CluHQ1sNO8l6E89yKmmeHSjLDsXaLFeWysWW1Z
 9TfM+JwQzIdyPlhLhoF5xixyisYD7/qQpg6u5WrjhrG0NnEigQbMiGonWwgmYd2pQFs9zxeKYnD
 faTu6Eu0gJZillZowvYci4BV4hN+TXLk5kZuk4+VFH7BJU7UNjui55RJtbslGSzVBcp/kygXtix
 vfGJCk4qdIAYckwBFiOQBOXkARvdmBZmxzcob95pt6j9VfprpLsKx0ex7t/9OXORTp9NavfMxfV
 m0s5tAHiT342ADy002BgE/j5P7xqe+9miDMB2SeVJQHUAfDxSbu+o3MP4h35kPP6+TMJwV7F93p
 AfBoxllG7C4+CEvE7ATGAAMWvGQ1fuDlaHdJzLvkX20ZlpX97jNMv2n
X-Received: by 2002:a05:600c:a0a:b0:49c:e1f1:3dd5 with SMTP id
 5b1f17b1804b1-49cf81e6cebmr400171825e9.4.1788783867367; 
 Mon, 07 Sep 2026 05:24:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:34bc:b4d0:3d5b:964d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be01bsm27724930f8f.31.2026.09.07.05.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 05:24:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  7 Sep 2026 14:24:22 +0200
Message-ID: <20260907122423.1350497-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pocketpy: fix build without threads
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pocketpy enables thread support by default (PK_ENABLE_THREADS=ON) and
then requires Threads from cmake, which fails on toolchains without
thread support:

  CMake Error at /usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
    Could NOT find Threads (missing: Threads_FOUND)

Thread support is optional, so enable it only when the toolchain
provides threads.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 23789dd62028..c1ae075d3897 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -12,6 +12,12 @@ POCKETPY_INSTALL_STAGING = YES
 
 POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=ON
+else
+POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=OFF
+endif
+
 define POCKETPY_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
