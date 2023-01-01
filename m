Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F4FC3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F6D480E36;
	Sun,  1 Jan 2023 23:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F6D480E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8cTP3fCal7s; Sun,  1 Jan 2023 23:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97FFC81BB4;
	Sun,  1 Jan 2023 23:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FFC81BB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1286E1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E00AB4018F
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E00AB4018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IhrBFEmWxxUr for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42FF2404C0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42FF2404C0
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:55 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v70so23832237oie.3
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k50tBaLa2s4eC2Bte1pbpoVsJ6Jak5/vYvQee6oZbhQ=;
 b=dW1xX42aNj7sfWfNzRkP6C20Hw6mPdlXiJkfXzdI1Xa43CFCxY5gW1sfCaowmoZ0Pd
 X86ZJbPkJ8+kspoyrZNMNwi0Om5x+hCuNxVDLvUUcJFydyCnTWkC0tgJmLqoZzxXbmWN
 7xec7VvXn87nwKGqijVPQ3Y/VPA4DWmBOpS70CbhXBdrU/5dO0n+Lt+ZAcyAFqYdW15e
 zPQko3QXZPFcF5q5G1/xxU/hW+XbH+Qo02CupVmbj6RKxgnIFdL2fZuw2+bdJD71jCSV
 9rgghZBq8HoUEBaraB1sIKMgrx1aRd2WclRZaMz16XEYJj/fZ3EtdSHlJpfqsv0Wz/IQ
 P/KQ==
X-Gm-Message-State: AFqh2kq8XXbm5qj0N9nAEOwJ7X8ZXChVYL6L3YsFDNiWlTNANXtbyuw6
 shIKftvUZlmblF2UAIp2DzeSwgERvqA=
X-Google-Smtp-Source: AMrXdXvA88IjucrOQFCBQFS8NrDUmzHpSDvPmUiaJZJGeaBkjEGp57pXBEFZr0f+Uk+UIJo3qjd3Pg==
X-Received: by 2002:a05:6808:1787:b0:35e:b4c3:3708 with SMTP id
 bg7-20020a056808178700b0035eb4c33708mr23705647oib.5.1672616394949; 
 Sun, 01 Jan 2023 15:39:54 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:53 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:44 -0300
Message-Id: <20230101233653.487175-21-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k50tBaLa2s4eC2Bte1pbpoVsJ6Jak5/vYvQee6oZbhQ=;
 b=VXFKmqGX5iJp0rTLdMICipuWyyF88RdloBnTU/bys1hkIqfgRC6xTEpXd+GY4fGG5F
 lb4nPyynay91lfwx1bJ/3sQYshM2swzTjHcVu/8Aj/0dAwz5MVXktrZG3niv+/8WElgU
 VbJb1AymowlOPMdUhVtCd3qDwfK0+B06BdHm6wnErqrHhRy5nQQHij9DbJmx6EpON6bp
 tjSihh/UoD6S5o5m9ANJVCH4I3RLmYGm5pYWSXiFTbTJekrL9AXJ0nSUNLIMtlPHOK03
 65/fQCNp0GyD0yxHZ70R8b4L/VItxdROIv9AUhwyED3J6VItNOXm6CLG3dVlc9Ta1ntC
 RXug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VXFKmqGX
Subject: [Buildroot] [PATCH 20/29] package/policycoreutils: drop bogus
 INSTALL_TARGET_LINUX_PAM_CONFS
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "cb328f77f8 policycoreutils: new package" added a define that is
never called: POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS.

The build system from the package already install these files to target.
So just drop the bogus define.

Cc: Clayton Shotwell <clayton.shotwell@collins.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Using this defconfig:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_LINUX_PAM=y
 BR2_PACKAGE_POLICYCOREUTILS=y
and performing a build before and after this patch, the content in
target/etc/pam.d/ is exactly the same.

$ md5sum output.*/target/etc/pam.d/* |sort
8448253cd52778260856591208cbf09a  output.after/target/etc/pam.d/run_init
8448253cd52778260856591208cbf09a  output.before/target/etc/pam.d/run_init
912cb497b06401def2991346787cfff3  output.after/target/etc/pam.d/other
912cb497b06401def2991346787cfff3  output.before/target/etc/pam.d/other
eac337ec241afe0ef2f4e5039be26cea  output.after/target/etc/pam.d/login
eac337ec241afe0ef2f4e5039be26cea  output.before/target/etc/pam.d/login
f4a2547443ac34fb30b7d06719328570  output.after/target/etc/pam.d/newrole
f4a2547443ac34fb30b7d06719328570  output.before/target/etc/pam.d/newrole
---
 package/policycoreutils/policycoreutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 60575ac644..8505dbca3f 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -16,10 +16,6 @@ POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
 POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
-define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
-	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
-	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
-endef
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
