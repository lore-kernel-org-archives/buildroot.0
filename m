Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DF2CDB474
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 20:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B6C340165;
	Thu, 12 Oct 2023 20:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B6C340165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-KEjSrknb1f; Thu, 12 Oct 2023 20:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B2D84037C;
	Thu, 12 Oct 2023 20:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B2D84037C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0DFC1BF330
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 20:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9E4082319
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 20:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E4082319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVcZXdWAcp0m for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 20:40:54 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E54E82315
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 20:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E54E82315
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3248ac76acbso1215879f8f.1
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 13:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697143252; x=1697748052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o16RPkTsOdWbkk2qQqj0m13XPfJKrRRicTAEV28uq3w=;
 b=C98LWgpOJ74lk4QYGJUKG8EP5n7yOUfBJg3Qh9kYw5apK3P+OE8LiCfK9vxvlk/DjS
 oz3sf1udGvuKPEW6IXYmNEoEPKlI3FIoOUbJfXmH+YIanOI5tAc78jCiSsGhkTguLk8A
 P6U3dFa8UUvxGk8+s8v1/Vli47ywcmwyPjjI/iuwopLl7xBsIMNMpJzSmwlC7rj0NHED
 HiNP3SMUMFPxzxmUPDVh8pmlTR1XlnoINcptRneQjsmadCl9GHVm8f2dnZZb6afmFpVm
 AG/7ZqKqd49YG4oAlz8oGh4zLvWuYpVZfeIPfqiNZcoD4YFH8D2U2OJkNpSmsW2Nl+lp
 OXjw==
X-Gm-Message-State: AOJu0YyTIf9mAqvrWMjK78urzu67vt++WM2/yszgNUhbF5WTzo3l5N41
 gNKcrZm4FwTJWg5l96uEuIucTDoXeT0=
X-Google-Smtp-Source: AGHT+IG85nim4lyLlN9YIu2FzejdgiK5RBKpws2HERTW9bOWS4JRjMNfA1Nsu+FoHMtf7ZR1riB5zw==
X-Received: by 2002:a5d:61ca:0:b0:319:735c:73e1 with SMTP id
 q10-20020a5d61ca000000b00319735c73e1mr23809621wrv.4.1697143251682; 
 Thu, 12 Oct 2023 13:40:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c1c9900b004077227bcdesm336782wms.26.2023.10.12.13.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 13:40:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 22:40:47 +0200
Message-ID: <20231012204047.243690-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697143252; x=1697748052; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o16RPkTsOdWbkk2qQqj0m13XPfJKrRRicTAEV28uq3w=;
 b=fLbh5pPL/ZhjtwmJwhytWPVC9cEgXCwZXSu1fSaYVvUsOnWEk6UD4vtsJf3FRzQh8U
 xrBS+dAFqRPKHI5im6BB8biV41nAWcvnSpCctz9u4ClFR7iaiwOwFIZFDgKFDE6Bip6r
 VXeekVfKHBo0kFaFnttcmL7PqSYReCOIFidhYyWn7HdkI7pL4wfnetzEWzJvJ/TTt4vJ
 vo/quS6tDcR1kqI89MMumy8DiD4VL4jyBBPsm9NFsMKg0IoU4f3TY9n7rjJOM2tQajV0
 qeY21b83sy7Eh8q4VxVjKxPZjoVLKiTYuEjWiW3/DnxOCZ5QVbLrIra8aI4WxMMpen9f
 k8uA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fLbh5pPL
Subject: [Buildroot] [PATCH 1/1] package/pound: force libopenssl
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

Force libopenssl to avoid the following build failure with libressl
raised since bump to version 4.8 in commit
525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc:

pound.c: In function 'main':
pound.c:971:27: error: 'l_id' undeclared (first use in this function)
  971 |   CRYPTO_set_id_callback (l_id);
      |                           ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/692db714aa8b0dcfb67fd99977fb6f33c5d4810c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pound/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pound/Config.in b/package/pound/Config.in
index 60fafff935..aa0f103273 100644
--- a/package/pound/Config.in
+++ b/package/pound/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_POUND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  The Pound program is a reverse proxy, load balancer and HTTPS
 	  front-end for Web server(s). Pound was developed to enable
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
