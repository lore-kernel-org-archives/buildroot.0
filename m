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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE978C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:13:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B0861177
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84B0861177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B3C9404D6;
	Mon, 20 Sep 2021 21:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id km95Ow8103v1; Mon, 20 Sep 2021 21:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C9A1404CC;
	Mon, 20 Sep 2021 21:13:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8D31BF97F
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ECD4401BA
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zQLntB1qqQ1 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 21:13:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E79BF401B1
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632172411;
 bh=ab/kwb15QywIvnA/6u+4gNSEPGMJhD/VB9oIS7+ordg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=l0UW690NabqjEBAOpiVhkwodsPjGRK/OZFHcfPO0+rh1ZkVIR8mBIEHInxzv5kuTx
 tJYMU1hEGal4XTWlAua+8fdRh22pNixqqAIRoj2veOnbjhai44P1fyAxPl3Mo8mJYt
 Uauyx1RR4ZiC/nzzQF7tpusDu/6qG61NzvAPSvmE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.129]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N4zAy-1mtgqt0Hm0-010rch; Mon, 20 Sep 2021 23:13:31 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 23:13:28 +0200
Message-Id: <20210920211328.17526-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920211328.17526-1-ps.report@gmx.net>
References: <20210920211328.17526-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uEKmAKbEDh5Nrw8lGaMk7fxuanWDFutfzn5K40u0HjIl3bTRvPq
 kMQsKysOi9mTeAe9AxeirCn2ys4qiWSi6K7g6fkSXqU0KnyGlYrhlYkFLAPfEgxqltgtVOd
 lXyqT0f5CJR+3KsHNmv+QJLeg+2aSFxKx+ab3gIX5eZQxLwdionrmssMvxrhvJS+VgIZ9q9
 uJZ/s+mBhiSJMouKMRm+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bi904zloyGE=:JWGlWLxIaWsNILh49m9yyn
 l9Jz01CUINrtEG7R+h23g1DszS/UYatKqp4c9XqO/R/DzCUDpNgMVqGKDzpN6f6Jlr0+Y5FsV
 EMM7lQ0kf0UVIo34Wo7GrNoCT4S4vwBF9h/Tk9Sb0XY2rbZX8emiLMwvmf29HQBT3F2RObSnP
 g4QChivZG/Vm3ddxZFtvrwVtjAFKJEGu1tzE1vJbgb9uNLlmgB8MvNiOKVYUvPBsr20p/QsOy
 n4g7v2SJk7TPyoiruk0NtmrcsEfX/PdUd01i9bCDb/WI1wL6Hbfx1t7MN6/q4DKVs0YArlrzK
 YBWLNd/Rt93s/OWTPHmtCze/yGWSXAue+SzNsxxCdk9ofwhWyvB/yJc4LxkksisZP5Cnu4BJj
 8Uv2yzElu81yhQYdkcfGclV7PjdPZl1/IwEq1R8Mgj8K0PvrzVB5AY+Ip2doGIFjaGRZsLlTY
 bBRSqc6GsKM3VlejSkT1u/S5WdIQWpsk4NRi2/PPFXQe+57AMKLEttRDxbXLMCFeL9ecl0SFr
 StFVen80NeexGLn+2kMBLkkVTy6F/FxblKV9U0mJSTbP3kP+9jj50gxdt0dXLiIF9v3PoxvVe
 9yJ/sDxR0y3aw0JJSwm23fF+VXWw6509euzTgTyoC5hcsG1q9WR+GoeNXhmQIj2N5bJSMpQjq
 8AR+6TKb29jkfOfy/iuBIBHjfMmp0DBOqccweIUOgB8rTpQ3GnIGx2yYFvbFjOvRMh408EirP
 fMuNqwBXclWaLF9L+Vn+nraHSX8avLlTNVOsbBNq4RknznqzUKpR0iH3XI4dVUalOD11wFa4f
 eCry9I2MnbB68JIacPFfGEW+iOZQT9NueArHz2ixfF0JKNIiMNTFpNfGXCpnubWy63hEguCE8
 bP7/rzEj9POwAEhEeBqITrCIqBD+Ni+/yIeSDeQyGdTnY1XLE56N+hN+Kq8XlqPERcq6IEJDU
 SOfA56fjRozcddXcRPaNmKFjnvDXUr0hdR0s7Trq3aAoZMuF/GXBkoSIhsGKYLl3CHuJFewjr
 GwNPW+LlCwYr78tuHNXgJfEkvMpbR+3q2lIYdVulDnbC+5g9/nt8GtXnOkudyCrymqFKwsmHw
 oAPeT0gZfgVfY4=
Subject: [Buildroot] [PATCH v1 4/4] package/rpi-wifi-firmware: bump version
 to 883b726
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
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index 4db3e15c80..3bd62306eb 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ae665baa465a09dddf7f4bdec67e108a74b2a3787550cc9ee53c2bea9651f327  rpi-wifi-firmware-4c47758bed7cd547dff3618a1739dcf64b5a52a7.tar.gz
+sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-wifi-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index a643c4df9c..28926ff4f0 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = 4c47758bed7cd547dff3618a1739dcf64b5a52a7
+RPI_WIFI_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
