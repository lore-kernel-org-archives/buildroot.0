Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D726EC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 04:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6570440134;
	Sat, 29 Oct 2022 04:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6570440134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1us3K2jczY2I; Sat, 29 Oct 2022 04:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98B54400F8;
	Sat, 29 Oct 2022 04:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98B54400F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72FC81BF982
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 04:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E17C8176F
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 04:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E17C8176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbIlul7UNOPw for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 04:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545A581763
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 545A581763
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 04:03:01 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id o28so2059809qkl.4
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/1tGKX/gWUIY7B+VGNkxqq3Ltng6TG4kkVILB1nAQdo=;
 b=d8Kg9ynw5IJhnUYYUQV38QCj02VxLsHAKoIGRigBPaHw3QwZHgFEz0aJS9UCn3mwTt
 Rn7V4f5FZAoAz6SnC4qBJAiVg/Zx90h2faQz1HQFPFUTQyKfWDD0MFldnOeQVwT3nm6C
 Tj6BxW0Qayb73b5n8n+kEU5RWRHHDAt1M2NsKhNqPa99Px+sGZ103iQL8ZFQ17pOxm5q
 5ldJPiQipCwUtV0qzh4FgBX0Ai1xjUFdB+uzaQ6aLsYN9npQdAzmMcDq3WuWyDgXvxf7
 QSc2oUpERPX28AxhZCpVfg7gOsdtFmRDn0hsTiEn/3vA8zO2S0v5WNKR+xqSgdkJLbxA
 HPPw==
X-Gm-Message-State: ACrzQf0BTZ9Mzoc6SDYgYNYpE3nsHHHp86B6bWHTV4GKc/llFfd8Kw3m
 60VW+855buyMCDMq438vSONF1FeS8TR3vA==
X-Google-Smtp-Source: AMsMyM7KBmt/fGD8n6nY+Fv7AzD71E9SmaFusMTajeorvQ4z6oHVhRPTdgD/x/wAWNReHsEubGAgNw==
X-Received: by 2002:a05:6638:25ce:b0:374:8245:ee79 with SMTP id
 u14-20020a05663825ce00b003748245ee79mr1174018jat.236.1667005841530; 
 Fri, 28 Oct 2022 18:10:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n8-20020a056638110800b00370c2b787a9sm64915jal.168.2022.10.28.18.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:10:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:10:39 -0600
Message-Id: <20221029011039.1393998-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/1tGKX/gWUIY7B+VGNkxqq3Ltng6TG4kkVILB1nAQdo=;
 b=VNAvWK+YIT5+DHpPlGWp6kqknnFyL4TGNrvXJjDNUrI2k0V+U3w36LaVwwkviTlek2
 jzKeIYql2LDc37dn7YTGTzstLhnavgr24dV4pllAVziShJ/CjnopdtxV2Lwr6CQMOfJ+
 ak498XYfr0ATd8ZXphVhEg49x4GKEgaoYsHOMX/bAEJct2Sq8d5pP4FXMOUIZtHg86kP
 SRr+UEf3sZd9bRFtuk5I8n33djJQx5rqYyCYKDZSsTnCCh7kGJfGtXP7HMSGXLmfgPFb
 aJ3AbMgL9GFD6+6/ATUx/vgGoOvU6Shq2ulVsxn1Y4JgkY6UBSSSWLDrmZ897WloBMsE
 DTKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VNAvWK+Y
Subject: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to version 0.5.0
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
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index 4c80d3fce6..1b37e90e73 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  3afeaff9db93af8b317c909196522ddd  pydyf-0.3.0.tar.gz
-sha256  1aea6c0c97cc7b809efb5427147e168a5404ed76a53d76a3aea590d4ca1b04a3  pydyf-0.3.0.tar.gz
+md5  6b2a02162a3f4be9464d7b4043953d33  pydyf-0.5.0.tar.gz
+sha256  51e751ae1504037c1fc1f4815119137b011802cd5f6c3539db066c455b14a7e1  pydyf-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index ae88a0eb3d..6327a3efe2 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.3.0
+PYTHON_PYDYF_VERSION = 0.5.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/4d/12/3341ead2313889e2bf49b18ab6d65f47f8a8fb82ccb91faaf74f5e51125f
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/f4/4c/6d31b36a46714d8206b8ca84b8dc9aaf42093415b1f50471538552abe501
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
