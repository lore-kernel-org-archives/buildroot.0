Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2339DCCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA42660ADB;
	Thu, 15 Oct 2026 21:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VD92fusLhp3o; Thu, 15 Oct 2026 21:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B469960AD0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101147;
	b=svE3YRBdgfRWVpSuyBmZp5Ms+V2jSaqjjhAtNTuf7EGJ89ArwNWNoc13AJFqUm4WBiDo
	 HxsHzC0mEJMOWF4Y5y2iUV5oJr7EnOqX6vAbNxpNpBr4+G3C0qTvo0VWB+3qPQ5UtPUQi
	 ygMULn0nu2/9fwQxx5pzxymdLeTxuMmLyrlWW5kbELnDh+l3EbKSzgpYNc6tlT21aPtl2
	 cKj75+xllmlGcDanJMMDHuoO4qq5H+VWiRiLOoCv/3S3sjlx5/XZ3fW7cmJc0RzXFGD7e
	 M4t97P22wDbAfe3axia1Udh4YunFYUnJZETMs+HhP+9mup5zkBXRIHjHVLewGsqjU5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vrN1iUvkkQoRstczGJn1OEHn9HVASIOBUG8x3LoxHoU=;
	b=SlPTOhFHNuqFGbEjND7R85XhcbhFm5GN2ypih+bWyfpFgRKh7J/GXabgFX0ly2z+WHNe
	 AzPHwhBsB9rVdrRrSUzUPe0yYUqoZjLbysYF3dFpS9qdlKR2lUMnAcep1NQb8zjGF2w2Z
	 f/259BkVp3dF8DC6qqbjUYv2FtD4CAiTq1JiJRkQklD0dQ2Oq2MyqiBypOMaXEbE4H4G2
	 vgIjhVC8unAg/aS7LlromgzLztvqxObjJ8DFOXt9607WhdhPZgPjfgEcA5sKcCsPUQeSq
	 dyPCUxy+YVoKfq6KaVH4aAWTzCqjhUGlIY4N3VEp5/YHVu+V6meSaqtxiNzwpyADGSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101147;
	bh=vrN1iUvkkQoRstczGJn1OEHn9HVASIOBUG8x3LoxHoU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FnhJ4Dcrk2rMahrgx8QKgeVPx0DF/gUExI6A7pAY34Gjvut1/ir+pA/hHn8a5mLK+
	 zxG4pfyKUsibbUdUv5KschUUAkBb6sxCpsAmdz6zFyyJLEdIZ16im89+6yAmEwrRnY
	 tNEQC0z/FK6zonStwndYE1BPdNBr53TThpK16jbb0ACxDeeZACZutKiiJnGXn+v/pP
	 9q5TBltPGd3lQHsXMqsD6Sw0BvJCbB6IqAOmwr5vPVY/4hUvw1/Uins3QKSuAxEz7t
	 Yp23bHvlrtx/piEIExYdaQBiSxYeXYM+d/ayQ0piXLJR3ixAFUmGziSVhg1LUB/MZg
	 ZaVpFVoFsBGMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B469960AD0;
	Thu, 15 Oct 2026 21:52:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD2EA332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEFF78124F
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfIFtajk3RjR for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CF45D8121D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::235"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101145;
 b=QR1r9QqSphv4Feal2M93RE24E5mY+CvUpHezpwM029yNl/M2Cz2utGkulkPQzZfxOS2U
 zjP2fxeCkEDOUWJnk31kjB+1JHzSg0xIp6gMXR8ad9FYBdUsEJy3wbk23yinFXRJxi8se
 fKk410I2gPoHhUwiqNickUR+cPJ1u5o+ENNAaLSIhCjnTVguYWUtv+oGLx/REvq9xH2pG
 y5A5L2Ev4fxbdt5ErCCuQhML8RZzo4XSeoApT6pwONkEWGk9mg947A04YFglphwyWo+ZI
 +arM1tL9MjJ6MC+Ju2HDIUm9gDL/H8rzsaDJtX6W7CfuI3aCOn60IxWuVT4GFBwXi3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101145;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=IYI62KeE50d/72MCUtRjqPYWjREWLif/bofqe8HaZCg=;
 b=rNFGFAPgw8cK36ss+mFghuWHywY8zca03IM151xCKZIswzsQ/4CLX00OPw+Xyx5xq7Gk
 yuW0zRFWJU47UH+oPZwfqI58JvwLrS9GLHtel18tQ5OG5WqRKZxNJpjiVsmlX0PxIC4S2
 Q5NzifltWRE+O6GFtpznfoVUT33brpB8ju5vAG6jOl4fULOra/LSWuQWWXdpY6MVI7MYL
 kjfaRxaXLQFwHyNof2StT256cNibO2YTyKnIL3wcXTGo20ulVz3nGnpOw32Yn4uvdzE2q
 5VPaAghck9ig2MG/vwnxrbBrPq+bxP8qWFFBD9OeaJy7nOEV2W6cRVV5MHT0BWrP44A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="hQf3c/iz"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::235"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hQf3c/iz
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF45D8121D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:24 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-4b190cdc9feso3567470b6e.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101143; x=1792705943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IYI62KeE50d/72MCUtRjqPYWjREWLif/bofqe8HaZCg=;
 b=hQf3c/izIZn7C1LOmgycpKHm3z1nfVlPVpm9BznN48GZl5fWZBTUyU/eqwUn29I0zr
 63GScqvl+di8VciewLIBytJ18W4A4voTsY4qk1eJBYxynjirH94T5Ebb7J516VSxeEtb
 AeHVn5Uici9ij4QRnvvhudlsCp/k64+6grc6q+tADy/lZlY2SYJEah8kiC0IPf2i42pB
 gQ+KcE0KZhjewNvfZtPtfyCelO+6/l+7btToOEGpmm3ieo8csDXssyEuf9+moZJu/bNk
 K7tCkwYxdJnHpxWhldKnewff5xTJHlLLtM3X6Fc14wO7BNyakwHd8XEx6wkPHTIhT8Uw
 foqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101143; x=1792705943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IYI62KeE50d/72MCUtRjqPYWjREWLif/bofqe8HaZCg=;
 b=E6AeXy76OJRcLxb2u78I/2XB9mxWMK253e4vJgz/m/aA4omG4YMyf05UNzKvXcdVLZ
 KPwNs7qAH8gOHsUEekH2SoMQb8vJB0naCgmbfDATKovTKmgOYbOWKO6Y6g9NdKczNvZ8
 JGwcwN/wRhEaeNSaCF51NtuEI73//Q1sLv5jvHcEhIRv2xu6gA1qNOxwJ3VxGdjUc3pI
 dYUsek75avJTJ/BDx3GxmmkjXwxu0BOEy29lVFN8zLAJ3nNMFV9iWAV7EwlRhiNskpXV
 0wC2FoZucUwXm38+/zNySrCPw0FHEnbdz3MNTTlIafH07/s7U8j4AYWZnJnIoJnnPNgg
 duuQ==
