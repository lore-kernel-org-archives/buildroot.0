Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED389CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3D381005;
	Sun, 18 Oct 2026 18:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95xFTAR_BCI8; Sun, 18 Oct 2026 18:25:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B082E80FFF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347926;
	b=N8aj7RpcXUNwJPnxHdARz2/eUrJxGheoRBsA9NjXxDkF0xlvEV4rp3mTyXRkj4Z+9wtY
	 7gGnn9qXfSuYHPkeGBVIoME/X1294UJObR2UBfw+kyX2oQukkSYxQb4Msu/lgNvmVrbpg
	 3XFiH6rD0peZ6RozoYafYDAXvJxd0MW5u+D7nmUn1+zyfVIL/CMFlhsScMZ7+0uIC6DY0
	 e3wgSKxDyE55b47Sse46N/SemYXQVylQzMuS/YYflbUoQHOMRxSzsgcaDQn7lf44gU0v/
	 PiZmE7OfDSiwfFPw9iYU4Y0dRAD9O7NOCc7JOjFzdYcXRbYR2WuIWuYZ2OISdP8cZgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+aArfrF2/zCzeEa9PK0W07rls69CanoDysnyXtb51iQ=;
	b=eN3TZm/mIhCp60Z/t2IUW+HlmLj4VcjrwHmGzRpV5uJ/VdwB0EB01/wCTGjGji9Zjpz+
	 RfUm2kHust+/gyJpUjY1YxKzbxEjQ0s5RFrZxuoVfDuPjESVbVVvB4m4iD2eGRMnTj7Uo
	 EwZdIEZKmiZ4HDvcGluXrM6wQ8sfMS1gsMGFJVQg7kuIuKngszCiIzEYZLz790A84a2GE
	 ITbcxzgQ8GVMNAw75+gBl2YQnKTkpH9GqQBhqqwBErDhqWPTc+AjU0WuRYW9vMsDHg7G9
	 WadJrKUwd2D+auuaqZydX5f/qjle/3HRdDmNwGGQ4FFpII/hZ4DlUVZmQsG88ciFsvA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347926;
	bh=+aArfrF2/zCzeEa9PK0W07rls69CanoDysnyXtb51iQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oZCYrw0ec1ho2K7B/Ogbcfjuf4TqTQJVdAZAr8/Qar9Xtt3JWqlUBNXJs1U6yQbJ/
	 xb5IY1PuJq4mPc8AeIqSv71v7migwRTs5bxTycBRwmR+EDKgaNSlV2tlHNLVXQ9WDM
	 8Unt6gbyqSN+dGEF0B9qdqQ2FwqNe2A+nqKFLEEaed2bRp3X9AM1FeZpEKSvRiH12M
	 bVtvDmUbZTjxaiu/6l11GBnG8xpi1Fl8KbeC4XS+jwPJrP+ZdBVwwSphmO9sEk3472
	 6bz+OgxO+GSWUr7TrpuDJi9tbbwUmFMUCgHKWwlfqRBGEzhukODLUBGp4UBrFkqb09
	 VRukwgEGZyS7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B082E80FFF;
	Sun, 18 Oct 2026 18:25:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66D5961
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58CDC60644
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_ZHiLmapsC0 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 41BF160688
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347922;
 b=aiFWTtc9+sa8ivcdPLyWuyz554qyP6LkF4fdZ/Y/yhzfjpvIDse0RY7ProG57OrJY2bJ
 7XegjtsMzMaU51okhQ185pXG+SGEZpk10rJiUiOmV2yxHVxKniPfQ3nja9Qd48is4imAv
 kpomta9Q+6ahfaIHusFHvR1mq7EYcz2qiWDbH9oUZIPKE9qwN3jKIrr6+LNvydSUDJnU5
 w0UKWi6oPs+Q+HNU2Z7i8fUuyixacwdba9zHttuHLuw3uGnAhoRnTZB2v15Hlez1U2Pch
 QEhMPEluJiXCyoRkBcAXafnX8MuTfFMP4r9gGif7WKZlRnLWlkp63lk7/8QS9BASqCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347922;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=32ORJ9zfpmTDE4K3cQrdDUOUDxKv8hKbEgdSsyNDojg=;
 b=aQxVxWTFC1520mjChhZ+2Za2roKd6kanFz/PFixPvAHIy0r1iMKcxnwKIY6HVmE6G+zd
 4HczKlo9tdKTb9AWBXa13ydlUvVEPJA3OpbP+SARRbDnYotXrUY71rdpz2L67QLODzQOA
 9T6iybGVM6vTQwWPaXhqaRifghZoCtRJD3YWk1AL4ZPxO7XWOU2QLY6NnCm6YjiWl0u3B
 FlHCG7GrsY+5i+1hR2YZ99vo6qldjuZr/f7SLYFx533NkMQ0j81IyliKpNMa0kN1ZFCBo
 Gz04fCRzlij/tl1cACIW/wq+HlqRrsNvmURqOta2SzVS7OcbyCh7JlGXL2sqfG1MjKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FG+I2YEh; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FG+I2YEh
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41BF160688
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:22 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-8479f46ecd8so380399a34.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347921; x=1792952721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=32ORJ9zfpmTDE4K3cQrdDUOUDxKv8hKbEgdSsyNDojg=;
 b=FG+I2YEhzQiIfnDn7s3c62rLXPdG81pQNxlp/HuXwPrDFMgG+r1vRKBmFdOBVmDzl6
 b7MWQPSa+bBHbc9W7JhbfWULQE3KUV7Ywca5yQUEO1JaNVpXbDz/j+6tLk3Q+qEHhXfQ
 q6HzK+crfoXZjUTFuSek1Kf8x5KSOGXz9GDafI8KxG5vpKHGYetKUOxobCIbMrajtGIa
 kEWE3cb//7hphb3e4OXdvYR1+cnb/+m5Vrdb+zYz4ur7ALjEJcIaqs/N4e/3bDO4IJQK
 Ks6QbTyNaJYXP9VBp1uYnqtwbFIpcc39f7T0vsUTKxGlkCGDbRKnmPOdGl8gvaO3oZIo
 sh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347921; x=1792952721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=32ORJ9zfpmTDE4K3cQrdDUOUDxKv8hKbEgdSsyNDojg=;
 b=yRFtoPI1j3cB1rROM5LxUc3Ck6xqqGbb2bKmken7zwZfPExi5lIWAzAn4o/m5BwZs6
 3pCJB1nkXaQOWWZpDiGiu1efk0JWJ8fosCUGATFa1iFpNB9hchlDmKLJNCt6STOnYXtr
 hqX68Lu/T9aJBf45EkouhdArPfrDhRriKP8e+4shSh0xOGnTZPL35EqFIIhjxb3Soz09
 1KtEAjvTEcuR26A3hNTkHf1utaVJ+EpkYUQro10Q5aC5o6BJP07MYy0MJDl9fKEE/zLB
 v6XTe8XegM4RyDUl54UphG1ti638GqEL7N0L61aRMQQGnZMHB7k+nLRQ2bbAwm4hTtoX
 VDJw==
