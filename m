Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079D0CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7CDC606D3;
	Sat,  3 Oct 2026 22:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fn6t3uEdEy53; Sat,  3 Oct 2026 22:44:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AF0326064C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067497;
	b=L1S5kvOFOUbVmi0ZGkl8a7VBRx3xfzedslueNY5UTZONG1LNncVHIEaz3jn8PIVjAQc6
	 RyMoe9p9NNIl3nNK7fedLceURkKXzhYLf9TfIqXCrPC7ZVdsh1rWXIPZ0yqfvOHl2Hmmd
	 e4HcLdyveGYgxw6zu6JwTujyfLxtgQkWC4O3fy//+WPvJaxZgrGrTMiJHQ5Y0IuJQXq1/
	 a5sV0Ynku6x5y11IttUUGczdEM92nBAqEWziX5ZJ2Y1JwFCdVns8MUV9Jk06G8WTJS8Oi
	 rcEmFbjBta8E4IyKQSNM8Q/pL7p5zFyctIYIC8xg3tpUcvkle9JnFAd5EO8BgXG92sw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067497;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JbPd4Z/9vF+NpQvrJlOYZZ8D++vizwvDWgc+Rap7Ud8=;
	b=VYUKzRnioBmF/p2jU0xgueyLmKYfWdkcs3B+shsZF9n0frVVIJO0A3GA6/2Evk9lZEgv
	 BOYvqnhSokkhRgDHPLLi/Py+JWe6dFkPn63jMHzYhdRdi2ZgP0GXBK4yJy0XV2I88dJ9S
	 rv5iUsvvJ8GmhE2RgyhUJjC5zUPDmJu3FHe/vZ/p1zqGkhe4B6AVygaizM6rLTlEkqFNA
	 8e5Pt7n0PF6/lk2WACfSDU51gPWe4qLcGApETOj3IpFZIIQ7dA7KEM7kXZS+yQofTl8LW
	 YvQ8ni+r9M4EvstWAgco5ABk52Cstc7dted+4+UfX5GtJjDoYp/oEp2WKMK6EMJ3iTQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a1oEq9px;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067497;
	bh=JbPd4Z/9vF+NpQvrJlOYZZ8D++vizwvDWgc+Rap7Ud8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VStZjjwUlCRXNz7F7Y5mE/Tsw1WUFgVPwVtoRLkAbcCCKtlFvQG3S10tAZXlgm9Q1
	 f/HheKo5DJWo71ACFfzAVtT0JfCl07iZ0h4MRTA+fcSrO47Ei97zZ6D9dnBv6JstWG
	 opw5bCk20Ge7NG1kZfy2g41YuMctsp8kVXaeZV8lhQuIn3ZQtzRl0eO3Ya5QP8HN+H
	 ihQaMKxn62pH94wyzeXmVTByq1hM/4S6wq22HTwMpQPbHsel2228lfzxWovYo3gWos
	 qYmbOliBdvhAfX9NhUPMn0HTFfWupWgbwWAbIUSgXhDFo0qReVkZqgbsZkhRNpRgS7
	 bBEBkTmg+dudQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF0326064C;
	Sat,  3 Oct 2026 22:44:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67911282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B78C6064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o76XhCVF3Zod for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:44:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E5B0060624
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067495;
 b=oFu2lVI9+s9dRcFeL+S+XUHfxvDg2WWOYl8flwcErtF+27/cxkYRHXZ8Ejvq4/7M99Xp
 +vAFjOINJc0THXvmLA7YK+PFz25r5i36pxQxDAUny1quMUn6ryDYtfDpbYuiTCw0oJUZ0
 /1XllAImBT03a1rbvlD7JhQeKAn6FAJzIVxWHh8mJfud/sa/+L6lXqFf1mFnZejgMB25h
 OBpIdlzUTDu7JBki2TG09fOKFNVwDl1vNISlwPIgqVqeILZMwXsg8tepVd8lpA9qQ/rz2
 fqrOxnyA4o7LvJLAjiHye7GQxJEtruzpcyhu4r3elKpSFa413dnaGYMG9WSKlMlrMmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067495;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SUqD9pEXhLNmDk1gExkIfJwxF9Xgx9AoG5aj5JYSr2w=;
 b=ssl92ZipaxMGgaNYCS0O978I6tl39XWSgdIs9SIrqj7wD8o5g5I53EBEwqudr9d/PReq
 tmC0ElkqpPONj4QoeMSk2qTD8OPXVcXEEeBWBQ4LS/766w73LeZTuPnJ76zZHE7StxHWN
 2Ym/hEmZxRqyKLwxZI7XDyD3YSZ31W3Be+7r3N9pCeitY7TXvSKgqRgdDip89XqQwhhtk
 KJwtxIIDO9PTxlKj1A/PxWdI+kg4DElif4Vvmh2OgtVOS1YPQNPKYOfSpYK5qd+gQthLY
 +gUWUidP0aFw6zS5HQnVqwuqWV/xXL/iTTjoZ7jPal1PkCN9GFsu6Nx5KJs2oaAHZrQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=a1oEq9px; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::29; helo=mail-oo2-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=a1oEq9px
