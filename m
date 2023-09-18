Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2AFC46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28C254159B;
	Mon, 18 Sep 2023 20:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28C254159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDW7ffS6Y0le; Mon, 18 Sep 2023 20:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BFB7415A1;
	Mon, 18 Sep 2023 20:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BFB7415A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA1181BF966
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A502F61089
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A502F61089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oxmXUO14edl for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:31:09 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF2C861073
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF2C861073
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-401187f8071so33135835e9.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695069067; x=1695673867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bvk/mFf/MWrXcOAPz/nvmtWOuoxR9qYQC5TCSwOtCQ4=;
 b=xR3Q7pKeytKq5F9iazKD8vTS/YxIma1OwOFcgct4NXwsVd1NhEickdnjNuMFo5rAf9
 sVHylgTDuNdY5NKhvCfpLRMeRX8ACmRv2X8lePZdS/yu3HM8yDktfdW7XInMtL4Gaqtl
 BI08hYs3Aog44s5q99oRksSgK7y0XaNfpea680OETWt64/LckshpPtOYt7ZwRkGY0HCe
 Fv9QVqKcP69XRnvk40pr7xsHbg2JLDCDwGPjoiwShc/9rvCDb52lKdWkTlWPITK7/OvK
 NDr2voazD7vEzLwSbjm52wYOZ2c41grYkkhRwGTjaePL3CFu8WWj0DP/eL+plYrb0FHO
 UpnA==
X-Gm-Message-State: AOJu0YxEp0vZ/bcp6uLGZMqegaIxwWolCOqgAlKoBk7SAKqEwjSGP/Zk
 /G+eAhkcWOgeatl+lQMui+BsNE3BgeE=
X-Google-Smtp-Source: AGHT+IEk7ITc81zr5g05B1DzURALGOistRUVtsZ284nMbbYTWhAlkPKuzWIEpMLqRQjU4qKrDYluXQ==
X-Received: by 2002:a05:600c:3b1f:b0:402:f91e:df80 with SMTP id
 m31-20020a05600c3b1f00b00402f91edf80mr537645wms.3.1695069066500; 
 Mon, 18 Sep 2023 13:31:06 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:9624:48f1:9fd0:3d3c])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b00401d8181f8bsm16238956wml.25.2023.09.18.13.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:31:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:31:02 +0200
Message-Id: <bb4563cdf368cdd3fcc13cf94d3c12fea4d92bc2.1695069059.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695069059.git.yann.morin.1998@free.fr>
References: <cover.1695069059.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695069067; x=1695673867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bvk/mFf/MWrXcOAPz/nvmtWOuoxR9qYQC5TCSwOtCQ4=;
 b=Dmd2FuJSBOzwIxrDW6k1KoS4S9LDqJ01gYsHpgXV/KQjnoCLSYRHL0pZ8wHTiXi/p0
 30gd9N1aVDz7dLvdu19ttH206M9ztpl1g5tv2aztCPeF6kj0ZyjnuRid9rMoSEJiCdXC
 /GyNR4s0P8ptcePkX9/qypuEoFxzGQghpT/6lK6t3JkCilomYmD86N/sOpVP7pi063g8
 wExcywuMSVzr7w53aePWaHz5Td7gKfjATWFHFCkEZF9criJojzO/e45V0SMmuPF3dcSH
 62gMflSyBsSsC3mZuLZOPfjEhkxj5+3KbTqRqsAIZE+cYYmsBN/Q3AK0gPBpdiOwc8vZ
 dm4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Dmd2FuJS
Subject: [Buildroot] [PATCH 5/6 v2] support/testing: add test for
 export-subst support in git-download
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../br2-external/git-hash/package/bad/bad.hash    |   2 +-
 .../package/export-subst/export-subst.hash        |   1 +
 .../git-hash/package/export-subst/export-subst.mk |  10 ++++++++++
 .../br2-external/git-hash/package/good/good.hash  |   2 +-
 .../git-partial-sha1-branch-head.hash             |   2 +-
 .../git-partial-sha1-reachable-by-branch.hash     |   2 +-
 .../git-partial-sha1-reachable-by-tag.hash        |   2 +-
 .../git-partial-sha1-tag-itself.hash              |   2 +-
 .../git-partial-sha1-tag-points-to.hash           |   2 +-
 .../git-sha1-branch-head.hash                     |   2 +-
 .../git-sha1-reachable-by-branch.hash             |   2 +-
 .../git-sha1-reachable-by-tag.hash                |   2 +-
 .../git-sha1-tag-itself/git-sha1-tag-itself.hash  |   2 +-
 .../git-sha1-tag-points-to.hash                   |   2 +-
 .../git-submodule-disabled.hash                   |   2 +-
 .../git-submodule-enabled.hash                    |   2 +-
 .../git-refs/package/git-tag/git-tag.hash         |   2 +-
 .../git-wrong-content/git-wrong-content.hash      |   2 +-
 .../05/482df734b3715b849ef4a3147a9b1b1f8cca38     | Bin 0 -> 35 bytes
 .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26     | Bin 0 -> 197 bytes
 .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8     | Bin 0 -> 28 bytes
 .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0     | Bin 0 -> 112 bytes
 .../git-remote/repo.git/refs/heads/master         |   2 +-
 support/testing/tests/download/test_git.py        |   4 ++++
 24 files changed, 32 insertions(+), 17 deletions(-)
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0

diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
index b44b1f8255..f263c3cfa1 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -1 +1 @@
-sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
new file mode 100644
index 0000000000..1926236993
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
@@ -0,0 +1 @@
+sha256  9d359f9ae9a9e65dd4ccfe7170aa6fda24e17dfc81238972957b4b7fe97168a7  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
new file mode 100644
index 0000000000..8d7d3ff970
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# export-subst
+#
+################################################################################
+
+EXPORT_SUBST_VERSION = 0fdb95cf4f3c5ed4003287649cabb33c5f843e26
+EXPORT_SUBST_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
index fc3f60dafd..a4846ce4ef 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -1 +1 @@
-sha256  682ad1f39f258bfb35e26f213f3798f44bb8105bb55fad47bdc003113765b650  good-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
+sha256  682ad1f39f258bfb35e26f213f3798f44bb8105bb55fad47bdc003113765b650  good-a238b1dfcd825d47d834af3c5223417c8411d90d-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
index 26a6b358e2..d2169afa77 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  c27041b3e874beb0d0218158e7d6507ad1515b684de5eed5fabd0f7205e9718e  git-partial-sha1-branch-head-68c197d0879d485f4f6c-br1.tar.gz
+sha256  c27041b3e874beb0d0218158e7d6507ad1515b684de5eed5fabd0f7205e9718e  git-partial-sha1-branch-head-68c197d0879d485f4f6c-br2.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
index ab1edc73a8..ee6b0d3e18 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  1bbba9bf2788bd789ed8da4e47cabbf3467b1f706875b3f6b62df38e08fb9aba  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-br1.tar.gz
+sha256  1bbba9bf2788bd789ed8da4e47cabbf3467b1f706875b3f6b62df38e08fb9aba  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-br2.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
index e4a08342a9..1c4574afd1 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  52d223f3b2d625216c259e9ff949ca8818452a531ba61557dd91f3889c7919d7  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-br1.tar.gz
+sha256  52d223f3b2d625216c259e9ff949ca8818452a531ba61557dd91f3889c7919d7  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-br2.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
index 6e83e637cf..e4228383fe 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  5cfc004b05f48b3fb419a5db4b7239223d670225fbbb91de2ae151c97910b36c  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-br1.tar.gz
+sha256  5cfc004b05f48b3fb419a5db4b7239223d670225fbbb91de2ae151c97910b36c  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
index 7d538e72df..20f73a0b9f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  0f40d7f39bf2e389cc2ce03c73cc0cc9ded1119378aaa68e2a2ef8597f6fd2f3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-br1.tar.gz
+sha256  0f40d7f39bf2e389cc2ce03c73cc0cc9ded1119378aaa68e2a2ef8597f6fd2f3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
index 2fc4fbcb95..0ccb912a8a 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  3ab67c485ce1825abbbf5db1d90d94dfadc89b30bb740041cfc75fc04021e218  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-br1.tar.gz
+sha256  3ab67c485ce1825abbbf5db1d90d94dfadc89b30bb740041cfc75fc04021e218  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-br2.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
index 38f0578fd6..d1bae36311 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  a5936d6d6022ea101a6076864a2afa918ab2776764012c4be589027001044041  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-br1.tar.gz
+sha256  a5936d6d6022ea101a6076864a2afa918ab2776764012c4be589027001044041  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-br2.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
index bd4673b15f..bbf765d827 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  c203f968e358ca478d4c5344b1e4ae9bf13f9fb1120f2ed96a12154dd64195a6  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-br1.tar.gz
+sha256  c203f968e358ca478d4c5344b1e4ae9bf13f9fb1120f2ed96a12154dd64195a6  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-br2.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
index c6862da75e..1efc311f5f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  57f08e9f3914e79a10e7fb5d346b26fef2773dd22eed0d61fd755e79e62cee93  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-br1.tar.gz
+sha256  57f08e9f3914e79a10e7fb5d346b26fef2773dd22eed0d61fd755e79e62cee93  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
index 188cb6897b..916b781a8f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  1d8b565827137aa21ba37cde382aa291e33a135c697e38dcd31f14e195386327  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-br1.tar.gz
+sha256  1d8b565827137aa21ba37cde382aa291e33a135c697e38dcd31f14e195386327  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
index c0698e7b28..840798cafb 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
@@ -1,2 +1,2 @@
-sha256  e8e0febc7f1408df22bce2d73d9a30081e03b45e152bc25effd14435ca8b3433  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br1.tar.gz
+sha256  e8e0febc7f1408df22bce2d73d9a30081e03b45e152bc25effd14435ca8b3433  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br2.tar.gz
 sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
