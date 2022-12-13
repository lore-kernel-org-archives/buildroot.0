Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6818AC00145
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 01:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 017FB60E7B;
	Tue, 13 Dec 2022 01:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 017FB60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCH0LsQ8--1O; Tue, 13 Dec 2022 01:51:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385E760E78;
	Tue, 13 Dec 2022 01:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385E760E78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 032601BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 755DE400DD
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755DE400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_eWffaH1iyT for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 01:50:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A22D40193
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A22D40193
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 01:50:18 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id x11so4339133ilo.13
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGMNaaZZwKMn4hUxfilc8BVEdXo36l7ZyR+Q3oOg4js=;
 b=yZnwqQ0euQJCihLbcr/AL6ftCmSraoy+whetng/2lud4afXZGlIUSiELuccFNoeamC
 Ev0vVmkiq5teIOLfg8pUuU+hbV+6cv5s+x94Zag2LUqGymJhEy+DSncEAlhMd4wNtgHU
 Tp1q2oPaYwiGq6ixfva0G5ARyRB5D9nkaBEplc+viRNkVgJ5vuhVjgoY2CgU48Dzjfim
 RwlA7HEZP+NQOfICLOnYJLELC2UOgjMTfXU7xtHs5T29JRQaSmXOuQNWniTnFhvs9ppP
 dJVa940wofpyYWUbhImiilFUp8yJ5odPvrvtJUTtUGfx4jfL8yssMKL+4Va5ijpKX28a
 etmA==
X-Gm-Message-State: ANoB5pmLkOBkNmLF8vIKntz4GAdfuR7rFWNPNx1m2e4NetzDNnjfA0Lj
 9/AcIruvPfhchhBjpqYfGU0CdGI6G3yfKA==
X-Google-Smtp-Source: AA0mqf6yN4lAuQUedx8mrCX8OpmRCu+wlMKB/PwO7B5aDYtMM88ib8IvqlBisVNleN8rir0Su2viVw==
X-Received: by 2002:a92:cf4f:0:b0:303:2930:509c with SMTP id
 c15-20020a92cf4f000000b003032930509cmr9732601ilr.6.1670896217446; 
 Mon, 12 Dec 2022 17:50:17 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b003760a908bfasm413354jab.169.2022.12.12.17.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 17:50:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:49:57 -0700
Message-Id: <20221213015001.4175808-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213015001.4175808-1-james.hilliard1@gmail.com>
References: <20221213015001.4175808-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGMNaaZZwKMn4hUxfilc8BVEdXo36l7ZyR+Q3oOg4js=;
 b=A/MU8TKsbLHHVRCTHEEkP7R7DCdYFLPopkX3YGeYED2gj74n2d5cUPo2ccLPVFvYWk
 N7yhqHlP3yB9ZZO6a8UHDp60ZFepPMuclQd2vP18L+7AQcftDbDcWIwTQ5P0si+Qyfeh
 +hVoeRiDO5rPb4E+SL8sYs+kI2V0eUkQNNHTkm3A2ICyKjcBsLELEkxDKVB8Yv412X9Y
 sQhOoeHWc86GbaI5ea2Ga75U3bC5DK7xtL9GxSlgON/22+pRZ0slS/kcUAeCFhh4qp4c
 yt4yf/rLOXez9Bj+Z9iETEsmI9qSpm4Ovp3cCAWTgMC4eP3qM5Eby9+hvU9PjBvfRWNX
 rPnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A/MU8TKs
Subject: [Buildroot] [PATCH 3/7] package/python-outcome: new package
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
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-outcome/Config.in           |  7 +++++++
 package/python-outcome/python-outcome.hash |  7 +++++++
 package/python-outcome/python-outcome.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-outcome/Config.in
 create mode 100644 package/python-outcome/python-outcome.hash
 create mode 100644 package/python-outcome/python-outcome.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dc3d012de7..f25ef3094a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1383,6 +1383,7 @@ F:	package/python-logstash/
 F:	package/python-maturin/
 F:	package/python-multidict/
 F:	package/python-mypy-extensions/
+F:	package/python-outcome/
 F:	package/python-pathspec/
 F:	package/python-pep517/
 F:	package/python-pycares/
diff --git a/package/Config.in b/package/Config.in
index aa8825d3e1..877a205366 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1144,6 +1144,7 @@ menu "External python modules"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
 	source "package/python-orjson/Config.in"
+	source "package/python-outcome/Config.in"
 	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-paramiko/Config.in"
diff --git a/package/python-outcome/Config.in b/package/python-outcome/Config.in
new file mode 100644
index 0000000000..bd51f3daea
--- /dev/null
+++ b/package/python-outcome/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_OUTCOME
+	bool "python-outcome"
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	help
+	  Capture the outcome of Python function calls.
+
+	  https://github.com/python-trio/outcome
diff --git a/package/python-outcome/python-outcome.hash b/package/python-outcome/python-outcome.hash
new file mode 100644
index 0000000000..43796e89ac
--- /dev/null
+++ b/package/python-outcome/python-outcome.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/outcome/json
+md5  58612ee4407901985f85ad3869dd83b8  outcome-1.2.0.tar.gz
+sha256  6f82bd3de45da303cf1f771ecafa1633750a358436a8bb60e06a1ceb745d2672  outcome-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-outcome/python-outcome.mk b/package/python-outcome/python-outcome.mk
new file mode 100644
index 0000000000..27d7fdede3
--- /dev/null
+++ b/package/python-outcome/python-outcome.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-outcome
+#
+################################################################################
+
+PYTHON_OUTCOME_VERSION = 1.2.0
+PYTHON_OUTCOME_SOURCE = outcome-$(PYTHON_OUTCOME_VERSION).tar.gz
+PYTHON_OUTCOME_SITE = https://files.pythonhosted.org/packages/dd/91/741e1626e89fdc3664169e16300c59eefa4b23540cc6d6c70450f885098f
+PYTHON_OUTCOME_SETUP_TYPE = setuptools
+PYTHON_OUTCOME_LICENSE = Apache-2.0 or MIT
+PYTHON_OUTCOME_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