Received: from mail-oo2-x29.google.com (mail-oo2-x29.google.com
 [IPv6:2607:f8b0:4864:31::29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5B0060624
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:54 +0000 (UTC)
Received: by mail-oo2-x29.google.com with SMTP id
 46e09a7af769-7fcb425fc2bso716938a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067493; x=1791672293; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SUqD9pEXhLNmDk1gExkIfJwxF9Xgx9AoG5aj5JYSr2w=;
 b=a1oEq9pxAZUqupEn3Eem2KrKEktrgCzRPg4IqnAppRSDoXDqdCa+lkRshYIU7WTzTD
 IrllLEhvHVOtlWQl5pmMyv1c3Vh1HGczY+pCfIGbM0qC2jV49Rds/bFUONW7Fnw+GDZn
 Tx4rfFF7pfv5WQoVNjd130M7tWc3zU76AxsxPI7NPFs9AH80GTLfICOYpS4MocEBP27t
 tTSCC/cWqZYUnXMyzBdWaaYQ6ssHEKJyiYG2d4awXcWx7bhohyQWTSsbdG7z7LDETwJC
 Yv94Zq/TFjMBAAb1ZkujhUGULQfDs/cQCn3NHuUGFcGPVeKgma9av0wEtXuBhPrLNinB
 Hjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067493; x=1791672293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SUqD9pEXhLNmDk1gExkIfJwxF9Xgx9AoG5aj5JYSr2w=;
 b=bviRb+PRnea1n1XY52Uc9JYuFE261YLIc/4F+cnezgpWVtcD/a9Lk+ggSEsrc6X/eO
 gFMVAmOeT+3YM9/hul9RkwuFNI1TM2Xt4i0SEGGp9Ct0NCjCb38v6m1GdhebuPwkm2cg
 VMdx6Rth+1oQjGxZ1AFIVLy+2UZvlG6olYtwmi7UQXa+5+O07K4s52IRMEDH7F1CKp6W
 MFbx/wkQ1x6e7aYIA73bE20UGze9BmYnW8N+FMRDA+Xw8y0LoCvu/hm+xrXWRy3b3x6o
 +QpxlHvwEvO+22//Tazmn3/twDLOhg/u63ypN5wODe3uqzoTDFZLD4TrJU1r2mncI1MO
 PC3g==
X-Gm-Message-State: AFuF++nWBo80LWpV47gnuVEeFOvFwz/yC69Fc7APn3sFCV+uZtM8Gpz8
 2gjYM/nZ5N7a/gFVZhJEq3Ror9BxVT4phwqO8UQAIPbm98UjYIc4WI6iaQjIGg==
X-Gm-Gg: AYBFou1+VYsRRHHBw17yDXNi7syFmP6JMcC6jiUNBq3awkxtFzM5O82+qHP/+zcei6i
 QSKP+e4zeyh/Qv4PECr0WLEmatYkHa5vo6A+B2p6as94R3kIr8DBYksesnSR4V9LHa9DApP0jft
 5oo+1BGgGFQcgKNU1Os39vYWrtnCSNUySdYmHmdOaMqInCDi6PL3ZJRVatOndzKh5PTSvqntSFh
 nB6tMNI987oaftuufLr4ZRPShFAdJtFd6wpTxSLIdfbMw8vYS8VYmmu9pWSS6i0KJPoVXpkkfbV
 +zHkM8HAKm/2RS0t/bBIBd0a7i9jPoTg3R8XUmQyN9BYLW/DXYe3MFYnj/w9OMURJ2rKAdyqcuF
 XlSA2XupLAS80z8zGe0z94i6sBcnfExsqQc1JY5/iZs9mIzQbelfPDh25HBgM7z/lp+xYj8wFOm
 1cTbbc1LFkIKFZfKUGiiewpFTaJOV3d9obqbLz0eVHglUKf/sIr47IYvsW896rSSxkvnddn9sPY
 dK9234PnQ3Uwu+v+h+sZMpDUjNuNnXw0dr69Ps1eU4Q2tRoHW+pY0mL1H8T1BcLHU29ofG8THQE
 S1K27ZUH8fU3BnAxmIdk9IJ2xpa4cVklS8Dx9MDXcSWZ6a0DRtzEMICGgdSNLG5267NCIhNgfkU
 /Hfhh23m5uGeTqPYrLgrLFcCmBAj0wCHtQeBptLnrHw==
X-Received: by 2002:a05:6830:67d8:b0:81e:bb4b:2324 with SMTP id
 46e09a7af769-82285c55c03mr6972771a34.26.1791067493147; 
 Sat, 03 Oct 2026 15:44:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:44:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:27 -0600
Message-ID: <20261003224447.744966-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 3.5.2
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

Replace the host-python-mypy dependency with host-python-cython and
enable the Cython extensions instead of mypyc.

Drop the dependency check override now that the Cython requirement is
satisfied.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-charset-normalizer.hash                       | 4 ++--
 .../python-charset-normalizer.mk                         | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 6a15683e1c..1257de8cfb 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  45256d816357f60e3e1880c5aa54a8fd  charset_normalizer-3.5.1.tar.gz
-sha256  6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3  charset_normalizer-3.5.1.tar.gz
+md5  0fd59692f546c0f8318af1728a12627f  charset_normalizer-3.5.2.tar.gz
+sha256  39de2a259fc954455c57274dc94c79d5842774e1247a016aff30bc0efed0f4ef  charset_normalizer-3.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index c2bfcc9e71..d8c69899a3 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.5.1
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.5.2
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/e5/3f/143b048436775b0f76ac3eec145c019e8173ccc2885c8f20319b996d5e83
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/33/1c/f41d4e74c28ab327ff3acd36053f7ea506c55872d7a90b0fa71aa3ab0c89
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy
-PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
-PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
+PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-cython
+PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_CYTHON=1
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
