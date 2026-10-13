Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799F4CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42AA6405CE;
	Tue, 13 Oct 2026 17:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMJWQS656DSn; Tue, 13 Oct 2026 17:51:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5274C405D0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913906;
	b=D+/Y0WgA9DADF16xIt3OA47o5KoXBpXxH+SpBL2Ht6TV2uPhavVOS+dSmAZmc/BHiZV7
	 ulEbtkb1Be+mV5hwaQjqEmmJRNtWu0CZW51slbmsRhRWu+If6W1V0YwzGZ/uET5noIy5F
	 ld+bBxFz3uHGdiwU2JSwalXdcgYHiJzE1dOATMcbjZbVlQRfVoc3DF9zVaD2dKyH6y7Sa
	 LT7saFGSWrbpvPRc0zGppAosaIXUW7WI18yhh5zYE6OELJbPPM9OmEGCPxWVqhMRnMwA7
	 DDc+NUZPAN0I+ZH5EboSnkuy+1NLDt63q2j404OLo4QWEP6lohTDDr1hqu7O6obrnWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913906;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ROcuSQdc43A9eX685OPL6+ZTMMpcHSK01/Xg+zxllXI=;
	b=qMECSEeRngBNnVHjIx2vzsDMKYB5LLVtDigPw+HVQDkic2Rm5a2c3u9bQ46dr64Nk3J5
	 cxHL20YMnYif4Yrg/hFu8EGJAN47uPe/ZE2CDHnCPrVtKoHi1oS3WtlS5KxpReydyDuZv
	 oe6vw7IyEbHEXVxMyMWhgD2tSNbjHB0RTrV3WfWcGkhK6mk9ztsaB/l8sqDstg5KNntRF
	 K1ZcIi+C94jpiLqQt/asnDPfBbepREjw79sSGiWiPkcz2lqaw6BtoEj3ubR3EYOZ3ClJC
	 LbMEx53OiES01Xh+XP2Vpy1x77B6YdYw30JyAiNJYIah7xpYLnwLOs1EAirGPgPPJIw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913906;
	bh=ROcuSQdc43A9eX685OPL6+ZTMMpcHSK01/Xg+zxllXI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=i3j2vB7bmpq0orujXmsQVdqHY4EBqKOBp+2Gcpyk8bDLoyfp9NqDrOgetCIjzwP+h
	 VvsTc5PK2mUSO97CwaFVL8mdZnRvOFdk+cOxUJQOJ3N2AuZU3lpRBU7pzE+Lm1pWhn
	 SW3jnPWDzCzb8P7xk1VJWwvNcnnCjHigP0l+Qvkfw54QG1vCFM+jxDx9Xz5osCRNLb
	 EVpMvPHgQpy7rdc9aOb6lU0cWFKe54/G4vg28fWX/dWDBhSV+zJ+1S+EOkr9t2/hBe
	 ofN3NQk0aWQFtdVxeg1ba+0B6UOMXg83V3ANQX2WOpqFqmtKhjSlqMGE/rVnGv8FIm
	 3moXT0RxjofDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5274C405D0;
	Tue, 13 Oct 2026 17:51:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01D2D2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F375F402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdLrdOlhpAoZ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E92C94002B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913902;
 b=EvkJnpvv7opN0NRaR90ksTnO4qZcNFg+JcY45AhaUYOnOjVMNu+8A8AaFiF6+wjS8N7y
 ++7QN6pPi8IxHaPeLP5tWEBlhS3JIk+3ifjc8sQIhy/KP0A+ta0QWnHIaJmeBOE3q8lMb
 A+xtNJTZqPyxz9aGYmY8u6xb2B9UI/+YE7+jCy6OsJn/IRdNcPMD5SY5qJYyzRdN3/ZX7
 0svp5IJA3jyLrh5B0f+OlnhoU5WeyhGdbi+j9JyjWchMB5GJoCTXyV/NRNsT9rzV0d5kQ
 H0/W0sjK7hu4mUklPuk8bkyvh/3sK5AUC7tANy4i1/ywdZen16241O2Z9ZNyN60e4yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913902;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=zTqDn0C7sr8Yjorsm0bdCEMUM/TPLBH4N5Q0qJcfBAU=;
 b=nLRnNP1iDSytmHJXDGkwBZAT5qrSJCYOF327w4UlBhXjCgjvAoOnQRLQrbM+AVb/LRmp
 mm4IhSp0tyW1NgLgQeb7hPJ5XSs3p2oZxjGKCbBsFmMMEdOYhR66NJVbatK91gLh87RU1
 V2z+60EdNp1EJyDzM7QbLZiL1th/X2i668HewAiYdJSC56YTpJJZYLFRw1OH33F3nqClu
 KzTp50t2f9VJYUTdSj5EQPpzRg9FKxUbkkoKUqg6Q1pEYcOTAcdB6TdNWs8Rs62jNQdeM
 ry1ecRvH4eKOCtd+C70hviNDcnYgub1Qt0l5NkbXSGdHl/m7LF176BB6D115RZEXz8A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=klJT+yuS; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=klJT+yuS
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E92C94002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:41 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-8258ac98bc2so91186a34.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913900; x=1792518700; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zTqDn0C7sr8Yjorsm0bdCEMUM/TPLBH4N5Q0qJcfBAU=;
 b=klJT+yuSuL2W+o+QwouhJigAifk+y27L3nBF2HlPYiR9IVBo7OlyIN4f5h/pQmwPJ2
 b56GlLzADflnXUgRJzRADJbfiMakmZWNk1oVhxsn4w7pyIw9v80e3KLz8PevKq74CLyw
 aed/NHQyTXCAx9GFDmuoHIDo+0VgYCRaIHVMUBAY6KgQ4lq+bc3yuvVe24CK6pFKwdfH
 0b4mcu+w+oWqCqs6QT6tET0oY6rea1cIzsjQGzNTyp9DtdW7Zwcx4tGePlS8rK2O1rPV
 zSjvGbmBg19GfH28LVPLjuBbQZTsMLtUAPXn1DplfVlL76FuGQIcKOyATQsWq8iu+9MT
 uSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913900; x=1792518700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zTqDn0C7sr8Yjorsm0bdCEMUM/TPLBH4N5Q0qJcfBAU=;
 b=QOXvdXN19vqlGzOU/5SQf3Vn04uXK9qVx4CUh2rLlz7gRwwkhCkC1nHYIvS31OwHQ5
 Lh9uyih4S/B4wyYpWz4k2r/3UIBhA1FePx8FBt5GfOX1WtqfFNYpJtZ517MWdCI0YSry
 tRp+pX4IgbAJoenxpD3HYH2pYDlltRSwhFxihLQvg+ObcsZh5hFCKWmkfDUjPoohBU1+
 DiAdCra1semJt3ML9P0I6Fgv0E1lDm8eVsBN8AAflHulKJ3heRrX1hnmaEdIKodDiuho
 CwTtlrD6kySzGexjKgaLt62IRQx8WLtUomypJWEAsSEK9Lm3Dl0adc0xJykIibndJTcq
 cZ6g==
