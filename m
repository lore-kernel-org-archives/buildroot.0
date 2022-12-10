Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A79C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 672FE60B2A;
	Sat, 10 Dec 2022 19:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 672FE60B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbpEThcXYfgh; Sat, 10 Dec 2022 19:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A504C60AE7;
	Sat, 10 Dec 2022 19:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A504C60AE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CADC1BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C8A34024E
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8A34024E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaw74hMr6r74 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:19:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D4840242
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30D4840242
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:19:44 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id z18so1528732ils.3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/kXonm8KC0df5GqZ62FO5o8m0VU/xGsyWBz+3ROT24=;
 b=f4sdFRglRwhPdjNdYQ6Y6X6RBKzV7uN8QjN9r3Ikov5GwENliOhxHv2rzOLKZJbjHg
 ZsUqZESLfkIpsnGRo+WOeM+Pf/+pcITyOqKq2V7G/u2b/BD5FVYstyVNfjKVfzGHRR0Y
 7IPXQ9pbtP3yqy1GP9VJ4v4soTl73HAIkDtMKaEu4Vo3FWl9o/u8t9xXX8+3lXDFqwaW
 rLjhv4hQrXRhy2meZam5+m4K1vFqbWOtb3AJc3DnYaq3cYZIcW4hzYBI+fZVh/JrrP93
 vujh7/SofMlmp///3MTLIKoIfd2J6SrPh/0GhYSyCCr7llkw5FoSVqrsmzXEy7dkt/Zi
 HVuQ==
X-Gm-Message-State: ANoB5pliwIyOdFdn01BuObaGskgPqOsmrGiYAq+BkzCzFClcfYwtwsny
 juuMJAA3rt4Mt4IRZbsa4K7jcmkD7pt+cg==
X-Google-Smtp-Source: AA0mqf7AOR54ty3ngaXlDysy+osOuIwT0HWKptiiyLVCA6bnCficJWxHcYWI+f5Ta56bsekCdnpuxA==
X-Received: by 2002:a92:d1ca:0:b0:303:2603:c00e with SMTP id
 u10-20020a92d1ca000000b003032603c00emr6036816ilg.30.1670699983077; 
 Sat, 10 Dec 2022 11:19:43 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y93-20020a029566000000b0038a06a14b37sm1621589jah.103.2022.12.10.11.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:19:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:19:41 -0700
Message-Id: <20221210191941.3092839-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h/kXonm8KC0df5GqZ62FO5o8m0VU/xGsyWBz+3ROT24=;
 b=B/0Wtz562wJZ7pXBJUgyAV9MJ5YhtZJHr0KmjsA2gMGbTL4jxUpfKp3xNE26rvtIbm
 Q78x34TNlGMZt76H4a8sOTjY4psPD0s884zk5DvkgRaFQYxpBhrZSHN3GtDN1XMP2PbA
 jsGgXeGEk5DlxB/9Btj6d2BJa/ii+ZSqlkU+/YXlaDFDt4cscnY3Flh1QW9iPZPR0nBl
 v4WXboWc3wZTVoROahqs7FAVUdc0PRdiAbN9aL2sF1vOSpNSGnUIVjQWxjxBmuUbDl9H
 83ChqLFdGcKmWcHr2CbnoltKZpd/b7tF5g6eu2ZmuvxIyzc/h3KAvuuPnvk2O+ywTzOe
 qBBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B/0Wtz56
Subject: [Buildroot] [PATCH 1/1] package/python-posix-ipc: bump to version
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/osvenskan/posix_ipc/commit/4db678001be2f16175c70cb88d4fb9f9126333f5

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-posix-ipc/python-posix-ipc.hash | 6 +++---
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 4258af6348..74d2db0f5e 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5  8c9443859492ecf3aae9182aa6b5c78c  posix_ipc-1.0.5.tar.gz
-sha256  6cddb1ce2cf4aae383f2a0079c26c69bee257fe2720f372201ef047f8ceb8b97  posix_ipc-1.0.5.tar.gz
+md5  81baeabebd3e4064972ec62fd9eace0b  posix_ipc-1.1.0.tar.gz
+sha256  f86a15b32b38573c78e305ebd9100d8198a3d9facc03ffafe39edc35833738e3  posix_ipc-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  61f0669e70518e6d32f87e485965fe9309de60e4bef938b29cecd068b3db9a98  LICENSE
+sha256  2b58f0bf31a8cbd7e56bfef030e9f7f02758ce8a810d073ccf41753bdc2a0747  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 359dee6d7c..c25af9ecbd 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.0.5
+PYTHON_POSIX_IPC_VERSION = 1.1.0
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/bc/2f/9a7901aa26fb0e02a671b989ba814d059a0f45af85cea31b9c9eef7e2dda
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/41/72/90b6702782921c0e3e0b10a66f2a47d8cfaf9c2255d763ab45cc8cea25eb
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
