Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E6EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 12:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9187A4114D;
	Wed, 29 Jun 2022 12:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9187A4114D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_2l92A2op0k; Wed, 29 Jun 2022 12:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EEDF408A7;
	Wed, 29 Jun 2022 12:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EEDF408A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C061B1BF407
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A7A7408A7
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A7A7408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VW2pKltH1sbQ for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 12:22:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3DBA40002
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3DBA40002
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:22:57 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h20so10137753ilj.13
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FfqhhEHvigwx8V8+plj7XUtrPz7y6JeEOtl4S/1w6bo=;
 b=hBH1aYhV52AwPLByurTcqZjwugUpA9SV0oX5WohrMzOlY8IVFw7Pn+U6Hb8FEKdgrb
 HzhSLZx5EcS9Flhj7NDLOUo0yb3KxyMC8LIm31vxOJXVFzhdSP36BTgAZC3p8CFfuXJS
 baSWa4XQQqUH/HRG9/oAoik9qztFbUu9XJzs8THNXdyBcG0rcA3gPGV3Tiw5qn5IwSkX
 +zRIlKNpstkDReyqL9BYxmwpOg0cvoZPWBgQdleGE371HKLU/TbPKRypkLhXE6GIbLLq
 /LROBcUlmma5xwDySYM5jYR3yYxpwpfUFd06iZwK/Pvv2LpqeqZ0W8IKV1pwL3+CT9zb
 2mkQ==
X-Gm-Message-State: AJIora+RqUglhC1ej/lvZYAjVBMDlfpL6UHxxutACglveD257TSdQ1uy
 XIW9nV0fMdq9MMM5xKvU1YzVvmCjNas=
X-Google-Smtp-Source: AGRyM1syzih2dQglrs4/ncDwM2K+/6YcVuZu4eejtsnx2M7P48uh4MKobq7kfPFi+7mTff4Qjf25iw==
X-Received: by 2002:a92:d786:0:b0:2d5:3707:e446 with SMTP id
 d6-20020a92d786000000b002d53707e446mr1750074iln.244.1656505376591; 
 Wed, 29 Jun 2022 05:22:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 q4-20020a6b7104000000b0067276d38121sm7870955iog.47.2022.06.29.05.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:22:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 06:22:53 -0600
Message-Id: <20220629122253.2407926-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FfqhhEHvigwx8V8+plj7XUtrPz7y6JeEOtl4S/1w6bo=;
 b=bwfW5W6Eyr/dsjET/RJrOVJQ4dllBY9EbevNsVFpKTC1/bYR0ha0nQoORRQ/CJ+8AO
 yEcM7KBQIOjRcXyvfbV+C1BJk86bnLFYBkLNAyBRb9124rxpo1emjZLAb7dt2gDOngYn
 7n3d7wLt2mSMk755QZ1BrcDq65oCWZFZwrHrQol4XAKq6SjRJKiXJ4mPDAdspoIBjv2x
 +4X9nMi1BzMdZj637ckDcxoI4vadEEJUsO5vKA9iJ38hHZPgeFinZO6Yz3OyS+rKdxRW
 aVpOZS5yznr1n6Kv3BRTmGtsEK+hxCN5xRm9TvAvqtWz3ONtlucWEV99hXRf5w4viNia
 ijMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bwfW5W6E
Subject: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to version
 0.8.0
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
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index c7daedc6b3..c0856c2abf 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  ec3dbe55359ee735b45766b30dfad877  build-0.7.0.tar.gz
-sha256  1aaadcd69338252ade4f7ec1265e1a19184bf916d84c9b7df095f423948cb89f  build-0.7.0.tar.gz
+md5  307632355e32c3769c99da66f92fe020  build-0.8.0.tar.gz
+sha256  887a6d471c901b1a6e6574ebaeeebb45e5269a79d095fe9a8f88d6614ed2e5f0  build-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index dc8363f59e..de4894dc3a 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 0.7.0
+PYTHON_PYPA_BUILD_VERSION = 0.8.0
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/f0/62/c73b775216bb1f34962beaf005f38460c6161177fef6e068a7a0c30a1597
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/52/fa/931038182be739955cf83179d9b9a6ce9832bc5f9a917a006f765cb53a1f
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
