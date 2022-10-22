Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD813C04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 20:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79BD18139C;
	Sat, 22 Oct 2022 20:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79BD18139C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPfijYRf6hUn; Sat, 22 Oct 2022 20:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9745F81352;
	Sat, 22 Oct 2022 20:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9745F81352
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8571BF3BD
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 683D281331
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 683D281331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCGXBTATBLBy for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 20:33:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 662C581308
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 662C581308
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 20:33:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id t4so4311723wmj.5
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 13:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GAutmM1JN67zIs86dcngMVvE+TZg/Vm49/NInpT1McU=;
 b=y7SMmd5GWmdgW79x8+GSpDLsvwdNEn7Xj7emoUq37PMCSazT5aw7jqWOzGlqcNrtje
 MrmX/K1q2MbFw/omIYYZslhlrmo5hTlMebnDsC3dsV014LUbdXgfU1lBNCEL92vLEyQd
 yplbyFZHVYpC5qt57CMJ3kGA1da9nZLEKGZx0akL5YrsMZx7mN96lKuwPgJbEwQO7vOX
 SsvRiGdJv+gCurE0+cdtWBtB6z9uKkfFpH6l+Ew8YNltWZwsJ3Gl7gDUQKHI6e6De8S/
 gWKZA1k5COEMEQslygBsrKrz2FMdhEcWYGRxYDzjVzuHld9pT0iAoxFEIG9T+2cOvF2r
 9VAA==
X-Gm-Message-State: ACrzQf0EIEDEG7lN/nUMisQAkOTU+PJty87jcYan+ShksAv+gozKR8/A
 Brk4/PlUG8VvnYauPOllMYDleNCiHdM=
X-Google-Smtp-Source: AMsMyM48H1qdVOX9lDnX3SM0f7TesZGqkqb+MoR6Zf1/XumjRiN+TjfPtevYqjvIZBfvYQsHzs6ykA==
X-Received: by 2002:a05:600c:6008:b0:3c6:c3fa:c173 with SMTP id
 az8-20020a05600c600800b003c6c3fac173mr18331078wmb.190.1666470819189; 
 Sat, 22 Oct 2022 13:33:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v24-20020a05600c4d9800b003a3170a7af9sm6314107wmp.4.2022.10.22.13.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 13:33:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 22:33:35 +0200
Message-Id: <20221022203335.131939-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GAutmM1JN67zIs86dcngMVvE+TZg/Vm49/NInpT1McU=;
 b=cXtJR50jWnPCMBXbUtFKWwoI6oUYWGaa+hclq7Nak2Zw4dJ+2O3nf1lnLQf6xfIafc
 0Zu8szqtF9TxjXdacNmKNVp5ItW3FD4kYCB0js7fMMzz6GVzIxbfBFEHJ/2ZwO1mMJZF
 a92KI2q6lgKAtqoXudTpJahJW1IEjFxapB/ouVCczRWN3wm5aXhAKa5QyGn93ZI8Hfwn
 NYcZLG8a14KFl62o7wpXXm+Qppyc3HbXFPhj63sHcOw1DpiymSIRaUhdaRxlI+nCFEpL
 bhrI/SXp9AHJn8RBkXWd3SAs5dIMEAZfZ/e/atoPzvyHOesp9ttDvivQm2cckJbJWLSD
 HtfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cXtJR50j
Subject: [Buildroot] [PATCH v2,1/1] package/uftp: bump to version 5.0.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 5.0.1 - 8/2/2022
 - On very low speed transfers (<10Kbps) sessions would time out due to
   a very large interpacket transmission interval.  Fixed by putting a
   lower limit on the advertised GRTT of of the interpacket transmission
   interval.
 - Sending of ABORT messages on early shutdown would sometimes fail due
   to OpenSSL cleanup functions running before application cleanup.
   Changed the ordering of atexit() handlers to ensure OpenSSL cleanup
   happens last.
 - Fixed missing timestamp update when clients read CONG_CTRL messages
 - Fix to GRTT handling on server to ensure it doesn't fall below minumim.
 - Fixed bypassed checking of existing files on client for backup
 - Various logging fixes

https://sourceforge.net/projects/uftp-multicast/files/Changes.txt/download

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Update tarball hash

 package/uftp/uftp.hash | 2 +-
 package/uftp/uftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
index aaebcad014..e47cba9394 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256  562f71ea5a24b615eb491f5744bad01e9c2e58244c1d6252d5ae98d320d308e0  uftp-5.0.tar.gz
+sha256  f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61  uftp-5.0.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index 1c36cb0ce6..ce865c20ec 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTP_VERSION = 5.0
+UFTP_VERSION = 5.0.1
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
