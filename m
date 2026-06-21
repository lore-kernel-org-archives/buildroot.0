Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DE9CD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 22:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 599EB4EE46;
	Sun, 21 Jun 2026 22:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pn4UCmLklriP; Sun, 21 Jun 2026 22:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC384EE44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782081816;
	bh=hjLmfScCAwM3VWFCq4pNnkBkj33eehABCNaPD5VxigI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=swkRfxV9mM7gH5cVIO9MOGhtjPwJKs1c023c1FqlMgS+cK3jpQPn+CT8/ktk6pQEF
	 PpfeI00M2mSYF6EF811MNlnlfSwdePewCXAAwqvLGrm6AaGt7DTFclmRFyh2FHmEpp
	 Biy+RF4wQRnb8tYiRp2dEnx8llP/kVRru8mJj0Qr7a+auv+MioQHrGZZUhIW9iW/75
	 aMc8p2CeWakRUP+I+2cavTy5F++iqk2X/i+dNx6+mUcEkt5Q0/MlL2Xa6sB8GbXYJ9
	 3rbKyBi6Yb3EcxT9JjewY7l7azSD+tVqhG8Vy3rVhvegG5SF+52vZgv/M5zqSXizFE
	 ynqRJ2MsRIgew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC384EE44;
	Sun, 21 Jun 2026 22:43:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id D35C9F4
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 22:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id C8977862CC
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 22:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id HPvV0kBNm0d6 for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 22:43:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 357A386221
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357A386221
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 357A386221
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 22:43:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id CE6C143534
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 22:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 288261F000E9;
 Sun, 21 Jun 2026 22:43:31 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Mon, 22 Jun 2026 01:43:13 +0300
Message-ID: <20260621224313.3061196-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel.org; s=k20260515; t=1782081812;
 bh=vt/XMNRDYuYi2xtxlKofqSJieOTErxwl45222YDrvZg=;
 h=From:To:Cc:Subject:Date;
 b=hnHEPezWeqJwvlx6Nco07pODaQlAbByvikXUY8UMMA5ZifoNY30yGp8t+35ctp6yp
 MWWVYXK9rHGMDOZUvSNTTISZ1du4ZI+9nA7czWk/91j4rms2bYQaFZsqmIEGysrY3D
 ZHwSnDt+gRx+5pJZ+QCGc46/c/T9zpeaV9qAvYmM1zpUqMKUlNC2xw0Nf1IkN/ECiq
 w3aCrFbvkxXAQjmJq0dKPaWIx+Sa3Upqv9RSc7Z3DtVJpSv7sqDWUv9Wd+MBKQ/WxY
 KhhurMT7k/6pe6v/UeDKPZJHoNIVk5OJNHJtkDRZNIx2OJeaFnbnieIDh5JDC/Q254
 NlGym2nHMQVgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=hnHEPezW
Subject: [Buildroot] [PATCH] package/systemd: Bump version to 261
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index e96d3ba7ad..1c82877a4a 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae  systemd-258.7.tar.gz
+sha256  f1c2e6a0d19ea5cae946386eb288432de12f3c6b7730cdb0d2a06f8ab8e3f8dc  systemd-261.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3223915d40..9a0b5652e8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.7
+SYSTEMD_VERSION = 261
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
