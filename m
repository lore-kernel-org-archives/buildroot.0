Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B8BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 05:54:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F698611B0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 05:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F698611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34C05403E8;
	Wed, 22 Sep 2021 05:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zl0Xv6EbGa1u; Wed, 22 Sep 2021 05:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C5C940197;
	Wed, 22 Sep 2021 05:54:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25FE11BF40E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 05:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1526C40466
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 05:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0lCjn4epGV3J for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 05:54:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C81A4043F
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 05:54:47 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id q14so1528334ils.5
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 22:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s097YY0d23AbQKZ9jTAem1ACds53KdpS5Df82dGvkWw=;
 b=ldbUpA5oefA7ONBdkGz0POefGemIlZ+nVqpsnp75UmN3XqHeR6T+wSzikzSXAgqHWD
 uGJfQBMgAWbk7AG37Y9y0djAYCL+BEZ6kJxkPkpmM1G3mIDsfjX/tZ8qAhmdkk5/p+bJ
 BkeIlV5CgyQQ5C3M65qtxUpg2EoQpGgK3av/f91gwpsRS2keTKngWHQSomBbih5jQP3Q
 x1KyITQ2AxJCs5/vX1SkpNS+U2VP51J/cjXqUHdL53iFXt5nK45zAoxYw6+Vq8MMSEuL
 D+Ejavoptl9E4+cyfphJCzINS31VGfnEc2xTEQD172iaPISAv2KNPQwhi7CqdxFoEYf1
 FcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s097YY0d23AbQKZ9jTAem1ACds53KdpS5Df82dGvkWw=;
 b=oP8baJwqwaCgF4sJxFpv1Oaz1bTA97uZ2qcH6F0XrtS4inrNCdytNCQGQaAd1fZrCW
 ZkKkCtH6c12Qf2HkDOPjDqcS1EysDTG5rMjSVVqbPZuIcOTyzHjRYqxuSJIjf2hXyshV
 W2tL0EA6+t3k1afHQmDFUf3ftbNk5U+OjejfXMuutKYJJpFOvWAMnJIil8Ant6hnUIK0
 FSQimgwRzwS6ya+o2TmlGcqSTjrF/M8q6ajEFxCM1uWF4qGJSID6Q6mwk8TvOG3HlkCr
 Un0NEwep1FApiKfMmsqZhq35jp3IvWUZ0eVjr62256wgRLtVTlzXhmjh3h3X3dmoxskv
 IT/g==
X-Gm-Message-State: AOAM532z/0KkScIv6kNAMDwNw/xykO080Q0cS7tShR3g0lR9eJ3YbuPM
 eY+HNxZvnbsLB9NDnjQSKq4T6cqXBCA=
X-Google-Smtp-Source: ABdhPJw8s9y/wEW0L0guRllStIH1+07gsCEsmpCQBqkGciD08uXGR2/i7wihphgui3FOt9SMi76HuQ==
X-Received: by 2002:a92:d382:: with SMTP id o2mr24155368ilo.67.1632290086008; 
 Tue, 21 Sep 2021 22:54:46 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id f7sm558957ilc.82.2021.09.21.22.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 22:54:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 23:54:43 -0600
Message-Id: <20210922055443.2563692-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-cffi: bump to version
 1.14.6
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 package/python3-cffi/python3-cffi.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 37676f2664..8ab672a56f 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5	3cc2f1daf62dd66eda79b4d6281cebfc  cffi-1.14.2.tar.gz
-sha256	ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b  cffi-1.14.2.tar.gz
+md5  5c118a18ea897df164dbff67a32876fc  cffi-1.14.6.tar.gz
+sha256  c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd  cffi-1.14.6.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index f0b5b4560f..2504cf18f4 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cffi/python3-cffi.mk
-PYTHON_CFFI_VERSION = 1.14.2
+PYTHON_CFFI_VERSION = 1.14.6
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
index 7541e71b73..52ea3b3fbf 100644
--- a/package/python3-cffi/python3-cffi.mk
+++ b/package/python3-cffi/python3-cffi.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cffi/python-cffi.mk
-PYTHON3_CFFI_VERSION = 1.14.2
+PYTHON3_CFFI_VERSION = 1.14.6
 PYTHON3_CFFI_SOURCE = cffi-$(PYTHON3_CFFI_VERSION).tar.gz
-PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
+PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
 PYTHON3_CFFI_SETUP_TYPE = setuptools
 PYTHON3_CFFI_LICENSE = MIT
 PYTHON3_CFFI_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
