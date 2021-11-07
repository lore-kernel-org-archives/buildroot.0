Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35433C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 09:47:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8972611C4
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 09:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8972611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5275181A16;
	Sun,  7 Nov 2021 09:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zl71oza594ji; Sun,  7 Nov 2021 09:47:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A5D818DC;
	Sun,  7 Nov 2021 09:47:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9861BF317
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 09:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24E3B40243
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 09:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3t-I_pD1n1kZ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 09:47:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DA4C400D2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 09:47:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u1so21353287wru.13
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wi7ex2VtOFqXp8bntQxE+3l1A7+/HX9PwpgdBv3ZJo=;
 b=CxLojjQSV/K0UkPV6QH7LFyKI0JYQfveKiG6bH3wOyXpht9fcCL2+J/UolT/Vv+soR
 l6SbkSJKAi8o9Biul4Nr4WKxPc9KQzI2xSmZ5mBEy+mg7gBxpDq6vBFqlkWVJ/nBKdAN
 3gXpKElLF47a6R4OMbRITjZKBkVb4TSIddq8xY8nQ/+MQPwEO5+YpBO9kHimo1Q5tPzN
 PqZ3pal6LNZtqLHjg6wT0pRI7kyq2gZwIfRsvMxxsQ+dbnLTIqel43Q2/tsASOL1Z9hd
 AEKMAmsctXSWtd/oTCVPa0LoLxpSvVjQ4c2NVw6wkQkVJLZGeXAjAwN1kc22WuxiwhZL
 5Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wi7ex2VtOFqXp8bntQxE+3l1A7+/HX9PwpgdBv3ZJo=;
 b=a0dUHD6+4lQFDXCS7XxbRA1f30yX4MPYp7ByM9dgwniQNRYKAGbRTQnJyMCDTNEO0c
 hhF1G/AsFAJS3TssjceB4HFTDq01iyG5Fd14H25P+egJMrttFU1V870hKxSvLl9tNdM6
 p0svVCVeVnY54KGFfRXEzGcxMRuREiGF4aTKjSWs8jcO7GaB2QJ5TBByDEwhzIp60JSX
 sfQ9qvG04UgoXDW9WSaHpfwne/OkES6iSJdIgFTNo07rImepOOe7EwpmiZZF/vj/2fSO
 l7ruF21sZQAKsFs2JNLPZKz0ZEkMJNL0562Y3i8MHiEKJfa2H5FVhTvyp+7OK4T0/qgN
 zeWQ==
X-Gm-Message-State: AOAM5331ye+Zc8kV3YAfwAJXxwM3TshL+qPUhMXg//1W1fvXu/IJRbRj
 /ZfavWitLN53JLFbWw/ElcGULRSsEqU=
X-Google-Smtp-Source: ABdhPJzmJ9iJU7D76DKD3hr74cMIpdbeE/Q40Dw479txgO9FMlLqPvsyq5aZCmxMsfkOclL5KyGewg==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr28403659wrz.215.1636278427854; 
 Sun, 07 Nov 2021 01:47:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j8sm12435062wrh.16.2021.11.07.01.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 01:47:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 10:45:14 +0100
Message-Id: <20211107094514.3502718-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/softhsm2: requires DES support in
 openssl
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 53873b6daecd2a97740833cae7c5b4cdb185a6b2:

OSSLDES.cpp: In member function 'virtual const EVP_CIPHER* OSSLDES::getCipher() const':
OSSLDES.cpp:81:12: error: 'EVP_des_cbc' was not declared in this scope; did you mean 'EVP_sm4_cbc'?
   81 |     return EVP_des_cbc();
      |            ^~~~~~~~~~~
      |            EVP_sm4_cbc

Fixes:
 - http://autobuild.buildroot.org/results/27d471c4ad1cdd5f2332b949f71cba86723d349f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/softhsm2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index 5d84997c07..58f3e3086e 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SOFTHSM2
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
 	help
 	  SoftHSM is an implementation of a cryptographic store
 	  accessible through a PKCS#11 interface. You can use it
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
