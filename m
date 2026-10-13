Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3665CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFE3480E05;
	Tue, 13 Oct 2026 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uk_uWrkDVl4C; Tue, 13 Oct 2026 16:43:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8ED3180DD7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909806;
	b=VUN3BZDwxtuhyedZFlUkeE5AdS1PYhoEkOKxkruuj96oxWnioUcVmfyAQapK1w+a6RTK
	 JeoUZUH3eErv0DlrAe+KAliKZdRIuaVFvFmD8wKK7+cFw6Xs/eiqeXVq+E+9FJHaiu7WE
	 708/ThgwWmkkF0JZJSBtajoiUdIp+L+XW0rIRUfg84JVWe/US4LwugQ8rhLBT1DST/nfp
	 AXsBJf0A2Lsvd/oj/yU9RiMBB+zBHFiN2YNcJz2t0DJfwo4MdH0gICCT1GaNuedb+C1la
	 jftDgc/UZGNUy8eoNk4iFaSoDHwPgM6bjCL8EF5R7zero6kczYz9te/S+ouAKKFqESA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909806;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ALteLJV0g6i1oCqUZS0lE9rr0nj68B1q66/7CX0rff4=;
	b=JRLWb28mTNiZZkx1hsVUq181Cg7ROLFFRfc+wlc9FP3wSFVDeECL87+LdM0mLhS/WK2J
	 UG/wkOYVOQEasiEiiwl2VKQbg3OdCPa1TG9J3G4Z8vShd08chpFIpFyGfOg/qixO3iVVm
	 chG3yemRUjHd2hq6bV8wTs5gyJJGlmsrZLQwYXwhYSHEe5mQ5TJCvqGBi/Ga8HZD0z+oW
	 7FqsL3IKyhbx7HF/JqQJiA1J2zh3sr6qMNE+OOxp+ukKeAyUFDol80/mWYry1UMy0Gmhz
	 birtaxmRm188iE+AYk3Ah6tpSD+P44I6Wwo3Ef4AYmWG+0YEDTXBZ0rt4+liE3tdZ1w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909806;
	bh=ALteLJV0g6i1oCqUZS0lE9rr0nj68B1q66/7CX0rff4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Wbq+5wKTjEmxvcvgyPOcuLyKpiIIt4VX9gDNa8cZ3JqyArOD5ACrLyK15pCOcjQcr
	 Ki1k82vUmu2SW3PYaKi38jl0R8vMsn6kBHf7Mb7cvKvVgcEKgzNmgRKu+uRAHw6EZ2
	 zZmM2zDEgRzoNXLSyC87m3vtMwilujE8VQLbqWIkFnnKKd37lWwDSQGqd+KdF5q2/S
	 /qOHvy40wCd+CEwBHX29BFZc+AlEQPE7a1MG8YHUFKSSuG547B4ohYtC+vH9jxBPe/
	 G4XcyL4J5d5KbdXNUepH3iaga3fF+8sQxPgaoK0V7DBXIv+sgWs5WfgGWJZ3XQz/5d
	 yVjSKZu5Csojw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED3180DD7;
	Tue, 13 Oct 2026 16:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 896DEDE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 693266078C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pX5I4BjG6wdw for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7056F6079B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909800;
 b=S8PktaxRJ9sKJuNtOBSB9mAzQZLekQ8G6QQchRzMhGYBgO4dvRJYt9HQDKkDZaQr8Gg1
 wH/vVMxuSQtwBReINAXw+ZF+VvNm6fb8lvxHZWPfN5v75ekZ5v268Jtg4iS7xh131JP+H
 GjlNDoHo0lYl2cOaOKLRSMsh/Gs0tjjyOzpw7m2KXy1bVdpCGPGuxBqu1cqDGDAMmnhMg
 IygXvJujN+zRfOcT4W3ezvCrc+dUroQ/x1ufKDQp9XVYbsVPx1FBlx3rSyhVQNDKqSPAW
 oelPsCIhTLD4vHQ+hgQAmBsSO9u4hT5iRWXBQfP+9/ELaLe8dE1W15f8eFMg1ihk3Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909800;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=GtFLPqLCkIrLD9WR/AsWdRZeR5pvJLjK9B1KSnc5g9w=;
 b=WSeMC3Hx4HfZKM/og9h/v10u8imov5/ZughyXcHAmOK4X/11fIkUmqi2S4SQRTe3lt65
 jx0kcZ4w0x835jmajr9WYGxqTCjWWBaGBCB2e2t7L6EnB7pMxFyBrUP29BGDXZjvW6/sD
 k3E1alH/qXO4HABQgwfbYMiu0rhl4mYXhaa8BqrOhtsAqVdHgH4QvW3Z94hAVBL2G0eCo
 dPc5qhmIg09NJib6EfM9ElQEdDf8BhhMw1+GebYObWMvl/AQEFEigUHLIC4eHXivdF/+T
 uIX8BZPTw2kAERRIOmHh/SVb7V9n88toXtYjG6Ku7kYhGYyG1o68CJoDdfHKFPJORIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HJjwC3u2; 
 arc=none smtp.remote-ip="2001:4860:4864:20::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HJjwC3u2
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7056F6079B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:20 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-49e09a20082so1778911fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909799; x=1792514599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GtFLPqLCkIrLD9WR/AsWdRZeR5pvJLjK9B1KSnc5g9w=;
 b=HJjwC3u2lD4+jwJximbGLxBVxwNuz2SSaaIm9/XuMtQHIge6NuL+0make0If4vw1lK
 0v299rCqCL15PAGh6FRQHlq6A63CDasb+bU3axW9goNFSQeGJQWq3U0FARblwM9dzlze
 0i0VTrjfogWdtCME+GRXFEid6fdb7SNPcFmA0pMITaW33EIaKzBkYePZz8e2FnN7pmjv
 f/mrOI72ZaAmOqwAWH37EwPHgniFyRIxo9SfEfwx8NewO9PxMPdrGD/S5w3Ywgp6Z8AJ
 z6CsRdl1XjyPNOvA67CGft6d97k9gkOEMmSDontG74uAcP7yP7hmlsCJJXPHT4ZWN1Dz
 ZDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909799; x=1792514599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GtFLPqLCkIrLD9WR/AsWdRZeR5pvJLjK9B1KSnc5g9w=;
 b=ePhP0auciQdz39hiSMpnSBrVSOZzppwxepjpGcJPodG9VJojrieSfyX9P93PweJn8i
 U//kupKb5PvGPZOT0jKxtn3dfFF1ggu+19MRvDCIdsqmi6NfQGQ3Cu7UH3CF3MAbFsi/
 d3mazo1yoVRdNPGCqE5cHamJE5Ps4nrOz0pnlBXWUPZTb5GYB3ENJEMUe/HHQALiMAj/
 oZP5Ug1KK/Igc9ekrHz0CFBFcyILTZRfl/U88hYd2Ow1Oo6/J0IZQJKTGmrnDZ/sTMxu
 o/YwcvRVJvR+m6/LptAC0FDKFQ4qKC09tQ1gf0ogzJRPhnCgR1VXBvsbelIXtSSdTmz0
 Z6Lg==
