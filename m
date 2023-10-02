Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28A3E784AB
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 16:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAA44160F;
	Mon,  2 Oct 2023 16:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FAA44160F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sy8BbQrPWBfe; Mon,  2 Oct 2023 16:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B65AD40321;
	Mon,  2 Oct 2023 16:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B65AD40321
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 553951BF2B7
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B9D1408D8
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B9D1408D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIg62cHIp0Zm for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 16:53:50 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 161904014D
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 16:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 161904014D
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-405524e6768so147018915e9.2
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 09:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696265627; x=1696870427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PeQaT63i75LNE7cDV/87s0eZ+6wXTryT8C8ziWoJVrk=;
 b=W/l3IRL5XuhdmdfSgR3MhPePVffcJapHqCHCw7OqldmZdLseH68Hr5PVWUbWZvBAzG
 /WD3VyiZMRVtkd4qMwNF6eyxXby8iBCbgCSsbe+gadmHQy042Rb4sA/KKGrr4zkg17XS
 ZJ7cCy7tlLMP6ROOYBcYRPpMOJL7bZDavcg9M82dt/glmy29N4nb2yekHEfyMq26kiHS
 lrNb1uVMEikJCtissz7TZNaUH2jRGmEnOiMFjyN7aKEKs11UYN0WIaoHSmxlJ0JmrqxP
 UjAaYAduPE/I0C4Ghze8mb234R9yMVdj1cUpyhhqV/fUdeSLsgiYZI5MDBPYJm8AjUI6
 9I1g==
X-Gm-Message-State: AOJu0YwxWV4XWu+Y1llaOoksovrKIONiVNDx7iOISlM8s3FfNFWVbpZS
 SDwi69Vsl7pnzRA3iuZ+5od9sAbdAwg=
X-Google-Smtp-Source: AGHT+IH8542h+I/6quOlaq4KGJ+QRF9PxQCQyx32XS/QfQi1H6Vi/t8XOZdsag87hS5tWFBqwvVuqQ==
X-Received: by 2002:a7b:c419:0:b0:405:4002:825a with SMTP id
 k25-20020a7bc419000000b004054002825amr10328302wmi.13.1696265627398; 
 Mon, 02 Oct 2023 09:53:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z17-20020a05600c221100b0040642a1df1csm7622865wml.25.2023.10.02.09.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 09:53:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 18:53:45 +0200
Message-Id: <20231002165345.346937-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696265627; x=1696870427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PeQaT63i75LNE7cDV/87s0eZ+6wXTryT8C8ziWoJVrk=;
 b=JFbFQjplNygxhqLrSMKiBSj3idFW6Huw/wJcD4aU25d4He53FJ03r18vIZCXmsetzI
 P2yhUTkl5I3iPeI8UbYGyXheJOIZ1AA/ljcQOrlDdo6GN4Sau17zVQu0MFEFtYlRCj2H
 UkS0DGhQ5Mfrr7hPHqi95TuzG95qSsVxMKXfTf1wKcCia8K3hHjggKmcUOOMTYXFCnI6
 yMHVvqUbbW9qQhyQf+pC9Y+03+Rv6lRAzzmVu2QwIngNs6do4e8noZaGjuTmqsQItlI9
 Dx+HWJtTCImPiXE9Mv6dyyeVkJuLfpfvHA0iy73rI6fPTjV+ngWQGCtgzZLL5doAOzDv
 Pibw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JFbFQjpl
Subject: [Buildroot] [PATCH 1/1] package/libnvme: fix python build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit cd7bc6b1c410514765c51821bb8d843f136fea4a:

Program python3 found: YES (/home/autobuild/autobuild/instance-6/output-1/host/bin/python3)
Program swig found: NO

../output-1/build/libnvme-1.5/libnvme/meson.build:15:11: ERROR: Program 'swig' not found or not executable

Fixes:
 - http://autobuild.buildroot.org/results/3cb05b4939eb7d1ce0460088c365402ffcd6b13b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnvme/libnvme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 71885e198c..c8984093d0 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -11,7 +11,7 @@ LIBNVME_LICENSE_FILES = COPYING
 LIBNVME_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBNVME_DEPENDENCIES += python3
+LIBNVME_DEPENDENCIES += host-swig python3
 LIBNVME_CONF_OPTS += -Dpython=enabled
 else
 LIBNVME_CONF_OPTS += -Dpython=disabled
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
