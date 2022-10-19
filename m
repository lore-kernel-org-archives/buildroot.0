Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E816CC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94E24403CA;
	Wed, 19 Oct 2022 21:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94E24403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qR9o7j1-PMep; Wed, 19 Oct 2022 21:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65732402F6;
	Wed, 19 Oct 2022 21:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65732402F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2546C1BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F38104016F
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F38104016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHZynx7Qs24p for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:53:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE3F04013E
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE3F04013E
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:53:57 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id r20so9913871ilt.11
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EMe/8IE7bt1ytBk4WkRqfqMx0BztZnxfEa8PxRDxkQ=;
 b=V6zhU4tky1tTfHBQ6upUB/BXzTsXnIH0A/9eS8aSSA/WK7QB5REP8gO6CpNOi/ndGy
 mpeiEnwd9Zl4vARlud3xUqbTNHfCqaUdcaNEYgHysUXDADPMXUlbz5Wc12xDVqeqymL2
 eUczMbmHdAZ99Gu2NjAav/x2btiVIhZWMGNTI2BVR3boAgEfqvkuhCv/EjLXXLG7l1DQ
 TaJmdQrFtjT88zYXuuwb1X5moeh+aMgzB+nxjpcyyEfVWtHMK9vWPqEvMwoHVXhvqj09
 zo8mXC9wBl5OzZoPtHrbbDbMmFyIzUjIGLYC+MshvrExvDD/dIpolmHQNjtvvEvGIRmV
 oK/A==
X-Gm-Message-State: ACrzQf0EIXq972XdePkaakdeeX/zTaJjLpJUd2SWBWU0t6vgAEAKkTPM
 IUu6iZJfzR0E7vWM94i9xoiNPW3VtzjDXw==
X-Google-Smtp-Source: AMsMyM6GeNL9KN8JpZ/c7tMm99i57L0T1FblVelV6Ca0iO1ZHsoTHOuPzq8xk/jHwwybRujNdZVfgw==
X-Received: by 2002:a05:6e02:1b8e:b0:2fc:5417:8d29 with SMTP id
 h14-20020a056e021b8e00b002fc54178d29mr7732604ili.304.1666216436512; 
 Wed, 19 Oct 2022 14:53:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v3-20020a056602058300b006bc69b0fa07sm2645358iox.12.2022.10.19.14.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:53:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:53:47 -0600
Message-Id: <20221019215348.3262192-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019215348.3262192-1-james.hilliard1@gmail.com>
References: <20221019215348.3262192-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EMe/8IE7bt1ytBk4WkRqfqMx0BztZnxfEa8PxRDxkQ=;
 b=H2lpYVaFbJZh4ePtn8AAd1RzTA8fzhecxXc366rqRXfb+0sgoUTz4+Oo5hOWZgQrSh
 F8QAyYZTe9+LVh3taX6sSt7lKSqIyZBWpikDzzrP7SnVPM+f7k8AJlCZlsFfX3+vIeAb
 ztfS0knZ2cAsllbn9eLx/U8gJOhuIabx7UUOsStJva3nhCUezBNUcQ9jix2m5APr3Qel
 cEWlEfVBl+PkNkH2fwF821960rCxT+wFZunTKgVRKPeshGWrmUWkc+SEzWDMDzyEomee
 hFvsbbnvijLjEKId5mrh8ti5i6rZtmYSp26NWOtc3oyOMsVZTlu9fzTf3cCngcFy1N1m
 S7Og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H2lpYVaF
Subject: [Buildroot] [PATCH 6/7] package/python-hatch-vcs: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/python-hatch-vcs/python-hatch-vcs.hash |  5 +++++
 package/python-hatch-vcs/python-hatch-vcs.mk   | 17 +++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/python-hatch-vcs/python-hatch-vcs.hash
 create mode 100644 package/python-hatch-vcs/python-hatch-vcs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index df61582cd4..c917cbe12a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1385,6 +1385,7 @@ F:	package/python-frozenlist/
 F:	package/python-greenlet/
 F:	package/python-hatchling/
 F:	package/python-hatch-fancy-pypi-readme/
+F:	package/python-hatch-vcs/
 F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
new file mode 100644
index 0000000000..e57eeddd2f
--- /dev/null
+++ b/package/python-hatch-vcs/python-hatch-vcs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
+md5  e56b6d0c05cfb9b59d493c67f94d6e48  hatch_vcs-0.2.0.tar.gz
+sha256  9913d733b34eec9bb0345d0626ca32165a4ad2de15d1ce643c36d09ca908abff  hatch_vcs-0.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  117aa5006d8475562f04442ab06dd2a4c501af3a77255eae0deef1f0c2499a1a  LICENSE.txt
diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
new file mode 100644
index 0000000000..55c6461751
--- /dev/null
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-hatch-vcs
+#
+################################################################################
+
+PYTHON_HATCH_VCS_VERSION = 0.2.0
+PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
+PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/ac/13/b3d83564c0cc0f1d45b4ea2a78b87b383a8165797613fedf11f1a7e49b48
+PYTHON_HATCH_VCS_LICENSE = MIT
+PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
+PYTHON_HATCH_VCS_SETUP_TYPE = pep517
+HOST_PYTHON_HATCH_VCS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-setuptools-scm
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
