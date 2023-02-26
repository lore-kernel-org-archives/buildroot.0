Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E7FC64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 13:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA4D380C81;
	Sun, 26 Feb 2023 13:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA4D380C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6tqLnQHUaDU; Sun, 26 Feb 2023 13:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B2DC80C3D;
	Sun, 26 Feb 2023 13:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B2DC80C3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF1D71BF361
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99FFD402D0
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99FFD402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_bmRh0MTSCg for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 13:20:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C970402A8
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C970402A8
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 13:20:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e37so1134925wri.10
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 05:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JJIlSt0J0pQg9huGU0E7u2hfXyYFf/OcK5ybVh5s2Oo=;
 b=DkDJ1SegwpZQA5BcB8LW76x6Jo8j8T6i/7wpjW1fzeDqwICPIMxMEHjqPXeWBkq781
 q1BXNQr7O8wRiZR49aywm5jqcu7hD6o87Fof2GqonlMc1s92Jn3jSw+9YnR/kR0VV77G
 UymHMOxB2dg6sWQIdxJvmaqGnjW9Mpf7eyW4k8IoDSb8tP/+Gb/W7ZhQvvxONjVhnkSq
 2JwnvVg1ueo3JK6F/DNVyqwUgQS3WGk/qz8+rtEmBoab+xe0P7begWXVThTZKoA9GFkh
 u7VFHrNyDjhBoN2952We72exbWkRaiGhUm+fetrV6gHVzRvG8+4Sld1DcwGJbypCfVDE
 szmw==
X-Gm-Message-State: AO0yUKU4/f3Ef02JyLttTE9OXJcjozXQbBVBwFkO0LzsBsBuX0pEpZYs
 Lq0C/e/TL0Bw6eCDywQC7xptL1yP620=
X-Google-Smtp-Source: AK7set/v2TyI1MNmrt1cZzD9gRFpqlIBaqTkZ4dx+eLDxFytPfNhdb/qUjafFZfjwmm6rL4bMAc7/g==
X-Received: by 2002:a5d:5e82:0:b0:2c5:51a5:9ef8 with SMTP id
 ck2-20020a5d5e82000000b002c551a59ef8mr4298502wrb.8.1677417629509; 
 Sun, 26 Feb 2023 05:20:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i13-20020a1c540d000000b003db06224953sm5867505wmb.41.2023.02.26.05.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 05:20:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 14:20:26 +0100
Message-Id: <20230226132026.82185-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JJIlSt0J0pQg9huGU0E7u2hfXyYFf/OcK5ybVh5s2Oo=;
 b=RQevCDdKijHcEXhTPTfjodcWke/4kzouPPjQYuAohpYYh/l8by1dl3klKo/gik3Xyx
 dkk9pmPMedZCwnd+KcA0DDbNR8CZNCvJGS/RqK2mb5q5w3UoVhhbhuE10PADQK6HFqZ3
 18IDDaoELxoKU1kC98vy8VLcr6NagIN5QMjS3Ikd/aRkCCxIwbJlc/v+saoFRK4wcpAG
 FAYai5ACMnvcUbRREN1ADsFTqXQ1dfDCWTzYKxIB+VRQdcEwgVxH/4U8zECqrob4d2Mq
 LDakHH06oYXgw8B2w5UPfcv9LeotMVbA5y/JTIhHY6Lv3uJwqAz0FJ6tEj1hRLXnUbfZ
 Ji9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RQevCDdK
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump to version
 9.16.38
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

- Fix CVE-2022-3094, CVE-2022-3736 and CVE-2022-3924
- Update hash of COPYRIGHT (year updated with
  https://gitlab.isc.org/isc-projects/bind9/-/commit/1a5d707f52282117c9912a27dcc89f2ec412577a)

https://downloads.isc.org/isc/bind9/9.16.38/doc/arm/html/notes.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index d41a9bbc5e..32804b5ce0 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.33/bind-9.16.33.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.38/bind-9.16.38.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  ec4fbea4b2e368d1824971509e33fa159224ad14b436034c6bcd46104c328d91  bind-9.16.33.tar.xz
-sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
+sha256  8df44c9d9a84a28ab8b49d55f3c33b624b90ef8f6a8b9ee6a4c33cc17c14c50f  bind-9.16.38.tar.xz
+sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index abc3100e6d..c6e992f76c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.33
+BIND_VERSION = 9.16.38
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
