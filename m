Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9BDCA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C6640E3A;
	Sat,  3 Oct 2026 01:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DzlJonjOvSA; Sat,  3 Oct 2026 01:34:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6E44440DC3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991246;
	b=rUki3CCzOsBIqy2w//YlMvDEqexsB7/WzoiYvsP2X6SgzQuBmLk9DFKkKz064WOdBHVR
	 BOEDM7Gd+ERNbc4xzvukE7y3ngjUDxI1f+Slf+CCS0KEuxnIkjV/u9Tfp8jIZ1kFvuqSL
	 wVH808EniRYWrKn4UNlTQAru5o/3DML0G2PqNvGh2tGtgCaskSf36xZdZHZisbcuKOdme
	 /Ztd59GBNMBswo7G4Kb6ijjhiPHz3QBMe+vhxyfG41TPJeVU3lER2N28kfShObMWrH8LD
	 t1Fg6jJvQyfaWrp+vwLBk3gAJhe6g0LRRMnAznFr7KBX0lASj3/UMIjtwt3UFWJktLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fp/cQG8Cpboj/JJ7AsR6ERboK3wrl30CY3LqBr1mW5o=;
	b=ir1pnVYh78ivG3UQ5nka14HFXPnLz0/w6L88PPcBVbF4gLecT3cYyr/6sTykmdRIMldS
	 ZHU4Yze4pM8BE4j34v7gZ1knDI0Yz4NvD4iU3ppE62Y/nNbME0Y8kca17qHZkDbcyoKEJ
	 Cs57plecy1pzDd6afSFWOL/ztDPhLKRkQBSZwUat4D9BI4SZyt9e2Hgn8Ap+xJUqtAh80
	 CXFnNbKyKJHnprHk+dYo8IRj+JEBdQmkWPqHVLzfedN6LfuXJG85rFcwvmJIvKt+akwcZ
	 pGI5/iJmeybxbzbD3PjR3GyJglfq5pMqKLOWqtIqyCg7pRgS5bAWO0dU4/rbRB0R7KQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991246;
	bh=fp/cQG8Cpboj/JJ7AsR6ERboK3wrl30CY3LqBr1mW5o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=M/Qj9pH43bJhzh0x6FTld5JeZlY0T9O5kbMyUXZM188AFDd6q3t7Myfouu9PMbqE+
	 Q/9mgNGUEQruqUYp+AXtgb5clXhxcq27NDZbSWlDcZPqzTxEQr04x9CzGbZ3zlWVzi
	 eLSPPJv9DTNQFlFvGF84pGw9/1qst8M5xxFokeHbKmyrUPGlDv5Wb5w2JQTlImqyRj
	 cbDpIUxHrekSehe48hCK5Q2fqlKbPgAu/1I2Q7YePpT4tX59A9pnasGLS/y4SCeO2l
	 TsNuVmBNw4DFqKyMFP0jrrhIP/HIAXkEI5zRZac0J8dNpmDMXzHDzI9+M0RBxhwrXF
	 xfKEiZEqFCZvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E44440DC3;
	Sat,  3 Oct 2026 01:34:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2BC01D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2AF0812D9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jsujr5TyoUnR for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:34:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B15AF813DC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::27"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991242;
 b=QXuDjyePBL3scczTHKID86Pu1ayK/h5uddWoOXQpACpHiOWg+EO4iECB1ZJYegVULqta
 YcVl/5k5hJHT+kCQv5JADYGZoxrcyBaJWqNWM3MtxhlLYHuKI/10aqB8zVZLCY4fPxXXa
 wTqxJ7FJR3tqAlwkgL+ugTdTpmwHk8ZlQE7IG0N5y/q8PeSziMIHiyXqn7YumxTh6pqea
 dR6AzfvBEHSVy9Mk3YAjafOx8tS9IruUpEuLlU0uolHySjUNUazXNb70EVe4Z4by9Kkob
 z8WsSFSzGufOJ2T042NICaUjuBFo6ZVqsmDxTR9yhQMKs9vABXUPkD2opxnJkebvnew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991242;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=kSkm55/X04XjxLjCJv3tPuA1xnd4aB50fFOa1xJ9ak4=;
 b=Gk0JDvwsptbOxDhuXeXBlElmRUwysl9pc9w/gjZxx6xRT+DScy1wq5jfguOqnnfGeOVo
 gaV1/UFNBiN0ZVAABGol4NMToTwjkjpEzZoBYVVq5BS4U5dRwRoNH5FPh2i4fvSNj3KPI
 d4BqEaD8l0z7E4O0tP33Fkt/ldojwa8K5iUAW4hXT+uO3UQqa9b3d5mkPBvkL+PWw20U1
 vd4elP7u6XetmFg5iVegN/zH7ZsaR+LUDIu5YvdYuGW0OOcVny/2NTiUu2TZq5N/OeiV+
 NEGYWCxq+TTb8ZNViw3m0W+6jbfla1/QmQnXlw3SR2/MzMbzUiclNtS4/9mwjujmbXQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lO88uCig; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::27"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::27; helo=mail-oo2-x27.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lO88uCig
Received: from mail-oo2-x27.google.com (mail-oo2-x27.google.com
 [IPv6:2607:f8b0:4864:31::27])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B15AF813DC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:02 +0000 (UTC)
