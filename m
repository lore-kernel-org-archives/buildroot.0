Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D8CECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 01:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D5C540497;
	Fri, 23 Sep 2022 01:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D5C540497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Mt6_nx8gBRb; Fri, 23 Sep 2022 01:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C134048F;
	Fri, 23 Sep 2022 01:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C134048F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 132DF1BF37E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E31D24048F
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E31D24048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PztW-Ygc-qtP for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 01:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1C04019E
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE1C04019E
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 01:34:38 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id y9so5826751ily.11
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 18:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rklOHFLrdhzQlsooLPagJkKwLHw40AWUpRDsZjMXhWQ=;
 b=5Q1UqsqsTX6VDUNpmOxeldYM2E0aQCetDtUPaHT4abPynaoDJYV1mtzbD1n3QT7GMl
 jJoRiAye++D6PUli5hi2UwVBxb6T+NS9/cSQIqUZ2esAM0F6ePfcSSgg6R+lgy4tPajX
 G25a4zRsgsrk4uOUwD8ibVblE+PgyeCjb9VVYbkfzvk+b2u86xf6gHSyxwXj2158ERp2
 dX9UgJ+kB6qZ36RURa9QKfve7cRLJ2HnHkylXEuunRaryq460Riuhon0I074p4I+YU2/
 lf4fcIePCR/37KBwdMyjhWvs+VOmQNXnUpObws/PjKzl7/OZc2HZ99Ba7m4eueaozadR
 KJtQ==
X-Gm-Message-State: ACrzQf1TXEOu6gR9md7x4ptQQAJlW1T97g0jC6pYZ8zdLQFUCDAl3ecl
 +gY1YavEfjU6ORnG3NoBwE1mp0EVYEp28Q==
X-Google-Smtp-Source: AMsMyM5DSvMshlK23No8qfRNnFa+wAmvwMioduNYV1neWDeanm2sL1Hg9s0loebfPsk9IBUkpyHx+A==
X-Received: by 2002:a05:6e02:1414:b0:2ea:c7b9:efda with SMTP id
 n20-20020a056e02141400b002eac7b9efdamr3152433ilo.202.1663896877391; 
 Thu, 22 Sep 2022 18:34:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z24-20020a027a58000000b0035a196d1e56sm2918766jad.69.2022.09.22.18.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 18:34:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 19:34:34 -0600
Message-Id: <20220923013434.156802-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=rklOHFLrdhzQlsooLPagJkKwLHw40AWUpRDsZjMXhWQ=;
 b=gj+/YpWNCjsdD4ElO7nbw314O2xteR7Xu+pSUko7mo7Sve+GYRSQWDKprsEV5HydVE
 drKvT50uribhr7il7YhWKMMNCyINjsRTcp6Qimx+BborQahIZYN/YQI4830t0AZEz1Kl
 ugMphFwaPrEiE0nWE+YENTPQmnZYPgrTFFY7H5C1rL1WadSg8J5NJetTQjoE+J24GTaE
 2UkQujrMiGTOHRtzS31sLqWthcnpI4fTaO37RPl2NuEBXRQOCTqIup0o3ijnwL0e9wqg
 vUuagggvIjOKkasNiOkLjFp69hAe7uqiHDPiwuBAgO/Euvep9vPdpVcQLHtF2H8o4QN5
 6n9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gj+/YpWN
Subject: [Buildroot] [PATCH 1/1] package/python-pyphen: bump to version
 0.13.0
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
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 14938de9c4..3a145e0f81 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  99a01a3806cc750c242cae330429a90f  pyphen-0.12.0.tar.gz
-sha256  b7d3dfc24b6f2178cdb2b1757ace0bd5d222de3e62c28d22ac578c5f22a13e9b  pyphen-0.12.0.tar.gz
+md5  a2d6f69468684bbaa88d004b79c02128  pyphen-0.13.0.tar.gz
+sha256  06873cebffd65a8fca7c20c0e3dc032655c7ee8de0f552205cad3b574265c293  pyphen-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index ac0bcf8aab..d83eb79736 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.12.0
+PYTHON_PYPHEN_VERSION = 0.13.0
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/0e/21/9e0841aa76db69e2d74cd64ea2271151d7332fa627a5f03eb0d9ccf3da87
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/9a/53/e7f212c87f91aab928bbf0de95ebc319c4d935e59bd5ed868f2c2bfc9465
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
