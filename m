Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E984CD691F
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1CB740A93;
	Tue, 10 Oct 2023 10:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1CB740A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlKRsSY_zuRc; Tue, 10 Oct 2023 10:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 829B94154F;
	Tue, 10 Oct 2023 10:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829B94154F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82A3E1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BCA48123C
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BCA48123C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myMS6HK46ZpR for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:14:56 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C45D81233
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C45D81233
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-533df112914so9107017a12.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696932894; x=1697537694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cZvzDLASVLTsgFGYQ/m82sFgQUNMcq9iT9c89rBst4U=;
 b=b/3ESBvP1tlJB4oIBZeAU6WQ0Is5vQc+tqmduSP5r1DdALSCuCcdEkKjsQIWcz6q/c
 jm9ydaAD3OApsFK0yuEt1l7Ok/gfDb6lUqnVEmtPdD31gToozpxrwyLtL/D31trfft/H
 p7tZxmVcyFa4SQVN4f9NWjqQwPXw0y8aPWGPgOeJqlqp3XDemdiaSx+ShElZhMeUW5KW
 CtRjQSRHReCDOzVpkJoHOtkCmTpEO3Kll3qZ/ir7ztwfhrpRjBD2jAgIGUqEmAGuqAtB
 8ztdQaZPgQgVweTom71Wwn9M7BwbGOECJbViZFUYcjkdx88KmgSijMglHa7avlXjpmGd
 3tpQ==
X-Gm-Message-State: AOJu0YzSdeP2EN97KDfjX5szimSSBCVCfWqgNuIbnJm5DCcy/YWizvF8
 amnVMJQoPUFkY8ze9sn/Eqd1Q9hM9jPAQDLpUwe7Jg==
X-Google-Smtp-Source: AGHT+IEU221PHKZf6S73CtRi95dgfQuPmM5iAchXoVMjXeLBB6FhPJ8R0W0hcoNf/7Xlx9DiMEROOQ==
X-Received: by 2002:aa7:da8c:0:b0:530:9b94:96e with SMTP id
 q12-20020aa7da8c000000b005309b94096emr14217640eds.41.1696932894344; 
 Tue, 10 Oct 2023 03:14:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 er24-20020a056402449800b0052febc781bfsm268857edb.36.2023.10.10.03.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:14:54 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:14:43 +0200
Message-ID: <20231010101443.719280-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010101443.719280-1-adam.duskett@amarulasolutions.com>
References: <20231010101443.719280-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696932894; x=1697537694;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cZvzDLASVLTsgFGYQ/m82sFgQUNMcq9iT9c89rBst4U=;
 b=Nj5vmRT696himzo3d4zz0/hhe1EeXd8SnwWZm/Xk7re2P0UV+0258+brnXaNhxAKkG
 JaIeXQUwaEur76/b9pbki7gRnSUKKtPRF0dTTfbzxWFSgfNC0i9eaGZlxgPIaenaWniX
 /fN3B2g64cfiUooGYKtL9Irgaog9SJn3YT/Xk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Nj5vmRT6
Subject: [Buildroot] [PATCH v2 4/4] package/openrc: add split-user support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also, introduce a new test in support/testing/tests/init/test_openrc.py that
ensures split-user support works properly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.mk                  |  6 ++++++
 support/testing/tests/init/test_openrc.py | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 9682296807..25c22957b4 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -40,6 +40,12 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+OPENRC_CONF_OPTS += -Dsplit-usr=true
+else
+OPENRC_CONF_OPTS += -Dsplit-usr=false
+endif
+
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index c6ade7676d..c60e079bfa 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -44,3 +44,15 @@ class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
     def test_run(self):
         self.start_emulator("ext2")
         self.check_init()
+
+class TestInitSystemOpenrcMergedUsrFull(InitSystemOpenrcBase):
+    config = InitSystemOpenrcBase.config + \
+        """
+        BR2_ROOTFS_MERGED_USR=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.start_emulator("ext2")
+        self.check_init()
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
