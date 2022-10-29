Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0C3ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 12:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 042B94019D;
	Sat, 29 Oct 2022 12:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 042B94019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrkFGSSPCXyX; Sat, 29 Oct 2022 12:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3344940424;
	Sat, 29 Oct 2022 12:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3344940424
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2181BF681
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 12:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDAEB813DD
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 12:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDAEB813DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rA2y0A9HXl8W for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 12:39:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA226813DC
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA226813DC
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 12:39:06 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id x16so4212521ilm.5
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 05:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iHf5kV6MDp7Zontzd4JYczrOkv0wz3f0YlaniMiYGsI=;
 b=We0hKv8fUbZU9WbzMVMYxQbou7ErWAdeV1PuoducCASbz2KuCM5nH1S4BlCcgJKJ3T
 n4TNspPqflTJWRzBHYeSfTuM2E+1YSOui3GGIr14pYKee7v4tNkW9NRrJ7Wj7LQf/G+5
 86ahxKdTf8eue26avh+IpmRwj54aPX4DsFJWmPLKuHSKw0WZUL44cMkCLutx3cL7rdmb
 6eRUoMgkut2oF3i/o4uVhsjUZiKsAyj7DnLellng/X2qR31YlAEC4Crg/Y+bc5HfrxVx
 tMKMushEAD3BK6+B+42w2OJ6klFHXJidzlnPZozhH+ksWRMZuZvj4Tfd68+pGqJRGz7w
 k0qQ==
X-Gm-Message-State: ACrzQf2krXG9bQCVWLWWfnD94cjRyaGRbTzt0hJfKjdk08QiKZIfRJzf
 8+ilWYEUR3dnew5j6ufK8ych0gvHy1kQtQ==
X-Google-Smtp-Source: AMsMyM7znZsao1eSKWDychis75V3BZ4qcB7JoYwsN5q+Xsz+Jj0c1eocLQElaWr6c79BoSgCGv7A3Q==
X-Received: by 2002:a05:6e02:e01:b0:300:906e:4113 with SMTP id
 a1-20020a056e020e0100b00300906e4113mr1614313ilk.24.1667047145612; 
 Sat, 29 Oct 2022 05:39:05 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o14-20020a056e0214ce00b002f68a98e1c2sm543816ilk.50.2022.10.29.05.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 05:39:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 06:39:03 -0600
Message-Id: <20221029123903.1422864-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iHf5kV6MDp7Zontzd4JYczrOkv0wz3f0YlaniMiYGsI=;
 b=g+nMnw0EFnhXziURv8Vp62MoxiK7GN+hV2U3S4d02qojEzPBKL97F5BxyZhp/9fIjj
 CXfX+Mn2c7UUaQt5b+gGObZcGwVFFTEhvhE/cmCBSOlLHStJbcHhvROcY2MH5sazdp09
 9n5RfIiWl0562wl9jHSRFL1U56BjorYr/VeI/fye40xPOw2WCrDGMoEqQe2Nc9RTORmH
 9GFYgarafFI5TenyAVMQPFUve5/HpQ3sKWSswcRBzG089rRh/HIqN/yH7TILJAdu8xJq
 +XDTgwvLVNvpKCEd20WfciTl69ueuBiB8s3rVoM3gB4styO366Q6sPgIYD3LI9Qw/ELc
 ogVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g+nMnw0E
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.13.7
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index e2de1123ac..eadf300bc2 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  c3c80ea7c10817c5fa1862c15ffae85c00db96d33b2b9f8088abe0024b983d84  maturin-0.13.5.tar.gz
+sha256  06d9d166b4a2d86f06ed09eeb362ac03728e1fbd2b852cc6a4ddc7cc75029237  maturin-0.13.7.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index f67f0ef562..ffbd131ef0 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.13.5
+PYTHON_MATURIN_VERSION = 0.13.7
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/02/02/0bc5e44bc6f0a1ec21bd1b32d7d0ff6035a72858823ef394a95ac66327b7
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/4f/19/6f982e341612ab442f90ba1a047a4188d48473ad0d1dbfb3dffdaa20e095
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
