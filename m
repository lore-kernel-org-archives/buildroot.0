Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4C5CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40017405A2;
	Sun,  4 Oct 2026 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2owk8hzHu8O2; Sun,  4 Oct 2026 20:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 685044064A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145507;
	b=OXq1KmGzCNFYBGo9Ca0/wX2W6DZKXOQ6uJg/LuXJtDXrZaVCQcR2aGTg4FPe+aI9L2CQ
	 8+s6ZuCl4b3n2wEq4NU34+MntkBK5SWDw7jAvdjnYojgoQytJsNHUAs/XwprcRPx8N80X
	 9Zy2ZrGr3S8+TUb9Rl97hSJ21dTZsQrgeSHFqikHTVJuhE1qyiOWDnArr9n/ClLZ1wETb
	 69ycIrjsFZqqeDf+6gyrG2pJR3xakyDl6zv9+s0I9Slc0A6I4kgut/vufEe7J0/ut8Y7q
	 HKQGPsB/tns1/D4c1JR5jLUhFSmy57VUAJwuvEf8Y2QpoyAQv8lIDGSi6qY4Rrdamdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EiBP7B5CB7/ZbHqrB7VIw2tYr/OcTmqyj5SNpRncnPE=;
	b=LtIQJMaFIvZnHDN+fTEZ6YiKxN4Lv8S7IHa846k2IP/aZkTgSeRTO5vfvM6Ni2cbbwB5
	 axOIQV1jwgKCaRm2zNtKdWEQ4QPgxuXRfelrr4OmswmNZF4SqCPwGK3OrmYBaEIujslig
	 wRfXHLkU2jOEpOBYqA4Wg4EE0C72fez2ASkMm/ftmHcBMj+ARyn9faTeSCP2WXiktscIG
	 i5RPpEMKugpQHONXOHkL/9diRRdoOggZSnaY6CaMjCNEpQZ1HBFYFgG/HwopOgrdXvzE6
	 yAiiJnWXL1oBYGQABFKpSpAXOQ8cmxT/HR6J7jn7ePlEMvI07JUqmKQJ2M6J/LQGFFQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GxNZuZ4P;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145507;
	bh=EiBP7B5CB7/ZbHqrB7VIw2tYr/OcTmqyj5SNpRncnPE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kqP/JWRxB5+3gMetmSlWUmdJCYqAUNfHmKaklvbBvhJOrzTJ6Jn6XkY1z0nzdZ7cg
	 zjPS38zswXGTi/OU8oNe+lKNBB7o77JYgFMZkt4xNrJXuV7dJmmRCZxPJ6BZz/507D
	 1a/BjQ45iUOvgcRgCiKBl2xdUkfjsxrBGlRdoacltEXDXnkhWb9rSZ2kUBWMXhLuFm
	 Y8yIc2uOTc6cdAN5HuhoKSI4rg/l3kUvBlbyKtbcpkom00/Sy++rjse3Z3KO9k9Pvr
	 GA53mfM+xrW4vzGKPxLfRvBHX6AqK5Jl8fUiiflyaqCbYOwnnCn6pEi2vQ3QJIs6Jy
	 e1yRggluxaEaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 685044064A;
	Sun,  4 Oct 2026 20:25:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 324A334E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2497940663
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfAGjq9mh7Ro for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:25:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 49C31405A2
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145505;
 b=SE3+TKEsRNfUrzpBM/u6QuNBjtHLqEk5UAxkFSNIxf619mY81qBRgcRG5bY1IqDVOE6O
 K2WnjVKAhUNoWKqpM3tpuqTNqCEw94DpAY1QUbUd6hYZL3/0FuuMSwuP/nWETjTuhAoWE
 U7tdr5dSPaZqoycSgOX1+a/NDU6mMOS16SRr8SYFmh0addlQqsQtiFYodlI5ECYq4uLCc
 MwFuShB5sZwMNihhyDrmylbLrUr4cS2xpSljncIrA1S5FF0mTLFOuDmscyEHTIihX4CXn
 x0FHSbw1I5nxzNsbgn84eKWWDaTTbI5waYoS/o06B3VsvEycObUorvm/o9HCpVPlJfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145505;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=t4fwWSQ4rlZyJDvnrdQYpxtC8D2T0k81EkfL3a9/qUg=;
 b=cGVgzH88bEIRtuSktvfD4i0sCGtbd7mLsVktICqeZjgQaYXy+6TZUfw2knFJ7UR4xIVR
 DUXFGjPc2rCNcDZT1z4+2T3B5NkpB9X8U4sbK2Wxhbdv+pof8J/xCpTcqWWNZjCh4RP0h
 CjTd8/rNwtw6kbdxJpsyV5PHYuuCcpqW1USgfHR2FsxvFUnDyQNBYxzrw0Fyk5leyDpTM
 NjY7Pw9NxMIHzQU92aVkql6UkjmC8q4sCTi3G4RnE2lVwT6Wu8xXJskHZCpBYCGHBty0A
 O9phVzALrgGvBBa1RJxLId7JfRgljJTSNxMdiZ4rhQxD+e8bIkuR6hx3TsLJhe5+xiQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GxNZuZ4P; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:32::11; helo=mail-oi2-x11.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GxNZuZ4P
