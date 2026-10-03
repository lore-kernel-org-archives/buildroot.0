Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514E7CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F35E181449;
	Sat,  3 Oct 2026 21:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlSVgbqHZepN; Sat,  3 Oct 2026 21:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 054E7813AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061725;
	b=opW0alAGBJ+8F0XLHDYoXCPHvH+BYDjLTIzcXAc6IJfJ+GqHszDHdMyZFZPk4akbSKBY
	 3+gBoA14P6xk8NOo6dz1O7kWj1VST4rOvKZmyFgKt3j3xZYE5gw8wIVxnOaK7jfidonKQ
	 BTtbD0oDstpc82Y4Or16NEZzhneVPv93/JEeS3emhxXm96qtMUDkipTcmOAgczx1nwR58
	 ovQjjsBQZ7xAbcslg6l0KVMjGbGSD7I7ytafsHTHGhE0kXxmdkc6Oj31XK+nanGX90StY
	 yj6Z8QpQWrsl/mO1ckmyp6ySr+hxVFKxSqOaPhF3AXWgFcJLOQoSU9qHf1weZSRCw+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zL+4NXIwj3536IPJFPstnxToOwbLQTasAQ+jX7OdhOM=;
	b=Qrm7Mz+3X9+3/xptVfh1yUT2fCZxwk6vEGmgvoVqyYniD9XKulwHraAv8hu4YERMN3In
	 ctYda1tC9ZdsHVTaBT21ra6jiITiz8wfdHvWAOf9z4j1ZOeMlESPBHBp4M9eLpXdo/uQQ
	 q7e+KHsOtE8lTnr0RKOPmF+IuTjUH4O4EobbGNujKAxC+S6s9v2GDwOLl8lRaBo+fYOpM
	 JhQJGS9gfGVr6IqVF8sM1VumiPHhahoqyF5m+r1uW4RFu0O6aPzuWo2BFaQng9z1OSJ03
	 +vgnRa1hrG0/GJN5mY8fMu79B6OmOfsmnsAdpe6pqfGInFEqo0NCb8leIhWiFpovk4w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="OjnvX8/l";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061725;
	bh=zL+4NXIwj3536IPJFPstnxToOwbLQTasAQ+jX7OdhOM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NTjOoIG5ojjENFhwnhM8ggH6T+ZFnvh4ReTv5Qr4SYocze1IprvGQmxLJU5n4xYTY
	 /K+tPF5SDbSQDWojhVzsQeGTzfDJnfIDO4vs92O1vKtt1+qEKp9isktKqjnf3JpJYm
	 bVWvsmi3eTZ36mE0hUOK2atx8g22u+eOlES8j9DmwHxHWEsLmUAv0f/fHDXg/x2tEJ
	 U4v0MwFiIpteBCMgcpkkpF+6BqY2U4KHcw7fqBf1bxByvK+miR4sQFvVfr1Bo3COB7
	 CQnvMYCSL5mD83QvCHnzjLeEW/bSLhiVF1h9rB2ouK+pVYjHFEHF1pIW6TXSp0Ml2v
	 70TCOAY7zA8pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 054E7813AE;
	Sat,  3 Oct 2026 21:08:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A4591A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30099813AE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxnLajF7DbyA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4BCF48130D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061721;
 b=Yb3sItKXdaKcYxbt/B56VjhxF5iyzgWOKKIfpEdcWH1/rDuwwAAWxW4zRpSxwKduaO4t
 PTxQyhMvelSzl6fAoxQLFkErks+y5KZRAb6ipbiIp9dgrQi9SOKe+ffP3NziXIFyvP5m4
 M9ivKYCcfqo5xSSbIU4d99w5cf1XIWue+95DqIGQ51UNhg1n/RD+d5kIjTKj8LUZXpSPP
 53m7We2OzUErlkMO84h+3oKY+vkdU0aBdLOqHDkNAVELx/15xpFxzQQ0sD60Ncf52xa3D
 yFk5FuFv5T3wwsv/eqIx2JDqjVL+IptVbsLLGt4vQipaTxxzHns8tY3HWVRq5tJcJ2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061721;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=nPUufnM+XAVaVolCqLkyoq23akXZiTh+VFltEiLTtRc=;
 b=k0tuKI/DsNg7nlUu6F4imFCsnU9wvZbQ5HP0hFP4SwJW8CUSZtl6hepTUMLQbFQhm5Lb
 AXOZT9pkKSLXew7eUJJNLzgXFoojOg+6FEbLm2kYZ9ol8Laf/q2KquVfnxo7Ynf7Octsc
 JhWq4UQtjAIFuAOHQpqpK2JHbVKBu4Cs7Jh7dkoEpMqjAJCi3FALPcziH0GKhLRbyjk/p
 rNlQto1RuJLVVvrPAllKv9ifKHEYF9uAyNQtWrVwUlyhMLlN0S7/84LH21H34lsMQindD
 323ihkc3FlH2LNHxuSHjWeeKvfqOI3SwZzWEgNM0I+VaNGmCPLLPVtHR9EGRXYauG4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="OjnvX8/l"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OjnvX8/l
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BCF48130D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:41 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-8253bc5a613so172682a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061720; x=1791666520; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nPUufnM+XAVaVolCqLkyoq23akXZiTh+VFltEiLTtRc=;
 b=OjnvX8/lX7XlghXtcGst69dtCLOIvLber32oKf5CbCTk6WPFQpKj9OT7Li5SWGg5cp
 cl1OCFI72dDE5SQUk2B/31iZ5V3QVn0v31M+/p3UwNHcbiMQ5lqWo8K/5PEcz1SdE726
 WckYo0BiXEUinm/UMlGXLSxi792twD78RpvroFFHaHVtwuBYPTHRJFq6Hv22PG01llAh
 5jRAIlzuG1rEtP+sq2Q2NpSJtfmd4MjcP0Oic+kwrVlLO5Tbgpuw5a+OF8b7tmdyfh9h
 ef1o49aM+4cENNroElr1H0NhfDqwYmXB1N5W7+2+WKMv0GP9hNbeCpzY/2b54xOTWV27
 TACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061720; x=1791666520;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nPUufnM+XAVaVolCqLkyoq23akXZiTh+VFltEiLTtRc=;
 b=uANVsK5E5ZiyY8z/7wqlYkCF28PhPOHvfM9JghgU2+WbUOZzS8d6SvaSixm8JYOGbw
 JdBQuZOX+0UTBCV15Sfs95i7NnXhp2p78XKNwYn00TNtz8pW7dN87x5IGT/TNJQXf6Ap
 siCEjDAmgEuzKNbStUTS0xyPovlG/5Xqlue2qmGcMBJFzU3jzetRdh6xjoyYZ2s7poNp
 eFslcn79jrGtJUpuTKPkzqNZSubfVujvpn5Bh5ZsMvc3xuUVFG5xvgOUcckcOSWvpdfi
 NNbux/DcqFIzftUEC5fGhA0obet+ML1ieOjqFD+XjK1YcMRLKjHYmpR/IpwjZipVvaIg
 kFXw==
