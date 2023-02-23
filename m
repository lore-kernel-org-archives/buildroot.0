Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343BEC64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D403640181;
	Thu, 23 Feb 2023 22:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D403640181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FaEeotSsnQe; Thu, 23 Feb 2023 22:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CED0405CE;
	Thu, 23 Feb 2023 22:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CED0405CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5F651BF215
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FA9360BBB
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA9360BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HemrtSX5qfIn for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:59:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 861A160BB9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 861A160BB9
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:59:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id az36so648261wmb.1
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 14:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8zTSdi6dc7U73LfKMmDxg0mwB5hPdBJYy43N3bLtCQ=;
 b=haXz4kXOmgI4J2OY3Mm3qJRml7thRjaTrttxzWCCL/OULOipqmC8VH6pgDDVfsZgMH
 vY1ctXibTZPyPV8l88F+8ZXH5nFki1ZUzT3pL2PZLX6YFTefEcDOlBCe6fnaEZyuzm81
 uwE8y592umGl9wnckKxdLl23tsbL4wGHRpXeaEt8vsWOBmcIeqAIXbHzHRCJ/bG7+U4k
 j1wGrHqHpsn5LWLa0roEzAvAiyWRmiOj6L+krW2X+HrPa0M6/KPdFA861n3lJoHRCfOM
 k+OVsjyUVbHCQLHH40Pnl8m3aR9E8/O67OFZGhVBV0anxzSdKB66ZUa/cXm5o3FNPhcy
 aGYw==
X-Gm-Message-State: AO0yUKXWp1ifTATJ6J+L+NMlu6SABLcuPWfjQ2mfhM4XUeX5WRoWiW4A
 3v55HGOvhXAUUi/Ug1MI3rZh6c+BJKw=
X-Google-Smtp-Source: AK7set8QU0sAT9ySkQhLC3orJclgPGJhbs7fwnAggwnWHhbgTBac9Pxgj15kcmjqpQqJT1wRoJYJ8Q==
X-Received: by 2002:a05:600c:170a:b0:3e2:d81:3564 with SMTP id
 c10-20020a05600c170a00b003e20d813564mr8574468wmn.3.1677193186269; 
 Thu, 23 Feb 2023 14:59:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b003dc1d668866sm721554wmi.10.2023.02.23.14.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 14:59:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 23:59:42 +0100
Message-Id: <20230223225942.313435-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n8zTSdi6dc7U73LfKMmDxg0mwB5hPdBJYy43N3bLtCQ=;
 b=ONUjqjic0NhhNlS93D7DceOYrFBSYQWBzUW9rnzQPqErU6Otg7jcbvV6J2JyfEIDr/
 aXPj4QmCfJjN5U/LFndgKhXrakcIfDfEelsoTLKJOTQ1wDJRm1UtCeO+APikT1HQdwlF
 XGCTHgilC2HQDDOs7LM9lVf5ekKFELLzv2UL6A8VZ6AdjLAd9coBa1xZoJIb1GFgF8LD
 y7R6Btgov43GlsX1p3d+IYcCabKkuM0Gk4AB++6nI4pmkPYD+scNi8r9DXhm6T1hzo81
 uXqIN3S7F8TzG0ltuYeF0HwzLLe/bAvnx0bRNt03gQF+ptAHNbwJNx5dTxtZ9v4rNTsl
 YZcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ONUjqjic
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require MD5 perl package for netsurf
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

Can't locate object method "hexhash" via package "MD5" at utils/git-testament.pl line 47

Fixes:
 - http://autobuild.buildroot.org/results/3dddcbbe7f6ecae5a2db6fac11fb659719452f73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 078559f086..58f44c8723 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -290,6 +290,10 @@ if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigRat"
 fi
 
+if grep -q ^BR2_PACKAGE_NETSURF=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules Digest::MD5"
+fi
+
 if grep -q ^BR2_PACKAGE_WHOIS=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules autodie"
 fi
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
