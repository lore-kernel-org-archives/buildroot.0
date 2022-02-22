Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830CBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15609410A0;
	Tue, 22 Feb 2022 12:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZWHgyh1zHXI; Tue, 22 Feb 2022 12:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 094FE40350;
	Tue, 22 Feb 2022 12:49:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADC711BF97F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E118134E
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASOqfB8o1x3v for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 12:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67125813E6
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 12:49:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso1109236wmi.0
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 04:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=n8CKeEibN+blrNBZbp4xbMPqHfLjaYJ0OiwIcBnnO1g4tnn5mxcviZTexVgCvF05cB
 NMOIrbm4H2E2SI91AoqGg3FspHw84ePnZ7SWgHnRf8lcDonpvq1PDZBrdazQNXbfDsMk
 dcdAEWkDRRL1WAnVW3R7VDgB+zm8o9D4co+Umg6M6UwJVXVEqhcmnQThUfe0zB3k9IMj
 uuEV5OPjBoJfpsxKuxECbH8l9u5ftDIkrupvdPv8j4PgDtK49aYXnyTd3ogyf3sVMGkE
 mw3r9wx0UXj4EP/wQRmB4lsD3+cvKZ6BSkV7ItUC4PVcWAx5h3mwkFsLMngKVkzp4DIA
 bOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=AG55KRmnm8T9LvireTMgDGwnemT+ajtCyDvSyZsjKkcqSeqc13u1E9AMrzkI4huV63
 9AwdS4RGz5cz90ar9iT1uvJLJPmfPmsKCtTZ4aZelAcuycXBeR7P2B6xEoD39PnDyh8i
 IUo+rKIKU+sNzxDTYyGpFM6B4VrAXgJ9fTN2hnOBDCrZgbQkozYXG5XW4dI+JnAicIRr
 /+t5YHy2QnBKq71ZmGLHaXEvJvCUUZz+cIpJmJCLexx02HbTWi0ZqWRJOpxI3YeAY1sU
 tJ2zYBW//gqvAYj5FCHFLfP3s96s9we4ndUuT+YnBrUJszAWgTg80jNbNBlbmUHUZeGh
 hf5w==
X-Gm-Message-State: AOAM530W5LvxPS89VL3RRgNYiUw3A140FTpzs4ZsqiaUaO55zBSiceDo
 bkWx6Fb7vqcPKRiM3zZo9Nvx7TZBjik=
X-Google-Smtp-Source: ABdhPJxXZ4hNkYFl9wDj0k8+njwkQlkGBLUbVRCWva4Q2u76BLGjiqrOvyosqMb10C9jWuZkVHHXtA==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr3316729wmq.139.1645534146548; 
 Tue, 22 Feb 2022 04:49:06 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id bg31sm1428840wmb.1.2022.02.22.04.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:49:06 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 22 Feb 2022 13:48:48 +0100
Message-Id: <20220222124850.6050-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220222124850.6050-1-guillaume.bressaix@gmail.com>
References: <20220222124850.6050-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/4] package/python-beniget: new host-only
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
Cc: gwen@trabucayre.com, "Guillaume W . Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Generated with scanpypi and converted to host.

It is a dependency of python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-beniget/python-beniget.hash |  5 +++++
 package/python-beniget/python-beniget.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-beniget/python-beniget.hash
 create mode 100644 package/python-beniget/python-beniget.mk

diff --git a/package/python-beniget/python-beniget.hash b/package/python-beniget/python-beniget.hash
new file mode 100644
index 0000000000..cd4fa7b873
--- /dev/null
+++ b/package/python-beniget/python-beniget.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/beniget/json
+md5  a2bbe7f17f10f9c127d8ef00692ddc55  beniget-0.4.1.tar.gz
+sha256  75554b3b8ad0553ce2f607627dad3d95c60c441189875b98e097528f8e23ac0c  beniget-0.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  64ad3e304e9d2d8731c26ac3e652335a6016e38be2f71fe30350be51c6d500b0  LICENSE
diff --git a/package/python-beniget/python-beniget.mk b/package/python-beniget/python-beniget.mk
new file mode 100644
index 0000000000..9970546b14
--- /dev/null
+++ b/package/python-beniget/python-beniget.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-beniget
+#
+################################################################################
+
+PYTHON_BENIGET_VERSION = 0.4.1
+PYTHON_BENIGET_SOURCE = beniget-$(PYTHON_BENIGET_VERSION).tar.gz
+PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/14/e7/50cbac38f77eca8efd39516be6651fdb9f3c4c0fab8cf2cf05f612578737
+PYTHON_BENIGET_SETUP_TYPE = setuptools
+PYTHON_BENIGET_LICENSE = BSD-3-Clause
+PYTHON_BENIGET_LICENSE_FILES = LICENSE
+HOST_PYTHON_BENIGET_DEPENDENCIES = host-python-gast
+
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
