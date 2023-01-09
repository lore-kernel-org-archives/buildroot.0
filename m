Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9E1C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D636409AE;
	Mon,  9 Jan 2023 03:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D636409AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itODSYuAWNK0; Mon,  9 Jan 2023 03:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81DC04098F;
	Mon,  9 Jan 2023 03:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81DC04098F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7B7E1BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C210B4098F
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C210B4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmcCQxqXVWWg for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:56:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED1A40984
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ED1A40984
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:56:59 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id y2so4363098ily.5
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eD0xCmRNtOHxCjflo2b2h5RAak0hABL+Nh30YewRJhw=;
 b=atYMNe0APrUq0/YnD+WEG3UXWO6Gu6fPTSEbFQKISczFfb4dm5RVXG0KSuNxdNNh0e
 NuRht8JGFlrLJ/BNXwWYPNy37vR+ni+HKkamNsd8jfsziIUAtuO3tTyhZ3x5qbwHMJMF
 f7cHJeHc26m304rHH5W8Msi2uDYfKwDn/oLShqpInv43ujma4+jP2Hl32Pm+JzMZ5EzQ
 fz6daeg5+VloUqEq6PEiDQcG9du1AShoM73Z//wZ19xz7aagD3/H5bHx2VaJsrTWUCAY
 kLSmTWn1YaC3t/DCrx1Y/wh6YRkP2MZUk8euLuOAS1Ku+Ga8fkaMNfOgSjQ/yM8gUcS0
 PCeQ==
X-Gm-Message-State: AFqh2kqqTeVSCJd5tMY4cFpowhcXP/Kqtu7t2uUN+9qyOFMbJjV3L8jx
 3lP/7pNkR1IbJV7r15z04joZo/6rXpo/hA==
X-Google-Smtp-Source: AMrXdXvThz0ffF6KJHDQxClbmY9jZ9GuMKc60kXKxpSJXBsU0HPzTv7xYu9Oc4xhyNfn9ThnudJEcA==
X-Received: by 2002:a05:6e02:b2c:b0:304:c95e:8c36 with SMTP id
 e12-20020a056e020b2c00b00304c95e8c36mr51617549ilu.14.1673236618349; 
 Sun, 08 Jan 2023 19:56:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 v9-20020a92ab09000000b0030da9e6784csm275398ilh.9.2023.01.08.19.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:56:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:56:56 -0700
Message-Id: <20230109035656.2220313-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eD0xCmRNtOHxCjflo2b2h5RAak0hABL+Nh30YewRJhw=;
 b=C4vWcJJqSPZThZBPwapuNeodNyHkTO2lJizBGlmU5+04BOLNkh2v7gVPR3As6usQ/w
 cHxanWTciaA5ZyW/l4BBrVpS4UFkbb+NRkFbElgWlhkEoc6j7fbT4tsUgcg/b6HXb5gd
 Ca4LIcWNX7U8EHvZwrF+ukxI691MTP4w2w85/D0QTGrlYumx9M+EesaY4muJBhfS5ZlI
 h86UGbaTnfKbn5RbsSbyr9yevizu5Fd1RVKxXx8qEFLTMK8jWY/jFK4O6wLzhYh6JvA1
 TFvsD3PbjWnL7JYTXjAjIIu2pZF3WyNl5jCkxd+spzAzeObi21KUY0lrSmAlsny7tTa/
 sScA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C4vWcJJq
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 4.1.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 40526bc0ff..1d3035bb98 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  02e2222d064d800f37c6a0ba78ce87f3  Django-4.1.4.tar.gz
-sha256  d38a4e108d2386cb9637da66a82dc8d0733caede4c83c4afdbda78af4214211b  Django-4.1.4.tar.gz
+md5  6b6a47d7478ead15b0a0835841c433dc  Django-4.1.5.tar.gz
+sha256  ff56ebd7ead0fd5dbe06fe157b0024a7aaea2e0593bb3785fb594cf94dad58ef  Django-4.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 96ec53f82c..e08de68954 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.4
+PYTHON_DJANGO_VERSION = 4.1.5
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/de/7d/ca5d224f7d345b0defd0a57c6deb0c6115fbe5304e4d9571f728b617f1a3
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/41/c8/b3c469353f9d1b7f0e99b45520582b891da02cd87408bc867affa6e039a3
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
