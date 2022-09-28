Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37CAC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 19:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A75610D0;
	Wed, 28 Sep 2022 19:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A75610D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ctRt4otqvMu; Wed, 28 Sep 2022 19:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 736BC610CB;
	Wed, 28 Sep 2022 19:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 736BC610CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C54C1BF3E0
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 19:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4F9983498
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 19:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4F9983498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ww_3VbiKs8ZW for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 19:31:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7734C83180
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7734C83180
 for <buildroot@busybox.net>; Wed, 28 Sep 2022 19:31:53 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z6so21365586wrq.1
 for <buildroot@busybox.net>; Wed, 28 Sep 2022 12:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=KzEg61fs3VNGIKAE0B9fjQ8jvddtdfTAWRsprO4nE4k=;
 b=7av5HujrOX9GnIFE4Sj1HGWph5ovPnoEM/HXo+Jh5J1KpRsAigv+f7blUTtODJtQCK
 u97KDcfCv5DFLDKiPlgF5YYl0j3arnE8/9HPuuxI3Odm28U59KVaFZHbzYKsDAjrKY1c
 4rWLCBA1QUG92FfbyQVpvcQFngnvXRVzy5ON5CuPNxNRgMVvqmP+lWbDATW3ZRx/Qeb2
 enq6+pWvnqSkVmGF7qiCo2IcwvH3r5Vo7TpLevtiW+nn+7Xx6SeJaPiy8/mGGuJjTZ3+
 M/4rd1OZsPICvMMlILytwE3eKvoflR8gHJFmF8CWWiWUzn665X+NI03t5MYSvxqgUBHd
 R5Ag==
X-Gm-Message-State: ACrzQf19B4sRHailwB+fFXjuKnoIC0Nvn0gwy8vSgv80LN0OwpqFcFL3
 M5B9AySxzRcQlzSt+zzFJ2Un0MAf7PU=
X-Google-Smtp-Source: AMsMyM5U8vgDe4onCo99dbSijYaZQcMv8MM+ba8DWd25V33s3rfYw1PqVU2R26XiZQ7aQjJOqcZjkw==
X-Received: by 2002:a05:6000:1d94:b0:22c:c4d1:3622 with SMTP id
 bk20-20020a0560001d9400b0022cc4d13622mr4842522wrb.63.1664393511263; 
 Wed, 28 Sep 2022 12:31:51 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:8043:4b00:ed03:af64:3498:bc20])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c1c0600b003b483000583sm2789012wms.48.2022.09.28.12.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 12:31:50 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Wed, 28 Sep 2022 21:31:49 +0200
Message-Id: <20220928193149.12466-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=KzEg61fs3VNGIKAE0B9fjQ8jvddtdfTAWRsprO4nE4k=;
 b=F6+RaWlCzznNAzIjX2vc5mfx24VYU6cLjd1qplFIyJfbha1WFj0Z79KnhdJEQNi4r2
 6TNLNavgEF3G6yzkr/W+4Tf+gCBQKDTm57VLSyhcbZWNgxvlinkdahh89vgwi7fslFsF
 lWkkrP692HH9k8pwNlFekrwiPzRqhxKS3BH55mDblk6AF9IvuY6eGeXtdbnenYzh8d89
 GiFU9wRSdlk/HJ8ih0GFCRAU2xzBdlJrPiQz5dUPUYFObN0TDhrzt6BsfCFzMS7G06so
 CmA6NW6VVu40JUgoovUnfyVX5a88I6HyxHFP/xOSk/8lqJSITVC+KTLWN5oBLPxjAXkJ
 g4Zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F6+RaWlC
Subject: [Buildroot] [PATCH 1/1] package/python-pythran: bump to version
 0.12.0
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index a24bb4dc4c..08348a5ccf 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  e09e90484771937ab499380858bdb18d  pythran-0.11.0.tar.gz
-sha256  0b2cba712e09f7630879dff69f268460bfe34a6d6000451b47d598558a92a875  pythran-0.11.0.tar.gz
+md5  d2961ece35b4b9f44a84ef31df1b21ff  pythran-0.12.0.tar.gz
+sha256  eff3dd0d3eebe57372f0d14f82985525e9bcdfb5b1d1010e1932cf9207060f9f  pythran-0.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 8234513af3..0d946be28a 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.11.0
+PYTHON_PYTHRAN_VERSION = 0.12.0
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/88/9f/161f08131abf7f23920cee29b691de27f10fd97ac09fb2f3532b3a7f9b96
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/99/e0/ed0e81de05cfa4ecbcbceec6603d175387d8bc7a6332cbfd155d09958ccf
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
