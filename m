Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C9BCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 05:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517AF40B69;
	Sat,  3 Oct 2026 05:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1UaqeSZKoOR; Sat,  3 Oct 2026 05:25:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 599DF40BAC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791005118;
	b=LCxMB6cm2pcZp1CYJkujmjIY1D4kSlCZNG/cz2kTFT9wC6Kizu2IntkrfZvDP3oR6SQc
	 4D9DhWN5Jl2JzD6ziPXxyW4uP5o5Bxg8qQyt0Cd+AXUf24qlveno6BJAGZqMePhVco1v0
	 PyO8Ul0HK2ku3GEwBFxwOe3jUSIt2XrsKjfHEOnCZiXxDEjiQ4uTp7ukAlXaOgtAqEcvD
	 krh1+ezO8wK6sAsOA+r6YBFiLDpEJUus8cNSIYUjysFgP6d6GX3dg/CMGBLyFDH+vTkyz
	 xCoyKaZ2tJk9xbWYZFgOBuLhWCHZTbWgMOcIxeSquhZ7Tf7joDuE1V54nOQwYkmjJxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791005118;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Kx0w5mEpS7V97d2xNiTzhwpn/mVdLqI1VCZslJ2X7gs=;
	b=jpd4A3eelFnuK9zpLQ8VKe2R9Po761AfVsWTpuCUeq/byxTkllueigOnZ/0yeKismFxb
	 zODACKbRuItaaQUBJLKcPL3a5/e87TOuEiBLHS5WLOfNkHqkdtXDC47vl/gD+3akEMowc
	 IZOtLGINQjefThvMPRjdOoy82OajfXvWdqXI8QKT8JxrGm9g1Zbh/ABvnloPU1kZWtl0J
	 dLS66M4DyHg8j5TLhhp52uMgTxZHYvuD9FL3J5TMZFZKA2QYzzDqSeJs1Bswb1iMEohhU
	 4lFgsVIAmOzaaShzoym4ciJBn8lQynLjbHu/8ZA6wRRQMsW5NMHLg3ZppP1KGCnSUzw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NFDdNr2t;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791005118;
	bh=Kx0w5mEpS7V97d2xNiTzhwpn/mVdLqI1VCZslJ2X7gs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bapA0ndgI8T8aFRCovZKpGXzj4JO/TSblCL9FL8g2SEQX/iLv96V/uTebmYFi+IwW
	 X7MWkR37Oyh70GpuGsiNA7pPP+dJ2aDxoRK48rPuuiGNtI8SWxEEofwxUUC6eezR1W
	 ei7G7bKR90v0Loh7nDvy1QY0GG92aPCBLSg6yZmvYKt3NGoq9PpnEY9VjCnxe1vpl0
	 NOw9anVHRzv+ptDGFVfOnCoVjnr84nfPyyxl3v3rr7HVmt5SCiyv3kr3kJoUdVXasG
	 zWJQ6J8YiGrBa5U/+aryiaASObaotEMlf8xpXwc1IHxna67Wo2UB1Rtyq2E/24Ljtp
	 lnXoNKjfM4D0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 599DF40BAC;
	Sat,  3 Oct 2026 05:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AC071D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 05:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CD4A40BAC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 05:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGOQn5FmLokg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 05:25:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 135E140B69
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791005116;
 b=Cfblrg+MLdfeHHAhwU4nuJ2dG++yLE1ZKKz7viavU2n8+0Bw4Mvm9YIK1mOrPFhEeNal
 9ItYAePOa2WW2dRddNELXvn0X7KHeYxVFFtFl36YfyMkAzB26RwSjgtYIua/HNFRFv73/
 N2lMTCKW+4CLIBmZ7Bie96DskiB//z2MrH2R98Tx3lrKlKopMWwQGVBhbBMjj+V9Ji0zw
 fdSQU1drUamZjbHuXAfNNt50IFp2XzyFi+otR0FkEwoejhZgyMD3nqtmtaVZZVdYvid2g
 ZKnkYrVKCaNpHPBR+w3TEtJmWl2slZ/vbfNA5nXDHTcQIPew3s/Ssx2QIpfjDoX3dqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791005116;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=z2ABXJQC+YjCH9lM8ZD4/fCJLBZb65MrHp2YUzLpkes=;
 b=BUphMwKCm0GXki4YwH0Hf77iZn/fZuBW2rwMB9bRdZYBwd+ettwHefpIdK2FRc+q+/L0
 R3OG50azWtqrQmM36tnqtiXuaRMt1oiW5CRRBoPGmqgks/+h7YwqYUiyZ53cXB4p/3kd2
 Y4s0TALnUEVfhtg2M/WQbjbQCXAOCyop1QB0nuVofb6r4ZXwUU5mIa8Sl0oG5kXMSinYs
 XLtU9S2D+tnEXDcUmBcR4OgsjlV1KsML5utfcyrsIUxnNhfrJ2DaKII1s+Y7g56YYo0nT
 BBiUwGnwz4fJ75KTuP0KewuukWzLPcsRebpK/72o5a4Q1kyxLSdAB21wuoGH/+Pzm0g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NFDdNr2t; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NFDdNr2t
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 135E140B69
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 05:25:12 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-82389b6da4dso518905a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 22:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791005112; x=1791609912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=z2ABXJQC+YjCH9lM8ZD4/fCJLBZb65MrHp2YUzLpkes=;
 b=NFDdNr2tYGaVI3AeStz1YZksmNtvDLOWK+uVia5sgtBLIbULdgM6AeMHzGmkTDtFkq
 JIAwCazhyx3hqZ0AP+3M3VVSxTkHoAoSX4G/cO4BITF4tEAJlzak8d0nEqF0SUGeA8G4
 zRYE65bo3Xc/BdYMi+VCRFMIXuHB2OqhJcmuKiCjlRygQ+BDUBU1oCtz6Un4NMGqUfQe
 JW0HZbSNPVMMbZHCcifMMDFuHX5nCSPRQ6nvJAofnkbAfEcg7wZijeZDUZMgLqF9jOi8
 FIQrbyjuqwxcAT3TH/UH0RqLFACqqtWAkfSxALV7HrumKc8ttQe/pfi5Optdvu/7KVhE
 N60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791005112; x=1791609912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z2ABXJQC+YjCH9lM8ZD4/fCJLBZb65MrHp2YUzLpkes=;
 b=kS66oALFcMQhmebbSyuk0LePpFyGGWXHNYNe2gCuDuuTB6yO0kKdvI6yYriNnYJiJB
 r8+0S5aTGYMCLU8jwfaW38tBIPkybSNV3dBXudbTrvu9u/Riz8BSwjItwvU2fqZbQLzK
 gkQ0XXPaBhijNwpKQs9/WqIReAB4vOlsh3x1FoS6sdk6V1F1UaqDff7UjS62p14rBjkQ
 VTzgxk23ttpJjewYYdea2fAygqD2u8P5vCHZrmu5BThvOIY+Fd8TeAwnHB9gxE6ITDGG
 K4Hx+cDHmiD+RaY38Jwn+QAv7ZFRq6Yjwh9sU8RXitK103r+uv5DukaYT+c70fwklInC
 fbuw==
