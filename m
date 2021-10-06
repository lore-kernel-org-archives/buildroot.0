Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1D9C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:39:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4263E610CC
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4263E610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09B7540901;
	Wed,  6 Oct 2021 23:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0lprCCq4AQc; Wed,  6 Oct 2021 23:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5458240911;
	Wed,  6 Oct 2021 23:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9161BF30B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5712260753
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reayACMWgtc9 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 23:39:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62C816071B
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 23:39:34 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id m20so3987185iol.4
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 16:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fnFWDhp1YQlNOgdurR+63X8WASenOyyhtc5kFU18DCE=;
 b=Ax5PdlzAPyitJVqwBMVP4O6e18fb349Vd6HjBLi5NAIOSgjd24BGwjd/evxgNE2yqr
 CCGjAgroE3rdKSSH68cdaWi17T2st2Bv5pfuLMqNHWjvcdkbsS5KkgLAgcE406OMW2Ex
 68UwZSgagkQNDi0eSFMbtrYvk0lG8gx0F3N5ybP8gabZ3VrqScYPeTDpn8AIZnIeT/Tc
 /lnuB3u3HJXLfE6R1qLtAUXfO21ux2+WBwvWsKkOLxatuPmfqVH5Bdr0K8mriqPwCN7o
 1g1PlxUnSvIy1RKF0Dgrlkb0t2tZkfpaPIzlI+PVA6l4xtEdmcYBxFi1niqcJzufuH07
 L9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fnFWDhp1YQlNOgdurR+63X8WASenOyyhtc5kFU18DCE=;
 b=1/CQV53W/m6WtAxUquiB80mMvVLaylKQM0OiuBAjLoox0p+8W8pAIi5R4HpEd0uDPm
 2zFbmo2ej9tH+kKd569WMYoXgp21SypB2j/7/VjzPXJ9PF10hhZ7TVmqJhsd5aVNg9YF
 Yac/YJ/ceiIfAWZ7BQkjUHqJk61q1qlVOUkvbebYFP6Z4BNVGu0MO0PWCuslI3Zu3iQw
 nIbxb7qGpvw+1aypoSdmsc6T/oQKtqUnbaCQUb//qaMuUdZIGJZntFfhlFGx9c83kLAP
 CdrZXVZ5h++Za8hcD+8xlnEmoIcmEEW1eu2q9WVvQVc86VVCZaNkYs5oyrGYcCg7Ved7
 HOGg==
X-Gm-Message-State: AOAM530zMMgb09URwffzf3bmNa33MYr10ZPYKm0wB4nN7I2ejvTUI/Q1
 OzaTNj90kgAVsliDWtNVNyMVowT7fx4=
X-Google-Smtp-Source: ABdhPJxFbPzb65+THiVEUh0diLHJjaIhYKCxdpwkiGXoe+SCnhU8kPeAW3apgZ/D+MqksppkIwW0UA==
X-Received: by 2002:a02:3b5e:: with SMTP id i30mr426577jaf.127.1633563572322; 
 Wed, 06 Oct 2021 16:39:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id o3sm12400335iou.11.2021.10.06.16.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 16:39:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 17:39:22 -0600
Message-Id: <20211006233923.3225201-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006233923.3225201-1-james.hilliard1@gmail.com>
References: <20211006233923.3225201-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/python-bidict: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                        |  1 +
 package/python-bidict/Config.in          |  7 +++++++
 package/python-bidict/python-bidict.hash |  5 +++++
 package/python-bidict/python-bidict.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-bidict/Config.in
 create mode 100644 package/python-bidict/python-bidict.hash
 create mode 100644 package/python-bidict/python-bidict.mk

diff --git a/package/Config.in b/package/Config.in
index 2f83c87582..91afefbb06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -925,6 +925,7 @@ menu "External python modules"
 	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
+	source "package/python-bidict/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bleak/Config.in"
 	source "package/python-bluezero/Config.in"
diff --git a/package/python-bidict/Config.in b/package/python-bidict/Config.in
new file mode 100644
index 0000000000..adbfda69b8
--- /dev/null
+++ b/package/python-bidict/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BIDICT
+	bool "python-bidict"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  The bidirectional mapping library for Python.
+
+	  https://bidict.readthedocs.io
diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
new file mode 100644
index 0000000000..59229f96d9
--- /dev/null
+++ b/package/python-bidict/python-bidict.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bidict/json
+md5  d9342771969dd0d42092a669ed6f3241  bidict-0.21.3.tar.gz
+sha256  d50bd81fae75e34198ffc94979a0eb0939ff9adb3ef32bcc93a913d8b3e3ed1d  bidict-0.21.3.tar.gz
+# Locally computed sha256 checksums
+sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
new file mode 100644
index 0000000000..bff10e4a82
--- /dev/null
+++ b/package/python-bidict/python-bidict.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bidict
+#
+################################################################################
+
+PYTHON_BIDICT_VERSION = 0.21.3
+PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/3f/81/7221b28d692af5c5fc180c4850b8e4a48c7db92b3d529b430488f67db74f
+PYTHON_BIDICT_SETUP_TYPE = setuptools
+PYTHON_BIDICT_LICENSE = Mozilla Public License 2.0 (MPL 2.0)
+PYTHON_BIDICT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