X-Gm-Message-State: AFq9FYKl+ctn2LPuY9II87hLnBw7M2mY9wUC+S4xjJdqPQHsrArTWfn2
 I7itIZpybT0Y4TJgA9eDmFwzc1/Ugu7FQ93u5E467CDrxfdmqXXsrrQjnYBi+w==
X-Gm-Gg: AYBFou0AaW0QTQ4taq/7++yQ1JtXdQ2ACnSFbCTmng/Uq+nbGsvc3uLZi0ZfAff/1o8
 DvsibVvZVnMEfkfFIe9A/5mpOmgu8IW2Zgc3/CLqY7MEZOleA0rPQqAsufNNi+540c62/82e2MM
 FFV3iQ6kRIvIYbctv24oGmEzU5l3Cetf/I0qpCU0qpgT66d8lPJ7GFJM3DP6mpAGmLHGUevowsw
 ClFGgEJaKeVA22pU+KB9xSrZVO4l7zOb9zIKz4Y1MZFXjiC7Ut/1AQzB5avS5n6Iu3wXIwbR75j
 b3dsNpMIUEtiAENwxb3ez9TMEjYB7Xk9H6bF7UvxgVSC1Rmirgy8Vgk9jUqpDa6tH6xuq0n9TmL
 Zhl14XKENnOCGuI2ddXnHoZo/dOmwQMZReW2tkf0JPRChOxGYDzn9zMZ1rthrKEwwhPF7hsBKaq
 6UYlTmLudq7cB5ITcdszs1q9XYsorwoGZJWDW1nvF5+Ie094UXECzalpW4WqXfoVyalgX/I5Z8L
 7xTRxI+ZMDra4nwEFxjl8o7Vj8aJUVW/1W5MkYjTJen37caTDBtTL2lmxNRKVb4avSDKGhKyF6m
 SJap72rpWQtPY+Gd1QmdgeQReKf1pnb6Pkc91Spr6xkhoP6DM3hwss5fH1vRkQupBgCQv26qsuG
 TPnpTRBjBguHNTmecWTH13ijmIPfibrgAUK0+a7NV2L5u8RYDJ8GWD+E=
