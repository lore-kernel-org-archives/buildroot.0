Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3117BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:14:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E0761177
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6E0761177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C8980DD5;
	Mon, 20 Sep 2021 21:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtFbssLOHR4B; Mon, 20 Sep 2021 21:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C351880E38;
	Mon, 20 Sep 2021 21:14:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74B471BF3C6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6328B404CC
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VU72SG-IgVPZ for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 21:13:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33FC8401DF
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632172411;
 bh=iFxyzM8IspM2ydL8hgcFOdTeWdQRSh9Xf2O3HSDosZY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Q6I/Oz3mFhWS/wWJq6o6KAoNMNsgCIUKYOgB6sr2oU6AP8YofQo53fM9MBzl04xhw
 Ve2+AtigiMc5MP2XwU/pAHVKOSXCccMI7rAfZtQdgbnKbYjEClKpPt9wrOKYswz4xA
 psEHd3NzrEWdZfMbrRUwKy/rEBZOLmjJwFOe9ZKc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.129]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N0oBx-1mpa7b3JRN-00wktu; Mon, 20 Sep 2021 23:13:30 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 23:13:27 +0200
Message-Id: <20210920211328.17526-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920211328.17526-1-ps.report@gmx.net>
References: <20210920211328.17526-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BUQM/WDM+2L7JxoncwzGQ/DRoJ64Nd04NxcOHA1p2fye3dovEtl
 4ThDbKC2eHYpjUL5w2lU+jEa0y/N1R38D8iQkTSHm/HMLewQdoT1RR/h68pK60/rD1rDWO8
 1Xvow6p0yyZXebQVAoiiI+qEQXqGeVSwPRYI6EJgGK+siEFk/0nZPFVlWAgiQW4RQZRi9Yn
 4fYxSTLpBfznJ86vIN9cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:11bx78EAqvA=:iG4IuGpekPQ0BnRm82Qeb0
 fGg+PjjQeaLkV4lf2f+sEqEnFHe8RzgvnK1YIoUmXDLNJF8tiXZfIGzPJZXvdhxuB+asiNiYG
 Il/2HrESK1oZAl+q4NFbMWin3ZY7Uk23T0+1qTtdqZ/oIQdjEewLlRw/gxXfkx41+ryHXeiw+
 J5fWkWjwf6M1ZAkkbxkz+5/7u6Y4ATQLFTE4Q2KkJBefH9TLqQ1VqWbKfxuXQw0iSiPjKtkXi
 ZdcovSSCM6nL+0HgJVL5TIeH+l1i6AnvSc8LGRSD+pxL8VHKronifS0YBX8CiMdtuM78q/JW+
 FWtpqV7njUbxjRmpJj167OM0in4gX45/6Ro2LAzNjet+T2x7ECA2XbK14yR0cYqqKn2tNmi0H
 GJbtn8u40REt04D5LE+wZzEqfPOYD/tzQEP+xWly0OrTc1FD53ziMF5rHbVawPfsjqbOnAxhi
 irkDE70LT8Cl0ZjWjCw4rA3wxpwI4ZRzHEOx8nPDyphGzFTEKgiECPdO7NqzOvvVkUb/iXWSF
 wPVvMkyulziKv95IUZPdCQydr3zn+DWlJ235VlGtOflZdWwy+aG0jj2VZfZZO3yMEBiPkaslU
 XAcYJcsCIwxfDwZHbZxeGQ2YXWpDOn3oX8EULdLxT7tbpzvym4m4SVLZ7MwNSS8Z8lc36Wq2O
 zvWfYrocsYrEW4HPOhMoSpXS2zVGb+pkdcYajPMVwRNzx10Us5FVRTyFQrtQ5lF6Ygxf1YVb+
 Ox2jgIMaLdB6eqrcJBr5pg/gOntt4jBMQqYFzhPUK30y303ShHhrnDb01i3JdGfcRc7Kz//CK
 Ok12Jo2h6cYLksHDwLKL97ouxP1ORi1wQRNHXeZ9M+gX34RPbzdoBZG8Wj9n3cmiD9L3oiUNg
 xBzZVx45eCrXau4SapmOPfZHV8v8kwOQDy8sd17s5CONcdwJVMstC5vl1qlyVYd06aU7Nsh8u
 2XMXBmGj3dKY8Adq0yyOCONLucZNy8TzJ62tjknpCaZJC6zIsNBo1pVRz+iwa4N2dzsqSsYzu
 Or8b+sK3cn1/DGPNkgDX4aKcrVDGX3gS5qjPTocEvvtEVRsJu+W42lWsBCdC+1OtOoBvu+Tef
 uIKaLU/ujx9oRU=
Subject: [Buildroot] [PATCH v1 3/4] package/rpi-bt-firmware: bump version to
 883b726
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Changelog:
  - Update CYW43455 bluetooth firmware,
    Second Spectra fix for CYW43455 (CVE-2020-10370)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 2520c91cff..3f37d964d0 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae665baa465a09dddf7f4bdec67e108a74b2a3787550cc9ee53c2bea9651f327  rpi-bt-firmware-4c47758bed7cd547dff3618a1739dcf64b5a52a7.tar.gz
+sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-bt-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index f63564de99..13358b4fda 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 4c47758bed7cd547dff3618a1739dcf64b5a52a7
+RPI_BT_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
