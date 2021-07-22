Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6320C63798
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 18:19:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C0060462
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 18:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87C0060462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 462BA4016B;
	Thu, 22 Jul 2021 18:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2RgrZd1yEW1; Thu, 22 Jul 2021 18:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91B9840158;
	Thu, 22 Jul 2021 18:19:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9FD1BF83B
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 18:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CC9360730
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 18:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7BqQg8qE4VL for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 18:19:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F17C9606A2
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 18:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626977971;
 bh=z0D0IVp3DWb50o79XcjbAbwNOSatsjsfPiid8uAzy04=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VC11oxjco/kmVwWziZIfEVgH97ueONXmY5Gdj8jQIaTvGw6JZZAaFddE/d2ZLFNum
 qWhIGEvyrYt7DX9oqAVzPTzuM7gkVBp/kUU8H2IgcYrAHRiOfQKOZeV5/9Q0v1I2ts
 O8JfCN1N0MWocr8TrDH+cB0X5aOtfV/T64UhXnoY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.131]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mjj87-1lMXtZ3kCZ-00lDEC; Thu, 22 Jul 2021 20:19:30 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 20:19:29 +0200
Message-Id: <20210722181929.24015-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722181929.24015-1-ps.report@gmx.net>
References: <20210722181929.24015-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:kfQ+7rJZwfDjM+AB3i/4wJl/cclDtLsxM/k9oa0UyV/Tcdic/he
 YtCpx+/Nyawys296bdZ0QmP/V/kMhjCU3Sn0fg5vn9Mm9xhsQCahF9McCZ0bqr2ZbXGaU9e
 q/erWMTRRepmezDVRQfkZg3Q12CRuYLAK3Za6Htwk4F3IJZ1tcg6TIUSjALrSApQDsFyYOP
 U08f0VvKpkMa6LQaZEssA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ayaHkheWQMU=:yEyHXEq4qvjrwrReyWSUCd
 DMygH+GB0oKO3v+zSpI+kUJVgfxzywpn+y6DgSTPVUN+mN+qJsNK7zRd/v36DmyWnNFLM6QaI
 gHHMZMU476VwOae518qJmdrZA/12xibXZ2ijq5Kfree5/jodJPW36LXzBVJHkW07pe4tF44Fm
 zzjI/lJwXt41kMI28R0j3/oHXoNvTXY7iazsH6JLWo6/FgKeSV7viydKzUuEC+T2XsQniesAt
 yVPM89bAaxP6OJisS0LJ+cW3Uc/q1USApJk3SqF7HMFv3CfGrbut3mi9Y8azyKMHOLMD5X/We
 zrEdivY00/ap/AWzQfpo5WqrY1YRjvB6jk0dYsP6NlB1SZuIuxVmIvb9JyaDW6Xfh5okcNy2W
 hZr19nRcOX8kVA4cvU9sNChEvgMWmTBmfGTx2ly1pLNCDChSDwfAiAvCJlM65iTZBsJhwVl6g
 zuI/4NqERIQt9k5osVyxH/kOVM4qCvGtF2jjqj3CFY8Jm14/yo5Z1W+jCDk+n7eNrHjlaLi59
 5t47eTt5iEn3r9OdpLfipkhfe5ObvjwYpVPPCOWprRphWZxwGgFCwQFID84s5QbnUiitVEu7R
 zhv7ylQ7AnTi9QRgWMXsBVQkB90Bhav/6PVjbWZ+IHzwHPVMM5M/NEAxLJmJ2AkTqjMctBGzQ
 QyOZ9gCMeTPxwOQ8+VL1fZbMBtuge7gJT65T2Ft7Ni9Vi5Fkhp3K6h9AyvZg9vppzRFoL4zEj
 2ykwpIwi/W7/9VzsceRet2Ze9OcD9xR5aK5j6FXmrjSNi2qZgfH6somrZlK939L8hUv1A68J0
 uY1YTco/lAW1zwxO0cbffASrYF+lBEyiatdz887sLvALFG7wViu3cCf/qUjq4gSm1+ig/Tx15
 fmECN14Aiec3M9A6bsIOBP8rEoXv/MM3EmcCyeu+J1OT4y6pAwrhIqMptdQG/WvZadjHB34uY
 eBt5UlumuKpGG82WX34Ty0ih7t4xO+Nos4HIc2rFszxHQZe5axHl3o7ECfvb4foEXkOq/xLZF
 SLQfP5ZCKwn1iVaXw+jgDr6UhjYEr3AZyCZ1TbYnE4QmcFSIVGPZ7qVQycVq297TZIiwwxhpz
 H0DxlNhsAx2zvGqY+8pJeC060v6F5Mahpuq
Subject: [Buildroot] [PATCH v1 2/2] package/mariadb: provide native compiled
 mariadb_config
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Scott Bartolett <SBartolett@thorlabs.com>, Ryan Coe <bluemrp9@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- overwrite cross-compiled mariadb_config executable (used from the
  mysql_config script) by a native/host compiled one

Fixes (qt5base configure):

  Trying source 0 (type mysqlConfig) of library mysql ...
  + .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mysql_config --version
  > .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mysql_config: line 100: \
    .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config: cannot execute binary file: Exec format error

  with

  $ file host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config
  host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 5.10.0, with debug_info, not stripped

Reported-by: Scott Bartolett <SBartolett@thorlabs.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mariadb/mariadb.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index ade73ccfe0..e0ac94f1c9 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -135,5 +135,13 @@ endef
 
 MARIADB_POST_INSTALL_TARGET_HOOKS += MARIADB_POST_INSTALL
 
+# overwrite cross-compiled mariadb_config executable by an native one
+define MARIADB_POST_STAGING_INSTALL
+	gcc -I$(@D)/libmariadb/include \
+		-o $(STAGING_DIR)/usr/bin/mariadb_config \
+		$(@D)/libmariadb/mariadb_config/mariadb_config.c
+endef
+MARIADB_POST_INSTALL_STAGING_HOOKS += MARIADB_POST_STAGING_INSTALL
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
