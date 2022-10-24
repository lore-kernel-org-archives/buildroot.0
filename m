Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96749C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 20:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08E4E8132F;
	Mon, 24 Oct 2022 20:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08E4E8132F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsV-eux0Tsl5; Mon, 24 Oct 2022 20:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FCDF81324;
	Mon, 24 Oct 2022 20:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FCDF81324
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD8BE1BF334
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 20:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CE17405DD
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 20:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE17405DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rg5jl7zjceXZ for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 20:04:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDBB4405D9
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDBB4405D9
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 20:04:10 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id l127so8637497iof.12
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 13:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tCUs1mpsboBBjJhGR4EG6mRjCoJs277N4k4bzGbqJtg=;
 b=WyqUC8YPotUcLoCZFHVClWpck26kJtBQHclAQ9TG1BvUACBPnMKQpRxDTzAe9vkzLd
 lbD6doHBxtGg3Qi7dOYxfTbDs0Ss/ZcRXVLh4yz6Hjrw22m9sc+EZWleI6E7fMPqbyV9
 FwOwW/tMPas9/RHcm5iGLqjuex/OqZ26hl6MVGIuZhgefiGcpu+Eh8N8LmUQRCjP5OKv
 mnr15p2q2fOUqg2TPfUYOb86fHX4cPx6JDyZcNc1cInpxvZLf2w30/GaEWl9tHntRrRV
 q/eFD0c8W+dEwMR26ELaVi4K9Fm08XVa0dWDc6kJ1wfvI3mtgegKEKR3Dp4gTjZnvZTr
 MKZQ==
X-Gm-Message-State: ACrzQf0SNT17d6XahaOTf697dKUo8sj5JZlmRYSMclnYipVG9mXG9jOQ
 BxSiIbW3uvaQ6CjQFLdBF75gTq6sS0fAww==
X-Google-Smtp-Source: AMsMyM5BJa/FjCcB59OLBILaIhKC0PCEoBsJQSxjOc2hGC+QxeCmx8nhneVH2sTVIUOV3fDnjHuGFQ==
X-Received: by 2002:a5d:9d88:0:b0:6bb:af14:4992 with SMTP id
 ay8-20020a5d9d88000000b006bbaf144992mr20209654iob.53.1666641849393; 
 Mon, 24 Oct 2022 13:04:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 a193-20020a0216ca000000b00363c4307bb2sm147432jaa.79.2022.10.24.13.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 13:04:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 14:04:06 -0600
Message-Id: <20221024200406.2266871-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tCUs1mpsboBBjJhGR4EG6mRjCoJs277N4k4bzGbqJtg=;
 b=Te2hXwv7r0Wi/YhQm7rVC0Eq9Fof+4V7TNi2qmYozinHCvQInfvupMQm4DBUEuuhrv
 zhSBGXK6d2fhTbVTmK8mdxzRl/Z6q9UHTBWTRuNJTFIMLeZ3LGhjsXgp80OPxsaMm0d+
 1m/O5/e80A3IHxEtSLs3Vx+XYTMhObjeveZYu5lFlCas8orc4xD2eh1DRxVm6mbs+mCB
 TMCJICmRw6Dds9vtm90Gc7Fy0MxEfIe/zluBgu7Yo4ml+mhLncfu+dz+vmtahB+SgUcg
 RpUDqV+/XRvzBx0pneH6pKlh4g6Zm6TfuCOfbfKdM1Xe+fhX1B5JCYWbzXZqjghdI8Qn
 U5OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Te2hXwv7
Subject: [Buildroot] [PATCH 1/1] package/python-daemon: bump to version 2.3.2
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-daemon/python-daemon.hash | 4 ++--
 package/python-daemon/python-daemon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-daemon/python-daemon.hash b/package/python-daemon/python-daemon.hash
index 4f53902d3f..005a969207 100644
--- a/package/python-daemon/python-daemon.hash
+++ b/package/python-daemon/python-daemon.hash
@@ -1,6 +1,6 @@
 # md5, sha256 https://pypi.org/pypi/python-daemon/json
-md5  3ab10a93472201214cd95c05f1923af6  python-daemon-2.2.3.tar.gz
-sha256  affeca9e5adfce2666a63890af9d6aff79f670f7511899edaddca7f96593cc25  python-daemon-2.2.3.tar.gz
+md5  b7397fe73d516dc14921500a1245b41c  python-daemon-2.3.2.tar.gz
+sha256  3deeb808e72b6b89f98611889e11cc33754f5b2c1517ecfa1aaf25f402051fb5  python-daemon-2.3.2.tar.gz
 # Locally computed sha256
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.ASF-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL-3
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index 600ccf5bf1..aa8019f4be 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DAEMON_VERSION = 2.2.3
-PYTHON_DAEMON_SITE = https://pypi.python.org/packages/source/p/python-daemon
+PYTHON_DAEMON_VERSION = 2.3.2
+PYTHON_DAEMON_SITE = https://files.pythonhosted.org/packages/d9/3c/727b06abb46fead341a2bdad04ba4a4db5395c44c45d8ba0aa82b517e462
 PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPL-3.0+ (test, build)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
