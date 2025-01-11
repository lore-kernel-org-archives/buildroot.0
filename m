Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D1E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEE0B40CF7;
	Sat, 11 Jan 2025 18:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKK4ckNT34Wf; Sat, 11 Jan 2025 18:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9262D41177
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9262D41177;
	Sat, 11 Jan 2025 18:05:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5557E940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3526C40CF7
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKSG3FVBB8C0 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1534241177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1534241177
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1534241177
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:05:27 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-84f1ea04c64so190130739f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736618727; x=1737223527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aD700URIv10E1uuwKSltfiuB6gEenxuBmmdRZ08VfpU=;
 b=ZA/BFnImCWOExJw7vYBWIcP6OkpobhaBtKMTlzCvBhLhSKj787mAUp7QYxndA1NMDl
 4Ay3GIzqokG1MjBiRdWYCIslQFrI4sNxcqeUqp8X/XlhITfuA/8quYEqIOqRep8VI9OE
 QojNKwYsovZUngeVsi9awBYjAwqp7K6wKL4fLWVk9WsiMFHsGdJEaQh+OL+UEwqmRXKo
 zUXHqNkik157n8rr08ys9qMtTOQI6MrWQv3S3tgJM1MqJlrXgFM2+zcG5rG5sK+VVqIM
 Wa8GWDpgAHjbf++FwQqNgUgQPopURLUK45CEkSX3nUOxa8LicwTttjesZscZcdX9x56s
 xSqA==
X-Gm-Message-State: AOJu0Yyqa3IvnqnuujS2hfiTNd4AubTKCOom5rXBBpW5kYDFQzI5uQdz
 fwdextG61Tz5pK7P38PrKeUPJAy+xeKOvbgpkseej3DCtNbmvUpp42YftSHLetQ=
X-Gm-Gg: ASbGnctwwuM+f2JqbaHqwJ8u45m5DhZ8BqpGL6brsoCm0paYh+RzegZinxGtJpzOL7k
 B1eVqCIWvlf6v4iBXUtKKqizToyjwt6VudCg3uJZrxGEAQMcLyKc4GdHnuAZtnBLOhhxyibuzeI
 /ieHU4IJkUw21pDr7vK5wIH3nnVYjRfS+D0CHgUoutUJ8WHb6kLBZLfAL+u/Ady9sP+PF0mHgXk
 2NWYAqqkFbXSH4aAzU6EgF5iiQhgitC5DIbkEvPL0esZ7JYNlSn5Jf9lLPOmUAPP2TX5mMv+Qzc
 bihX5qR8nczOoGgB1q4CFC5gyuNkQeM=
X-Google-Smtp-Source: AGHT+IGTo0QL/lp5qvN5pxWaBk1VJi9s3Ez98dgYGvH+eN+f0r1l9+fJulGyHeuNazY7HbsDjvezKQ==
X-Received: by 2002:a05:6602:3e81:b0:83b:a47c:dbfd with SMTP id
 ca18e2360f4ac-84ce007670bmr1595783639f.6.1736618726865; 
 Sat, 11 Jan 2025 10:05:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb1c356sm165061939f.18.2025.01.11.10.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:05:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:05:24 -0700
Message-Id: <20250111180524.2925350-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736618727; x=1737223527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aD700URIv10E1uuwKSltfiuB6gEenxuBmmdRZ08VfpU=;
 b=DN+OL0NwbKy4txL+HmL0kykEygeHTC4O7AAAMoCbMrbHwKX31HnqMp4qed6GWgQDz4
 0au8q51PlerZwDs8Zbf8ULQRBLm5zk5HBBBLJ2a03H8jO0ATuv4YN/xWtEafdBrHtvo2
 TnKGqlT0h/X/RFjWg63hfudEoZAOxPxg8OEEMbm4rCmBwkHpimFEdGVvVimIKwvSmEFT
 aKB28prEPb5Bz2J0W0HT2cApDnEm3MvYayqVk2+daz4zmyZ9X1dii+vZSYNrWs8+1e8s
 KUWdQCIKuqjcfriPG9Z7AMqdGI+6lxCsw/px9LHOLNImUZcGQTcaWvHzWbQrGWXk94aM
 9oRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DN+OL0Nw
Subject: [Buildroot] [PATCH 1/1] package/python-tcolorpy: bump to version
 0.1.7
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

License hash changed due to year update:
https://github.com/thombashi/tcolorpy/commit/8f71e7f6672fd77170b461e0dafcce7328cc3533

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tcolorpy/python-tcolorpy.hash | 6 +++---
 package/python-tcolorpy/python-tcolorpy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tcolorpy/python-tcolorpy.hash b/package/python-tcolorpy/python-tcolorpy.hash
index 0bba6e47fe..30cdda9f69 100644
--- a/package/python-tcolorpy/python-tcolorpy.hash
+++ b/package/python-tcolorpy/python-tcolorpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tcolorpy/json
-md5  a4a8404d2b6ecfae4eeca8c71e4634c6  tcolorpy-0.1.6.tar.gz
-sha256  8cea0bf5f8cf03f77528a9acfbf312df935573892ba5ea3b2516e61fa54de9a5  tcolorpy-0.1.6.tar.gz
+md5  6232d098c4531507e2aa04fe34fb8cd3  tcolorpy-0.1.7.tar.gz
+sha256  0fbf6bf238890bbc2e32662aa25736769a29bf6d880328f310c910a327632614  tcolorpy-0.1.7.tar.gz
 # Locally computed sha256 checksums
-sha256  f41a0456d5f2bba25fd4d7e50b51a95de304770ff1db5a79515d03397a914d8d  LICENSE
+sha256  a26e357cfe6ba55f8d8e1e9d82c928ee7ed3c1ecd351b29455ca7a3f5d5a664d  LICENSE
diff --git a/package/python-tcolorpy/python-tcolorpy.mk b/package/python-tcolorpy/python-tcolorpy.mk
index bdc66f61bc..062c218ef7 100644
--- a/package/python-tcolorpy/python-tcolorpy.mk
+++ b/package/python-tcolorpy/python-tcolorpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TCOLORPY_VERSION = 0.1.6
+PYTHON_TCOLORPY_VERSION = 0.1.7
 PYTHON_TCOLORPY_SOURCE = tcolorpy-$(PYTHON_TCOLORPY_VERSION).tar.gz
-PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/af/f6/b17885354c5addfb93c14f3ed7172c33494f989dd5f83c0340d2c8fa3b69
+PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/80/cc/44f2d81d8f9093aad81c3467a5bf5718d2b5f786e887b6e4adcfc17ec6b9
 PYTHON_TCOLORPY_SETUP_TYPE = setuptools
 PYTHON_TCOLORPY_LICENSE = MIT
 PYTHON_TCOLORPY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
