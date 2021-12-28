Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47C8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 13:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B67260B01;
	Tue, 28 Dec 2021 13:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abOD9EGYOi-6; Tue, 28 Dec 2021 13:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9030060A85;
	Tue, 28 Dec 2021 13:43:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09E851BF363
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 055BC40145
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_04Odp0C9xJ for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 13:43:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B48F4013A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 13:43:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t26so38463155wrb.4
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 05:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XEagWQK3ZTWRtK7sliCLZokwPQh63NcQdEw69y0WIOQ=;
 b=kzSrl6sLPgw9AVcUJ8OjhmBREBiieWYzq4sC1IeNLKir7PpgYx7UsA1HCMD/TfQwRf
 8qdUhOumnaDPB2sI/AuqdXUElzR+9QpPVKPKQDfIjkfIzCu0uvxzyq2o0QFNadAsi/+W
 ETHsWT1aXYQXakDXGcaXntVNv7nRIS3zJkmdStsAU//sf/JXxwOU74wVldtWxDtmtxy7
 ya4T+2J6r6+zxbPWgoMB6GdfFjw7dTPRthFmUCFGUZiGK3HXnirI5NlJk4coUBOsTfzf
 RoDNNBSFBI019YF2Jf/RAyv8n4WLqwJcYAJ3c/ggTd9FxMpILtnUEAMKWgP+YkOrQ17Y
 Jwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XEagWQK3ZTWRtK7sliCLZokwPQh63NcQdEw69y0WIOQ=;
 b=stuOw7ceybJOxCAGzKf7F/leFr688lRNtoO+ZFANZNkKBvD7cm+GP2fWMRIDMuZEeP
 aBr/f5SkViwRF84pSF+2aciUkbCUHdGIoJOVN0n+IMGsrQMcpF0QP6tCpD/a+goQ/wdW
 gkjd/2AEgA/ZgqgdpAi819VCJwnTgcRXUMgGuzqKwgm/etm3FCGKnYUX70A/qjmNkSHy
 JDMho41QayE7xdoO7WcoYh6Q9VJ3TN65Ib/ri7dtIS6IAYaIMIQoFxv86nJpEf6vmh9w
 7U8FY4lP49TSD74+te52zfhCTX7IM4RlliYYRUkcyd98K67FniX5LQaKS6VNbEzKuxIy
 zqpg==
X-Gm-Message-State: AOAM5326PkfdzukY/tdQVpgydQWcQcIvLYfQgIHT0Gul39hWNnFs/RFF
 SkqL8RmyqcYuDrM3559vkSRhGU7qs8BkeQ==
X-Google-Smtp-Source: ABdhPJwuw/FpxINClJtbKbdrXMCPabYQ+PCF3jd1eJbSHD3zeCsKI/pY5t1yiocmckbitV4U2JcYvg==
X-Received: by 2002:a5d:588f:: with SMTP id n15mr16785380wrf.159.1640699010822; 
 Tue, 28 Dec 2021 05:43:30 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id l8sm18666603wrv.25.2021.12.28.05.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 05:43:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 14:42:49 +0100
Message-Id: <20211228134249.3690613-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-jedi: bump to version 0.18.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/davidhalter/jedi/blob/v0.18.1/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 018429bdfe..d0f083e942 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  72707c00e8d6d0b190a5e5664be1cac5  jedi-0.18.0.tar.gz
-sha256  92550a404bad8afed881a137ec9a461fed49eca661414be45059329614ed0707  jedi-0.18.0.tar.gz
+md5  d8dba4a98a35530f7f5b461c20aff180  jedi-0.18.1.tar.gz
+sha256  74137626a64a99c8eb6ae5832d99b3bdd7d29a3850fe2aa80a4126b2a7d949ab  jedi-0.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index bfe56b7c36..b0508de701 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.18.0
+PYTHON_JEDI_VERSION = 0.18.1
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/ac/11/5c542bf206efbae974294a61febc61e09d74cb5d90d8488793909db92537
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/c2/25/273288df952e07e3190446efbbb30b0e4871a0d63b4246475f3019d4f55e
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
