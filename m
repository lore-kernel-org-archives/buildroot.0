Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B37CD1288
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 20:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD25D41E5D;
	Thu,  4 Apr 2024 20:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D-ucLALHfum; Thu,  4 Apr 2024 20:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FAEB41E60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FAEB41E60;
	Thu,  4 Apr 2024 20:55:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6398F1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 20:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50C8841CDB
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 20:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGxmue3nW8mb for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 20:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BA3041CD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BA3041CD2
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BA3041CD2
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 20:55:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4162b016230so7638075e9.3
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 13:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712264152; x=1712868952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fk6tw5h/L5wZXV0vk/pqDqRWrPRW/EC5SXdsjOMnBs0=;
 b=WZ1k2XFsUSBPto6iYb0mJkxK0Fgx5R2M0i07/KPR/ZqBCs7ROziBgK8h4icx0vAVMm
 smwiMxKjBjtzD8hpD5LV1tDsKZHgS9AEHnMX+IaQLhSzoPn7cCH8h8kPSB2KtmwW4JMI
 /SJWHxTU1+FrQwZeSy/GrFmlOUeYdldvHpSl4XBcOYKPdlpxRyzqvKT7kT+d/2h4XK+L
 zXTJo2xLcV/Q+vkqKJHXNmdWze7OsDlTmG7btaz5/Rrf6+dLo4XEk1qTdW8jSrWHBfHS
 K5W1VkvKpCN1Hrs4bhPqbpf+ysOhWbJXVE42C4mc4c3bKR98V9GqgKQWJQiP5n6gsVjA
 gRSg==
X-Gm-Message-State: AOJu0Yx666SNq6jTRB0Ib97TEFFsMZjJVnwBOZ6+IuTmlyZnknHOJQ5w
 LqG5JVlkdT9SqNISS++KWWjIUM11m3vHrNXKGX2dstk2bh9WmBLy5uv084HE
X-Google-Smtp-Source: AGHT+IEWjPRu3MmxssTQ3JcfqbXxvv0KcSEkPFiku+kQ37OXaJHRmNF+HFwBbbyvn991HA442wyrcw==
X-Received: by 2002:a05:600c:5755:b0:414:c42:e114 with SMTP id
 jw21-20020a05600c575500b004140c42e114mr2502235wmb.39.1712264152057; 
 Thu, 04 Apr 2024 13:55:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b004162a9f03a6sm3466484wmb.7.2024.04.04.13.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 13:55:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 22:55:48 +0200
Message-ID: <20240404205548.1859771-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712264152; x=1712868952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fk6tw5h/L5wZXV0vk/pqDqRWrPRW/EC5SXdsjOMnBs0=;
 b=jBJjOeotVtMDkIVpNIeCJEbUz6GULNdF/eg4viE7+Fk0MgwHhJYf/UdtHFUt03MPzT
 1k98KQL6QWn0zgM6uGuP7SDRbXkg47YW1X+0hroJ1+13KeOuYIoHjBQRLWXJyWPegkSa
 yFG6UoUAssyFTPxTcfku8sm0AFtulIyjM4ew3TsrCq8PKoLBbze02EWz/GMrAhYgK3UA
 NkuCPik31xbHGrFkpVVYXQNtMKI8P/8p0I2vH8Y/R4UfijRa1Mrjp+U4+eVJAOLo1oBR
 ulm8msc8k+OtAhtRb8fzIc4RqGafVhpYlGNIQsTAW0I0zjVoYn/Ks5ExlprawBHM7YX9
 Jyhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jBJjOeot
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: select libxcrypt with
 glibc
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

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-6/output-1/per-package/linux-pam/host/bin/../lib/gcc/or1k-buildroot-linux-gnu/13.2.0/../../../../or1k-buildroot-linux-gnu/bin/ld: .libs/pam_pwhistory_la-opasswd.o: in function `compare_password':
opasswd.c:(.text+0x26c): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/e17911978febb7b25112940a7c40037b3f98d491

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-pam/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index b17716f2f7..c8aca97ac6 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LINUX_PAM
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A Security Framework that Provides Authentication for
 	  Applications
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
