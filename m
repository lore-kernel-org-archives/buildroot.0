Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6597DC433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB8ED60EFD;
	Sun, 16 Oct 2022 21:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB8ED60EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1MfQV7nHUwJ; Sun, 16 Oct 2022 21:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C96760E8D;
	Sun, 16 Oct 2022 21:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C96760E8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85A1A1BF3A9
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 21:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD12404F5
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 21:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD12404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9DYYNDKt3PE for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 21:09:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1059940492
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1059940492
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 21:09:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso8561154wmq.2
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 14:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iH7a1ujlWl64nVtebIjFt0T49tld78fkChH90SPwcH8=;
 b=whEF+11oA0bIYS4fHSu+tmUKGWP9AAqsTlusKiHuyQxBVQ7Lec1aFFnZH6WNOTTXoV
 xTn7lyN+vxvFYHthSXpVyJCgX5csLSb57x2PdCeSwLZyf8xVuptPM515NFy/+zVVEYwh
 jTiOVdQSuCFJDOHZzfqKQUghIxNIvgp199BW9uNyEUHkPZunSh0ZC6Wfz/fxysrzweQS
 vOU0jpD8dD1+gymvGwEMQ46fTyEfLCkCX+Mnszti60ztNnwnfINENceo2rn36c11GF2o
 1cIAh1PsFhtPvHQZ4wO8QIkjYC1828Bi3JgZgEzryeIIkqxck0PTXjRdRzoUbDhqL9Nk
 mPbw==
X-Gm-Message-State: ACrzQf297pR8PHIsMi9HtSh0PIWN4X/lradhs/s2Mj6fLv8+wZouCoPu
 jJF6LwhRDQHxBeUWS6IVZOWCvL9bawE=
X-Google-Smtp-Source: AMsMyM7Q0O4nUQpSo6gGoQBjyl1IVATDizZveT1laVHDstnf0NxRMDPkVKJ+S7pvLju333bQHkwbIA==
X-Received: by 2002:a7b:c4cb:0:b0:3c6:f83e:cf79 with SMTP id
 g11-20020a7bc4cb000000b003c6f83ecf79mr852857wmk.112.1665954576696; 
 Sun, 16 Oct 2022 14:09:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b003b477532e66sm24714455wmq.2.2022.10.16.14.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 14:09:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 23:09:31 +0200
Message-Id: <20221016210931.54469-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iH7a1ujlWl64nVtebIjFt0T49tld78fkChH90SPwcH8=;
 b=PB33lB6RHFosiZAsaBd3Ul9ta0s7HAmV/mlhQEYrxJhqBvwy8MAgzu4THENRMrO1Xv
 jz95DvvVab0noBzdDpDLiauQhNDtXsdfqoc7CfZ4qu4MmFc2BF2QVjWtL7LoxnvVSagE
 j2oQfq8L82Ac/t4pGNMDe/ju5Ml4xmoRe3iSQ3ClHaFuI5txUAGbXIC02SXGYbeDBfg3
 9aF0Edn2mvzwh0EAzFj3iFUvbSrk4sO9nQfbQ7ZKAXVdbSOB77Mmi/Hs8x8uekGyomxl
 STE78/rYWOovB1I7mZDAPtXJILUECvpYa3O41C3W/ar6W0fUj4mnzPGzZCctC+ncRW2T
 3R5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PB33lB6R
Subject: [Buildroot] [PATCH 1/1] package/dhcp: security bump to version
 4.4.3-P1
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

- Corrected a reference count leak that occurs when the server builds
  responses to leasequery packets. Thanks to VictorV of Cyber Kunlun
  Lab for reporting the issue.
  [Gitlab #253]
  CVE: CVE-2022-2928

- Corrected a memory leak that occurs when unpacking a packet that has an
  FQDN option (81) that contains a label with length greater than 63 bytes.
  Thanks to VictorV of Cyber Kunlun Lab for reporting the issue.
  [Gitlab #254]
  CVE: CVE-2022-2929

https://kb.isc.org/docs/cve-2022-2928
https://kb.isc.org/docs/cve-2022-2929
https://ftp.isc.org/isc/dhcp/4.4.3-P1/dhcp-4.4.3-P1-RELNOTES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/dhcp.hash | 4 ++--
 package/dhcp/dhcp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index be03423db8..7dd80a7acc 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/dhcp/4.4.3/dhcp-4.4.3.tar.gz.sha256.asc
-sha256  0e3ec6b4c2a05ec0148874bcd999a66d05518378d77421f607fb0bc9d0135818  dhcp-4.4.3.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.4.3-P1/dhcp-4.4.3-P1.tar.gz.sha256.asc
+sha256  0ac416bb55997ca8632174fd10737fd61cdb8dba2752160a335775bc21dc73c7  dhcp-4.4.3-P1.tar.gz
 # Locally calculated
 sha256  45a39c430be0920cb9570f34b32d2378fe6048c034f2f3265b9326d64ada73df  LICENSE
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 183c8322d6..7be40191c8 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.4.3
+DHCP_VERSION = 4.4.3-P1
 DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
