Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51410C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0EB260B45;
	Thu,  8 Dec 2022 21:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EB260B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxXbgUAse5L1; Thu,  8 Dec 2022 21:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F365060AD6;
	Thu,  8 Dec 2022 21:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F365060AD6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD951BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71B2E410A1
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B2E410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q--UlDr8RpNm for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F90A401E8
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F90A401E8
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:40:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 125-20020a1c0283000000b003d1e906ca23so1988926wmc.3
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7axsCIiwrRN0ZzOnx/YeLWSVSbtFvlEzsr6Wd3puk8=;
 b=g05aYQCb8UifHkdUo60j0330EDsmu5guquSZKD8wTXOW4n4lNxxM/6s+94mD7RYNfO
 T9N7gF5wjJo91S8KG7p8W8o8uRnc9apb84VqHc0O73z7VHjmubUwGOyUbRclxTYaQlR3
 hgL6Sus9JhVfu1voPDNtqVEJvwmHEeIdeO2w26dpFYqEhA48bvI+rY8KF39hl9kYXP1C
 lzmaHlpbMpWapzjqB1/9+8d7d8FopsFngS1AJxw5P1Yl9bg61yOWTHDIiy7LYlfKeLF1
 8IVR+XcYryamK/RPt1AMaQH1Gthjo93Hd9l2egiCQE8FP4XfOCY+uFCcxvEpu+BVVISi
 J95A==
X-Gm-Message-State: ANoB5pk0Y3752r0tKd70CLF/J/ppNTxCKXUJ8r3sZDXDA9w2K5nY+j5T
 oC+Ap1GmKHiy3GQdLt/iec2gnJ2LWgM=
X-Google-Smtp-Source: AA0mqf6+wxC3ykrXrjwhNT2B7Wry7JRY5jU0HJwFllu8INJOo25H9F51H7ppsdt6g0ndgIscXGLpiQ==
X-Received: by 2002:a05:600c:5106:b0:3d1:ebdf:d591 with SMTP id
 o6-20020a05600c510600b003d1ebdfd591mr3007100wms.15.1670535621235; 
 Thu, 08 Dec 2022 13:40:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m186-20020a1ca3c3000000b003cff309807esm6030029wme.23.2022.12.08.13.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:40:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 22:40:16 +0100
Message-Id: <20221208214016.110125-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r7axsCIiwrRN0ZzOnx/YeLWSVSbtFvlEzsr6Wd3puk8=;
 b=HQWyy/XRofCg33edJy7LSh8rUnDevPWJMgqeGA+J5EdFqGoKBcc13cfaP95wvIjNqf
 Od/yarg55z3YgpMNJ4CBgAw8NVZG8wzI/6D2Qs0w1TPbsR2Mi1n9rlY8lcgaQ4yU1Ng9
 OJRWQquyPnaPrxUAZgKQYHDyXrtxrL19ELDD5XGQT5iPgCxl/wIvhDFe7J2mn5sPEFWx
 QvIUbUwIT9xaNq+9D0XWQ48NUFCzOWDr0V/VGNxuvjjQifVBPj4TdNNrAcErJcjNJLzA
 ZfNBJbIKwgnDRydkkLYSVXOKNwRCmGkrhAk7KKHEnA8YPVdQe5GgkuyKU48lCmfrdHTD
 3uxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HQWyy/XR
Subject: [Buildroot] [PATCH 1/1] package/fail2ban: bump to version 1.0.2
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/fail2ban/fail2ban/blob/1.0.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fail2ban/fail2ban.hash | 2 +-
 package/fail2ban/fail2ban.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index 4073efe4c7..b40922e70a 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  62b54679ebae81ac57f32c5e27aba9f2494ec5bafd45a0fd68e7a27fd448e5ac  fail2ban-1.0.1.tar.gz
+sha256  ae8b0b41f27a7be12d40488789d6c258029b23a01168e3c0d347ee80b325ac23  fail2ban-1.0.2.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 288266c2c7..7ad22d02d1 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 1.0.1
+FAIL2BAN_VERSION = 1.0.2
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
