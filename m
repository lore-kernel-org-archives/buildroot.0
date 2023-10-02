Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68326E784AB
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 16:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031734172A;
	Mon,  2 Oct 2023 16:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 031734172A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wI39XjaK404e; Mon,  2 Oct 2023 16:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BB53415EF;
	Mon,  2 Oct 2023 16:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB53415EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 452DF1BF2B7
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EDCF40531
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EDCF40531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HLYVXCNTNr86 for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 16:54:42 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EE9A4014D
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 16:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EE9A4014D
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3231dff4343so2038537f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 09:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696265680; x=1696870480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFHhc7x/ACBsBBwYEBS6IIxfkiOOFTHuw5y6537O0Bk=;
 b=UPdEx1mLC/XgJLKo6onGQ3/ogWXXhsk8Jjz+DpUxtE6bAAvavv6yDXUrOin7n9rj8k
 xdyFRfmwKjrqieZ0PXsze6qs9VQsNk2QbX7a42l54+fhEeSJcD13yci2+HkYkGePbtA6
 kUtNUoHE3lpmnn3NtaWJ6hgvLHJC58Z7y8ZIhIMdCAxtyta65mBcikQDO95Ls0jFK0fn
 ayVN9+VBoyzDlUod68OptSxgldQogibD1IKu4072xVQZ17PqyQD/xRWzPChTjyeTJYuF
 +Naqe/afJhdL0s/XF5SPiBpzPd+in8Ke0NK15YoY7ngiLysw5F5XgnNvljgFW8BOFTus
 x2xw==
X-Gm-Message-State: AOJu0YysCsFihbaZ14+9J8I8GBFV5X2vppW28victyJKxKpJ69lcACf0
 /LWcNIm0LXONJp2+ejLYuDM4LOtz3pw=
X-Google-Smtp-Source: AGHT+IEzBQTLxxu6SBCWfXugGqlgGbgOuL3KnOt5dNMfSXXXq1TzfXioLqw/DtSOVtKb18Mb1xvsVA==
X-Received: by 2002:a5d:6801:0:b0:314:314e:fdda with SMTP id
 w1-20020a5d6801000000b00314314efddamr126012wru.23.1696265679949; 
 Mon, 02 Oct 2023 09:54:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c34c400b003feea62440bsm7743127wmq.43.2023.10.02.09.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 09:54:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 18:54:35 +0200
Message-Id: <20231002165435.347541-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696265680; x=1696870480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFHhc7x/ACBsBBwYEBS6IIxfkiOOFTHuw5y6537O0Bk=;
 b=Gb8lJRRM1Y+LHo34XV1CknfeMnQTHRu2cerTPvgzPYXysgZvgWxCBvfElDue06WHRM
 LlnH4DIhAim2Eac9VVoIN5k+g+Uy7EIyKB2JcUxsYZiX9NrHW5n7cUfF+vbIlXRxoMXn
 R16D95MURnja/63SlVqbbooK9zQ54wZDq3qO3mtCvlK8R51WY9Y6lk9FD8J+3b++6Fn7
 9XlBycAdEn90xdVSZFvSOSYonXEQPe0Ftp/mg8Zzd+lT7FHa5fq+Ok9sIR3XAFOxiTRj
 RbL/pjn6Xll4yuRg8UlmLs7ZAeQeIl4v1Zt5NjvI+v6eQBfAskUDvz68yDcczGEnBwH8
 8R/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gb8lJRRM
Subject: [Buildroot] [PATCH 1/1] package/spirv-tools: needs C++17
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

Fix the following build failure raised since the addition of the package
in commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c:

CMake Error at CMakeLists.txt:17 (project):
  No CMAKE_CXX_COMPILER could be found.

Fixes:
 - http://autobuild.buildroot.org/results/aff5b968342bf05f036c8e1e557c404060345d30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spirv-tools/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index e2f46253a9..39fdb80b86 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
 	  The SPIR-V Tools project provides an API and commands for
 	  processing SPIR-V modules.
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
+
+comment "spirv-tools needs a toolchain w/ C++, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
