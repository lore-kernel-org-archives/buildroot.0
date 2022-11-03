Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017AEC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8398B81E97;
	Thu,  3 Nov 2022 00:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8398B81E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7sJodowUwDM; Thu,  3 Nov 2022 00:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8A0881E8C;
	Thu,  3 Nov 2022 00:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A0881E8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC501BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 169E560B9D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169E560B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6NRqU8QB7mC for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:12:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A587F60B70
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A587F60B70
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:12:05 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q142so152706iod.5
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxyEN8FmSVMkAxTamEXaz0hEyEuPbN5WSl+XD6LsHfQ=;
 b=zOOr+b8LQWiXua3z1I8M4X4dGnVV6FYlrYlvII9vwJEQD48IJLvZNQ6FkmY/WKOJxa
 6KOt5+G4NV179n+9IILt5QHWhnx37eKTL3DBUrvc8AiYMzOg/C8NGXdC9A3gSxdvCJ8+
 VpYP8mjdc2aLNEz2bqxR6zILvYuEfKc7GKIs9a2NakZV2pT5Az7ZBsi5aQhvJttc6Iuj
 uJJT0012ZOj5+ITK9DiQ0mdsC5IcmNTLQXYHMI6k96GtZVoUd2uM1+wZE7a6o33O6dpL
 2+js/6PkE7HH6G9/SD4FAHViaPX0RKrMI1FYdeOX44QK65yagvK85eVIsK3CpZ5ly9Bh
 nPsg==
X-Gm-Message-State: ACrzQf1vXZhhmisBN3qBQZaOGrG/G3/mZYgm5U7PEHHpwdSUjV3izcLY
 FfRLW2vSOCA4S2vVDZJvrAsG3XOuYEt+/lOy
X-Google-Smtp-Source: AMsMyM6CoeNjjsenoTB8jLyRHw3WAgMLSOWLXFqIQgFyvzsjC4axRMP0KKRQ6+pQLE/3WnCgPfX+7w==
X-Received: by 2002:a05:6602:2f0c:b0:6d1:c87:fe3e with SMTP id
 q12-20020a0566022f0c00b006d10c87fe3emr12548995iow.57.1667434324349; 
 Wed, 02 Nov 2022 17:12:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i16-20020a925410000000b002fc323a2902sm4956990ilb.62.2022.11.02.17.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:12:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:11:59 -0600
Message-Id: <20221103001200.1576937-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wxyEN8FmSVMkAxTamEXaz0hEyEuPbN5WSl+XD6LsHfQ=;
 b=dayMofKQUeSKeT1xk/IxtptnjQ4lbFEGwP1Jumv1f8i30Dk29ltlpl058hQWsQwqUi
 gWyRoFrgQvAoiV9+MztsvhH2z3X1Ym3OWAvAonijQp9eSHIKx4VjyXicwD4WWoF6UTKC
 o1cWtBYCjFCf01ocxJC9007euENwmKtzdNAh+F/RNmAv5uw0vkTivzmL9fYs1sbZwFq7
 axBSmVUjz+YRUajCtpSmFOKtTcn2FFUz23K0Frjl3e5d0gjJ3Ug9ndEuZUTe2a9L8PD1
 lkhuyu1u0eZnfKtwiH1CbDBAzEWGv3mW8SyiM8s9Zw/r3HxCqwXsTFvSNegWdWRH7KKf
 br2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dayMofKQ
Subject: [Buildroot] [PATCH 1/2] package/python-cppy: new package
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
 Esben Haabendal <esben@haabendal.dk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cppy/python-cppy.hash |  5 +++++
 package/python-cppy/python-cppy.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-cppy/python-cppy.hash
 create mode 100644 package/python-cppy/python-cppy.mk

diff --git a/package/python-cppy/python-cppy.hash b/package/python-cppy/python-cppy.hash
new file mode 100644
index 0000000000..45b78eab8e
--- /dev/null
+++ b/package/python-cppy/python-cppy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cppy/json
+md5  7c1f825c43dd66454440932a35b9969c  cppy-1.2.1.tar.gz
+sha256  83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b  cppy-1.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  db7a008bff1e63ccec397cfa033109740c4dc6cb12070a70d0cfe69aba27c4df  LICENSE
diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
new file mode 100644
index 0000000000..adadc352d3
--- /dev/null
+++ b/package/python-cppy/python-cppy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cppy
+#
+################################################################################
+
+PYTHON_CPPY_VERSION = 1.2.1
+PYTHON_CPPY_SOURCE = cppy-$(PYTHON_CPPY_VERSION).tar.gz
+PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/c5/7e/6cc5acd93752ee52d2f0423046072a2ce3ae16dfcd44373b9fe2a0222204
+PYTHON_CPPY_LICENSE = BSD-3-Clause
+PYTHON_CPPY_LICENSE_FILES = LICENSE
+PYTHON_CPPY_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
