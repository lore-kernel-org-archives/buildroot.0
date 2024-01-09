Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE23DC47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF8C41999;
	Tue,  9 Jan 2024 08:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AF8C41999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_YG1gT8vrxg; Tue,  9 Jan 2024 08:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC5AA4194F;
	Tue,  9 Jan 2024 08:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC5AA4194F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 258401BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1A7760ED9
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1A7760ED9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ejadXJl88OS for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:36:11 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DFA960E27
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DFA960E27
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b7f9fdc14dso130010939f.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789369; x=1705394169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZwyQ5Z0GEdE8rZkr3Da97OD0po5xUhlkiA6LhN9reg=;
 b=wb/FaEM/1klnIwTkSG42sz8cwHxpl8d+nQ713qtCY2CXhn8JZ5gfo0cChJCOpbnFra
 a4OnqPBRT8Dc6BXj4E2KDkrPHOMXvJl2gxoYlpVy4uQMwiAaWXG8i0IMeYHyD8Lc4N+b
 /nfL+Vl+40ctX8Rb6qf1z6kyfQweBW6q1+pVNbO5+1YBa5ZgbjvaUan/uEP59B+wJd7z
 9Fgqj4Hxar9Po6u5X6bGMd3ofiG8dchY3EaOg1TR1H0RAphNzdot0UpnhmVk1my/Qw6U
 nAlUfXRW5KGN7uwfsh/s7r08vsAHqvqzwCUwYo8p4Y5uXX5FLMvej8NGHyltq8YXkrL/
 9vQA==
X-Gm-Message-State: AOJu0Yz9rXnUWfqdhe3HwTI93XA1+OfPsLcqkZJbtrXi1fsDrFQa5NSp
 fPrNT/dPIxBPcTr+nMKLqqBs6cwqIutLwQ==
X-Google-Smtp-Source: AGHT+IEOlNoPYqK8JKCvj8pQaoiOgserwaZXZI+g/rFy3l9Wbey1XfTBoEwA/vikaIpBemQ/BzRLKg==
X-Received: by 2002:a6b:5009:0:b0:7bc:293c:be48 with SMTP id
 e9-20020a6b5009000000b007bc293cbe48mr3735766iob.16.1704789369376; 
 Tue, 09 Jan 2024 00:36:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 t7-20020a056638204700b0046e08e513b2sm502312jaj.116.2024.01.09.00.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:36:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:36:06 -0700
Message-Id: <20240109083607.4082976-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704789369; x=1705394169; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cZwyQ5Z0GEdE8rZkr3Da97OD0po5xUhlkiA6LhN9reg=;
 b=Y5QZPkqDJqArX5MrQRWEhYTyzrpI34yw1L8IxiYeKuN63JNnLRcVn5CPYKt5mhEf/K
 UjV/9fE0zUyjYEdbeGBh6piBwgZQv5wRf3yDKbnoNJ/jMSWu4yuPpMtkWH2azx/fhwT0
 PcUIEAFa0tgMTvTSg/MCdfZkVNvNSxOfUFGWRCmGxLk05bj9ehgC1Qzlf0rbN8pIrUtx
 U36WSvaz2Dh5m5VnuxYDP6Y0O+xc8frNTJtPPuh+t5XEJWjx/CuBtNvN56aA6j6A4/tL
 ahmRxY8nhFcI2JgqKnyAWshFimi9InA7NCTBjbO3Cz7Z16QLbVJUsvL3zFsD/tue+GXq
 zePA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y5QZPkqD
Subject: [Buildroot] [PATCH 1/2] package/python-matplotlib-inline: new
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-matplotlib-inline/Config.in         |  7 +++++++
 .../python-matplotlib-inline.hash                  |  5 +++++
 .../python-matplotlib-inline.mk                    | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-matplotlib-inline/Config.in
 create mode 100644 package/python-matplotlib-inline/python-matplotlib-inline.hash
 create mode 100644 package/python-matplotlib-inline/python-matplotlib-inline.mk

diff --git a/package/Config.in b/package/Config.in
index f5d0c06334..811bb012a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1181,6 +1181,7 @@ menu "External python modules"
 	source "package/python-marshmallow/Config.in"
 	source "package/python-marshmallow-sqlalchemy/Config.in"
 	source "package/python-matplotlib/Config.in"
+	source "package/python-matplotlib-inline/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
 	source "package/python-midiutil/Config.in"
diff --git a/package/python-matplotlib-inline/Config.in b/package/python-matplotlib-inline/Config.in
new file mode 100644
index 0000000000..2ea9f4d966
--- /dev/null
+++ b/package/python-matplotlib-inline/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE
+	bool "python-matplotlib-inline"
+	select BR2_PACKAGE_PYTHON_TRAITLETS # runtime
+	help
+	  Inline Matplotlib backend for Jupyter.
+
+	  https://github.com/ipython/matplotlib-inline
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.hash b/package/python-matplotlib-inline/python-matplotlib-inline.hash
new file mode 100644
index 0000000000..7382fc3406
--- /dev/null
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/matplotlib-inline/json
+md5  aded9a57e2f526f76b3a4851d5528d4f  matplotlib-inline-0.1.6.tar.gz
+sha256  f887e5f10ba98e8d2b150ddcf4702c1e5f8b3a20005eb0f74bfdbd360ee6f304  matplotlib-inline-0.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256  8521b036c6448e0e0aa7213d4713b6fdee0f4c64c9f320450f77346bf5c0e8e4  LICENSE
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.mk b/package/python-matplotlib-inline/python-matplotlib-inline.mk
new file mode 100644
index 0000000000..c9c22605ca
--- /dev/null
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-matplotlib-inline
+#
+################################################################################
+
+PYTHON_MATPLOTLIB_INLINE_VERSION = 0.1.6
+PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib-inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
+PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/d9/50/3af8c0362f26108e54d58c7f38784a3bdae6b9a450bab48ee8482d737f44
+PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = setuptools
+PYTHON_MATPLOTLIB_INLINE_LICENSE = BSD-3-Clause
+PYTHON_MATPLOTLIB_INLINE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
