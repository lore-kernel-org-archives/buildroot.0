Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFBAC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:04:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FFC61050
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49FFC61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A5C402BD;
	Sun,  1 Aug 2021 20:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfVH6gNRhOH1; Sun,  1 Aug 2021 20:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67BB24029A;
	Sun,  1 Aug 2021 20:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1FF91BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D53183189
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNDbmhDfi9pt for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:04:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E34C830CD
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:04:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b7so18911183wri.8
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1G6iZPYd4NG47iEeJm7R1NETC0neOxwFTRY8dsfJ8Q4=;
 b=XBtiQEb2ECD3LebGqTO+QaXUyt29ByYA/YNXILHbTJyNh0BqVyttGjlO6b06yS06hE
 Kt2VYEhUcPuiempv5B9iKmwIogJVU5SzFXIC6Dp7FMgZ+OaC+g8O3gMYZBOBEHiT1uTo
 D2JCWlOYMSAAyO32lljZ0NRP3ZMLkGsNV93deI/bVXiDfiyCO1CyEtjxXRTZGdbqoYV1
 rICCs/wThyds90JaJv2P2aTw++eB+ObpyicHJbRLp7AdS77jTYJ/Ke2IrppZ6mPHPeSa
 gUtAHGfIbVesC6HEKC3RxsIYGLbkKCodoZFNjru24mH+hll64WrCXZvRgP7mmm45ngwE
 QpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1G6iZPYd4NG47iEeJm7R1NETC0neOxwFTRY8dsfJ8Q4=;
 b=iT/XANpIvciW0jHQJ3M2TGU+cCCOAbFSxx6pxpMIJMSIywAv16DDuD3Yysxi2qDmb2
 5h0JXgl4jN012yNYmb7rP+iB8jd8koH3Nv/3mG87zqiKt5U9kqyA64RcDJJiZhCkg6T5
 jBJtNo1xPlFXZA5UztAdFeIFSXSDsS8VNqDoP2HAw6WiteozcO6R6/eoUW5Zdm30qLSw
 qA4i07X+W072V+QnDk+HEMhJaBb/ryFh3meHtn9AVZ7bOJiPN1/fD7+b+rH1yAUBzSOF
 ArTze73PQT8y+olT3qXgS5Aj/eDNhf2dIJ7mDG3CwU4v7Ik0iandTfOIX0DlQ4MJa13/
 9NQQ==
X-Gm-Message-State: AOAM532yApvgTb/N8BD3UdZ5TJslC3Vl0IaEbbn2IuRhpGpYdeFHA/j7
 N2zyDdTeV+nCqNZFARK+05LLnFnc0tX+CA==
X-Google-Smtp-Source: ABdhPJz6UeU0PhO4VqtXWESt45qbxuE++X3LD+hOFRGwZIx6hAkjQXB9MHiFMeI1dlDdHm3uENzoKA==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr13871524wrj.143.1627848281401; 
 Sun, 01 Aug 2021 13:04:41 -0700 (PDT)
Received: from kali.home (pop.92-184-106-251.mobile.abo.orange.fr.
 [92.184.106.251])
 by smtp.gmail.com with ESMTPSA id l7sm7967287wmj.9.2021.08.01.13.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:04:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:04:31 +0200
Message-Id: <20210801200431.3987173-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tftpd: add SELinux module
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

Support for tftpd is added by the services/tftp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tftpd/tftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index ffd52ce0d0..42b5f17821 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -11,6 +11,7 @@ TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
 TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
 TFTPD_CPE_ID_PRODUCT = tftpd-hpa
+TFTPD_SELINUX_MODULES = tftp
 # From git
 TFTPD_AUTORECONF = YES
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
