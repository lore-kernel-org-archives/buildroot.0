Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F2EC61DF4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D12C40103;
	Sat, 25 Nov 2023 01:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D12C40103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 352db4e5pDXu; Sat, 25 Nov 2023 01:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5896B40108;
	Sat, 25 Nov 2023 01:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5896B40108
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 990911BF3B5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77FB3822DD
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77FB3822DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9B7JVqQ2YEwm for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:38:11 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 659F0822DC
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 659F0822DC
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7b017766ac8so74642139f.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700876290; x=1701481090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kkHMQhmx8sba28Mh1fe29Pb6fQmWwNJqwXLZ1LLX52k=;
 b=NkDVuvhxkoEARxyrBsBT16Ykbdm3mekzUqU0LybgWbfSHOjHPvR0qWwCF7715rBSuz
 B6169adqKrj+ROidPGKTvkqO2iQz8EL8oInkO0/6MxIGPIuMDmEnqgjCNkeq6ItG2MKi
 NwP/vugM6/fuGi+wHhKtXx5vVv+GkRJxPRSv+1DlEcxqhk9Oy5YS+t282QsbRf8w+QgJ
 PqSilomk7p7/+lo+b6VQPBRt8AW0QqLNMGZBJYXosXgceZupAtAarIdPscf4MRDX2vti
 e1OcPWnINKfD/og+tqaLEC+JixxHQ9oCW1rls/+0iP3SVbBG/Tggjj4ia9hm0sSjs9gk
 FuXA==
X-Gm-Message-State: AOJu0Yy1cnQhR4QgDwy73KAgYKyjhD31OEEFSpyKH/GLfIuzE10fGuEB
 vSbWkFtbgWbKxiQSdt4lGPEfOXXtdmY=
X-Google-Smtp-Source: AGHT+IEslw5XP6/lan4ZB4vgiwwjeDvmmZ9XwN6D0aHrbUDg1u5N5Gi3UVjoPtWtGlOGcVU8Yg2yOA==
X-Received: by 2002:a05:6602:2112:b0:7a6:966b:35a6 with SMTP id
 x18-20020a056602211200b007a6966b35a6mr5892546iox.11.1700876289860; 
 Fri, 24 Nov 2023 17:38:09 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 g1-20020a028501000000b004645642818esm1139552jai.35.2023.11.24.17.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:38:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:38:04 -0700
Message-Id: <20231125013807.213822-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700876290; x=1701481090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kkHMQhmx8sba28Mh1fe29Pb6fQmWwNJqwXLZ1LLX52k=;
 b=LI8jMKQptC5qjxGr6wv0FEcjau3Nc7Lj9H9ik7QwqPBsXYlSBIEmDzcsw/MeHNWQLW
 Q0CNHAHwFKhHV/XPxcsyQ4quDHIgTL7ysXJnPgmZFzOQq5/eFs1HfLwrFLAKv6wR6ACh
 HfrKoadXBw6RYaee/O27fqVVuY02tTekR1i+Oiha9QazP0n00HMks0fbJcKK77kfOXBZ
 5CP3QuEttoc6Ik0uLP1L4XWbOel3RnQ5XTuY79nZHVTrKO3KycXSL5A6Eu+Fqpxqvutq
 kCvRIU1fOvubDyzg26ce5AZ1tqPfnbcJcbFb4KpV3iqQwGrAfb2BWVl9UvqYMbZ9EpEd
 NvNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LI8jMKQp
Subject: [Buildroot] [PATCH 1/4] package/python-pyproject-metadata: new host
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pyproject-metadata.hash                 |  5 +++++
 .../python-pyproject-metadata.mk                   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-pyproject-metadata/python-pyproject-metadata.hash
 create mode 100644 package/python-pyproject-metadata/python-pyproject-metadata.mk

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
new file mode 100644
index 0000000000..51a3e4b85b
--- /dev/null
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
+md5  ca5e9527cff96153a976e14530b53746  pyproject-metadata-0.7.1.tar.gz
+sha256  0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67  pyproject-metadata-0.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
new file mode 100644
index 0000000000..6fac22abee
--- /dev/null
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyproject-metadata
+#
+################################################################################
+
+PYTHON_PYPROJECT_METADATA_VERSION = 0.7.1
+PYTHON_PYPROJECT_METADATA_SOURCE = pyproject-metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/38/af/b0e6a9eba989870fd26e10889446d1bec2e6d5be0a1bae2dc4dcda9ce199
+PYTHON_PYPROJECT_METADATA_SETUP_TYPE = setuptools
+PYTHON_PYPROJECT_METADATA_LICENSE = MIT
+PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