X-Gm-Message-State: AFq9FYJxXmtKlsg7voncsFIUi/IJ97n/5jvyLWlnm5/LI+Ny0r+W7ywt
 lXG4qRHKr6jFJ+KgCf7j02W6TWXOjDUuJXXiohxHwk1DawoPiG2C9bgd7O+KpiJ0
X-Gm-Gg: AYBFou0SrgvmbUHCTwmVeD0zLRVd9//OSUNVQ8hW/MCPQJII1SbI731XPWXKdR3oFZM
 HV6YUKu9CxmVd/ArJOKvM/hfO91j769VB4o5ET0qyQcYJ10gpeJzpk3GJ8px5abjhaqOOJ+MjBl
 erGorltOA8W7Rerss+ScUUP7g2zYm3XU7wq1pnlzMulbiBTS3NyuLKueMymexPyXHMH3TUVVnvT
 3NwrgsZ4u297EHT91xQVCGT/e1U4J4j8yjEop0ROOU0ZmMIwiskyoiPYA04eCtCDX9gDF1RVLbR
 QXYJ5kYfeG1ZhtnXfFjXPthNb3rADAVgwhUJdmY8wcI/4oyC/VwaPQtDJAB62T5vy3TTxCFAxtR
 wEqZHAV9lIDmUI39IzGL/aix1V+WloW8igZi8M3jfpYZz91X5HIKayMMEqMDvRRzKeTNcJGi73E
 ixLixkIdOGmLFUWGCeiLYv0hdSaVW9ng43CFh6Yp3cz/Vge8UD9Zlf2E22f+yp0OhAZsWH12p72
 PZz2YNUg8EuTkiszBymavLNhRvND4Azz2Y0IkbR3NRD8nWJk0hFy5/aY9tkaRqINpc8FakBxS3X
 295QaJ2ZhWZ0WfRrS2HClvCFJuxnq2SXTT0gvmkA7vF0E35/nmfdn0nCDFO6V2nyfKVql0Lt+cP
 78gXQtZYXpNE3Oa1fllFgrxthhu+fmI6zmf2kf0Dya+o=
