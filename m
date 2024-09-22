Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE39ECF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E9704052D;
	Sun, 22 Sep 2024 08:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_h235X0esWa; Sun, 22 Sep 2024 08:58:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F9124053B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F9124053B;
	Sun, 22 Sep 2024 08:58:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 037841BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D9E6061F
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGaPh1m6Ibdj for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:58:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C8B860608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C8B860608
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C8B860608
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:58:22 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a08dbc6019so15409185ab.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726995502; x=1727600302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=82jOqmrjE6RjwvTsq1sSDijiOeafcGzFs6e8YywYV+w=;
 b=QIHzhwo7H5ABCe4KRqP8+C9vq4UD/LDkwPuH5fRIyLaQgQoegZPJ6NKTBl+Uw8YWvu
 om06gFLS3c0iMKcWlwIcIvPfTBKzr+mA4i1DXhJ0+DSDCItXrX6DAKeRA+CkMV/EdOEx
 PyOp3v3qZ+6eDMci54mPv8mG3L4ObO3ub+8/pyjpSiClocGhDbvSPeoOZaV7H+907/A/
 dzBFT2ecq8W7K9U5J9395cIF0xO+uGRBSE0Jz3xGZddRgGyRfNIktMofK3gaMs0GkSrw
 U8vIs/ZSM+1us6xGsTwY3/9o8qhle0BnnZudQDZOljtFl4VrkAZRoIFb2PwJVN+Ubz/m
 Yp1g==
X-Gm-Message-State: AOJu0YxI3RAeqVCT/37kfn0HwgFV5rKLm9ZEDzNl7wtIkzmexl2rZrDz
 ++3Y2TzXMIgtPWW2A1QOMtF9v51hFy9M+1YTcDqC4XbvwytPcOsCC490qw==
X-Google-Smtp-Source: AGHT+IFtz2rZLxiUB9Dxrwx+qubJNuqugJ41ochsPj869d35Tw5Y2xL4Fn93YIVKsrCvn5Zmr/eFOg==
X-Received: by 2002:a92:c269:0:b0:3a0:a08a:a0d3 with SMTP id
 e9e14a558f8ab-3a0c9d6f25emr57411425ab.18.1726995501618; 
 Sun, 22 Sep 2024 01:58:21 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e724desm53306975ab.62.2024.09.22.01.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:58:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:58:19 -0600
Message-Id: <20240922085819.1022144-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726995502; x=1727600302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=82jOqmrjE6RjwvTsq1sSDijiOeafcGzFs6e8YywYV+w=;
 b=PAnk5Sn4z+YdMiqAcAsX8ZsQKpEnMHi9cZz00UJ08jmN6EHDPgB/ucQSHj7+/6Xc/Q
 ZDzaiH6ZNjZT+uvbxBo2/L2G2h7pwXwyIYTHXNppdi34DzR81Hn1EfRyJc5vHxLQeR3/
 Dm8OZWFwEk9Hze7TZS9o9SGCeUXlCaXMsk06P6lC3Z8nZr/8oShetRuKf+xWC6B/dfb/
 NKJchq4hjitFX3onSPQ/mxLGVNFlQvdYNJAfyDg0ERPWp49Dkvb/CRbEBOAEeQMtApLy
 WfxV6KmfBnGABlVrWFuEMkLfQA08pIBD7ki+c+9nFkyJKCBzHFtWKT2ez5OiNGrnkEKe
 98Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PAnk5Sn4
Subject: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to version
 2.35.0
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
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 7351ceba31..688a38f925 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  7bad237adfde8f24d610d1f0595eeede  google_auth-2.34.0.tar.gz
-sha256  8eb87396435c19b20d32abd2f984e31c191a15284af72eb922f10e5bde9c04cc  google_auth-2.34.0.tar.gz
+md5  28fa1c797f8a75839337b742bd0582d3  google_auth-2.35.0.tar.gz
+sha256  f4c64ed4e01e8e8b646ef34c018f8bf3338df0c8e37d8b3bba40e7f574a3278a  google_auth-2.35.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 3e1aadc506..41c7bc9b50 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.34.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.35.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/0f/ae/634dafb151366d91eb848a25846a780dbce4326906ef005d199723fbbca0
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/a1/37/c854a8b1b1020cf042db3d67577c6f84cd1e8ff6515e4f5498ae9e444ea5
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
