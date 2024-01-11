Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1385FC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA9D96143E;
	Thu, 11 Jan 2024 05:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA9D96143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRxKTqJR9cYF; Thu, 11 Jan 2024 05:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1076561400;
	Thu, 11 Jan 2024 05:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1076561400
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4361BF23C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13F3561400
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13F3561400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJNsPomTwNrU for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:07:33 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3672B613F5
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3672B613F5
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3606f133b1fso13616555ab.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:07:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704949652; x=1705554452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2XmBwJ0A76AbS5RvnfSV1mHfUfEoU/1MinE9L/cYeEg=;
 b=ETXip+WDtOGQnvf+azlO4UDwywMPp9KXynd3aRZNGVlmUB6gjNEem+zkwv+KektBtk
 wV4SHr5b3J+wqwOYJ0jzHFx0ZGMAmFbNuH1Zm9C2KWF2GYwV0hWBdHpxbvxGbIX456Eq
 gfaUDapUV2Vo5SAuZS88A8Hd4dapj3gDCDLQGsCiWAj5EQsC92JkmO2Osywo+LrJ84Vs
 rqgH9N1IJcCJFuL1B75nnPCmTSctQJWN7CY0Km6xPn0m8baksOZc5Nq98bvcwxqjT0dD
 ssAOAgSs+2HucbjsHJpGw9eMo2YRHe9SPNG62VfpOhokWggCn1szHUL92Ne5AEWyGQ/F
 tlyQ==
X-Gm-Message-State: AOJu0YxxqlGpNm8hW3Tdg4JhfZ/KzIbwJlwXLPmrry2QvaxL9rra7F5w
 R2PIiHHL4zgArhUpxMr9+eDXxISEuHZ2Tg==
X-Google-Smtp-Source: AGHT+IEZiEQxyJMK+A+7GQWHpU0FAoii9Z3T6ColO8lsSyfsZrQ9LaHBW8jhN3FQwuoOAfBOiUDrDg==
X-Received: by 2002:a05:6e02:156f:b0:360:84b5:b20d with SMTP id
 k15-20020a056e02156f00b0036084b5b20dmr183456ilu.29.1704949651576; 
 Wed, 10 Jan 2024 21:07:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cp12-20020a056638480c00b0046e2cb87f6csm106956jab.126.2024.01.10.21.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:07:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:07:29 -0700
Message-Id: <20240111050729.2902435-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704949652; x=1705554452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2XmBwJ0A76AbS5RvnfSV1mHfUfEoU/1MinE9L/cYeEg=;
 b=Rpf4qbvyr64QPM5eS1/3BcgsbdrEAeAgH7GZYWoHmsK6gjp+gBNsxjk0GWvUNFeJqU
 P062JfD5eTA00gROexr6Fsh+f4y1VCD7yERimdX0kqx9SZErTwvmwDNDt+YUZzD47Duv
 FH9/5giwb0CFz7rChD+YTjnOG7dyPbpATBMbqZjKeteV+RYephmtGxe8+mcWB4ElIU57
 nCzjD4iBA2UBzozUYdVflian2z6DCAYWwqTrTrMjOtRQQZfaBQ/+0ZXtlnYRVNYLL1+X
 fGPwYqjMnJL2JInO0r1gfPe/VuajR9pG585x7FeEN8dzP/NUkYQZ8SeoEFRKaUEduhph
 QIHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Rpf4qbvy
Subject: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2023.12.25
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
 package/python-regex/Config.in         | 2 +-
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-regex/Config.in b/package/python-regex/Config.in
index 5f582d085a..89ead69c04 100644
--- a/package/python-regex/Config.in
+++ b/package/python-regex/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_REGEX
 	help
 	  Alternative regular expression module, to replace re.
 
-	  https://bitbucket.org/mrabarnett/mrab-regex
+	  https://github.com/mrabarnett/mrab-regex
diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 11a5765e41..7454db99bb 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  a85ced10be8bfe76fed4f30c42d32d5c  regex-2022.10.31.tar.gz
-sha256  a3a98921da9a1bf8457aeee6a551948a83601689e5ecdd736894ea9bbec77e83  regex-2022.10.31.tar.gz
+md5  3f97f0aef9bf334fe50ae5980b183e68  regex-2023.12.25.tar.gz
+sha256  29171aa128da69afdf4bde412d5bedc335f2ca8fcfe4489038577d05f16181e5  regex-2023.12.25.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 81bd460ecc..6b1938bc0c 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2022.10.31
+PYTHON_REGEX_VERSION = 2023.12.25
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/27/b5/92d404279fd5f4f0a17235211bb0f5ae7a0d9afb7f439086ec247441ed28
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/b5/39/31626e7e75b187fae7f121af3c538a991e725c744ac893cc2cfd70ce2853
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
