Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C7BC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 01:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA00260BAA;
	Wed, 26 Oct 2022 01:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA00260BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXifIbLFa_hQ; Wed, 26 Oct 2022 01:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4C8F60A64;
	Wed, 26 Oct 2022 01:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4C8F60A64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A97601BF2FE
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 01:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8520560A64
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 01:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8520560A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qF8KRwRLjR4U for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 01:40:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6424C6059F
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6424C6059F
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 01:40:56 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 63so2541036iov.8
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X9BWqbRX2LgjvBkVVl4ChltbIJDd+diX0DjpQVThpx4=;
 b=ttYD3jUtQYzFR4S3p6GutD+KE9SvRbRVK6nyBMtV99U6pFVe6GdOJh+qGKzz5iL6VF
 qvkqi0MtFGV+1/snkRiBVb7avjKKaxLdPdZMjpCX58L74vGMB1OA2lb3zmykJucfqlT9
 u/e9eJDcIJHcyV02IGeRfD6khKgpMbphmLpxyI8kZkZJtno4qxb9sYx6cjsz+B5jXQIz
 8GVBR4bXd1wc2bkm+nyjJkyruHuOUCCbybnuxUMI3jYDmdjhhKcKAVY01PtTKbGa5qi9
 xlQK/I2nk6tUoTcsEgBBHKIPc+WYA+e7gYXJwIGOppNlwV/nopqXPgpvrrY9SuLC3z8G
 vTmA==
X-Gm-Message-State: ACrzQf0Xokgz9qm6V7XwxntN3i6cbhRy0jcI8vra9k1r+krXu1wr4vhX
 IZmlMTft5+i9+L4z8BflcynSXP/tO/deVA==
X-Google-Smtp-Source: AMsMyM7J20YpQikFq61siOvoKnlx+MIfdCLKJ3SXqU9XgeHUPK9wMCpmFOprfHzPlbU+CjpXBfZHOg==
X-Received: by 2002:a02:ab86:0:b0:374:2da8:ed19 with SMTP id
 t6-20020a02ab86000000b003742da8ed19mr7042609jan.213.1666748454896; 
 Tue, 25 Oct 2022 18:40:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 cp15-20020a056638480f00b00375147442f3sm264050jab.16.2022.10.25.18.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 18:40:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 19:40:52 -0600
Message-Id: <20221026014052.587418-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X9BWqbRX2LgjvBkVVl4ChltbIJDd+diX0DjpQVThpx4=;
 b=aK+1bKg7LgHKUzCofEmkjySQWYGKMHvw6f/76vW7gipxbQblK0FtdTX6y8CW9Pq4oK
 CDvU0+v7r1Hg6t/XzrQk9lxBB2ukkJyHhjUSQ0Qi/6COt2iMW34+VhACXQCKPHTa+QHj
 25m0WMLa83XsoGsfsYpq6so6olgiJmThA73JQ4QQc4htTktJ5hDgfqxpLZA7RdWUe9aJ
 +F4sbjQbqixMcRnBVp6hhlRc6OQ+JND/Z6vBuMlu6CmBUTJ1jWcwV1WS/1syh01A11AH
 VPFJWfBJiA4+YiQTxykGtzgGWjAY1gOI14y/jSe4U5X9L89ASq4sJVWIuVDAI3nbYZrZ
 0bWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aK+1bKg7
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 1.1.3.post0
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
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index c1870c886d..8e2a95b03e 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  f424fbd9afeed575dd2ba5f0ac66e30b  greenlet-1.1.2.tar.gz
-sha256  e30f5ea4ae2346e62cedde8794a56858a67b878dd79f7df76a0767e356b1744a  greenlet-1.1.2.tar.gz
+md5  b3e86eb9ab0908e6e3ef542e9b94d7e1  greenlet-1.1.3.post0.tar.gz
+sha256  f5e09dc5c6e1796969fd4b775ea1417d70e49a5df29aaa8e5d10675d9e11872c  greenlet-1.1.3.post0.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 72d2747970..b4a0e5af08 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 1.1.2
+PYTHON_GREENLET_VERSION = 1.1.3.post0
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/0c/10/754e21b5bea89d0e73f99d60c83754df7cc64db74f47d98ab187669ce341
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/ea/37/e54ce453b298e890f59dba3db32461579328a07d5b65e3eabf80f971c099
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
