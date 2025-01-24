Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CD1C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C759C82121;
	Fri, 24 Jan 2025 21:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFinW9f0IwAz; Fri, 24 Jan 2025 21:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABDD382123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABDD382123;
	Fri, 24 Jan 2025 21:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46C35941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27B1A82123
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r54w3e4HBm0p for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B2D982121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B2D982121
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B2D982121
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:21:26 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3cfce97a3d9so2494085ab.2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737753685; x=1738358485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nEbnXb7RCsDQtitqDlvHp2+BKyjy9vAriiy3yDgxpDg=;
 b=aB89J6ezxQ2YHgG0gvSMIZKYQAX6OkOIrUQ2dIvlox90ptACzCt0MqWMrgjByf8F02
 olCH7xrU5QPocEahXNIPOLr+gf0vyyMPH6gohquPnk9mJuid3TlXpB7JknDDp63gO8Rw
 PI8WiuNWoNCj81m8s01jlux8fCEz0dVeniKO/5Y85pn/NaxcZgiD7HmZ1s3jvL8Unnzd
 3dBj0k4sCViyWo2XtUjGlEkppLjYUtV8NOGlXaxySxgRu4W8sXXIFG60n9x1pU5frurr
 iBYUjuIi2KANS8RZhvKWcHYqNyQ5hemRJddaHRqpTTGL5UfQ9bU17dAWhoGEAlMAiZ0i
 GLPw==
X-Gm-Message-State: AOJu0YyOjUOfqBZaRpX9uriw+vba0uLmxhx90AKyTOXVNCouO35mc79v
 RWSy7WGizuMtaXaPfEMxd23W6V97ZiUt+yzOMY+QVz76CutNAXffXWfxUG8q
X-Gm-Gg: ASbGnct4m1wTgJszO0CMXl1QVeYwXaSZF8+cpDil4/VF3NkLrqR+yZjjObbUxXf15dp
 4iF8yJuzKkjmnwwyFO+LFUyddogqbI+b1ai480t98DE9sJAJR+Nya5Nh0/EDlJ++1JJ8sOkgF/R
 uI3w2rhuSRFnuAGjdY1NxxqzVHz4mEpBnac3LBMi62y3xE5l1+sXf4RBPZUcd5voiORWZM0ejLC
 b3VjWHrtbsv+ZcDS3W3ZRftOTpeXJ2zim3XRdtLlzWraSd945vuWhtEkRmFS8AmY1CTSm8sKNmm
 vZl8sWr3Idz+z0o/nT7faxVFndtLnfkKIAEveEhyEGzPBPXJMM3xEs4=
X-Google-Smtp-Source: AGHT+IGt+nG7odLM16k7ONrFc/Du8wysrgr3NJUXOw5+YNu1zW7eaH9tK9+q7ib1B2YBAF4TkFpZqA==
X-Received: by 2002:a92:cd84:0:b0:3cf:c908:a1e with SMTP id
 e9e14a558f8ab-3cfc9080a87mr33755985ab.1.1737753685077; 
 Fri, 24 Jan 2025 13:21:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db97d15sm847221173.129.2025.01.24.13.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:21:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 14:21:23 -0700
Message-Id: <20250124212123.3877939-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737753685; x=1738358485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nEbnXb7RCsDQtitqDlvHp2+BKyjy9vAriiy3yDgxpDg=;
 b=dFkDpNmATblkiYNtwX/iHEh4uREv1bYLk05tAWMCai3uGtKMBb9Vl3H+vn8aOarK+k
 N/tsRE6HGAiJFh/qk1Ku7Y15tRxq50E8tyew1gfTFu7cNz83Lu/uxYT7uPVUz+aRDS+y
 1nDG/cRGeIOq1tZkHqGYsY7TVwo1KjuUMbrJFlWKti/YupxLfw2N8aTAFjfu2uLkLkdn
 4Qd5lQ+B7mSQwPPFgAJu4wdWkJHKSr3wAfhtTV6LxyeLLe0/ufCF4mvmzqJdUlWuWDaV
 4Id1HTTOx+h8lQpYEND+mQGK0AOUWwDoKf/BOYohyYb8sg7PzE/seAfHWxvcdJsFpiPG
 ad4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dFkDpNmA
Subject: [Buildroot] [PATCH 1/1] package/python-xlsxwriter: bump to version
 3.2.1
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
 package/python-xlsxwriter/python-xlsxwriter.hash | 4 ++--
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 859fd19532..009ebe9c36 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  86f1c46dc20ca2b87aacbb2e1fc9c1ea  XlsxWriter-3.2.0.tar.gz
-sha256  9977d0c661a72866a61f9f7a809e25ebbb0fb7036baa3b9fe74afcfca6b3cb8c  XlsxWriter-3.2.0.tar.gz
+md5  881932c4645db35b39b1da684af42a01  XlsxWriter-3.2.1.tar.gz
+sha256  97618759cb264fb6a93397f660cca156ffa9561743b1823dafb60dc4474e1902  XlsxWriter-3.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  272e8fbd91096feeea0a250775ed83dfed17143ee4acd5d9567a1e42104c038f  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index eb8c692e06..be2bd342ca 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.2.0
+PYTHON_XLSXWRITER_VERSION = 3.2.1
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/a6/c3/b36fa44a0610a0f65d2e65ba6a262cbe2554b819f1449731971f7c16ea3c
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/48/4f/108b0bada5cfcc47c24ea6181f4c563fbafef50bcc0054089c256b2ae578
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