X-Gm-Message-State: AFq9FYKc57zVLmRccyrz0Kg6tq9i4E8pTCXdqRy7ulmu84g3Xln5UZlC
 icg3i16BMfX957fF9FTGU2DUM9SWdm0+ZyhWkHSm57+OCtXu+/SA7sdPgSDsbw==
X-Gm-Gg: AYBFou2rzljBT0vlzniCb4co8wYgRwucfPq9SHY58ZVfIa2SJ8y1rOQPU5Q1ExgGDdU
 WSla5dHDbTDw6k39L5jWUtBm2TfuusrCbEctJTutWdEFjIpmEk7w2M/vNQ1Ou37nSaOBppmoDHF
 LLxs4l5aALLOb8lyTk/zysP8VmPI78C1OxFZvFqudKR/9yKw8SqP9LwLsfY+WKJPzE2d+u4L9We
 BYTPrE8psJtwkMM6r9i5dF/g9OlUI1alSpWbtchPBPoBeJ9H0nURKyqfsGBhIf5dXsr4OiNwjbt
 33CctdgQ3nCI33D7CVHw3/agieKQJLGDrwzBawBq4QLGbVECiNT1RWlDNwgN3lB13jHn68mXfac
 tRtlj0cZefMGx5DMN/NAzoO8J4ZQerNhmco+BwhnSaDQgy6iNx9DsEdB7Gr2qvwS0jg2UCrqQC9
 Yr7sGdm00oRwf8Oi7cuzp0L0YJzCuM1+pUFVvwJeNvfDdtOsXBahGmdOYS6tmOXY/yR9GzymnYb
 eikTelZw8lNZCwQjdTpdkdcRnQw4TYWPgLcx01Ou3MQ4EtX2AOiVrW1kvgM1vDZRwjfh/NzmiOC
 1zXlTT1oKM6qTtaPELs4Mea5zqKnwK0xL9/xOn+ys9fhrsbMu5yvZbyQV5gTbr7spjW2CgS58Iq
 Sx+EG1zffunLx4uZjFyg6FLBq5aAf0CiZ0wovZ592g68=
X-Received: by 2002:a05:6808:3096:b0:4f5:5cdc:84c9 with SMTP id
 5614622812f47-50c5bf0c49dmr20330435b6e.62.1792101143530; 
 Thu, 15 Oct 2026 14:52:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:43 -0600
Message-ID: <20261015215210.3426895-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-git: bump to version 3.2.1
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-git/python-git.hash | 4 ++--
 package/python-git/python-git.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index f86121683b..5ac0e5f85b 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitpython/json
-md5  1d057defef1a684993a1b664062c3f64  gitpython-3.2.0.tar.gz
-sha256  fb92310af6844d96adc95ca066ed2e617c00e1dbd146a326626c81e72e18cc2e  gitpython-3.2.0.tar.gz
+md5  86218016f8db6759afa4129c307b5998  gitpython-3.2.1.tar.gz
+sha256  0f1229ec5c057bdabdeeda8bda4f17bda679ab33dbccc00f24e6a480553c8613  gitpython-3.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 8dd87cfd65..5b70dec755 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.2.0
+PYTHON_GIT_VERSION = 3.2.1
 PYTHON_GIT_SOURCE = gitpython-$(PYTHON_GIT_VERSION).tar.gz
-PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/6e/2d/6f6e649818da44d4499604802c89329b8d9799687a124e3a5e467a643336
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/c0/ff/fee293f1ec3e1b64db6eb270e00964f29c086d769201474cedb8d1608930
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
