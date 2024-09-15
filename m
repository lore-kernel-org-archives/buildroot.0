Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26EFC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9533580C5D;
	Sun, 15 Sep 2024 22:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHTthJ2XhNTA; Sun, 15 Sep 2024 22:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 990A981277
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990A981277;
	Sun, 15 Sep 2024 22:34:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E62291BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1DA940A1F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYDnfLdZheAD for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:34:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82325400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82325400A4
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82325400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:34:24 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a0981e63ecso9306615ab.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726439663; x=1727044463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PMIF93IEWehOFG9KauIVJAay0bUj+zTWYfmFvLID5Fc=;
 b=ZR20GmfvcVeMTlJiIm/NlXCOUDaUf/7PSangPKrOfUXpgjoY9kxf3ZxRL+S8NTLZyR
 +522/XAsm1H28BY2EOfIWNHUINtN07AHf6vZyHX7PSjgUlc4Otu4t1j+1SeB9o2Vje+I
 2JcrmB8vTeYtEiK/w2iJkuAhiVkk+Is9XiUX8/z0wEPJ3X7bOnluw9ASiD+Bd3Xvn5f6
 IkOeDogKWIhLkSiyOFUiihUB6b2ZmGQmrJUe67BpCsDn5PtGcaSTbPK8tRGwCiSdzbPH
 bOQelOjyu0lnA8eHrxJqd+19o3fwFZN/3YO/uVb/BIfaGMHED6Cn2gFhydTFJK8ZbcXc
 C8PA==
X-Gm-Message-State: AOJu0YwkCLXcyBYWFJmyBa7cTHgDjP8n6PxV9wDxYtNJC0yhtDhwOyFX
 sBoKYwW7t75TuBaEj2Zm66r4Gblgcm1BY7r5jmo0tCFkW1QMNImhnO2a1Q==
X-Google-Smtp-Source: AGHT+IEw6w52EwWs+BE5wBf6PND959Y0oF934498PXVrMkzA6bkhHwtgqDxcrEwqk0u+KzpakENMPQ==
X-Received: by 2002:a05:6e02:144e:b0:398:4bda:cf66 with SMTP id
 e9e14a558f8ab-3a084942bdfmr148083865ab.18.1726439663111; 
 Sun, 15 Sep 2024 15:34:23 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092b83b33sm12750705ab.0.2024.09.15.15.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 15:34:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:34:16 -0600
Message-Id: <20240915223416.1666437-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726439663; x=1727044463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PMIF93IEWehOFG9KauIVJAay0bUj+zTWYfmFvLID5Fc=;
 b=Lv1bmcAlywYY8HFQvlGTjn0v0NqXkmO4reUhM4ugvOmfJ7rU3wj3lQ5v4geJn5BPGW
 VUZKaqnVm4OZTy8hz8tDBTjVv77WRQnwpY65eCBM9kb+YNOXdrXa6sgOx3O8H1PT63Eh
 aY9s5FhvLRitFu6Z5MlC2lMdLOrreb/M5GlACf0D8pVvKhFCJqPJBueqROyPgTcsNqr/
 feR2MWcWm2owa86pYlRAmHfks8WwU6zB8JdJgN19RtESJNJH5+UOkbou5OAX2Wvc2b8v
 oUvKekLSER2kbb685YRuqWcxWjaIv95YWXE1HXHxLY/LK9Us8ieLf2EuttBJL05V2vVQ
 gcCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lv1bmcAl
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 3.22.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

License has changed due to year removal:
https://github.com/marshmallow-code/marshmallow/commit/033277809382a496d7004b1e944423fd86fb65f9

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-marshmallow/python-marshmallow.hash | 6 +++---
 package/python-marshmallow/python-marshmallow.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index cb60216a26..e71425d958 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  c6093f980a650b1088bbc5610055a05c  marshmallow-3.20.1.tar.gz
-sha256  5d2371bbe42000f2b3fb5eaa065224df7d8f8597bc19a1bbfa5bfe7fba8da889  marshmallow-3.20.1.tar.gz
+md5  55bc9b09b8557d53541521b723232133  marshmallow-3.22.0.tar.gz
+sha256  4972f529104a220bb8637d595aa4c9762afbe7f7a77d82dc58c1615d70c5823e  marshmallow-3.22.0.tar.gz
 # Locally computed sha256 checksums
-sha256  759dc79c383ad79340c6e41f712e80407fe0d2cb3cbaad1ed98aa9c3e28a602c  LICENSE
+sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index afd4068f44..811e532155 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.20.1
+PYTHON_MARSHMALLOW_VERSION = 3.22.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/e4/e0/3e49c0f91f3e8954806c1076f4eae2c95a9d3ed2546f267c683b877d327b
-PYTHON_MARSHMALLOW_SETUP_TYPE = setuptools
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/70/40/faa10dc4500bca85f41ca9d8cefab282dd23d0fcc7a9b5fab40691e72e76
+PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
-PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE
+PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
 PYTHON_MARSHMALLOW_CPE_ID_VENDOR = marshmallow_project
 PYTHON_MARSHMALLOW_CPE_ID_PRODUCT = marshmallow
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
