Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB30C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 00:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD9160BB5;
	Fri, 23 Sep 2022 00:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD9160BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgAouLca5g1l; Fri, 23 Sep 2022 00:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA43660B9A;
	Fri, 23 Sep 2022 00:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA43660B9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 182B01BF286
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 00:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01132403F7
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 00:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01132403F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wIHSZtTtsnzk for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 00:42:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A29FF4019E
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A29FF4019E
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 00:42:15 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-127d10b4f19so16263958fac.9
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 17:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=lgXZQ9l+aYOuOgPuFAQSDnCusHrNeBN41tB214Z39Qw=;
 b=wdYQUt7HXqK6hIlDolNF1d5d0BcFT7LZhxbsd8JyIuhVX0DF10nYEAUEy3Oogr16AP
 gh5M8DvZODYvJ6nLSNEle77/KKzF/p5ztmBUHthi5THvRnS+fE7jR1jhxH164XkY9Y6G
 2BWgMfzaiQRUIzFG/TV7xiA8+k/k/FLDWi6aOJYGY2Tcr/XUYNZEqYgbDFB1uPbQaefU
 zEAK9R+9MLTuRLD93bjXF5tfwLWMiq76YPKh7btSHM1V+YGO3iQpehZIOg+QHaIBmUhR
 Ir852VoI1XofJvW+3KEDq6zaXvCfUZyyuH1XuEqoT0jvwOxR6g/an8FexBcZvEpVzJ1d
 sAZg==
X-Gm-Message-State: ACrzQf19qoNUEvpLtRoAoHzehzOqbN7C8ARITfyAMhx6n6BKL+gQQGP7
 0k7sqrYX12oMWMj4SSwTCHrCTf6MIFK3EA==
X-Google-Smtp-Source: AMsMyM66U3EuKeYexduA9Ks3BWtUV1CnlV8OkAoG+yEp+KZ29e892jdNSTDq2Ee7D7DkH4SZwd62OA==
X-Received: by 2002:a05:6870:58a6:b0:127:86d4:6707 with SMTP id
 be38-20020a05687058a600b0012786d46707mr3491691oab.88.1663893734291; 
 Thu, 22 Sep 2022 17:42:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o17-20020a4ad491000000b00435a59fba01sm2687258oos.47.2022.09.22.17.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 17:42:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 18:42:11 -0600
Message-Id: <20220923004211.3190761-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=lgXZQ9l+aYOuOgPuFAQSDnCusHrNeBN41tB214Z39Qw=;
 b=ck6wrQNO9b9AprgV/iT1zKWM+G/oTSHZFjDmKB4UF7uau2TeQukMGI2iNgII1AQR9X
 +bwwNRDKOqJh2uqHsiR191iH0PYi+SNcx+UfJSYOqQqX2bmcRNckm7ciUeZMiINEr/8t
 FmE7SFvedRBSnW+NcHpaL3Fb+TjdfpzAFm6A6Blr27d6ihQTMm1yL8faSKSSZPLw2U2N
 pJJchRRQ+r3oDrbf5ppUK2NhX1lMyowftSDcHKPHq9QyIXJNYbAKnc8YHg9TedzlUByv
 OIhKMMKtm3Nja3hDPpDDAYXU295qWiKkhpyrGj5qa+rLle7PBKOen6k70f8ihDiuSqcI
 9EzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ck6wrQNO
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2022.9.14
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
index e93a228d7e..ac3d0a909b 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  10b6970c3e64d037137f4bd052ef417c  certifi-2022.6.15.1.tar.gz
-sha256  cffdcd380919da6137f76633531a5817e3a9f268575c128249fb637e4f9e73fb  certifi-2022.6.15.1.tar.gz
+md5  f919a230b999ebae1969088ca68e8367  certifi-2022.9.14.tar.gz
+sha256  36973885b9542e6bd01dea287b2b4b3b21236307c56324fcc3f1160f2d655ed5  certifi-2022.9.14.tar.gz
 # Locally computed sha256 checksums
 sha256  a02f6c638f9fb84d06f7764c3ab085d8af7eda5b93c166da54312479077c6fb0  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index c03cd6e1e4..2053d5e820 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2022.6.15.1
+PYTHON_CERTIFI_VERSION = 2022.9.14
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/90/c2/4e37394b66e7211ad120f216fc2e8b38d4f43b89c8100dd3917c9da9bfc6
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/ca/48/88ec470f8b68319b6782ca3a0570789886ad5ca24c1af2f3771699135baa
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
