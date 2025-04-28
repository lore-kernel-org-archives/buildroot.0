Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E07BC36005
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 06:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3351406DD;
	Mon, 28 Apr 2025 06:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wd9xvp1HZyhQ; Mon, 28 Apr 2025 06:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 068FA406CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 068FA406CE;
	Mon, 28 Apr 2025 06:29:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C79F0194
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B94E960B78
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2foQV73jFhO for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 06:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3A276088E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3A276088E
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3A276088E
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:04 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-879d2e419b9so3680233a12.2
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 23:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745821743; x=1746426543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cswmHGKVF8aCmhzDPskEdNWOYgB2kqq0NhplruZRkqs=;
 b=jGWSwZmlhkDS3l7ez/xrYFbYWvuM2hqIummfUKjxtaL4OI3Meq3sL/w3Pg36yMDav+
 5o2z/W3TmCuwWaJ3NCbCZPFK7lT/0SnEpoZnQXDaDiWVG6zF+7Qn9/5E1zOaKQQ3Dmg8
 fdjUySz4lWZQRmSy8YBAydqrD5eHyiN1i+sQA7x6jE7Ku1ZIaQ/16FNEfqw6z4wF551V
 t0hHPy5AYk2ei2QPQzmBVtsx4djBgXETk4sA+Zak4xOi9ReuG3J51dbdXPkag+iNMCHY
 YP+tGMKPIk2OxAIJitpXBkDilOuX3L/fOCAfJgCKev2hwZpyaoUsrjyQlQwzEZBLtp0p
 kHNw==
X-Gm-Message-State: AOJu0YwXGo0nNpiRtUysqLUOybrfaJfMyzF0H1xBOKdh3RZ2+sPERR9j
 Rbh8T0qt3E79LqUa4SAUYi/fBc6ZVcEMSbT2SqHppOC9HG/7wm3qu5e5rjxY
X-Gm-Gg: ASbGnct+Du7EPh1EEVfKHjpFtpJnnSCvMWbHmf4OV/f001zERRq0/KUC0J1b5FACRx5
 TqOW1rNwlrv9ADkjAPV3DZCXtesnDe4lvc8+EDjNliDxgTovSiSBJJQY5M2EQssbWV8Ky40SQD7
 U4V1frhT2DT5yAIA0yXKuDEhk+NU1kKZXr1lsTh7+weUp2A67encnvpQ3lM88KxO1muPOAf4Um/
 Y//8+xb6QTUdkxQNBWrYsqnrKmFQ1OdkFUy6z9Yt4HcQ1YOGP2oAFir+0dfQnsBNXtEDT/Rpvrp
 ce8Xui0DlU07wp/ngX/b5iFhuf5nd63QhXJ84rOcztkbAbcyT/fBSNkd1g3gkEvti9frYM0/5by
 q1pA4XHm7bAf6lYEZaJ+pgZNxFPgscGT4A4TenA==
X-Google-Smtp-Source: AGHT+IH1atErwn4KxAEfaSQzRuoQvAmvSvFMJ8O7ZvpB1gRf6uvl5fxjhDwciSKgfMxx6AmzV7Aw3Q==
X-Received: by 2002:a05:6a21:3942:b0:1f5:9961:c40 with SMTP id
 adf61e73a8af0-2045b6c214amr16092346637.8.1745821743436; 
 Sun, 27 Apr 2025 23:29:03 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1cf3921092sm1516573a12.25.2025.04.27.23.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 23:29:02 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Apr 2025 23:28:50 -0700
Message-Id: <20250428062852.100535-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745821743; x=1746426543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cswmHGKVF8aCmhzDPskEdNWOYgB2kqq0NhplruZRkqs=;
 b=VuJMrFzmb3yVHU1HEJDXtu6NWCWy8OrvF33Zr7hAh78RnDKXbCRB9Db6KjKg9U6Xgx
 2QoH8k8NaFhPSPpe1OHmDKqs4m680H42wFZKpIZftoSRT6yXAKltsVKWoabJ495LKmHs
 aajgbTCiK8mf9mYvEIgpxN9cUJKXlKzi8A8SIh5quBHrig4o3B1tA17vCg5NJ1yjjIU7
 TuV/XeqoEkTovVsuIUb2y9+YJV9aril9G8/4Eq4R5DVbuD6XwgokSEF7dKamvrLC2xW7
 q3J+1U/o+GXnE1/c7Cp2zlu79i25w+no/1pmUrucsidjzGnM4CvYsVNqUUPoRzJUIlbz
 lXbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VuJMrFzm
Subject: [Buildroot] [PATCH 1/3] package/libqmi: bump to version 1.36.0
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/qmi-1-36/NEWS

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 7937f989a0..3962e925ce 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  8690d25b4d110b6df28b31da0a8bf16c7e966d31abcfeeb854f2753451e7a400  libqmi-1.34.0.tar.gz
+sha256  e254fafdd916a78a27126e6d72ae436662487f59c7de84d4d40286059af89093  libqmi-1.36.0.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 524333feba..c14caa3113 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.34.0
+LIBQMI_VERSION = 1.36.0
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
