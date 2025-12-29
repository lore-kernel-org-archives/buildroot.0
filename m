Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F7AD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 06:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C68F4606A0;
	Mon, 29 Dec 2025 06:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wd4ZoZhrddQn; Mon, 29 Dec 2025 06:08:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7DAE60774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766988504;
	bh=ptOkuugM5Md1dTNC4tzMV9+O0IOR1F/Cs9qnS+TN+KI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YwxZkw/Rd/1m0gWzwjr/Y5aLpQT3xbVvaJD/Hdqppuo2O3xpn/0cEy6Ke53te5Hib
	 /oGacaI31Id4n5lVHIilPABrGYIn+ypMwwvnuqRpw03rWjIGH1Gvrq4LvGmjSBMmBL
	 BOj8RvuiwRR69DHCRVlkb5R1uXSFsvlJTl9Xt+QNtxoYNFF6WBJh4/tP4RFKVth3V6
	 OJMArMdyDRmbcRfBMpfRFxucudzx/yrUEZTiI0SiVWs2xkJT2H7+mIbzsfUd5mFQAa
	 x6VEWrld6KU4Jr+8qj0AiGSBxo14EoByC35aB0Jha4hhz4ESlPplDtcJZqsFvd205g
	 Vz7fMascgR7AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7DAE60774;
	Mon, 29 Dec 2025 06:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E25BB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 06:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 702F540059
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 06:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXy5-ViNPbS3 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 06:08:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B5DC4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B5DC4004E
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B5DC4004E
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 06:08:21 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7cac9225485so7051629a34.3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766988500; x=1767593300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUysx+4vBPvQ3KajAWCjAxL1NloS6vwlok/8PWnsL80=;
 b=QPzR6lLm0MvBO4rFqjqEGecTlCsPRpLuKF0hPw8O0XFMz/mwuWFE6aee8vv+4MiOTy
 ONh44K3MxKe8dMhM1M98HaRNNk0o92FFluYVArPJ0f8uBwhldqk/C5ZQCvZs3slejEj/
 AkX8Wkjz/iEV0SIZb+kbTiy84cerASpF8d08uGlPQ5Sp7lshUok9KsBmaguCQs12tpFb
 S1KSMGowx81gLN0jKfoakhFXik8mJ+tTM776oY1kD1J3ctZ4blXNi+YOaEG9eUA6S1kE
 9TnxeUwTfKdFFkyGMvwXdqvRvbPQB11IGnGHj4FFQ1FBEwG0zGTYPE1xWMaVRnCwye7d
 tK0g==
X-Gm-Message-State: AOJu0YwUHyZaLC3bkm7rP5aVnZzwWf29fcQzgG5UgqGaAZUlv9c4mDTJ
 Boif2fA57FxqSWdX5T7GYByo5iG6hTcxJG8QN9pqbbWW3SZuWPZc8dvceVY+lK5F
X-Gm-Gg: AY/fxX6G8+ztJAK32+Z4QO22AeGLx9h6cmB/3PUqpHDvR/u41L4cibQix/+WHn+yla4
 /rpH/DbcQ07hMiwVHWR2MjlfzPBEjx0n7/khkHiJYMCIraM8gqLScPqjM9OQphEtNKGwmMOw27d
 8VAGDM4LPA2IpAaLM1zscfQ8sZj/tRTGPYHXOdL0lRbZv++L5LSkFVJcf6AlsKjahgvihfQT/qz
 IVcDhir0Bi0MgxE2yKJJjslCqqHXFM4URZWIaZMiegIU0WoPkFc7St6u2j4hLkpPlAIHa5hT72j
 Yedo3DjJHrwmBbc9veiIId4I6YVs7oj3G6tMBl7iIag4CoSMM9MBAsrCs3wQNNWS47ThO6dtcUL
 PLBmE32PtbJ/hol3eT2Zy6PahM28xfqEmYLUtE2kHWB9GwWTdgoJD1h2sHytQCLgSQou+yttDoW
 IKu4JnHrBM5n14mTDhDtLUppRXxE5QQe3ME6NkF6e/qwT0y3PBHEaN+hCKc/tXomggh4QVlSYDD
 8qwHyW4X5OX2+2Zq5XV1dTBEnBXy7Zc3xXIP+ApQL7K3pb41C4FEkY=
X-Google-Smtp-Source: AGHT+IGL3avsM8FaCSb9IPW3P52YJYkxyEo77ZpO/V96TKOAPLb81s1nSJY2vLNQjIsePZ86b16eTg==
X-Received: by 2002:a05:6830:438d:b0:7c6:b6da:e2ad with SMTP id
 46e09a7af769-7cc66ac1f03mr13628014a34.33.1766988500048; 
 Sun, 28 Dec 2025 22:08:20 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc66728296sm20256437a34.4.2025.12.28.22.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 22:08:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:07:43 -0700
Message-ID: <20251229060743.3529914-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766988500; x=1767593300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NUysx+4vBPvQ3KajAWCjAxL1NloS6vwlok/8PWnsL80=;
 b=Ch6jDu6PQYVstyAxBYOad4kfeYu3DABY9QdRJo1b/qzcdU5ytovpxjU5JqF7+wLVPP
 r7ynhfS3jXvDfJhlMhHhiz1+s4UhsMKhOARoS3bLEyzpaJTUnCuBlCDgvXzFg6C1LP1b
 ATMRmqX9VCOu0751f5lnN2fHI6XAxWcOTVZ153Q2aSaQIzBxsgWJZr6o3rE7eScAusiw
 5OMaYGCR15+bvxWmw4/hy0n8640EE2xYBG8WJR9i3xH8kn8czGq336vAk0IYit7T7DYx
 E4xBruEV/qqiQLsNDJShH+SouKs+6GJr9yETL53a8qsjA6yANqPYWpAFBX+tGlIG1fMk
 Lj5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ch6jDu6P
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version 3.2.3
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
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 08972cd035..3c33ad0536 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  f508595cc0951a77b70c07100df1b4ff  cython-3.1.3.tar.gz
-sha256  10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089  cython-3.1.3.tar.gz
+md5  7cfc3278f4eb7a072446f08dbd4647ba  cython-3.2.3.tar.gz
+sha256  f13832412d633376ffc08d751cc18ed0d7d00a398a4065e2871db505258748a6  cython-3.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 50e2e6e1cc..f99dddc310 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.1.3
+PYTHON_CYTHON_VERSION = 3.2.3
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/ab/915337fb39ab4f4539a313df38fc69938df3bf14141b90d61dfd5c2919de
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/39/e1/c0d92b1258722e1bc62a12e630c33f1f842fdab53fd8cd5de2f75c6449a9
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
