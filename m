Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C615C7619A
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 05:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 859BB60DCA;
	Sat,  8 Apr 2023 05:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 859BB60DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oS0kfRQGYWxw; Sat,  8 Apr 2023 05:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4EC560E51;
	Sat,  8 Apr 2023 05:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4EC560E51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 566061C2E1E
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 05:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C28D40147
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 05:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C28D40147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkFiuLJXEPzM for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 05:24:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B310400A4
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B310400A4
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 05:24:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id t20so563942lfd.5
 for <buildroot@buildroot.org>; Fri, 07 Apr 2023 22:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680931486; x=1683523486;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lrEK06sh+YTeJX4aDgMQeKP2fyUISM1LxNt/2faY7cs=;
 b=K8TPz8DLjEdQ4Qbu0Ycu0r7Ufzpt6xrhMGBbOnjqml9GBdOgW3qVeB7O15acrQZtoo
 xrnXpb0rpmfPLJJghpnwEA7CpsZWoR28zOndexkR/wTBjHgZyYTruS3b2QXA2liGFEmk
 ulM+aYoPKokoW07C2weGFxJpYS53HOs3CD2LKGqSfEHZmWsc/HfqMwjpbMPBr1MBXiIO
 TeGlE+i2KLAxdeUeAcXpZc8r5rC6Rhe8J+e8kw9y9EDpJCIApQ9ziiG1K+GkmdQVd1ki
 o1urWmuF3RUU5VJYLvHrg/uFEMAKBunB3pNpZqbhnAcMHlzepb1VI8HK1jf1qGHN5rMn
 tvmg==
X-Gm-Message-State: AAQBX9dkrHhV9wouyXu3haXEnJItJOoLyVHv9oC30zbjJJxdQD5YWOSE
 Ecx8edJbbxoBe5HdsjHWP4ZQv1t5KZg=
X-Google-Smtp-Source: AKy350Z463YC4VDtGvn22yyMnvpmRe0Hg1reVmGAtNJhMnZcSBnhz3IzzAN5g9IRlmRT4s6A5bEF6Q==
X-Received: by 2002:ac2:5607:0:b0:4e9:59cd:4171 with SMTP id
 v7-20020ac25607000000b004e959cd4171mr1042845lfd.60.1680931485868; 
 Fri, 07 Apr 2023 22:24:45 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 x10-20020ac25dca000000b004d8580b2470sm1020099lfq.225.2023.04.07.22.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 22:24:45 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Apr 2023 07:24:34 +0200
Message-Id: <20230408052434.1413424-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680931486; x=1683523486;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lrEK06sh+YTeJX4aDgMQeKP2fyUISM1LxNt/2faY7cs=;
 b=braH3z533pIvYLdMqAPHH7Xn3tbKJf6kwbDZm9tqov5c9vYNbPsvbdudq+wO0O3ahn
 jq3jmjXI3On5SO/UMtstHk9a/Z95c6F80y9Z3ytjPdz02hkwhjdLRmMhiuE9N5Nx/DVP
 8oG/hL7on6lXL0TMPaPxgfRrkJbgOjdyLPnB+Nulgdz78iD974zOmcYWDm2Gzqy8TbdH
 1bxgh/tRFChIJS5j2/8vZwQs/q4tUWbxxJ1D6Dj5GrIGWBUgKgBykGYjhALYERhx1E1o
 XZ30HKzoC6xLSMrK1dYFpAsulzLveKUoaAEpbqN5DFPwPkuH0K/5yFIgzzJUpiLSnU3E
 zgFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=braH3z53
Subject: [Buildroot] [PATCH 1/1] package/libite: bump version to v2.5.3
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes, from https://github.com/troglobit/libite/releases/tag/v2.5.3

 - rsync() does not copy single files correctly
 - copyfile() does not handle empty source files correctly (error)
 - copyfile() does not properly create destination dir

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/libite.hash | 2 +-
 package/libite/libite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 8b622d87a9..7dac198ab8 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  baa9bf9931427ef5e9ddfc5b72139981047a8d0d3c03a534d9716de38cf18bb5  libite-2.5.2.tar.xz
+sha256  ca086adc7ebf0c2ebf2ed7a6787f9567fb802db8583576228dd5dd5ddfb7bb97  libite-2.5.3.tar.xz
 
 # Locally calculated
 sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 66a8253c62..1cef992e53 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.5.2
+LIBITE_VERSION = 2.5.3
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
