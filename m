Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6D0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 17:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC08460A83;
	Sat, 19 Feb 2022 17:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ET7ysiXnYacv; Sat, 19 Feb 2022 17:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B3260A72;
	Sat, 19 Feb 2022 17:03:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 586671BF588
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 472BA82419
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LKKamOVTfly for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 17:03:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45DD181BC6
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 17:03:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h6so19671296wrb.9
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=iRNkFAX0i3H6EEQj7z8kjIz7wZHRLzaZ+5OZkVPiPn9JG90wZIKEftk4kQOceZQMgV
 yqDB50Yjm3DkQeJGnRWOS/rdCA3XPDQF34fuIkogwNMS5xc45BY14sOJf2bdudR87dOf
 1X6qkhuyGPtiBW2bEntSjEZmS8m9dsya+humlOkZVj4bV6WRSzz9SB488WIQ6XrhBvkV
 NPxsNDQbd6rxk2UdAsDzzk2pRhtPP/arpXTmiIDNsR35UXzt7hZ7lBpKemxoTL7833L+
 VYmNkbirrAUm+2lRmSFg41Zst3UzebPYgOQZCKbjdgRV3dDFMtKS1/s2b+N169RF9NGb
 SuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=0B+gXeOFthcLCr2lDdyp3jcPH5UAR0B1pkOdMV7Y+MsSWRMkbu50ypMt5yo2IH9gE7
 KhWfVrQWEp8Mln36Ti8q/WFZ8sGmWrlgOWh9T5EPoKX+H5q4KRIy1+sLe7Rox6vOuzUH
 n/KTmiwSGCySlgnB+rAHyv4LdyzlSTrhFVgyx2ErTOX623RshE4YR2dcepTpxNvyOHDU
 8v0Tg4hwjdkG/ffEaU/1sgNjNpGqKMTrDN8Ga/w2JEiBXnGkofgDhu0lVjJK374dqh6h
 4B7ggP70LbCjpm5AKOeykXYkqIvwO9kS5wF7dx76ka/RG+Aa3C+jx+dT0Zq/QIuhdxBH
 XOpQ==
X-Gm-Message-State: AOAM531O86uLkz2z3E2jitr/SVVhGb1afQR8WwNIHC+/qbhfffGOKjlR
 6I0xrwbAyDh3+2eL35N9cDlqyYsUgCCxNQ==
X-Google-Smtp-Source: ABdhPJxhTeNVfjnUIfh/02Ggx7Z04F0gW9DHv3j4DQCvbOQM7gyCSHyEUWrwyeeEQRrcQRghysXwWQ==
X-Received: by 2002:adf:f2cf:0:b0:1e6:2b26:1eec with SMTP id
 d15-20020adff2cf000000b001e62b261eecmr9718076wrp.499.1645290183191; 
 Sat, 19 Feb 2022 09:03:03 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id a1sm28034291wri.36.2022.02.19.09.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 09:03:02 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 18:02:07 +0100
Message-Id: <20220219170210.11691-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4] package/python-gast: new host-only
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
Cc: "Guillaume W . Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Generated with scanpypi and converted to host.

It is a dependency of python-beniget and python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-gast/python-gast.hash |  5 +++++
 package/python-gast/python-gast.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-gast/python-gast.hash
 create mode 100644 package/python-gast/python-gast.mk

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
new file mode 100644
index 0000000000..f16d001a6a
--- /dev/null
+++ b/package/python-gast/python-gast.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gast/json
+md5  fdff900805e03e9dd76d377eb4cbaed7  gast-0.5.3.tar.gz
+sha256  cfbea25820e653af9c7d1807f659ce0a0a9c64f2439421a7bba4f0983f532dea  gast-0.5.3.tar.gz
+# Locally computed sha256 checksums
+sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
new file mode 100644
index 0000000000..e02e87fb23
--- /dev/null
+++ b/package/python-gast/python-gast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gast
+#
+################################################################################
+
+PYTHON_GAST_VERSION = 0.5.3
+PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/48/a3/0bd844c54ae8141642088b7ae09dd38fec2ec7faa9b7d25bb6a23c1f266f
+PYTHON_GAST_SETUP_TYPE = setuptools
+PYTHON_GAST_LICENSE = BSD-3-Clause
+PYTHON_GAST_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