X-Received: by 2002:a05:6808:238b:b0:4ef:b695:656 with SMTP id
 5614622812f47-50c42460996mr12735043b6e.9.1791913900506; 
 Tue, 13 Oct 2026 10:51:40 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:15 -0600
Message-ID: <20261013175130.1822395-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pyudev: bump to version 0.24.5
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

Refresh the libudev loading workaround for the removal of an upstream
import-sorting comment.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...round-finding-libudev-on-systems-without-ldconf.patch | 9 +++++----
 package/python-pyudev/python-pyudev.hash                 | 4 ++--
 package/python-pyudev/python-pyudev.mk                   | 4 ++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index f8c9497de3..343b1d486e 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -8,7 +8,7 @@ Python's find_library(). find_library() fails on systems
 without library cache mechanism.
 
 Taken from pyudev issue 117 discussion:
-https://github.com/pyudev/pyudev/pull/117
+Upstream: https://github.com/pyudev/pyudev/pull/117
 
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 [Marcin: adjust to 0.22.0]
@@ -17,6 +17,8 @@ Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Bernd: rebased for version 0.24.4]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[James: rebased for version 0.24.5]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  src/pyudev/_ctypeslib/utils.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -25,10 +27,10 @@ diff --git a/src/pyudev/_ctypeslib/utils.py b/src/pyudev/_ctypeslib/utils.py
 index 9dffb3c..aa9942f 100644
 --- a/src/pyudev/_ctypeslib/utils.py
 +++ b/src/pyudev/_ctypeslib/utils.py
-@@ -24,7 +24,7 @@
+@@ -23,7 +23,7 @@
+ .. moduleauthor::  Anne Mulhern  <amulhern@redhat.com>
  """
  
- # isort: STDLIB
 -from ctypes import CDLL
 +from ctypes import cdll, CDLL
  from ctypes.util import find_library
@@ -50,4 +52,3 @@ index 9dffb3c..aa9942f 100644
          function = getattr(lib, funcname, None)
 -- 
 2.29.1
-
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index 799499a2ac..5d8392a888 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  2d2e6f68b60c3bf3ffc2b7c8df8d18ac  pyudev-0.24.4.tar.gz
-sha256  e788bb983700b1a84efc2e88862b0a51af2a995d5b86bc9997546505cf7b36bc  pyudev-0.24.4.tar.gz
+md5  f5d521b54002eb3b9abbd84adbd12da5  pyudev-0.24.5.tar.gz
+sha256  4e7faaec419b81a902d057568101819f448972c0cf448bb9c22203e4fc6a8eb9  pyudev-0.24.5.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index a83fe70a48..eeb12fa08c 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.24.4
+PYTHON_PYUDEV_VERSION = 0.24.5
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/5e/1d/8bdbf651de1002e8b58fbe817bee22b1e8bfcdd24341d42c3238ce9a75f4
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/6a/45/770eda636216c62be4a06af01c7235923ca0580d72fd3e3178fb01b3ae01
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
