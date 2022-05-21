Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C60C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 15:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E59D860B96;
	Sat, 21 May 2022 15:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tmX5s30fvEg; Sat, 21 May 2022 15:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CCAE60A82;
	Sat, 21 May 2022 15:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB7A41BF25B
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 15:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A90B740B3B
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 15:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0vpSJ2qTscr for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 15:28:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59F5A400AB
 for <buildroot@buildroot.org>; Sat, 21 May 2022 15:28:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w4so15001035wrg.12
 for <buildroot@buildroot.org>; Sat, 21 May 2022 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eqwCAydROPy+h9yY1IO3RgACLDjxtM5uqRwBN7GXtbs=;
 b=oYfleQzw2jclTjMtLd2j/Ue03rsOnlFIph7+Fy+MfYUMlDSRUX8pkGj80SSeteJUQt
 4lo0sOjTQJgx3bq5dm5OOt6gZsBvTywRbxt7QYfiZJ/HY+e7KCEK6sP6cNdzUqfDYPJE
 3zk97nn8ShAG+qG0lPbs8AKyjUI7F6q0bQEmRuDuTIMdNK40rXPwNI/Odsxu+z6o0LV8
 CoG30UcBbY93kqFBXp5u0z8pnMDsQ6VLlG5X1mpGueImlv06iF4KgDVpk8oibNwzWhSm
 vkG3HP8TxyvcnNsoTxCVCjYMKuvJMxFEEe0TfP5Qo7/GoC13/gC31sWWmevQ5CGnu4os
 LzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eqwCAydROPy+h9yY1IO3RgACLDjxtM5uqRwBN7GXtbs=;
 b=ZCb/kMuQeM7lEwHVqfnbOD61gOfkpqZS+SamkPZGlnmNi55olsH06qRdCiwHUc4rDI
 TbJGI3/Fb8AGDy4PXg3OOXMF5biPGxoSt2TGvPdfHe5MLVJiNHAE22l1r/HyPfDuzyZZ
 QkXIkjmHrDVnlpQ/3X0NIBv8HqEN9eFqoB69EPnesuJzEKp0FAI2TRmdv3PZ1H5UuYN4
 ejAzpJoDpdZ7tuNvghD4zvndRIgQfR1wfudk8fuPD5r1XWlCmYKiMDiHqhAb2q1HJfan
 R6dFEbCSG5EyJ0M9hWDuH2C6exAOtbtdRCh8sx7nlVbuMXBFagYCzRBXT8TXbhiCi3gd
 H4cQ==
X-Gm-Message-State: AOAM533H1bxeQ+qIglV+MZkr9UqcryGsZ2kvKtao2VkVf+XOvjOMewJw
 2HppGIUCHxVrCPtJ4AHpixx+vn7K9X0=
X-Google-Smtp-Source: ABdhPJy4qDwTMwIER440zsb+hFx8KqryGGUgX6eYHiVqXFRsJv7UCi8K7KzBrJ315ljOti+x2CcKSw==
X-Received: by 2002:a5d:674c:0:b0:20d:87e:8d6f with SMTP id
 l12-20020a5d674c000000b0020d087e8d6fmr12480991wrw.40.1653146893096; 
 Sat, 21 May 2022 08:28:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003971fc23185sm5029235wmq.20.2022.05.21.08.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 08:28:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 17:25:46 +0200
Message-Id: <20220521152546.894405-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boinc: fix build with libexecinfo
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libboinc.a(libboinc_la-diagnostics.o): in function `boinc_catch_signal':
diagnostics.cpp:(.text+0x8a): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/4504379b464eb144a4c257001eb4d316bb1f5e44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 0d992f136c..695495f777 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -39,7 +39,12 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 BOINC_DEPENDENCIES += freetype
 endif
 
-BOINC_MAKE_OPTS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+BOINC_DEPENDENCIES += libexecinfo
+BOINC_MAKE_OPTS += LIBS="-lexecinfo"
+endif
+
+BOINC_MAKE_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 # Remove boinc-client because it is incompatible with buildroot
 define BOINC_REMOVE_UNNEEDED_FILE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