X-Gm-Message-State: AFq9FYJ5eGU8qq9f79C9fQrZ4yUQIRnIpFlYJk5bUGbG25+o3fMOiNbM
 m/QaiDGMHJx7HAf3rGsrypc7PQqHV7Z+mqO2HyQfU7kpDkKlEdbG4dWTBerwFA==
X-Gm-Gg: AYBFou3T+xze0uVrVsNnASY2VDnb8eD+A0fnNUwpeWrfyAaWgY9hiQzXghIMP0VRUv8
 4jxvNB9QDkmUJDZ2AVROhxcbIY3KH2C6r3hH1dxQjZlNjTVDXAFyEtM83nSCDHCBUMF0H+fXULw
 irPkoPFP8OLwUMhi6vqdY5R8pe7kfwghGzCFg8zKEcbMYdBUGtlW0GKJ93BmGjuVs5S9efZy5q5
 LWtssZKtraYSfMT6D7vJO7kCMeHDhNUrZmxOG/f1hHBg/SqvH4378E2WloK8XKhoW0N2PJn4ADy
 RTRDkpSlQBYAw/J8ZH4qgzPOrqlmr1t4ikV1GKHj0OjICyOticZ73TAPCEnu0vPWsM+i+H9OFiV
 8O9YkhodA3wDipVDCFx0+JMTim0ex1VfKnYILFY3/56d5xwj0/wHlL8a8hXokQopxDaV3i91+Lg
 JPrcHrpktvt4iHXGqlXBSnivZhKU5ijTqkUHQCigUQWEUP0AMahQGZOHSxxGl/BcoCg09TdyxMj
 rwkSlkjUi56HYWzpkBRXnoJ0CT5eP/Zi8EMFWBvm/EWIDvpO4f2Hs2r6ScNrbCyB4R/BQTWlBQl
 UV2jQm9rGqMM4SMHNTpVZMxJ/XTyWoesv4BXiR8mwHfqwtNjnqA9PvbIhv5CAEZvCAkylB+YlFv
 P9XiUQc1nYjZcja/WAf6A3Iq4CWp4weeGVjTIspi8dSNz6f5dZRtetA==
X-Received: by 2002:a05:6871:ac02:b0:475:a1ec:961e with SMTP id
 586e51a60fabf-4a2a8a0a644mr10109871fac.32.1791909799186; 
 Tue, 13 Oct 2026 09:43:19 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:01 -0600
Message-ID: <20261013164254.1476592-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-ipy: bump to version 1.2
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
 package/python-ipy/python-ipy.hash | 4 ++--
 package/python-ipy/python-ipy.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ipy/python-ipy.hash b/package/python-ipy/python-ipy.hash
index 3d8e1e8c71..b4f79d19bf 100644
--- a/package/python-ipy/python-ipy.hash
+++ b/package/python-ipy/python-ipy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipy/json
-md5  d6cf83e7f418ebbd23324ba1c658b907  IPy-1.01.tar.gz
-sha256  edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a  IPy-1.01.tar.gz
+md5  1977488587a7ca39ba3ab1299e869dcb  ipy-1.2.tar.gz
+sha256  c145e664e84642fac875a043fab1a0b50bd65297385dc438dbfe25f24e65ac61  ipy-1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index ec03adcb60..2bf1665963 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPY_VERSION = 1.01
-PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
-PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/64/a4/9c0d88d95666ff1571d7baec6c5e26abc08051801feb6e6ddf40f6027e22
+PYTHON_IPY_VERSION = 1.2
+PYTHON_IPY_SOURCE = ipy-$(PYTHON_IPY_VERSION).tar.gz
+PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/d1/49/de558c2c8581f5860b9696467fb893c7141501daf00ea14bb01fefd360e1
 PYTHON_IPY_LICENSE = BSD-3-Clause
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
