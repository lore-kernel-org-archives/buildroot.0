Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C273C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 03:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F18F426B6;
	Wed, 10 Jan 2024 03:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F18F426B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3DHosw0UkF7; Wed, 10 Jan 2024 03:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630004269E;
	Wed, 10 Jan 2024 03:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 630004269E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BB681BF23B
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 03:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40425402EB
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 03:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40425402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RXsS3D3fej1 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 03:59:16 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1509B400D1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 03:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1509B400D1
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7bee328027bso40548439f.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 19:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704859154; x=1705463954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yPPs4I9xKRUPTcgQfD0gkxhYecCk+P9FmKJis37EAuc=;
 b=RaGnzK88c5aCjOHBU0OMCNYJGRFJ2fyV7w2YzTOUUmR/slDi4ijyLy94EgDQw2ll92
 udjx/VlZLVP5bfQIDuTWnTcLfqebbyE3sILuVUd2vegISLD3cTcLyb6cUIlSev0a7SuZ
 y8TOyerP51XrYHX+CnWLk4OIb0FfjqR8EMM5RSSgLvmBkGlJTBEqQeJKbY4AcOCF7CS6
 GIE7fUgkJ20v9gNwoy6IdhHq/Fj6bDBheWu3ycQCiWKG04tE8B/dfHZZXekcnwkeBGz5
 Hbyc3K/O4xUwyULXTXwhArfMHy9x4uWBWvHg+NXjHHo+DaKGwYiZh30EGw7nJ3OWGoaZ
 HPMA==
X-Gm-Message-State: AOJu0YyjoBXHV3DcHGO9x1uK8VPK8xZ8I+IvAYblney6V8Z5pCAcOwkM
 DOGDk9cH1xIm8h8SzTo6e7Q6GDqRV7f99g==
X-Google-Smtp-Source: AGHT+IHy1a2fTYm7vedPcOMS913oUS68LVVDtH/G50RRTAUwyXky6z+G1o7DFzdZBNOUHP6v6OGwFg==
X-Received: by 2002:a05:6e02:b22:b0:360:8937:53e9 with SMTP id
 e2-20020a056e020b2200b00360893753e9mr676671ilu.45.1704859154628; 
 Tue, 09 Jan 2024 19:59:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 o10-20020a92c04a000000b003607f777e2bsm969729ilf.11.2024.01.09.19.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 19:59:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 20:59:11 -0700
Message-Id: <20240110035911.1020944-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704859154; x=1705463954; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yPPs4I9xKRUPTcgQfD0gkxhYecCk+P9FmKJis37EAuc=;
 b=adMVtN/3+0HgW90eIA3hc6G1vExvb4VFqjKBvwG7YdINqJ6oUkUSd3ibJwsldmzM+C
 n5NkZ2pMgu8bSOZt9EKaF2KRSGqIiKda52TuCx0gvsojI2QuAoUJ23BlsG/t+QhJ082r
 m4hKu1yseFZ/+RB3YrSYrAS00vNCL7Pa+Etkn+3UIRYFLvWTkrB3tbsbCP/FLYJwDeP/
 ctSQ5giNcJfWfws3Du4uy4uMdYwJEhSH48wR+QMNFeoCq0aDbdb8okx2W82hLejdaMhp
 KPqwyS5/A8j/v1Vztyhq/a6H3QvhNbFZjwYYNktENoJPSgIGVQtIkZNt7JA0qfQjAuPL
 iYsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=adMVtN/3
Subject: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: bump to version
 0.3.2
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from distutils which is being deprecated to setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
 package/python-ml-dtypes/python-ml-dtypes.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
index a440268e39..53bfacb528 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.hash
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
-md5  6adbb05530819bdb4a78d2372d187fe2  ml_dtypes-0.3.1.tar.gz
-sha256  60778f99194b4c4f36ba42da200b35ef851ce4d4af698aaf70f5b91fe70fc611  ml_dtypes-0.3.1.tar.gz
+md5  438c04dc0d941ec1b3b71667225c74c8  ml_dtypes-0.3.2.tar.gz
+sha256  533059bc5f1764fac071ef54598db358c167c51a718f68f5bb55e3dee79d2967  ml_dtypes-0.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 92d23bece4..b346dc5e9b 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ML_DTYPES_VERSION = 0.3.1
+PYTHON_ML_DTYPES_VERSION = 0.3.2
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/16/6e/9a7a51ee1ca24b8e92109128260c5aec8340c8fe5572e9ceecddae559abe
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/39/7d/8d85fcba868758b3a546e6914e727abd8f29ea6918079f816975c9eecd63
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
-PYTHON_ML_DTYPES_SETUP_TYPE = distutils
+PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
 
 PYTHON_ML_DTYPES_DEPENDENCIES = \
 	host-python-numpy \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
