Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DF9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C65BE821DE;
	Sun,  5 Nov 2023 05:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C65BE821DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HnSEZv6RHA3x; Sun,  5 Nov 2023 05:02:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB645821D8;
	Sun,  5 Nov 2023 05:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB645821D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0A611BF5A0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6D5C41B08
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D5C41B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOYJAie5n8SP for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:02:49 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B846A41AFD
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B846A41AFD
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7a94a3b0a49so122022639f.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699160568; x=1699765368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vCdAaZa3Reqi0dmmlGy0Ik46TV6AvyAdqF2GkK1zH6A=;
 b=ay6SoZeBvgdx+yxSzJExVG3laePwxjfeHVjTkEt+YK8Sr+mkmolsk3snE+w4CK3owc
 ivdKTQhoYQpwaLria6CdNenkxz2QESvmZeWJNz2e+A5nzx1Vf9muGPQcHKy2bXAcnBon
 YypmRlxNroyPcu+xqT6TyjKghrsTnf1ssIjCQvV+YebaqKPP1hvit+PXEhPZJQrl9iQS
 bfJRSJDNd2qMkroeEdMS3KZqP995g7NTNw6poTFr/Gm5nl5Sy4GCdGbnZIPVNtvHYMCV
 vd6jbJ7ruwdC1bxWQjLgIDn7uR/04kaElRkTTD3jaOT+E1cexHA3hh4A5FjEVXNol3SG
 uuuA==
X-Gm-Message-State: AOJu0YxXCdDNXtjiryxDV90gKzCbLRl5079FKPCBcfhIQ8wtAXpswB1V
 eNe2n8sE9VR9GhBBTyV3eCh2aHrxf1I=
X-Google-Smtp-Source: AGHT+IHY3g93yvOzKvuajHvc8EO+ZzxYzY9a/GWQNyoSFPNHpLylEvw/ZbmPqS1JDQZ9BBaTIR25ng==
X-Received: by 2002:a5e:aa0e:0:b0:7a9:22af:7fed with SMTP id
 s14-20020a5eaa0e000000b007a922af7fedmr23545768ioe.13.1699160568398; 
 Sat, 04 Nov 2023 22:02:48 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 z60-20020a0293c2000000b00463fb5dd52dsm805154jah.57.2023.11.04.22.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:02:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:02:25 -0600
Message-Id: <20231105050225.2827004-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699160568; x=1699765368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vCdAaZa3Reqi0dmmlGy0Ik46TV6AvyAdqF2GkK1zH6A=;
 b=JsreQDmHSNMt8E29lSgWGlTvFTAuZC/SaNbyJG/Dk24XUQ+cdKXdNoc08gcRgj8Gvm
 eC176QhPhUir909RrjKfhkRIVwx8h/dUMfiTe0zNsAGsdn17PN54Na27Vd18KfWnvoUe
 M0APOFSuxyDhmAWRkcusS3Ak4Gjzoj89LTO00ootRjZJo8HSHD6gngv4dFOBNvuhjTkw
 0kLXXL+SJSoxbMlfW9UjjI7yKSGOMZuH304jNIGkViAq7Ynts7v1oHR8U8JnY5mSJtwc
 kFP+VWwW5uT5zjuO8LaDuAVCYIZ/MmyJSnUn6TFIbNtDliGB4GKPr/EYPuXa9/zZjJe7
 tkBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JsreQDmH
Subject: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to version
 2023.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index 734ff3f681..a391e4ab21 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  3fd3ba2d98ad320c06277274ca40d045  dtschema-2022.12.tar.gz
-sha256  f532d433a915e507d4b426b7ef57a6730d23c0938b682fb4866f9dfa80a58ec6  dtschema-2022.12.tar.gz
+md5  bb0ecd8b8680b76f7cb55da002f58d62  dtschema-2023.9.tar.gz
+sha256  52c6d271065155ca134d8a0bcf7e0ebed67b3991acbbd7a98b74eb8642f67d87  dtschema-2023.9.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index dbdf43160c..0fc13073f8 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2022.12
+PYTHON_DTSCHEMA_VERSION = 2023.9
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/f2/61/7d7e907ea6eed33708ce07766258b961fe476221fbd2e759a1921487e381
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/24/97/daa9109a854727cd4e1a715e4123198e5abd47db10c131de5bc0cef0acc3
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
