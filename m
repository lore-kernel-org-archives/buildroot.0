Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36CBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:12:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C09660FF2
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C09660FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EDB6607BC;
	Mon, 20 Sep 2021 06:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTeAjw3pIgZM; Mon, 20 Sep 2021 06:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D44F607CD;
	Mon, 20 Sep 2021 06:12:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2D21BF3DC
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F84F403C1
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_GW3Q5D-VmQ for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 06:11:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1519640395
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:11:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id e26so12201886wmk.2
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 23:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zi3MtGaIQ8buGlLElZZ5FOXDaUF8FAai0nrF1bn1Be4=;
 b=NZgWyAdcgrMEtS/8AhTXD5DfDK7cu4TYRqMeouS0ct6yQvRDk1e8qiwaFuodFJ5N6Q
 xd+UVNid/fbWu8y/xUtyDZ3HmflT+AjEXAthlIBFUkrh5/6aohyTEJOeTcYn5GcGSxqg
 htHhjWI3QnJuR0fSePKECgyV5RTjPK4r7ETPXxVYbREAhCjT1SpgKGRTubzk9Fb3ENLq
 +4hJrjDE2F6NptG9dVuyMKEGyc5Wi/C2hyRBVsR1hqWTgiripaO4glx5CDvw6hfUyANo
 F7a6dtRS5+WF7PTr/+qEkarPTNQNmFewBzdh2PENybFpr9tEKtaUDVeT88Y9zbjCaja9
 0CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zi3MtGaIQ8buGlLElZZ5FOXDaUF8FAai0nrF1bn1Be4=;
 b=lidksdE9yUa5r96tok3eUFCWFJzeqV8JjLoCAJJzxac/94FxAgLpuw+8l5d+jxNtGU
 gj/79LfPjpVxAEfE6vyQRW8DnJfs+FFFMmmsqBpeFZmIss/EHKHKdXyXJauVLf8Qevgn
 Y4vEe/HL4jvADUMqIj/bv6PeruhfZlgTGho5+D2SwPbvgdoM8xSkKpy9q3M5nyVTIueP
 60iMbrs58VDtu451Tj+BGUiZuaf8WY1xEbUVDYL5geJidEfrY8CKXA8OSxJFOD+Jq8Sf
 0jCYttsH/eeROERnqFlMyHGnOMdu4ca1BNTF9FaYKR7RsHANloZk5hZTdvV2xc/QNlwE
 pIPQ==
X-Gm-Message-State: AOAM5316aPyOhAqiOpp9HT9D3Zvazas+h1fP7zNCBgfaZXJqVCg/4PgK
 TcXrx6VD4I8irAn/ZAP3HJmG8Gl4NtI=
X-Google-Smtp-Source: ABdhPJylqHSXyzkOeTnVeW0lOg2v+HMNrNNUjpS0+nqKuyoST/0p8hnEyMDgT7nZJcIQYlBywmiXmw==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr22704709wms.119.1632118295205; 
 Sun, 19 Sep 2021 23:11:35 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:72db:d93a:e4a7:fd06])
 by smtp.gmail.com with ESMTPSA id o1sm14622480wru.91.2021.09.19.23.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:11:34 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 09:11:24 +0300
Message-Id: <20210920061125.221541-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920061125.221541-1-asafka7@gmail.com>
References: <20210920061125.221541-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-defusedxml: bump to version
 0.7.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-defusedxml/python-defusedxml.hash | 4 ++--
 package/python-defusedxml/python-defusedxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-defusedxml/python-defusedxml.hash b/package/python-defusedxml/python-defusedxml.hash
index c782a97bbd..c32c6cdb7d 100644
--- a/package/python-defusedxml/python-defusedxml.hash
+++ b/package/python-defusedxml/python-defusedxml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/defusedxml/json
-md5  a59741f675c4cba649de40a99f732897  defusedxml-0.6.0.tar.gz
-sha256  f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5  defusedxml-0.6.0.tar.gz
+md5  a50e7f21aa60a741efe6b1b658dfb3f8  defusedxml-0.7.1.tar.gz
+sha256  1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69  defusedxml-0.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b80ce9da8c42a1f91079627fbbe2bf27210ae108a0ffe5f077d5b08e076c24c8  LICENSE
diff --git a/package/python-defusedxml/python-defusedxml.mk b/package/python-defusedxml/python-defusedxml.mk
index 6d2a9aff43..19ba2fda68 100644
--- a/package/python-defusedxml/python-defusedxml.mk
+++ b/package/python-defusedxml/python-defusedxml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DEFUSEDXML_VERSION = 0.6.0
+PYTHON_DEFUSEDXML_VERSION = 0.7.1
 PYTHON_DEFUSEDXML_SOURCE = defusedxml-$(PYTHON_DEFUSEDXML_VERSION).tar.gz
-PYTHON_DEFUSEDXML_SITE = https://files.pythonhosted.org/packages/a4/5f/f8aa58ca0cf01cbcee728abc9d88bfeb74e95e6cb4334cfd5bed5673ea77
+PYTHON_DEFUSEDXML_SITE = https://files.pythonhosted.org/packages/0f/d5/c66da9b79e5bdb124974bfe172b4daf3c984ebd9c2a06e2b8a4dc7331c72
 PYTHON_DEFUSEDXML_SETUP_TYPE = setuptools
 PYTHON_DEFUSEDXML_LICENSE = Python-2.0
 PYTHON_DEFUSEDXML_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
