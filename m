Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28456C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D669881F84;
	Sun,  5 Nov 2023 05:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D669881F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHQ6m4jtIkxc; Sun,  5 Nov 2023 05:45:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13FF1820A6;
	Sun,  5 Nov 2023 05:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13FF1820A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6901BF5DF
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBA22414C9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBA22414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlh7jd2QkJ4S for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:45:08 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5661403AC
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5661403AC
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3575c10421aso13094635ab.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699163106; x=1699767906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvF15LFvBQY84iwNBpu3TLVx/pTBWpdLdbGbdaNvPss=;
 b=T1HDotw7HyW1w/CK8AvkfEPBGAmvNKye9Neg5A3CwFxIf1Ilmd1MtQQUtGut40/g/q
 tgWO1DaczqDRWb/wKCoQMbwTxAw9jIu8MLYgaUUEPlpEoia0sHAbqLWsfGCVFIC3uHWO
 2m8PXtmQC40fBtNJO4Nsa/WyjDeGTP9k4wrTd0rsbGALvF1Hg8V5GtyVk61FKqyFYuaN
 IMuSvW8eCfrjBXkm18op0xR+4kOJFgfRdnAkz/PoBe7qyAYyKBJXNJlDbygemnnZAxoy
 iXRB/wti5uLCUV64yoCMZXghx2wxdZ89qLxVR/hrMBV5qNZpeZQKEwMN2l6BhO3YQ9et
 qPXQ==
X-Gm-Message-State: AOJu0YxNS1p1ulKn6O9UGIfNcQRXlOiu0sFhWZQ1AA40Nf2JlAXZrFuC
 UjjzWcXKjZPq0Tz3mW4kuUuWvreUur8=
X-Google-Smtp-Source: AGHT+IEZGdCkac1XP+rce32A/YZcESvIWCkwRk4T4P873p9/iXGSve6W3YYpxxod8SUuM8nWt+//dA==
X-Received: by 2002:a05:6e02:1bac:b0:357:fb77:63bf with SMTP id
 n12-20020a056e021bac00b00357fb7763bfmr34825186ili.24.1699163106540; 
 Sat, 04 Nov 2023 22:45:06 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056e0213c200b0034e28740e35sm1675313ilj.78.2023.11.04.22.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:45:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:45:00 -0600
Message-Id: <20231105054502.2846404-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105054502.2846404-1-james.hilliard1@gmail.com>
References: <20231105054502.2846404-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699163106; x=1699767906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvF15LFvBQY84iwNBpu3TLVx/pTBWpdLdbGbdaNvPss=;
 b=Vp/T911cUW4MvcgQRGeSOQZHiyl7bZXaZqOKSQ0iKccz3+QN9FupcCacL8aMv4b6dc
 B9+x/Fev+koju094hMcAsmrGTmUgBnnAuE75ZKddmjtgw7+KJfSNoh9N7mBSyWWf/FWh
 MaF3Do+YYpT69iQgenUsV2/zEZJGJ3I4yM6ozZ/9aa5BjpIiRwPAwgYYKpoPW27nhaji
 XpNSXBP+Lz8VeaQLIJJaX5oVx/tRIdcOyYMuaz/MBOFj6SR9KbhdFL3/nzctL0B2QQAx
 Hydhmlhi2s8aIhW3PnqPR4lRadQOyXSCI3OFpRT+yL5QlGv3NLaNnzOMtFIEsLly6oGJ
 s8SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vp/T911c
Subject: [Buildroot] [PATCH 2/4] package/python-trove-classifiers: new host
 package
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-trove-classifiers.hash                 |  5 +++++
 .../python-trove-classifiers.mk                   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-trove-classifiers/python-trove-classifiers.hash
 create mode 100644 package/python-trove-classifiers/python-trove-classifiers.mk

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
new file mode 100644
index 0000000000..26b813eded
--- /dev/null
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
+md5  2afa6925489403b8025a1b66d990e760  trove-classifiers-2023.10.18.tar.gz
+sha256  2cdfcc7f31f7ffdd57666a9957296089ac72daad4d11ab5005060e5cd7e29939  trove-classifiers-2023.10.18.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
new file mode 100644
index 0000000000..d0d79d297c
--- /dev/null
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-trove-classifiers
+#
+################################################################################
+
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2023.10.18
+PYTHON_TROVE_CLASSIFIERS_SOURCE = trove-classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/5b/fa/49b6a09e4f389d4d9406d2947a685de1462ffb676ea6e61c50905e27b0f4
+PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
+PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
+PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
+HOST_PYTHON_TROVE_CLASSIFIERS_DEPENDENCIES = host-python-calver
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
