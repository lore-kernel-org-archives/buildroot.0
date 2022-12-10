Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207D3C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D2541505;
	Sat, 10 Dec 2022 16:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4D2541505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Q3CMBmDcHRR; Sat, 10 Dec 2022 16:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D92E414C0;
	Sat, 10 Dec 2022 16:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D92E414C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE981BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A0DA81B26
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A0DA81B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpBhEUHz23x4 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:17:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1761581902
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1761581902
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:17:53 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id b192so2298643iof.8
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F102v3dd4xWxTSPtarcrwFJ6O6Jl5vHzqMYdGq04hMA=;
 b=lozr3/pD/gIpRzqf7o1QpzSB+ySfMDxUoK3EgKhuouxUOMomoQWv6pjreAQV+2NIpf
 vxiPuvINOGan7r727/cvgHpsj5SK+Esf06oRWMxBVEKmxjJw+ulDvZgN21GT5k1YJuIV
 jYLwlPJV5EYOUnTll8knuj226yGiu9sIPamGUd4/MOz3hYE4CRM8mfMxTFQix06QQ7iN
 mv2+Wq2v1HrPQqfAIgLcVWU8I6zwbdt4R6K8kXr8Of5RhoCO6r/2YrxYnODnvSqtTZg8
 X598ASiWc5orVLHCK43GwxozxWBleB3iHBTz2dED9bvL9UUVJbEuGQIiebIDUsinn6Tz
 2RBw==
X-Gm-Message-State: ANoB5pmbsRckl2SfdpNf3rEB6O0YVWhDHlzGLwW4iQTJBr+gBPBnfZQU
 IEscHAwD3k4KhKq6CMzFVpq6p6BosLrD2Q==
X-Google-Smtp-Source: AA0mqf6NXAAoQMDjqg4qKMIS4cJdLsYDa6MekwIzqRWQsZ0ixb4snknh0iwHJQELgMiZvtbI06L1XQ==
X-Received: by 2002:a6b:d916:0:b0:6c2:b477:441 with SMTP id
 r22-20020a6bd916000000b006c2b4770441mr6004125ioc.9.1670689072969; 
 Sat, 10 Dec 2022 08:17:52 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05660226d300b006e25b512bdesm1931374ioo.33.2022.12.10.08.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:17:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:17:50 -0700
Message-Id: <20221210161750.2457193-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F102v3dd4xWxTSPtarcrwFJ6O6Jl5vHzqMYdGq04hMA=;
 b=AILfsMCJV/cIeKDDsVgDrLy9+2/LLw8mwQt3NIbQdBbfjD/VnILhso5c5AsS6wpDz8
 A+u53Dvyrc8bnMsjvTZGx/7uQOiX3BKdOnoYaX5R5cEyXRpYwal/xD5qBCeQfNcXIre7
 HQEd66DkCqMYlDgGIHoTQTijaTE1ErX0q6ANQnc1+CnO1ZR95hyKrRvxLY66+Ev5Susv
 tSO62vsTlmwYgVLnsAt1GAFq9Th3F5YOdxfby0kFklYDQxWZ3Mn1vULwLUyylO/U38OP
 2gmYOn06t+BeKgfrvefJeeDw9oS1moQkLXjzxE7jwQr23A/xL6sZBaxjoG4hRiT8BH7o
 XEAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AILfsMCJ
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2022.12.7
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
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 0557a5c97c..d3cf24ecfa 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  ff9c8d5c7e7fb083de6b874609c5ca68  certifi-2022.9.24.tar.gz
-sha256  0d9c601124e5a6ba9712dbc60d9c53c21e34f5f641fe83002317394311bdce14  certifi-2022.9.24.tar.gz
+md5  d00966473b8ac42c2c033b75f4bed6f4  certifi-2022.12.7.tar.gz
+sha256  35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3  certifi-2022.12.7.tar.gz
 # Locally computed sha256 checksums
 sha256  a02f6c638f9fb84d06f7764c3ab085d8af7eda5b93c166da54312479077c6fb0  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 8e2435199f..70f9e69d2c 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2022.9.24
+PYTHON_CERTIFI_VERSION = 2022.12.7
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/cb/a4/7de7cd59e429bd0ee6521ba58a75adaec136d32f91a761b28a11d8088d44
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/37/f7/2b1b0ec44fdc30a3d31dfebe52226be9ddc40cd6c0f34ffc8923ba423b69
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
