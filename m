Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AA4CA5FFF
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 21:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E35340A10;
	Wed,  7 Oct 2026 21:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTxQ1R38tTwQ; Wed,  7 Oct 2026 21:17:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 81B7A40A4A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791407856;
	b=ivNvLMpP9cTSrxkj1caFbSI7fB6tomHiCIqKyMKIL5lnv7t+0ZTzzJf5Higarct5RaSs
	 f2I3lI0d2oi2Y1uB1KfYKdbsDUKwbkKgT+cXxh3X5lDc1cjUH69RPUTUZAbzUPBolNVrw
	 7HTcoFqIACA4/1DZ51uqXTSp5vzlttnO23RFIvLBAdSn/TawEKGzX7nWczTaMRKiGtJia
	 1S1OTOGsghw0dLvJSG+KXJvVFWpF55mQlGxsfC6LhA6z4dKsbNkUMXbg71tNSx3T1FAeA
	 OMgzmFNQcjb7HhVeQoiVvGtuvf29slj5u3CHhr2LoLo2C1H/XtdeC3VxboKHI5dMXCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791407856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LKHcE3igOAcxM54KEj0jLcGDh0ajVP03FrmCKBtp/+8=;
	b=SFpXB1LES9QoyXgmtYn8q1JQMWfRs1iIRZAeKX60LwNxXx1Tx4BgbxvZnpzg2cQkO0ln
	 SICSMWAuV2xnM7ohmxD5+Ce+V3yFVsDDsqFxTdYgMPeL2rCbfo0/lOFROWs4H+LT7Kb12
	 Pwai5N1Foqs7GQ0skKiwBn2MJ/WyUwPYyUVIHBPcB+C5Lu+FFaMLSzm1wSAvmrb0fxKg+
	 Jnv25u1ih3QYjPUWRMZLyRVGYgy3IwoYtl9Oby9ckL9WmFByU+w4hKtxziUuVk7VG1fxL
	 bllvCJ5ny5wwqkoPuMViHgGkcu/xDUfL/1KexwEVaUQUkV9kmdv0GPMHpK8fUpDvVWQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791407856;
	bh=LKHcE3igOAcxM54KEj0jLcGDh0ajVP03FrmCKBtp/+8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYHGv18pspbID2CK0QB4Jj0ovZzpdXEmKXQabPZ+gmd7yj06IL7DPBuWPZeu+nhEp
	 cBWKYtf5+hsp+W5eXX+lfD3Nz0+VuEV3Db0ej3Qn/yWP442pJxMtby++YUvPXsNA9o
	 4oSI8jSzLsmi9/HaLx435tDsCjKNARYbqTnl82f8ioSR4j4bXP0ERG2nwpw0qgeNCk
	 lJvF5eZh3JK0cfx0JWI9j5BCvCSLuQQfoQiRFuxjxR8URmWDwNxahunqyR3Br8qmf8
	 Kxdc4jD8rH1EpDZw/vGU33Tx+CANoXdnZ5ta+3+zJW0nN52bSzWibsf1ny1Zs7nmEs
	 wN+Q9Krs0w8FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B7A40A4A;
	Wed,  7 Oct 2026 21:17:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB30338
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D53B40081
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m92mFzypHEnR for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 20:01:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8FEEC4004A
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791403293;
 b=EaGpiiXLzBGv4T7X5O1T6i7deDQqItmEzpf6xYu8w9IhoMs4io/v1uQep1+IIjpAAdBN
 8IYKbIZO7VBFiO0OK5Iltz3GUKDSDsNVoWHVvuoCJFs8VNl7Xvufp+pKCm16Bm0y4CkLu
 AXjwf3a445iKd/riwbvQl+GVgpuLrV67bVnbDFFZHoff/E2hsYp/BO23vyDcHzyjFb7rR
 aF3fC4Cg4g4lqf9Sv7EYLhdDS7AjWbLEK22s5LCIY4zWeC5H0w15+jleea7gtOC+j8Knd
 17LDdedER7aiUZJ0zWxWrFcnzwe6jqHlLP6mO612oTRA84wglBtijfjxKkDpTUoy4MA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791403293;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=b029V0pHyJ6Aiw7FIWAmgtAbVIZNq+2HRC9grjU46RA=;
 b=P9c6bhsNFhSrN9n919wG/pQSDMTF09or/KssF3G67omwh1hKmhQqonldJ5kUIGFEir8q
 nbfEghGn3wqKmJxDI1gtoLujHF60UO8iYbtN+eMG/GAMVuHoDFfvZn9oImhxBI94XAmG9
 53nFxanxWk72/nHkY01AojJ230Jhve+b6h409svQ9sF96zE4FkLSuVeILrnOQ87Lv1YwX
 9rq0iR0WcxIHWH+Dj7X1Rjau3qSjDoXL2TvKmhwppaYlO3JIjhzJfIU5yIFFmO7gLWfMm
 WHO1psG+cy9H86Tvqx8fJNXnF6j/2fRXfJjBUsec5VR/7E+S3hm9PAgDQLUJmME3Y6A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="DxVyvg/x"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DxVyvg/x
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FEEC4004A
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:01:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2e8c710847so302353066b.0
 for <buildroot@buildroot.org>; Wed, 07 Oct 2026 13:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791403290; x=1792008090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b029V0pHyJ6Aiw7FIWAmgtAbVIZNq+2HRC9grjU46RA=;
 b=DxVyvg/xjWaJMYi16dLO6vcKeDvf1wqFgyTzAmR3MsMwAjk7b05FgJYsyo1h728IG1
 0LFS1/Y6/8AxhcQ7XVkcUfCtPT8sW1nBe/9l8bKjNMgL+Lu/BfI3PZ3Fae4CKd7jrqi/
 wRSPIjmt22qAqRqY6DbMNPc3NyAf3B3THmQgsWMP7YuDlS+jRuZkFERiUzk+lDMDZu9R
 W7epA69Wz5mX+El9lXYTPKaB5TWOmqgjjYnTXnw4nrh0Zw5zMG9PwseQnl2rzFsRfm/Q
 2DAeuv70vIJ+yOrbwc701ITmMr5nie9xS1U+fN0dwOahqvQNlrAii6XubOrUTQ+M+68V
 pHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791403290; x=1792008090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=b029V0pHyJ6Aiw7FIWAmgtAbVIZNq+2HRC9grjU46RA=;
 b=jl1/OO7wQTmCMlnsJyvfJGyEtvmoBe3S5S9q1O5c1AXBGNZFiPvZ9La1FuS1R/IcqX
 PBfG/fYOJR7L33EsTbMiFLzXsbG6XXINZVzftBh5I9cxDoXYghzMG+CZ5uzzLMWeohss
 cL5sYFUhn7p/D23lpOf5AkEVhXDbYL5vEBR/MkMM5pnhMJ07VcszYoghaMLjkgWOGwfX
 q1nT8PQ6CFMgJTAk6MTh2zAz823GltMlC+6vMvwJ9dmPON+ZTbg67BhWsBfH0qlJcJST
 v5QQNJZ32jjf6I6xVTL1O84W0vGbh6MzCzQN7J7KqoQk1CdUtqtKe0fjV/eDDWb/sRfy
 sVGw==
