Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A8CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DF8840153;
	Wed,  2 Feb 2022 03:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKcD2ZVWO6aQ; Wed,  2 Feb 2022 03:58:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D0FE400D8;
	Wed,  2 Feb 2022 03:58:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9F01BF95D
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 372186072A
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7xEwClPE-9V for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:58:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63A836061B
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:58:51 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id z199so23861273iof.10
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LsyItuxz4bJ7kzecp8c96MC5FSdbVCyJaDj+vhSGGzQ=;
 b=haOJkWBMeH5fMdJxpqcmeMxuBectSotbRrGKsFGEMceJxAJOS9h5Fs2yy1ZYC/k6jS
 h9sw35NVAslneCtBbO9jJXSAlzHr9qNGbAHxq2bjpQiEaFiYTdQ9KpvsI3BUB9y9ujnK
 RyYh7qyMZpHz8teLlq+JO3KLTdRFJ9yNxaxMkzFW443lzv2I8ukTja3eI7+DxkbGRmqS
 6XNg/w2ha90g8sdaDQoKWISr7UW6fo1fEFfAAX87ZDGKimdQMZnqb56NCOjWeIWOxMJE
 StSt4ooP4hGa99pxPQR2sr6Ej2q/C/PlZ92F45qeoGAIaE1r5sreU+SoVnax7HStYLQn
 cnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LsyItuxz4bJ7kzecp8c96MC5FSdbVCyJaDj+vhSGGzQ=;
 b=mz+JxQMJPh3RI2oOim+w5ZUXtoHDCNBBXpq7lXylCa+4Ih3B5MJPp/Vn7lKX2aTO/u
 iCt9W2g2BOWo+RFPdga/09kHtmKIQHVOdVniJ0iJlCZqrT4xbnB1VI4upa3CJSK6+MTW
 4pGaIQ6mulFUEYFfzWlCkHpmJxe2blvrm4mVLBNGl+W9GMqhY2vYvOjuM2e5tXGIWtw8
 Otzluax5ysUG+JCVvHjTzumsUujPIQkUGAj+WLrHjItwP+i6Syqhd2GXtDrt0SmeTOPb
 BDzsbQf7TR52kM9ibw1oR/wFHgSMIKqCvoGWs1wvvUAVUzAu99Ipqz7GvVw6EmR5+sPa
 lLKg==
X-Gm-Message-State: AOAM5322z+UieqAZVVS9bpo4ASdr+jivLfr5LmxXquh5ZYSpsqmLWdd4
 MRYK86haAoVoRbU8A5IMB1cRVmSaBz8=
X-Google-Smtp-Source: ABdhPJzF9oyw0S0E8TS5oTXxpwtRXe84CY3smWJsE+e86xWW47m/W4MMOP1CyigizJvTgxUakhDCxQ==
X-Received: by 2002:a05:6638:134a:: with SMTP id
 u10mr6858975jad.264.1643774330325; 
 Tue, 01 Feb 2022 19:58:50 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id 193sm15387272iob.17.2022.02.01.19.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:58:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 20:58:47 -0700
Message-Id: <20220202035847.2194218-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-janus: bump to version 1.0.0
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

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-janus/Config.in         | 1 +
 package/python-janus/python-janus.hash | 4 ++--
 package/python-janus/python-janus.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-janus/Config.in b/package/python-janus/Config.in
index a1ba0463f9..38e4b7217f 100644
--- a/package/python-janus/Config.in
+++ b/package/python-janus/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_JANUS
 	bool "python-janus"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Mixed sync-async queue to interoperate between asyncio
 	  tasks and classic threads.
diff --git a/package/python-janus/python-janus.hash b/package/python-janus/python-janus.hash
index 7d914389d2..7f7ce35caa 100644
--- a/package/python-janus/python-janus.hash
+++ b/package/python-janus/python-janus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/janus/json
-md5  dad6a03e7664cb800ce45ef8bcf12439  janus-0.6.1.tar.gz
-sha256  4712e0ef75711fe5947c2db855bc96221a9a03641b52e5ae8e25c2b705dd1d0c  janus-0.6.1.tar.gz
+md5  2d8c0b884c14f18fc5223858eb16461e  janus-1.0.0.tar.gz
+sha256  df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643d3ad0e10de058cb1612  janus-1.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8b177cccb6ddec12a9fc97bd49e7e2bbcd92464625624bd8bdbfad799ae606e9  LICENSE
diff --git a/package/python-janus/python-janus.mk b/package/python-janus/python-janus.mk
index 2b08733c18..43df87870d 100644
--- a/package/python-janus/python-janus.mk
+++ b/package/python-janus/python-janus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JANUS_VERSION = 0.6.1
+PYTHON_JANUS_VERSION = 1.0.0
 PYTHON_JANUS_SOURCE = janus-$(PYTHON_JANUS_VERSION).tar.gz
-PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/7c/1b/8769c2dca84dd8ca92e48b14750c7106ff4313df4fee651dbc3cd9e345a9
+PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/b8/a8/facab7275d7d3d2032f375843fe46fad1cfa604a108b5a238638d4615bdc
 PYTHON_JANUS_SETUP_TYPE = setuptools
 PYTHON_JANUS_LICENSE = Apache-2.0
 PYTHON_JANUS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