X-Gm-Message-State: AFuF++nHBYQtQq/tZZTW8xwmgj1AmjA/5vhYwN8Wz/kIICWBG6mSfSeo
 9su7SaZwq96QjV7KBK7Fq+YSFcNIwRDR5Lo5D9Sqn0yOH50SfNDsGjrcIlfd7w==
X-Gm-Gg: AYBFou2BV17b803/04kv4vSBaEnxqCnStjXrxIryipBxnSyJKGfShWdRR1Ki1u0rmWo
 zR6HTMAC2ODypsK2HYsftUq8paVbq0usbm4XF/wvMNfVExAn1CS4UP9WehK+PGzUoIcpOoTsDix
 gf8LZszmLr1PMEcTujzYtfxKKPoRVUPHs/NqCxw9Vvm2M3HtjDTs0L8hsGDH84Lze3uYuO147/B
 j2dcpujEXM27LOaRx8q+JuEUwYOYGv+gOG3r86NIUyrzaf289z6HTmr785+3r8menjTa7N+yk1A
 672t+OsQ5NEcB1TADrsJzIY1M3VGN5Fke0F1SIGTG1HQnjKciaJ3DN35WkAdyMKx3F7xpuon2qi
 lhe8t+NucCLObuP6vXHrq+fvinh8riymWe7mAIaRMhpc95ILvUQqsAiPrwMv0lFrG0S3HFYHupv
 1g+FKZkvyi5cc8xJK0fj1JnrFan7/ocUWQ/3NDGOzcwaQaguGVbaD7A4ofow88UyUGKwJL81YT5
 26p2MMxKev7ShPO5or6Z/HN3AXgkULpwGz46ifBep7sqzVfrykPK+5RrkAJz+pB03qfDToYRLsd
 qlip4wkhwAScyQngo+sMHbJ4BDkSqXg/gY32uT+xtoHNKZHKcA/FDloUBTTZlDlGbSSbm9clZGk
 3hMLJasVB7Dx0QS/9B8dSTJvtFNQPYLfRHuYB/7aGNnI=
X-Received: by 2002:a05:6808:1b96:b0:4e6:1356:c72e with SMTP id
 5614622812f47-4f52ad8f715mr3988102b6e.51.1791005111832; 
 Fri, 02 Oct 2026 22:25:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5245d16c9sm5382200b6e.10.2026.10.02.22.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 22:25:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 23:25:06 -0600
Message-ID: <20261003052506.486458-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 5.2.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 8341aab93d..d63030eb62 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  e7c3a629f252de1aeca447c79ba40399  dbus_fast-5.0.14.tar.gz
-sha256  9c30a134be1a1e4021630e551de040ec38705213c0889ecfdb0218f83beaffa3  dbus_fast-5.0.14.tar.gz
+md5  d02dece424c7cc96a200868d30e6df62  dbus_fast-5.2.0.tar.gz
+sha256  a4a5dddc04b1ade5eb7650d791e2f6fb7c1334595593473914e78a2526ecddda  dbus_fast-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 91c6679e1d..5153e4083b 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 5.0.14
+PYTHON_DBUS_FAST_VERSION = 5.2.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/7f/6b/d4c8871e772ddf73e76bfd725dbb6fa82eb11492b370b423892016f0e579
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/4c/5b/ce64b8788c10a8bd313c8638b28be5dccdd5c2daf14839f23aff37e0b39d
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
