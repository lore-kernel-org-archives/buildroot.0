Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9DACF58FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 21:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B029606B4;
	Wed, 19 Nov 2025 21:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAZEWSZOR_xI; Wed, 19 Nov 2025 21:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 815A0606CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815A0606CA;
	Wed, 19 Nov 2025 21:43:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A69158
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECFC1810F4
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rr9JhoXChqlg for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 21:43:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2520A810F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2520A810F3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2520A810F3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:43:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C775CA4C72A2;
 Wed, 19 Nov 2025 22:43:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32930)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLpx8-000000006jK-17E6;
 Wed, 19 Nov 2025 21:43:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 22:43:02 +0100
Message-ID: <20251119214302.3248072-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763588582;
 bh=9EqzSbPpycWLdMklH11E6vucNx+4EiNklf21yVVpugQ=;
 h=From:To:Cc:Subject:Date:From;
 b=JK05vVA6kcEXe754NI5xNAnQP1B5SAkKfPIMEL8YZsqJFUkPwdyNxRqeWZq2eGMd6
 Io1ANUiCcJsuP+BWfi2cvCAEM/6jU3Ok2VxlNfOtHEoT+ufdKCpyMQxDM+d1+5pCPt
 y+ix5oEovPzyvaPM1/kH7T08mM3iGf8QN95pm9+kMLlZlxlAQyzIWHtvJ3d+e//w6K
 LrZYeh40hojtIB3jrZGTFkZogYGnMUJBtsHoyVzn0HqGBJZMvWNt2v6z0RFkIqHdqW
 3bB5DXj1q8cOrZcIMegyurxxS5w5Of0f2LVFTslJJLPBTY5KRFFaVrqSHpdVGusch9
 xlmpV+UtQPicQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=JK05vVA6
Subject: [Buildroot] [PATCH 1/1] package/python-scp: fix dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 3963c3c06e3a4161e0ebb570db80ab0b297c9a6a added this
package which selects python-paramiko but forgot to add its dependency.

Fixes warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_SCP [=y] && BR2_PACKAGE_PYTHON3 [=y]

seen with https://autobuild.buildroot.net/results/423/4235283218bc49f53bf7cafd4a67f380dba659c0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-scp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-scp/Config.in b/package/python-scp/Config.in
index 1db0e910f4..28a649e406 100644
--- a/package/python-scp/Config.in
+++ b/package/python-scp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SCP
 	bool "python-scp"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko -> python-cryptography, python-bcrypt
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  scp module for paramiko.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
