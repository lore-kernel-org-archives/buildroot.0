Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D36C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B4260F78;
	Thu,  3 Nov 2022 00:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B4260F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WK9DnXw4zJvj; Thu,  3 Nov 2022 00:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B63DC60B70;
	Thu,  3 Nov 2022 00:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63DC60B70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39EA01BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147874159F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147874159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4edcq8NAsZg for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8CE541550
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8CE541550
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:29:11 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id d123so168743iof.7
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FXASQJp1LPUgsZGGSRIcg6jr9k9BMw+w8TbxypCqtFE=;
 b=FhxuuZw+w3tClJ7B9k1Xi8mSldeLxlrye1qLOZVmOUmIVSUr0kXlCntgm6bPZ8opBP
 xyjlrT3lqc3pOst3aZu65IKU4w7HZeZOrIK9ON5nS4ozqj0nAJYKNWiYE8SIelOFxBjC
 YJgLCU7douZqZ+9HgkEpAnr0K9GOPGCOpxpxz9E+QFKf6m81VYk+BD9FgrZ/fD3MUqnh
 +Savft35it7/9xfoDupmzWgZJHtf55gOW63MdvJWS7ndxdS43BcfNxtL9Z9BM5HMa1NN
 JBjWPUl/LCoFCDvUxQpQzUXmkIgH6Hqyr0U8xJVX9oFEweA8XwSjxRxkTi3x0KUL2ag8
 3pXQ==
X-Gm-Message-State: ACrzQf1q/cEgqvZZW2HXq9uH5TcgY9UQs7wOu2kiGWRtcNPa0tHRqmnO
 wsSqlqNIG33wGY3aZGK3CvhXuWdjCTzY8w==
X-Google-Smtp-Source: AMsMyM5WvLPkHgVg0BtXDwjDL99ub9ggCPsoQ4p1M1z4hVwOpup+HRXnskFqh2uEwglSfn6csSb5NA==
X-Received: by 2002:a05:6638:15c6:b0:375:4c11:b388 with SMTP id
 i6-20020a05663815c600b003754c11b388mr14031068jat.222.1667435350581; 
 Wed, 02 Nov 2022 17:29:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m82-20020a6b3f55000000b006ca9e36fec8sm3859768ioa.54.2022.11.02.17.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:29:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:29:08 -0600
Message-Id: <20221103002908.2790791-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FXASQJp1LPUgsZGGSRIcg6jr9k9BMw+w8TbxypCqtFE=;
 b=UaMw0FLXEEq0iX2yEHmrLxjXGdW5BKJ4cgxm0fQ4ySTI3c7Jg42rds6HbfMIXTnijz
 Nia7m6DNw/+53svpfQHp0Q+8TDY6nX/8rAXDE0SvxjopFuu/DmcweHKp8GizMY0AmItF
 ciPxU6QqsvYGV7tkG4CorqskMteFkLU/hy03y195wOIgZ+cZuikvPf7GN5qurkxskLZM
 D3FeSWa8izAzm8nT3Rj8PxlehtsIrzZljcjmDgtEdUYP/h5sW9A/Y472Ltia3stAOMOD
 ixgsgj11zu3TOr4FhL6lTmK/MTazhLjFBs6caAnWgWO/C7rZbfEEAzRjPCeo/5z7J0Fy
 rbxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UaMw0FLX
Subject: [Buildroot] [PATCH 1/1] package/python-markupsafe: bump to version
 2.1.1
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
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 520bb405fb..2d1d81c62e 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  892e0fefa3c488387e5cc0cad2daa523  MarkupSafe-2.0.1.tar.gz
-sha256  594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a  MarkupSafe-2.0.1.tar.gz
+md5  9809f9fdd98bc835b0c21aa8f79cbf30  MarkupSafe-2.1.1.tar.gz
+sha256  7f91197cc9e48f989d12e4e6fbc46495c446636dfc81b9ccf50bb0ec74b91d4b  MarkupSafe-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index e0e689f5a1..49bfc0b840 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 2.0.1
+PYTHON_MARKUPSAFE_VERSION = 2.1.1
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/1d/97/2288fe498044284f39ab8950703e88abbac2abbdf65524d576157af70556
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
