Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6A7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 00:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8529A415CC;
	Wed, 22 Dec 2021 00:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SLtdVlifUFh; Wed, 22 Dec 2021 00:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E86CB415C9;
	Wed, 22 Dec 2021 00:02:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5E381BF9AC
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 00:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B03A160F85
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 00:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGHY5QPmm4Xv for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 00:02:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28D6660F7E
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 00:02:46 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id b187so639849iof.11
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 16:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wIS0c4rkYdhk+j6AIRQFZ4BsdnEc2Fb/vBJgkQRCz4=;
 b=cz0YGarFT5sWXtmQ+dtSA2xejBzLJfUKq8dZXNHiIte2/7VK7rowsciTOTrLqya8H8
 ExrTzaUWCgzQks0VXmRmCwWkVtbzYU4amIp70QvwIznm/GhEBPy+qUMVZG75Hfvf/EML
 nQaZdSqThF6ajneaf9OAFrXbImvcc2QvLhzeVcPrAkKppagVqTm5sWmPs1QgC9mANR6L
 n+VR8evV5A5JL1r4yr8frYHn1zYN1d2E1HvMRwvhHD/1NQwyRPxANy1o92yiHfZnL+zF
 U93jO2CkNSHH19/4JIhj3N470PmNO7v+6XQ57U5h4893qXSBsKCeqkkFDWcYDOg3N82P
 PnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wIS0c4rkYdhk+j6AIRQFZ4BsdnEc2Fb/vBJgkQRCz4=;
 b=rRDTHFj8mUij9JMpU7MOLthhzB8FYkq6ixTZ2B/JiAAtewp3w5s+LFqgiergTwH+p5
 qzscSWOP30J7BZNlLPrZnh/W4BY6r+zFD4SI7cGpgvSh37WZxiKAM5uNKDT7HemCVrL1
 Pfv9Sv7Kf/bHVB5siwy7tcLGhFlA+91ubCU7L/lBN+FJC2tInvOcPsMYQWIIrnWJlC7O
 Djs4QCuU6C2Ip6Qekt79W2H9UJey3wdaa0xoBVSBrtJIsQFnVFDjtLW3XHw17bDFmQ65
 R0bTCGi6tQBjQ1NLWk4j7cIcbrCJbUSWsPP9AswDxjht2LhYP9qIQlEAo3iVhFfCgcmz
 1krA==
X-Gm-Message-State: AOAM5327UD8kPYzcbqYgwk/igtx97RT2niyzLSoevZH8Nt6eRDf3nvPC
 Hta3xKtJHx7I/fhrsVVxW9+ZW4rfYPizHQ==
X-Google-Smtp-Source: ABdhPJzv6HWCUcOCvpaM8Sph4k4xXNQ4809atPk4iUu2QJt8Nhb6zQkcwA1XAH1AZr4cPsPRG4LSRQ==
X-Received: by 2002:a02:aa98:: with SMTP id u24mr262597jai.41.1640131363758;
 Tue, 21 Dec 2021 16:02:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-229-18.hlrn.qwest.net.
 [71.218.229.18])
 by smtp.gmail.com with ESMTPSA id u6sm240616ill.39.2021.12.21.16.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 16:02:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 17:02:41 -0700
Message-Id: <20211222000241.1894807-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/connman: add iwd support
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
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IWD is a runtime dependency for the connman iwd plugin.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/connman/connman.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index e5e596c973..8c66a69882 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -85,6 +85,12 @@ else
 CONNMAN_CONF_OPTS += --disable-wispr
 endif
 
+ifeq ($(BR2_PACKAGE_IWD),y)
+CONNMAN_CONF_OPTS += --enable-iwd
+else
+CONNMAN_CONF_OPTS += --disable-iwd
+endif
+
 define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
