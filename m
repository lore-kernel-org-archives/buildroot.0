Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865A9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:07:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3BC260EB4
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3BC260EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF10E80F9F;
	Mon, 27 Sep 2021 19:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cy_eqhqvw8T; Mon, 27 Sep 2021 19:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE3580F8C;
	Mon, 27 Sep 2021 19:07:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CE541BF2F4
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C5A0606D5
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqD_JbKgIWnV for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:06:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 451B7606A0
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:06:59 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id b65so37622071qkc.13
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6oR/j1CNS1fQhv2PD6Iw5fvOSm3PjusFT6+KPOi9CmA=;
 b=ETypw9aSgFolQc5qxGAzbpwUT8MNQCeViZKxuL8DhCqeDDL+FFh6n8ZL8iUXsdZPBV
 SW1JFFPQKSPS4nWnOtZZD6wgBP2QNivWpkRVqZwmNME5FaptK/qx4ZE0gRx34alKvJPh
 JB1MFSDD1sb3Yjs0deo9c8snugJglKG+1zlPzR6tUXoSNpEOKlj1U2nkh8Y8RasuM6gS
 QQhZvKoA5EIWwh6zlbQTs/TvpXAsHlgrehsaCCWfin0Rp513q+Y2rwuUHi4Xp/nIEdcx
 qoeAn/SNQS450eAiOMr0HdUV3iAb5BNASnED2gYldPAU1zKKmeDsytgsIPXpq6si1lHk
 6ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6oR/j1CNS1fQhv2PD6Iw5fvOSm3PjusFT6+KPOi9CmA=;
 b=7PVJdSwZZbnv0oMI+HVgSIW43u/Zbz0qxDxm0A6ecfLUNJKtDmK9UibAT0zZqgKaO9
 ULki2rZ/GvY2pqzw9pXz+HJwwkJCTOsPAHqeAKpo72Ei0RrUEg05geo2yKQJEeF/9XKy
 n2jvxGVBLuNIyj/OPMq9w3TilYXBt5PAhJyN6YvtKWiinMYnAXsuodkLjrrygJFoUNLW
 0kF4Xw9Uc58JBztaNPvJSmKVk33DZjecFLzW9/D+EMONi3UY7ILDZe4Y/BcHXAXXDSXn
 +3H7s1hfBexEXV+OfXW190ujF3brloJxg3uEZ/d5KZHv2zfiljVWt7gS5D3bssjnO/JB
 kOqg==
X-Gm-Message-State: AOAM532v0ID4H2+Qd1cjOKpR2z3ZcXBt6BWrsRyfo4hwD4WwzS/IAYMI
 rwAasM6PFOj7GNC0MFwBQFUzg+PeKu7FaA==
X-Google-Smtp-Source: ABdhPJxCmYF6JSR0ky7qTj+dP6ztIt9WkqhT4HjJGQntPqywQKmycg2K2H5gj7EzHon6BFwVA+Yp7Q==
X-Received: by 2002:a37:8287:: with SMTP id e129mr1595963qkd.415.1632769617506; 
 Mon, 27 Sep 2021 12:06:57 -0700 (PDT)
Received: from blazer.lan
 (bras-base-mtrlpq4718w-grc-09-142-113-8-172.dsl.bell.ca. [142.113.8.172])
 by smtp.gmail.com with ESMTPSA id b1sm4806908qka.34.2021.09.27.12.06.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:06:56 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 15:06:55 -0400
Message-Id: <20210927190655.48426-1-ashcharles@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] pru-software-support: bump to latest version
 5.9.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest version of the PRU software support [1]. Compared
with v5.8.0, there aren't code or license changes, just some extra
release notes.

[1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index 8345c2724e..a2c78e7a1a 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,3 +1,3 @@
 # Locally-calculated hash
-sha256  e9256533a6901d31cd12b4ca1c1638b795d316a966967783a8d573e75a6f9d77 pru-software-support-package-v5.8.0.tar.gz
+sha256  4a6b1b2b8ca892c442fd7fce7ddbf6b74e0619def2bb19f3ad67c94720b7ca3a pru-software-support-package-v5.9.0.tar.gz
 sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 7c1b520290..cff3fb54ed 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 5.8.0
+PRU_SOFTWARE_SUPPORT_VERSION = 5.9.0
 PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
 PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
 PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, Public Domain
-- 
2.26.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
