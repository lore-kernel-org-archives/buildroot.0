Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37210C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 10:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2E5B605D4;
	Sun, 21 Jul 2024 10:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yczUXf296Wwu; Sun, 21 Jul 2024 10:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE586074E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAE586074E;
	Sun, 21 Jul 2024 10:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E87A61BF380
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 10:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D56CF4016A
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 10:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-iKmFCQgJjP for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 10:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 519884013A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 519884013A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 519884013A
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 10:24:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso24611985e9.2
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 03:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721557473; x=1722162273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cu4zWea0eU7m6hDu9Ojeq2Bs/fp27EyTDLAZf6ySsJQ=;
 b=M90kpfdhSpgk4MUVyRGDSi+3fqApx+uRQ5OQ2aifyHWEPRM9kKltJC1ux+RU6l8JXg
 Ou2Q0hBPet6P4jF0RAI7Vz5ZhVLK5uGUZN+UMSdf6qZtKbasikTnSsrO8w9O0qA3CJVM
 /h1LMwD/lF4QQ2rcXv3REemy9pH/qIWEqbjDz3QsxO1Dwc3BraXv+GLRbFFnG44BwZzs
 lUax+iuJXsbsHFSxfnp9df61AcLAb2ov2HfmyptTneqH4aGnRSiccCiFP+h0sW077BX1
 k7D6SnNwF915o/9YeWGpgXKxKRMVcR6YGjV/iq0le7weuVB7lWLN2ijoLqnstQKuTfP3
 Ibiw==
X-Gm-Message-State: AOJu0YxlxAkiyHZlwEZjBLHMZdEyvJOg3Z4iP9jCz2amLg0zRyzyyI/j
 8jAlhAKAs3dUk8Rh8kwkJbDs1SRms0aRCRdXMRImwD40z6KSrn6DB3ndKQ==
X-Google-Smtp-Source: AGHT+IFtYcbEiv0Ny5BX+Wz9/YZfKBCksMcUh8FbBpvgdFc5a1AsdqoRn4oWnCG0PfG2Gs6/YzN3Uw==
X-Received: by 2002:a05:600c:5486:b0:426:5ee5:3130 with SMTP id
 5b1f17b1804b1-427dc513699mr21329465e9.3.1721557473046; 
 Sun, 21 Jul 2024 03:24:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a638bbsm107749865e9.15.2024.07.21.03.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 03:24:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 12:24:30 +0200
Message-ID: <20240721102430.980514-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721557473; x=1722162273; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cu4zWea0eU7m6hDu9Ojeq2Bs/fp27EyTDLAZf6ySsJQ=;
 b=ZKzDIKSLahgKd5ZHGm22xeWcZV5/ZeApy0QyC0sFwUc157E7d3fHjfVMXHSdZcO5NJ
 /FRCP6o4bZF3+60VtUC3G69mgUEjHtfh7E3ZBfNrKDgJeZcxH77DGncM1IPd9j7D0aUt
 o9bxzzY9lqp742jjyPZSLuyJSwKU0EwzUiC1XqhoG4+WJigIEVBsoAt9UgHaitAgnqg7
 84EplwUJDPXGAc5ew8jYZnPOa0Il5H9HSXvxd+1UfkbTaeH2A9mx4mJx/EzQcFW0R8RK
 rGbq/523FW5qQvBt4fEwkBvrwz2ejBLnoSNC+e5Spujjjc14BD08XkdH7XUzzXLfNrFh
 T1Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZKzDIKSL
Subject: [Buildroot] [PATCH 1/1] package/tftpd: bump to latest git commit
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of tftpd.c (changes not related to license)
- --include=$(@D)/autoconf/m4 and --disable-tcpwrappers must be passed
  since
  https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/commit/?id=fefaa2cc5c2ae1537fccbb552496787130feeeaa
- This bump will also fix the following musl build failure raised since
  latest bump in ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb:

  In file included from tftpsubs.h:41,
                   from tftpsubs.c:34:
  /home/autobuild/autobuild/instance-9/output-1/build/tftpd-e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0/config.h:209:13: error: conflicting types for 'socklen_t'; have 'int'
    209 | typedef int socklen_t;
        |             ^~~~~~~~~

Fixes: ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb
 - http://autobuild.buildroot.org/results/4b5320013d8ab50499a459d64a71e0b71814fb2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tftpd/tftpd.hash | 4 ++--
 package/tftpd/tftpd.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index 3fab9dba07..5a4e87f689 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9bdb3e2ab2b68e4d8cd057d102395c362baf07c7b052f1d5e40e5190afecc15e  tftpd-e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0-git4.tar.gz
+sha256  452b2d630f884d80a7c4c324aa8248470224048ffb9473e3490460658b8ebea4  tftpd-2c86ff58dcc003107b47f2d35aa0fdc4a3fd95e1-git4.tar.gz
 
 # Hash for license file
-sha256  5936d0764cb6e8f2f5ce8a11c249d81037b5f275f5983e8538ee4fbe57195369  tftpd/tftpd.c
+sha256  9c46847a03d4cf290616a173d526b9bbdfcaf6846cbc01f361989b4e61f2d72e  tftpd/tftpd.c
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 81b67f82ce..73ac7006a4 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-TFTPD_VERSION = e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0
+TFTPD_VERSION = 2c86ff58dcc003107b47f2d35aa0fdc4a3fd95e1
 TFTPD_SITE = https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
 TFTPD_SITE_METHOD = git
-TFTPD_CONF_OPTS = --without-tcpwrappers
+TFTPD_CONF_OPTS = --disable-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
 TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
@@ -15,6 +15,7 @@ TFTPD_CPE_ID_PRODUCT = tftpd-hpa
 TFTPD_SELINUX_MODULES = tftp
 # From git
 TFTPD_AUTORECONF = YES
+TFTPD_AUTORECONF_OPTS = --include=$(@D)/autoconf/m4
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