index b95c51fe20..1fec35d099 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -1 +1 @@
-sha256  176c32f10ad11f290b6251d701835450292ba281eb59c7fb57b244407a55ceab  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br1.tar.gz
+sha256  176c32f10ad11f290b6251d701835450292ba281eb59c7fb57b244407a55ceab  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
index c7ebcf0e04..13a65d9437 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
@@ -1,2 +1,2 @@
-sha256  c66b2366d8ccb1670951012334fe8d48de3358aef39b3da2912b339448fefcde  git-tag-mytag-br1.tar.gz
+sha256  c66b2366d8ccb1670951012334fe8d48de3358aef39b3da2912b339448fefcde  git-tag-mytag-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
index 453ffc0ab2..1b731298e0 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
@@ -1,2 +1,2 @@
- sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
+ sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-br2.tar.gz
  sha256  0000000000000000000000000000000000000000000000000000000000000000  file
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38 b/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
new file mode 100644
index 0000000000000000000000000000000000000000..404bb1397cf8ec58f5e21a86e311e3b3884a55d5
GIT binary patch
literal 35
rcmb<m^geacKgeK9ipS|Qo~A(_Yc)>jYhBdU^VQOO$iz_nm{Sb^1FsEl

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26 b/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
new file mode 100644
index 0000000000000000000000000000000000000000..3a4cc4ead6ce5a7e90a38e025896bc66da85a242
GIT binary patch
literal 197
zcmV;$06PD80j18pN(3<!Kw;}V#qDK=<mP`7v9YjFK`YBl?#(*jBugd>?%TWg1cK#h
z4qtBDwhqwJ-;B--j*`L!t!LwllOZ~Vg`-cw8%Ibno17#|aY~)*fP^|Mib|${mW-#M
zO)5HDL~WGM!6-#hl1S(A**birTH$eq=hwHV7r47zbKY8C>#Sl759Ml@OTP!@qOn#-
z6W~^&lp_B^2mfOs%KF84fWi9!{yw!nrv1F^Lx}hFSed3)%CuY#e^rVfqgY-S2z_Jg

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8 b/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
new file mode 100644
index 0000000000000000000000000000000000000000..fdc4a37651a4ad195f8f106f3496d5df0b3bb6a5
GIT binary patch
literal 28
kcmb<m^geacKghr&DWLGQ{wZIbjX_@n9x^f5#jv&l0Hs3<3;+NC

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0 b/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0
new file mode 100644
index 0000000000000000000000000000000000000000..932f73602f5927ae985829cdd301b1ed40350137
GIT binary patch
literal 112
zcmV-$0FVE80V^p=O;s>7FlR6{FfcPQQP4}zEJ-XWDauSLElDkAVD-@bZnC*Bx@F#%
z#UfR+rR950SwK~$W#*(ZJf9QSKh0&bCYQsEj;oGV#dUqLSCQn67&0_|^q%JH*m1VF
S>l%yCbKk02!Y2Svbu0l+hckcx

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
index b6bccc1c17..b6e37260fb 100644
--- a/support/testing/tests/download/git-remote/repo.git/refs/heads/master
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
@@ -1 +1 @@
-a238b1dfcd825d47d834af3c5223417c8411d90d
+0fdb95cf4f3c5ed4003287649cabb33c5f843e26
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index ec5b8f3fdd..ba52e03ef5 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -56,6 +56,10 @@ class TestGitHash(GitTestBase):
             self.check_hash("bad")
         self.check_hash("good")
         self.check_hash("nohash")
+        self.check_hash("export-subst")
+        with open(os.path.join(self.builddir, "dl", "export-subst", "git", "file2"), "r") as f:
+            blob = f.read()
+        self.assertEqual(blob, "0fdb95cf4f3c5ed4003287649cabb33c5f843e26\n")
 
 
 class TestGitRefs(GitTestBase):
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
