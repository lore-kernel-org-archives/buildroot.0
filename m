Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4F2C4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 19:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CE6040141;
	Fri,  9 Feb 2024 19:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7cNDSgt6WPW; Fri,  9 Feb 2024 19:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6DA44033F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6DA44033F;
	Fri,  9 Feb 2024 19:50:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D45D91BF318
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 19:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C162740585
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 19:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XcVk01G_Z5H for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 19:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3D0D40563
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3D0D40563
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3D0D40563
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 19:50:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4105006bf11so11045115e9.3
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 11:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707508226; x=1708113026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8gDvQhPjml4hS1tDv2LLvOBbnyg036n/qGJRjSbHDf4=;
 b=kd/1ta6vfXUk3Y4vhS+zNW3QAx9ygxRMv8nArBgwm6YhhEwiAp5cc8k+CtGM6iqoku
 EdDZ0xblNCdFYWpwIenDnU+CdWfOgqLbu1Q4rxrH0b7mjEp3vwfYCXx/wg62PK8Xe8kn
 4WHpzfgdjXi0rdR1ewm6A4lG7SUOj87FZrnozITtyCG0MFxBVHC8w805vF+26TKmhqXF
 BlN2Zf8T14Zla7pI10bN96JdXDATDB+hHq/x/quU7Jh4GeYet8nn891LB5DMl7nn93zN
 cIw3ZrnR7ss19JFxMkZz8FnWuQQUxWFStdQVT5n3NKAaNbuRNxts65KUwHfaXpvqlhjm
 LR0w==
X-Gm-Message-State: AOJu0YzZX6Ttbf4MvnC4cmy8HKw0cNVpkIunwmXeSUexfhvjNt+bABkR
 yBSKcODPnsRbvrEtaPwTf06k0Km+tVgVHhyyKkWlX2mXOEcOCmntE4juqiu6n10=
X-Google-Smtp-Source: AGHT+IGCCRg8VSZfDIp12jYIjAebtWaHqYNnFvHC190AX+BFFRx2mHjXNF5HpzP05FtfDmcRsLlRUg==
X-Received: by 2002:a05:6000:144:b0:33b:649a:1a1b with SMTP id
 r4-20020a056000014400b0033b649a1a1bmr14070wrx.49.1707508225676; 
 Fri, 09 Feb 2024 11:50:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVOzVEGaXndUI0QM4QcOFILdcSWwKu3dJnsLmx2nuwpkTO2KZm9776MLwthARpRTOghf5JrsTLcMzOnC+GiQoNFMI8rRdRF7fczGg==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k15-20020a05600c1c8f00b0040fd18f231fsm1591139wms.3.2024.02.09.11.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 11:50:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 20:50:21 +0100
Message-ID: <20240209195021.341782-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707508226; x=1708113026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8gDvQhPjml4hS1tDv2LLvOBbnyg036n/qGJRjSbHDf4=;
 b=TBIAVst9foMf7TA2mshddolQK5uvBZlwqXBaXfe88ki0U/0lssQ2qnEx5ML69BA+gY
 mEyq9ce9Smtyw0nPG3nnJ5UX3xwYS5fFSjCIBCQf9mdoZXKwYN7kYVihS8RyMK7NiGvI
 j4FWlKV8YQBqGDj9ALVSrZD3Dc21J0bZISl4xTHy5aesij62UWJfa0jYan9QJiZAUkfi
 zMDMFg3UBCbGC8dpI1L8KlPWt+aT3vPuhBHnR4j8z62btmWNzqXxDB5dtltv9/TSQrj3
 8ydLrb0e4LiqDju9zkgynZKD2cFRGjpZDrG9lpKVQMTAEY62S4JXgfWgoG7Kppx9Eie2
 Nxkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TBIAVst9
Subject: [Buildroot] [PATCH 1/1] package/rlwrap: needs MMU
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matt Silva <dev@matt-silva.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 0a1f2fce0494388080af0a4130e62522c26fe4a9:

/home/autobuild/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: pty.o: in function `my_pty_fork':
pty.c:(.text+0x68): undefined reference to `fork'
/home/autobuild/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: filter.o: in function `.L0 ':
filter.c:(.text+0x134): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/0a3a68cfb181bc67a7dbf1d44f64b0a29df75987

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rlwrap/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rlwrap/Config.in b/package/rlwrap/Config.in
index 0cb3e33fa7..4e18dfde52 100644
--- a/package/rlwrap/Config.in
+++ b/package/rlwrap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RLWRAP
 	bool "rlwrap"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_READLINE
 	help
 	  rlwrap is a 'readline wrapper', a small utility that uses the
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