X-Received: by 2002:a05:6808:13cf:b0:4f4:f3c1:72d5 with SMTP id
 5614622812f47-53cd39e1b55mr4004447b6e.62.1792347920955; 
 Sun, 18 Oct 2026 11:25:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:47 -0600
Message-ID: <20261018182507.536698-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-httpcore2: bump to version 2.14.0
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
 package/python-httpcore2/python-httpcore2.hash | 4 ++--
 package/python-httpcore2/python-httpcore2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore2/python-httpcore2.hash b/package/python-httpcore2/python-httpcore2.hash
index c088cfa87f..c783f884c3 100644
--- a/package/python-httpcore2/python-httpcore2.hash
+++ b/package/python-httpcore2/python-httpcore2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore2/json
-md5  345513f80f9ba004d66a8534c5b74dfc  httpcore2-2.13.1.tar.gz
-sha256  e0aa977abe17e69a3b820a24542a6fa88702676d83880b8d194dcd18408e5103  httpcore2-2.13.1.tar.gz
+md5  a540e0f456af9e4abf944965a361ba1a  httpcore2-2.14.0.tar.gz
+sha256  4f57a1a8249fe6af589d935cfd456f1d13bbdcb0f0fc72af9142368fc94811d7  httpcore2-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4df125c807b0613501e943a5c92496dd11d2c16604ce396097a8dde396304d9  LICENSE.md
diff --git a/package/python-httpcore2/python-httpcore2.mk b/package/python-httpcore2/python-httpcore2.mk
index 48c3d64604..048d582bdf 100644
--- a/package/python-httpcore2/python-httpcore2.mk
+++ b/package/python-httpcore2/python-httpcore2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE2_VERSION = 2.13.1
+PYTHON_HTTPCORE2_VERSION = 2.14.0
 PYTHON_HTTPCORE2_SOURCE = httpcore2-$(PYTHON_HTTPCORE2_VERSION).tar.gz
-PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/cb/f3/1db7aa2bc2524062192bb0e0323969492d1883152a232fe36eea65f4e35c
+PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/30/ff/b53af1b49bb2cb5fa97c92215614b173ca5c1a99ded80e2d52f15a94fa6d
 PYTHON_HTTPCORE2_SETUP_TYPE = hatch
 PYTHON_HTTPCORE2_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE2_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