X-Gm-Message-State: AFuF++lJ5U6gHOHPnAyKiDnyKHs+FiteK0nR9fYvVwJYq6HnhOwnLi9X
 JnVY6P3w+kqbwUl2uKQnU0Dw2YVGDinnPbLzQN3h+q2ncHQP382Dho2UIDrCzA==
X-Gm-Gg: AYBFou2H1/g9n1KRrDMLXmnxZPJf8ipGR8qdLFVd6qoC4Ikn1Pbc8wZ1Vtie61NpqY8
 V2SxOmlxV63MA2KzEzsgJrFphUedDLz4oYXlP6EVjtGSIRmI6Go7f94yaL1TfXYp+JKkcQHxwS8
 lXLcAN9iqSCc6L2QUzAqQXoQUDpMkNeh3xCENFFw47KMqS4vw3BtFcserLRmAb/9nsQuTe4VUET
 vaJBwisDdmH2g8VYApG6eESEtCAfhs+0+FxOeMdXdeARVHLScggvseNypuvIuAAc5os/plYyd4i
 mK8vvY6v1Hxh6EJxY51+sgJVcP6aCIycZaq47rCfXyIDfba/fFRknBdLSvcoCugjcuy72aJs8hv
 HK/k9sGfCx4XtPHs/n4NjhUPgoi0GcgigH1m2ZzCjACwVoVfdrWy7BXxK0h53sA4sq5DGIiInU1
 DXry5eET5UL/0XQNsm/9Tk8Zj0RVCDaXFzWmm6QtOEgDZEI864BWjw/gKxF9uGEqWmW1RJ70ziA
 HAbdW5u3YtSv4z0Wkimj/UPHQInjfhBA1hwDE+de0O42+REqoWtjYLWwnrpfxQWSlZ+i0iVkuwx
 G2Tu8ceKuDB0WurPnGHg5HHG9DHDRmmXVFmbFshwSqizBPRi6qNnmPCNfLdhy1p6xJQKq9P9rAw
 1Jh78GcBOk49Zn/gIGOzZsA61717z8yeg08Uv3lbMSA==
X-Received: by 2002:a05:6830:661b:b0:822:b69c:fe5a with SMTP id
 46e09a7af769-823fde019d3mr3614431a34.27.1791061720061; 
 Sat, 03 Oct 2026 14:08:40 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:53 -0600
Message-ID: <20261003210833.735937-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 4.0.9
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
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 302664deb8..6547677538 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  7ad81dd59ab8b9af8af536bce90b37e3  filelock-4.0.4.tar.gz
-sha256  90999ed63a26ccf86b93b959ab10cf1017f422d816be454ed54cbed263e71ab5  filelock-4.0.4.tar.gz
+md5  0bd500192b983fb9bafd2e5a7b4e02f0  filelock-4.0.9.tar.gz
+sha256  635e7d67fa92654eed444e75e9ca18426d34e77ad9c469bf4373f75a932f7b22  filelock-4.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 97d0cc96dd..fa06e5f7c7 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.0.4
+PYTHON_FILELOCK_VERSION = 4.0.9
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/c8/d7/37691dc5063438a448b646f6f2442b4beebf16cc0e18d8cdfa7aeec60b8c
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/70/51/2bc9e529f154fad99b6cd0073e609291eb32fd23581b32362d33d164d316
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
