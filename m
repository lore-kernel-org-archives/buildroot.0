Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B82C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71C154243F;
	Sat, 23 Jul 2022 19:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71C154243F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpehQKPWB7GR; Sat, 23 Jul 2022 19:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179174241E;
	Sat, 23 Jul 2022 19:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179174241E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9B71BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17942402D0
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17942402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X25T9fV_Ug2Y for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:37:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16058401B2
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16058401B2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:37:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b26so10700840wrc.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QBongafZ5iuS26CaPy2jkOVsZGTHNWD4rWSyyghvIdE=;
 b=qpDFucq5SnJoFRdkIYxly70LFup7Nl7+OIQ4YNkNeIJELDQHtMk7RseBU/fNExHh39
 uC0O+MsTnm9Kp1uXjM+aRsyHt/iS5k8FpR4InfpKkoZxQbtjRFVOv7QDIIlHZ4wBHZVr
 ES+o6JB/CnByib6G1i+FraLrX0gkMoOhPYhMZPRn8cehvMKGA8bmmvoL5XqzGjsX5Wgr
 I1H6pXjSABdXg2fgDA5Yt+4c/IV8o9gD2m7EzIvfpk8T0eyAVYbLge9wMhArGyNeL+LF
 PomewbbeYwV1IRlNRvM50/MPOdBMkOUXhJJYgghSlKj2VWQVrfu+SvcmSzM1brp4V2zW
 z4bQ==
X-Gm-Message-State: AJIora+TrYoJkKn945uAz7CqwHnnOyeq+DvFbQDSm9yWE8iUqY2Auz9Q
 zoKMha+QsNXSsYCf1MZ9AaysM3oua90=
X-Google-Smtp-Source: AGRyM1sh9Pgf68exmm+ymDNBBurLP6tT7OJ+z2KyqldaUf12haucTD2hulZF8ZFjfwGSnYFN4QqubA==
X-Received: by 2002:adf:df8e:0:b0:21e:4f87:6b42 with SMTP id
 z14-20020adfdf8e000000b0021e4f876b42mr3534804wrl.5.1658605068877; 
 Sat, 23 Jul 2022 12:37:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003a310fe1d75sm14115404wmq.38.2022.07.23.12.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 12:37:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 23:37:46 +0200
Message-Id: <20220723213746.6015-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QBongafZ5iuS26CaPy2jkOVsZGTHNWD4rWSyyghvIdE=;
 b=BgMP0UwtadchuWrm0uCktVGlgWW2V17X41RcaNyDb1dnBud0Hd4JWODSXQTTy8tfbY
 AldRPC/4eB9LUh0IAc+dzs7k/rjJDq4aE10NMLGJa3DsESWfLFCDStZHXNi/QIaXzzl0
 IQVnBgrrTS1w0+xmtCZULXn2U8rYxsiiscipzAH/8IajN2qnj9o9DquH1hE51O0QJNLB
 PlcDy9PS8OcRXlC1NEkGBp5xS5WW23eK27yr1wp+9TMGdChd79PFTzU8GWuVlkOfpLni
 6/3GX1yFLllm1pEV02oZg6KhzxX04SdXsLmKV3p18+AGYizoOrmhooWadZsMft5qe+P0
 57Dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BgMP0Uwt
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: security bump to
 version 4.9.1
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

Fix CVE-2022-2309: NULL Pointer Dereference allows attackers to cause a
denial of service (or application crash). This only applies when lxml is
used together with libxml2 2.9.10 through 2.9.14. libxml2 2.9.9 and
earlier are not affected. It allows triggering crashes through forged
input data, given a vulnerable code sequence in the application. The
vulnerability is caused by the iterwalk function (also used by the
canonicalize function). Such code shouldn't be in wide-spread use, given
that parsing + iterwalk would usually be replaced with the more
efficient iterparse function. However, an XML converter that serialises
to C14N would also be vulnerable, for example, and there are legitimate
use cases for this code sequence. If untrusted input is received (also
remotely) and processed via iterwalk function, a crash can be
triggered.

https://github.com/lxml/lxml/blob/lxml-4.9.1/CHANGES.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 3600d7759a..cd1943b0b4 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f63f62fc60e6228a4ca9abae28228f35e1bd3ce675013d1dfb828688d50c6e23  lxml-4.8.0.tar.gz
+sha256  fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f  lxml-4.9.1.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 90935a7ee1..050495c3f3 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.8.0
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/3b/94/e2b1b3bad91d15526c7e38918795883cee18b93f6785ea8ecf13f8ffa01e
+PYTHON_LXML_VERSION = 4.9.1
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/70/bb/7a2c7b4f8f434aa1ee801704bf08f1e53d7b5feba3d5313ab17003477808
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