Received: by mail-oo2-x27.google.com with SMTP id
 46e09a7af769-821b8443e13so102266a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991241; x=1791596041; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kSkm55/X04XjxLjCJv3tPuA1xnd4aB50fFOa1xJ9ak4=;
 b=lO88uCigMvwwzkttWstxKWJD7m6qVfNqb6UXfeXd7rFXRSF60yRpeoMezk3TxM11Xh
 tkfWUUpmVTsg3bPA5pJt5Y1dVOFeuPXhjndZO/yCx4+qMcilS/LuEfxqF6AzKp8M91vv
 zxG2hcNMV6D/rxb4s/vlG4Xp5PL5FwOraXO51rFW8nn08l/bw/u078HpGKbazzXf/i/D
 bQUWVpxVmZX9hRcPkcNN3uRC4AbK28rkrsKS7nRwgaL/Tt8uPvGCJ3flxcCWB4LIgRC2
 gliCZn/N/S52X1SlmJ2aIOWPCQ6840gA/ox2yyJ3F6yMJ3DvSLNd/ZZGfvYpzv/XYIeM
 SRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991241; x=1791596041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kSkm55/X04XjxLjCJv3tPuA1xnd4aB50fFOa1xJ9ak4=;
 b=Z3t3+vRFit0Xa2HtmNh+XL5Z7KjuRQeqKgxuEpdxNDcsbJADfFRYhOemSd10muk8+l
 Dv13V9WuniOR7zOAVzWw05W9UlfxXaw06lZfXWQFHE75YMoUCEzTxUGc/ur2c2Oz2dX6
 GR+Nb3aXpjKp3i19D8Kv6eUGU0aTpc9Ty2TmagC2vzGNXhIZCCkTGGkfIxMGtT0tRoN+
 0BMM1kn0LKjAvAiofb0+jmjozIWE3q4notaWDCwF6ZDLw8miwu5Ez4bO93RIelOkmyWu
 sP1zcHYzwDBlrqylMvncpZzAjsEQQMqbQ/UYGsE6U+q4EQ9zjP+qhcNuFQdoGdXMK4gM
 XQKw==
X-Gm-Message-State: AFuF++lxwNQNj8pw2MscVeuJAMPHiayjzvbgPU4Zi4BKQfDK+fW9gIa6
 M+M7OAjGvwrgSYTgQlQgCXXHWwZBOdt3+/d8rg5h9HYYblEfwLUnlquT8MYAHA==
X-Gm-Gg: AYBFou39IBNnsol6SglsjGeM1qPLEnIgtQ7se4mMVWfm6X+nmWAew8s2tw4JfFTN55u
 TZZSke5f6ScXJvvuZVsLHPw2W1Jp8nSJoml7Lj/hAeWrFxHS5amx5XJcSzF4pbsk6FpvyNkkAYZ
 CRjso4ZXzQlI7iz6/C0EBhc1LFfesVMJHDVv9+en3ugEhN0V+Hi3/A89SGY2AePa9UqOCxVOQP6
 9cHTAQwhlvkP+YsJwO+KAH9i9fxB0uL8EI8GZrADgeXFHb/fDG4HJlf6YkOhQ3lSpen7ITv/h1m
 /kPR6muu9V7yR2opuXEzoq7GbnwLD6cWibphPzgtTmfIAloWKXQORbVvOKTM2/QB7U4ZH2xLDaD
 +/EChNv15LRVbmOCIuXPKbnsvjXOPCt92piorfaXUB675iDqATt5sPNhJiQpVTIvzL8Y4lEEEdk
 qQR6qOC/8LsxWbLK0srTG8/gOi/WLcQT/3KySbTksQbX2BUj/mi+cdbVrN9lQ0PLbI1Cz9wiKGM
 ze1t7Hu8VE4OjLjAv9VZsKMfkSTXwjVwOoWBWGquKR7ToSvV0aDWOn0qhPfRR7VZPmkPYsRlIo+
 ndwO3n07jemOf8k3+l8bmxvYjvqIW63OMRUMbb90pVb1xsvjxqazB9lfjEYXQ3c0E+tzZ74JiET
 z1DO4p3QSY2Z6TZGI4MaK76wPsfuY3sJEVK3GUULr4w==
X-Received: by 2002:a05:6830:f81:b0:7f9:555:1ded with SMTP id
 46e09a7af769-82284d5b741mr3444749a34.9.1790991241313; 
 Fri, 02 Oct 2026 18:34:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:34:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:33 -0600
Message-ID: <20261003013304.400979-33-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 17.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 448aa69e19..63ead47a25 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  eca5d5bbef505b977ea84d6799f8fa89  websockets-16.0.tar.gz
-sha256  5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5  websockets-16.0.tar.gz
+md5  1d11b405b284374774d43bb70a6faf92  websockets-17.1.tar.gz
+sha256  acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a  websockets-17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index b7b8d26e2b..35d1b9f824 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 16.0
+PYTHON_WEBSOCKETS_VERSION = 17.1
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/04/24/4b2031d72e840ce4c1ccb255f693b15c334757fc50023e4db9537080b8c4
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/18/72/fba934cb3dff7a85d811820efffcd141ddd52b5a2a01637f64551373ff4d
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