Received: from mail-oi2-x11.google.com (mail-oi2-x11.google.com
 [IPv6:2607:f8b0:4864:32::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49C31405A2
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:04 +0000 (UTC)
Received: by mail-oi2-x11.google.com with SMTP id
 5614622812f47-4c112aaaf04so556913b6e.1
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145503; x=1791750303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t4fwWSQ4rlZyJDvnrdQYpxtC8D2T0k81EkfL3a9/qUg=;
 b=GxNZuZ4PBgFjPFiq9k3XPio3cJVexyAmi2P1vxmVOcVEFpoHcXxheKHqcIQGEqgc/6
 /cx2uvAWka3MWg1W0tevDoM8YLvOzm9QePx/suwnPBf+xFPPxrLo0iAkWLVpz5YlJCI8
 sFssA/yCdpg3EBDbWbCJw9qc4N47umLzyuX8gBDHX6GyqT4xsTH790ePejqylnrPc5op
 5F87S/R4xGSrqQD3oIrPYVkc+CrGwFUy+Ht8FBIubCb1tkeFmj9ZU7r5jmAG/NwBRvCv
 KuUhHoBpsWaeIh+WVVvTgc2eNVK8RlvuFT70LfdrhiGe34i1jL4+Wl0w86nSztL+xMge
 d5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145503; x=1791750303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t4fwWSQ4rlZyJDvnrdQYpxtC8D2T0k81EkfL3a9/qUg=;
 b=KPNT8T9zpkeZkTDX/SlJl0ao3/jrlloMu6yelc+CesGqWBAzRJdptr9RcV8ZkT9jr3
 fXkuFnHpV3KR8DKrYzg5mRiGZyVuEWGlFOlfJKfPWecOWwOIQaHkvdJ4vI7bfQB45b5U
 uC7Z/NEcwj+jsacJgM5VBm9oFwtIyEUnjugIPcv5pggSeTKBHCt27cGuivsyHXdLlr8j
 zkTKvv63bC+TL4zBr8luecYiJZYTVDX0tSJlcF8JvRTZwWjgq0SgzP7L0LucfGGUYM8G
 Fj2+mDr6w/Yc/l+ooaeoT09ld0oxRI9THXyns4YHD87oDzVmrjK8brqcJ2q7muhucvtu
 mH9Q==
X-Gm-Message-State: AFuF++m047czMyXulVGp4czNRnO0N4knX7JgGLjksK0w1PNjEQRTGVjl
 GeNNc9jsXK7OauaqgGiWGvKNyERoxHiPo6IOWJ4kChXwpGKIIYC/CQqQhymcpQ==
X-Gm-Gg: AYBFou0KeGc8OgcUODjQX5HN9bg/6tIIlIBOsqr7I81k1fYcvyRSticIICNKnpvxTP9
 VZ7CM8SrDp92immb4S+mzWsfFc49XC6RBN9/E6d8LV0HS2PXVapK/KKARbk0oJMf4Pfg9K2qt10
 GSwpnpLX4dS2XAetWzkt+OJDmFuB8am7xi0SbZUc3ANG0bkFqc3WJ5bH4rO7okhZOQbt6/X1vdV
 sI5JaB+XU40rqkI1GclJGwKuolzQKmaY8MdV+cFO3l/fz7tQCzdfXzhdKYGFqLeTA7NuPcLFHeg
 6iAb6EnlkXap6OgP6H+YCPDFG7LbEVyJ5J67TUx65s/1gg+4vdh07gpwxLI3k2uBsuadNjt3QNP
 HyhLIVojAEtC9op5jTRMZxfMr5RNm+0salPcGD19LQCm+l0/oJkovPTbxXDxNNVzhLnZNqkUTmJ
 EQ71Zw9Ycp6O0A748Nz8RRXxTxBL5PsGj4ylORrp2ktOxIJVoNVnsyc0qg/uiH/sH740wQiGepm
 I6yoZR3l62i4CAP1XtI9Gxt4LRgjxl4MGOwk7Kf/Z6QqEHxx8ynqzGB4FnIoaeOl+NMog5A1D1r
 cqPjup2e/4YcDueCT5/pRdnfLhQKqg4U0W2wE2uHg4YnnQbvo+70+JfGqYQiBnctTYqBtszt2fb
 gueckRIuAWGNISYeUx23So6yd5+m/5ksg0vSLJ0sX6g==
X-Received: by 2002:a05:6808:e8b:b0:4f3:e98f:fa0c with SMTP id
 5614622812f47-4f52a576b47mr7851229b6e.37.1791145503680; 
 Sun, 04 Oct 2026 13:25:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5251e3956sm7900555b6e.15.2026.10.04.13.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:25:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:24:59 -0600
Message-ID: <20261004202501.932522-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-maturin: bump to version
 1.15.0
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 117a2b9463..45e8492bf0 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  703e4542966258bc728916f99fc78e38b670a538339cbf7f0e1b3bc9f9ab166f  python-maturin-1.11.2-cargo6.tar.gz
+sha256  df0b5d46b6a70ec13b5610de795e055c34b8cc898640c918b14e22fdbc92c9d0  python-maturin-1.15.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index dba5e8bbce..5cab6697bf 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.11.2
+PYTHON_MATURIN_VERSION = 1.15.0
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/2f/1c/00b48c6b93a5b3795ec96165a60dbafd3c5094aae281ba56812a8cad4fc7
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/b9/c8/22e5e21b2679c9bce6415ca578034ca2cc9316be0642ae21e051a2d5198c
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
