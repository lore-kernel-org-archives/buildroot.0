Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7ECC433EF
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 23:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A65BD40CF2;
	Fri, 29 Apr 2022 23:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ICfrp3qJR-iH; Fri, 29 Apr 2022 23:04:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD02C40CE2;
	Fri, 29 Apr 2022 23:04:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 826551BF28A
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 23:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7056741DB8
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 23:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1BrtN3wUNou for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 23:04:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68F254179D
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 23:04:25 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id i20so9577601ion.0
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZYXUymdctHvDgl+NSams2cPjqEHydyJ6xIBPmufBKuQ=;
 b=QMklWvLJAvqNKI+H8PzbpjWyzsfz9CX+zkrVRH3QFddKOmEhfIODlV3+TqQbRbwTIb
 ogkog9K5k/nfx4mH0hQ9Y+/iHCjLfFhZlRKpLAHSh+KnyLo4Baf0mWujmrej3xwnVmsF
 jmQO58HHCUpc9Z7Ox1OViItzm81r+Iy2p4OZy+6/kY76eZ2rsyartFSwhmmZRT2Vkvt/
 Sktrzt+uDOVgBTtSCwklTKUgFxeBhWv8xeG2PtXvhhffHwlpjzdthNda/t/CSIRkLdyu
 0TkbIlb7vT9JYyHIiRRdRuSM1XUThfx/g7bmAQJHy5nisQoLgNLWzmKV4U85BU1QCMWA
 tQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZYXUymdctHvDgl+NSams2cPjqEHydyJ6xIBPmufBKuQ=;
 b=RVLYfnScrPTg9ghjzixwMqGMb/224STuN+WxlDLTDcYER0KdP93t8kW/lcMYoR/ILn
 nMgT/5Y6SWGHSAcnsc/VZwm3GO54T+gWFmhl0h/yyJHDnug1pZSEwO58wCUcHSkABudg
 1OaVu6CZjoi1P22SFxoTXgkcFkV+/Fl2K295VriZtaFWKj6aygFgeMJEv9Tpk021WYZp
 FQRDw9jpiAPyRzrImwOGKRvmNd4PxVeCktqw3xole33x7TkaL4dfk8Mx1wUWh2bJr/eW
 HZC0OI/xlb9RR95JruzOM+3vtanddc8wTtEuAfa/7gGXwr+vXjJ24IxjGAMfyUq8UdpY
 VR7g==
X-Gm-Message-State: AOAM531RvbetYLC4gNvHMna5ySfTr0A84Iw8kSogg3KNHeNLTRc1QhEE
 129g0dqWUjzJfm9rEtnHwOW/D2OTI+Y=
X-Google-Smtp-Source: ABdhPJzrAHAQJSEGsk/3HOcXgbHJBeZywdYsGH+Vwe3iB4NDcn4NjrIynn6mNRr3UZc/v1TP/HUy9w==
X-Received: by 2002:a05:6638:116:b0:32a:e8f3:2b51 with SMTP id
 x22-20020a056638011600b0032ae8f32b51mr683049jao.42.1651273464301; 
 Fri, 29 Apr 2022 16:04:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 l18-20020a922912000000b002cde6e352f4sm860620ilg.62.2022.04.29.16.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 16:04:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Apr 2022 17:04:12 -0600
Message-Id: <20220429230412.788645-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429230412.788645-1-james.hilliard1@gmail.com>
References: <20220429230412.788645-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-installer: migrate setup
 type to flit
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is moving to flit and will soon be dropping distutils
compatibility support.

We need to use flit-bootstrap as opposed to the normal flit setup
type since host-python-pypa-build depends on host-python-installer.

We need to add the src directory to the PYTHONPATH so that installer
can run from the src directory when installing itself.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-installer/python-installer.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 862a251415..5bb14e315e 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -9,6 +9,7 @@ PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
 PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
-PYTHON_INSTALLER_SETUP_TYPE = distutils
+PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
+HOST_PYTHON_INSTALLER_ENV = PYTHONPATH="$(@D)/src"
 
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
