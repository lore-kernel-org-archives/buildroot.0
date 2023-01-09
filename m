Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFEDC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A57FE60A9D;
	Mon,  9 Jan 2023 04:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A57FE60A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hk4dFELAbyJu; Mon,  9 Jan 2023 04:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4AC8605AD;
	Mon,  9 Jan 2023 04:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4AC8605AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62DFD1BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E2E640142
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E2E640142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlkqJoaDPbG1 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:53:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5746D400DD
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5746D400DD
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:53:49 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id o13so4388370ilc.7
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tWPZuZC6mOs0/sXQsdZmqwIrJvO8YOA6sRMk84AMDhw=;
 b=zJAVAwY+m+fIqZVE6A0KkyHRdiwtQUV6HQcktmJ4PsQWh9EEDsl/8E7KyT7vLFph3W
 5mCvFq23xo5DH4NhZC8LnJWC1PsOuKeUzvH54FWjYQcXfcvzhDtsGqcSh82Mg+Rfwyft
 ju6dg4w0Ud0gSZk9EFLVOeDY5BTfAFd2XPRNWK5yQnFARtMplQiRxYmbKI15H/idwQKH
 L3HW9l/yu1YSeSqymz8gn2yLZ7oPg8jcvBmTM59HGOi46krtLrL3f2dHvKPWzbkHAfpq
 welUaf3fr6CQkt9aWvKe6AAbzjj+hHGM+2mzkGqUaYJj4PD7aaA3RweloxZBtbLxXJkK
 Rb4Q==
X-Gm-Message-State: AFqh2krFs51mVjcw5oMdoZiUw9OALdUxxnCS87IsBV18GQH3gIWSqhsr
 0Qixu2DLmF37rutn41jFld0NZNabfgJ5ehQR
X-Google-Smtp-Source: AMrXdXsJKrofNkpzww590fuSgGGHI+ADLRU34DiO0UmNSxvdk39KaYI+SjEiSjeCwg0UxgmOqfxyGg==
X-Received: by 2002:a92:7308:0:b0:303:25a:1cc4 with SMTP id
 o8-20020a927308000000b00303025a1cc4mr46830986ilc.13.1673240028237; 
 Sun, 08 Jan 2023 20:53:48 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w132-20020a022a8a000000b0039e9006a146sm43596jaw.122.2023.01.08.20.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:53:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:53:46 -0700
Message-Id: <20230109045346.2464524-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tWPZuZC6mOs0/sXQsdZmqwIrJvO8YOA6sRMk84AMDhw=;
 b=jeWyK1nXIdijw/BNROADdl6Kpgj88RrzjpL5VfQrAaonM6p4pFq9mlm+MykB2IADY0
 TvIu2F6hL/rNKyFHLFjbvvA1LU/SP5ks2OLbCtrh31gSf7aiu2IHN/vYyze5IqVN9CN9
 MMjUNDtJ4ga/wIRi1pb6MDMdg37drVUKwtUB5szjQzSGE4a+DQARWpz4TBAqGZWdHFAQ
 vA38NK6A0dSufmyVB+w3ko4J79IcMOmA4LXrUmH74IsiGOcPNlx1F+EwgDVLqnV6CiUy
 EZhsqMWkFEGFEIMnt1fx9F0cL9fpIQKIHW28QnGnXbMAbYmG2gqBt+kXW7XdXtgSzpKo
 ugHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jeWyK1nX
Subject: [Buildroot] [PATCH 1/1] package/python-posix-ipc: bump to version
 1.1.1
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
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-posix-ipc/python-posix-ipc.hash | 4 ++--
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 74d2db0f5e..427e4c7b55 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5  81baeabebd3e4064972ec62fd9eace0b  posix_ipc-1.1.0.tar.gz
-sha256  f86a15b32b38573c78e305ebd9100d8198a3d9facc03ffafe39edc35833738e3  posix_ipc-1.1.0.tar.gz
+md5  523a31c4dbd56e0d4fd677f33e126e5d  posix_ipc-1.1.1.tar.gz
+sha256  e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7  posix_ipc-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2b58f0bf31a8cbd7e56bfef030e9f7f02758ce8a810d073ccf41753bdc2a0747  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index c25af9ecbd..bdd2f1d4af 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.1.0
+PYTHON_POSIX_IPC_VERSION = 1.1.1
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/41/72/90b6702782921c0e3e0b10a66f2a47d8cfaf9c2255d763ab45cc8cea25eb
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/07/7f/b954f224a226960a4aa98b6c5fa3d4f3fafb20bb8461446e41b563aee863
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