X-Gm-Message-State: AFuF++lS9slypSR2pGMFpRuaVuRHPa5h6tTkN0ojnPj9assPPqFwFUVU
 kQyRuXKNq6ntO2wxgp0K2dBL6BNqIgUrbJ5ZVL8bn4jOS/R7qnLqVRJf/dTYRQ==
X-Gm-Gg: AYBFou1nJ45yxH8MSuJx4JVhsUYW0NOVgwVOD2y/tAYS6/WJWIP6AJwDhS90UCFIZKd
 WIgnHgHVtDtXkNm3xzeqP7a6jMgXWzXWITWcKDOyy2CXqV/UqZffZCspRQpVRtyjHAOwQz2gJ58
 KoQDRFpZ7I0ezKYZGkOFu+4KALx1VcnuaDyS/jxHzgF6l5ILFzJTb9LqHKvhSEE2S9RKNYH9EwY
 q9CX6ZgzxDp0EAN9B0Avh/nTdFA40EeQ1UShZL7V8mQV/lY+u+vqgZDe4yBba32IFgYL5cia+Rm
 DRsBXHToKZdmpbPX/MGvxpQSoAhwrPGfHECYXI9WYfiBpA5B5X/Xc/ZzyfV1BVFwn0loUEoP8yO
 p+KhStzO2gjFAUM/mGJ1Oj0I8XnIVVIulH5DafhsBuVJrLpVGQakkP8+EmTtBLqvwUmQfF7Rupe
 JyBeIX5P19RDamJ3D0QGmvDH2cVwl8zJ2c/5GCYcbBI9HY6vyZu7O0yKQahEugVKyYWkP5rHjG6
 gvVRV6chJfWbCZLFaRmhNbV0OhUEVZnMkPUYjK2j6ABJvbODg==
X-Received: by 2002:a17:907:d8c:b0:c2e:3d29:a5a0 with SMTP id
 a640c23a62f3a-c317bb4d1f8mr333208166b.3.1791403289936; 
 Wed, 07 Oct 2026 13:01:29 -0700 (PDT)
Received: from PECS-93BMLD4.foss.net (254C24EB.nat.pool.telekom.hu.
 [37.76.36.235]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c317c36535asm143782566b.81.2026.10.07.13.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 13:01:28 -0700 (PDT)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed,  7 Oct 2026 22:01:15 +0200
Message-ID: <20261007200115.516421-2-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007200115.516421-1-mr.zoltan.gyarmati@gmail.com>
References: <20261007200115.516421-1-mr.zoltan.gyarmati@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/testing: quazip: refactor to have a
 base class for the Qt{5, 6} test classes
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

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 support/testing/tests/package/test_quazip.py | 26 +++++++++-----------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/support/testing/tests/package/test_quazip.py b/support/testing/tests/package/test_quazip.py
index 154481fe4a..b1bcdb7e07 100644
--- a/support/testing/tests/package/test_quazip.py
+++ b/support/testing/tests/package/test_quazip.py
@@ -3,10 +3,10 @@ import os
 import infra.basetest
 
 
-class TestQuazipQt6(infra.basetest.BRTest):
+class TestQuazipBase(infra.basetest.BRTest):
+    __test__ = False
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_PACKAGE_QT6=y
         BR2_PACKAGE_QUAZIP=y
         BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
         BR2_TARGET_ROOTFS_CPIO=y
@@ -23,21 +23,17 @@ class TestQuazipQt6(infra.basetest.BRTest):
         self.assertRunOk("/usr/bin/qztest", 120)
 
 
-class TestQuazipQt5(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+class TestQuazipQt5(TestQuazipBase):
+    __test__ = True
+    config = TestQuazipBase.config + \
         """
         BR2_PACKAGE_QT5=y
-        BR2_PACKAGE_QUAZIP=y
-        BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
-        BR2_TARGET_ROOTFS_CPIO=y
         """
 
-    def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-initrd", cpio_file])
-        self.emulator.login()
 
-        # qztest returns non-zero if any of the tests failed
-        self.assertRunOk("/usr/bin/qztest", 120)
+class TestQuazipQt6(TestQuazipBase):
+    __test__ = True
+    config = TestQuazipBase.config + \
+        """
+        BR2_PACKAGE_QT6=y
+        """
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
