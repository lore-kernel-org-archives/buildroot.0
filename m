Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67808C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BAD6428CF;
	Wed, 10 Jan 2024 04:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BAD6428CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Hgh-0UJnxrM; Wed, 10 Jan 2024 04:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E28F428C9;
	Wed, 10 Jan 2024 04:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E28F428C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CADD1BF322
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B628437C5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B628437C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMsdq6ZH22cK for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:03:46 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33FA3435BA
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33FA3435BA
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso160930039f.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704859425; x=1705464225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9cSYfUj4+PYex3CMJmSxG8DUfdZuZROHYt9CqGYdplg=;
 b=YIexy2ZEmm1kGNS/kSfnqv4HP43fhIG7p3QI3F1u9qjLkHJjnVAobHYH7r/5fm70aD
 i1GuLaNifQSzZUh9cv0Xw9cso/hIoyGgJcfXJin9FOyByc9oUEeR8lcnG1NehZT6QL2H
 hnup0Nltoev+adMAXNh3sNhu9IVMbCZTlGN4e2EmmaTMCkHlhzjfA8i1f0jGA61ovW2d
 q6i1XnjHG1xUfrbsgY4+iiVlb6rEFteW7OJWQA546umqB+TYiovohcou+koEm+UjXR7W
 5Bjn3JIGRFwFHMlbXsStquPs3o6lpv0AOKwNgIhdoK2j8ydFPe4gI3hGbP5pvkqPU0Ms
 zanA==
X-Gm-Message-State: AOJu0Yzks1TwD+OSY/hORpYLfcwd2AhFDoH42IFznYpRVc9KNU7p7GLp
 jQW8Ce6l5t9hlGLtO2Cm0lfgnsEj/UsPJg==
X-Google-Smtp-Source: AGHT+IEJoh46RbnYUacRf5odt+5nQYG2zFqRGEh+BCqp9dU4UzfD3u0MLrMx1AC9xtdUuAq9yLnKcg==
X-Received: by 2002:a6b:d11a:0:b0:7ba:85e4:f8de with SMTP id
 l26-20020a6bd11a000000b007ba85e4f8demr122857iob.42.1704859424874; 
 Tue, 09 Jan 2024 20:03:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 dv8-20020a056638608800b0046df973519esm1053763jab.137.2024.01.09.20.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:03:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:03:43 -0700
Message-Id: <20240110040343.1025210-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704859425; x=1705464225; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9cSYfUj4+PYex3CMJmSxG8DUfdZuZROHYt9CqGYdplg=;
 b=lO1GrOfFvrZHuqA7kt8j6uFRbUPtnHuUNV+o8brEWx33EaI2DENJjrhrOCRgYl3d6j
 Iz2j85gV57gJHSNNvQj7gDXuPjwtMVGVn7cC/Z57PzkG6CRf4WKvj/CFldBf6o5a3Y9E
 WuEwD5EsOUDFJ8z14+bHuUiWx1mbkGK/PdFb5+D7OYcZIE9LSfuv9ZE1xCWOdvbWBQI9
 hWCYbiaXGhIVjFtAvNDV/2saTZBO9WvQDhLaC4odijK1bi6LbveXj2/ZdxP5PlcA5wKr
 faRaRwPEt6lMfSWzHbAhZYThCRV2ktSS9LnxS/IXDEYFWzx/T/gF2078x9uOC7UspihI
 m59g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lO1GrOfF
Subject: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 10.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 6f659ab468..4d119cb203 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  3651461253e7d206073affb491b5c6e0  more-itertools-10.1.0.tar.gz
-sha256  626c369fa0eb37bac0291bce8259b332fd59ac792fa5497b59837309cd5b114a  more-itertools-10.1.0.tar.gz
+md5  1737bb4d9d09501f75f498538efe3cf4  more-itertools-10.2.0.tar.gz
+sha256  8fccb480c43d3e99a00087634c06dd02b0d50fbf088b380de5a41a015ec239e1  more-itertools-10.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 71c33bfdf1..98b499c3c0 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 10.1.0
+PYTHON_MORE_ITERTOOLS_VERSION = 10.2.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/2d/73/3557e45746fcaded71125c0a1c0f87616e8258c78391f0c365bf97bbfc99
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/df/ad/7905a7fd46ffb61d976133a4f47799388209e73cbc8c1253593335da88b4
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
