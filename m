Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D0CC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:06:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B621B60725
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B621B60725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D530427A9;
	Sat, 28 Aug 2021 15:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iW7xjJuAZajT; Sat, 28 Aug 2021 15:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E71A0427AB;
	Sat, 28 Aug 2021 15:06:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2D21BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09E3C40101
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGjyLvnUhJvn for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2B7E40019
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:06:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so6366340wms.2
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x1RXx4/rVwU2fVsMfmykqvyHcMs83iVs4taZpcQ03ko=;
 b=QIeS5oeZEVIk1fG7/r/e+Y0HHofjAsA3xvFQDYwHBs8fVDbGmbMyG9zLuEHSHiha27
 13Q7pzjJ1Q47QEdCbIOFQ0JpRS9F1HHTY9weqZjfpzKmXqdz0JSmHIju/ksSYZT3sK8l
 XFay84nsmW+swZjKWWSVzeovMj6rif8ST5r1vFXhd0ezI2V3+I/h+QnF9ivcWyODhRg/
 ZrbqXwTvXonCJLLqhYnbmAitTG3i6xiIGIzYkyyJzVtgZtYbWTJP4Qv2uDBlFrgMnTlA
 OvaDuawKvKoy/ue3xyBOPo/zEndRxeoVeFczCk2N+QrZq++HirbDfh46PAfvhzpGz4C4
 ul1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x1RXx4/rVwU2fVsMfmykqvyHcMs83iVs4taZpcQ03ko=;
 b=lhkxlzq83m6lJokZsK7UPaC4uGbOu+qKjSB22BUdKUKA/8kHB+pIKsf3ScXmrwB8lE
 PXTAgL2Ze7xhFQqYALvs82R7fbgU2caFvKzqpIBsbMrC9QOxqV+KI+8Z6iBBU7CdmJNV
 9wS0Zlu9KtUoODOQx4opPQh07hKEJykQ5Vyxy41LhN/6M5cBo7qFRdsyDDd8s++pGwJP
 hG0fKpYlty/NnOcG2hzO2vzgPUEX1MEWCVR/MHMHHsQfvLRDiAHJ5ofy520EMyv2XfZT
 z5tx/VwDTg6dE3eEZZhqStTvhkG+zIYzNQTsiSut6WZeKHDmZaQni3Kc48adkNXp+pk8
 keMQ==
X-Gm-Message-State: AOAM531+M+Ui3HCjdCI3F+kZuLkdQy7/ASUmp1guZuuYJ7ZmN83gITSw
 1GnR6ZztrAA0JMHncnG3qLFz71UngRJjcw==
X-Google-Smtp-Source: ABdhPJw9atQwlnhaL9MIEqynLeCkj+IPH7iB1HluXeUf7XM8EC43DA4PqQuybzh4I1aBY3miw2SKJg==
X-Received: by 2002:a05:600c:4e8a:: with SMTP id
 f10mr14189561wmq.84.1630163175951; 
 Sat, 28 Aug 2021 08:06:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id o26sm4089504wmc.17.2021.08.28.08.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 08:06:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:06:02 +0200
Message-Id: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/c-ares: security bump to version
 1.17.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- NodeJS passes NULL for addr and 0 for addrlen to
  ares_parse_ptr_reply() on systems where malloc(0) returns NULL. This
  would cause a crash.
- If ares_getaddrinfo() was terminated by an ares_destroy(), it would
  cause a crash
- Crash in sortaddrinfo() if the list size equals 0 due to an unexpected
  DNS response
- Expand number of escaped characters in DNS replies as per RFC1035 5.1
  to prevent spoofing follow-up
- Perform validation on hostnames to prevent possible XSS due to
  applications not performing valiation themselves

https://c-ares.haxx.se/changelog.html#1_17_2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 235b7dbc66..28657645df 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  d73dd0f6de824afd407ce10750ea081af47eba52b8a6cb307d220131ad93fc40  c-ares-1.17.1.tar.gz
+sha256  4803c844ce20ce510ef0eb83f8ea41fa24ecaae9d280c468c582d2bb25b3913d  c-ares-1.17.2.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 8f200237cf..3a7c6e0298 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.17.1
+C_ARES_VERSION = 1.17.2
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
