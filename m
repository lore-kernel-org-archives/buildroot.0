Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A119C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 06:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 199D6404D5;
	Mon,  9 Jan 2023 06:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 199D6404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7s7GuX3Kpbs; Mon,  9 Jan 2023 06:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EF8240412;
	Mon,  9 Jan 2023 06:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF8240412
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5D471BF48D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 06:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B09FB8197D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 06:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B09FB8197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0y6O6R1w7X4 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 06:06:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E0581970
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56E0581970
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 06:06:27 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id r72so4103948iod.5
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 22:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2qK0FuUaR5o+EvFyDm78Rqq+gmqgk8TlRFMXc6wQ1YU=;
 b=47x4gek7+WAdJqOdPvLCm5QShef50buLxPMEgKaDWEHRQ44fl8Z5SgMi/vncvoFNCl
 aNG0PlIp+Adfbrmn/uIzQURXq5Pnt+MYw4uKfa7x5hKA1YH9oAr++NIMBdKHC2FS2L5G
 dlgYRmfQ3ouSUxxlWLyCsXP3fgga/DpJEMPLGCZiRzT5dW1NNHu/YqGumlNJWkoi9aj5
 VWDtUkJsT4jyT6Z0OZNZk+kWOpk7pMG59pyjOhKbeYVcu4kOEzpDhoWpI+f3VqHk7p8H
 jE5dNlV9lHts3Benz7g4wlitZbgi6cf6/at5NTmdtfR4n8uMvB7d6Vyjd9Y2H0PDEFkU
 ldYw==
X-Gm-Message-State: AFqh2krdsmuTAtQc9Pth9qXEmdo/ClvFYKdzLe/3jy6wbRmpLBeX4TOI
 I1Q8sL1BE5/XcN7BuNat7oD6O5EwT1nAPd2+
X-Google-Smtp-Source: AMrXdXtgysIaHnePYQUfoKvJPM8iaTvlhKccbVKTlhH7z/ksZnKGYg1Qt5Ao6QvgUrFMbH63M+B+PQ==
X-Received: by 2002:a05:6602:2242:b0:6df:e142:6679 with SMTP id
 o2-20020a056602224200b006dfe1426679mr44713068ioo.5.1673244386053; 
 Sun, 08 Jan 2023 22:06:26 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 d9-20020a026049000000b00374f99a3de5sm2552059jaf.63.2023.01.08.22.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 22:06:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 23:06:24 -0700
Message-Id: <20230109060624.2811047-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2qK0FuUaR5o+EvFyDm78Rqq+gmqgk8TlRFMXc6wQ1YU=;
 b=WXo8lqHlyXT7GrFjiFAh2MbusaDOgpHAtGsDRw8SDuyLUDmvgt20OFbfN69E1+bto+
 huXR8QIyONxh5LrmJb4OAdkg1xGV70C1mG/8RC3vGf1ud5tadobfDVJFIGz47w8fdEOy
 jRCkx8llhx6YOro6OMe6Mt7yU4dpkWKlJzA4TUb1sS7G1gw1iT4nhRJr71KR127aFVCc
 3TXekD0apErJGbgq7jMMocYF1OjmTOClX/b45TQuO7+0tK97QwDp/pvvzD6gGPjMnKT9
 c9g1czS1M3lscpJJEedpYFcRU6ikPxNUD4XSp6uXcox+KIxytNuRmgDGbNaA/C12zyP/
 l+jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WXo8lqHl
Subject: [Buildroot] [PATCH 1/1] package/python-tempora: bump to version
 5.2.0
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
 package/python-tempora/python-tempora.hash | 4 ++--
 package/python-tempora/python-tempora.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index 39249eb4fa..ac6483b77f 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  f9954a8c3b091f9769eb7bbe0faddccf  tempora-5.1.0.tar.gz
-sha256  3e7c4a5369a1788c88a99b6be3a4c74c0c7728d3b62fd768a7e81bd0be0e88df  tempora-5.1.0.tar.gz
+md5  87fc0d99edd557323e61a16017707a8b  tempora-5.2.0.tar.gz
+sha256  af82eb016decda8daf566d1e4836f94f7f8ba8c7153637460156e081aadc64df  tempora-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index 68516a8388..3074ad0de2 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.1.0
+PYTHON_TEMPORA_VERSION = 5.2.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/a9/4e/41863232e77742b3a5b30a81e1398abd102aa0a67657bc86a53800966b8e
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/97/70/5cf5031a83ca6d0431a53459b2a98aa387ba23d06710a5e48d681ff3956f
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
