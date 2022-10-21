Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E9AC433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 17:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59B2A84428;
	Fri, 21 Oct 2022 17:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59B2A84428
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjpUsjUAg3LL; Fri, 21 Oct 2022 17:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A21384425;
	Fri, 21 Oct 2022 17:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A21384425
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97CE61BF27A
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 17:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 811006FB3D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 17:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 811006FB3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWZ2jHrrTAwo for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 17:05:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CFD56FB39
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CFD56FB39
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 17:05:40 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id 8so1967290ilj.4
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 10:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GnzN4fNgDB6HE2uM8mK2pjCVzEgaxXuy02X2YP3yVbU=;
 b=hp08T8QwL3BjcJ0p9i20K4Ub3Ei4OPLMLcoZoXlP73ags2uc80jZ3pyCe027eBdEjm
 lspJgXgWq/u/kuXlcMatdCRgLmGLe1kLGgfLrkb40uLTI3FsNGrlPCsNycpfv7xSRK3X
 7jiBfENSZedyRXFLytGwcrFkNbZC4yHXvRs9FkJhGqsB6W0nO9j7HVyfIgW95wEb1+cL
 LC0dRUhY10EqpJxmCu7RQP7jGzvojLv1FhBvSTPw5Rp4qjzmNX8fsbHtDIX+q37Qn9wk
 95rKRGj3cmNaN34ccNRcTcF/1gu3WZslULZJHz25icEd7ldpb8p9Bqhsr8DewOX1h/Qf
 Uxww==
X-Gm-Message-State: ACrzQf2gnV2RsmYVZEx7Xz0J1L+s45T5hxGD0Xuj8FQHlnZPRYtB55Hz
 qWQve+9TFnPpq7koyaSI1wgqnheocznEkA==
X-Google-Smtp-Source: AMsMyM4KpJw5jI31PaiheYRzeIWxi68XE9+fIma4Jxr35mhMHr21fCdjqGbE7QKWeBdHvxpp5wVs8Q==
X-Received: by 2002:a05:6e02:2162:b0:2fa:c097:de05 with SMTP id
 s2-20020a056e02216200b002fac097de05mr14690442ilv.277.1666371939115; 
 Fri, 21 Oct 2022 10:05:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 w22-20020a056638025600b0036371872137sm4470793jaq.11.2022.10.21.10.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 10:05:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 11:05:36 -0600
Message-Id: <20221021170536.3408570-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GnzN4fNgDB6HE2uM8mK2pjCVzEgaxXuy02X2YP3yVbU=;
 b=D9oIJWuaBFNi3TrZbDb+oOX3TTN8WOQ5TzBkNJigixZNvIoj57f6ILDzlR6Vp7VFUP
 mjSuyjiG3Hc6vtNDq0BgbUV5Z2jpTVhCve+DyXoMUaOG+D4Q7VI6UG9yKd/0VMBRgbsH
 5B6xq9JbF0b/ZSThE4wPBKvAX6Vi26VImZGks/r3veG3W4g9AvIe429pXDxjTm16yH76
 YvF1foWp9I+IftD7+Cjn7QCmenKEgUaqZsDoQQWnh5vnlbnyXpZJfNXQE7WRcOJAwz0P
 KR/SPo6FGAgJ+KHaJ/sNV71xYw9W8rNJ/Iwi/kHxyFTsm90kDCOH3XsvUcx+Q1IKfXpg
 t9pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D9oIJWua
Subject: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.10.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to links in license text being changed from
http to https:
https://github.com/python/cpython/commit/96f8d3619d839266491b722b943de65892bb0e81

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index c625e7a8ea..f9b8e2ec8d 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48  Python-3.10.7.tar.xz
-sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
+sha256  6a30ecde59c47048013eb5a658c9b5dec277203d2793667f578df7671f7f03f3  Python-3.10.8.tar.xz
+sha256  d4a223f033419313218c9b8444167e91e87a5bebdb43fb8490df441df5220a8b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b7df26781a..4131941e11 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
