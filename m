Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9376AC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 20:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 235BE4018E;
	Fri,  1 Mar 2024 20:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVu8fgS-hWhg; Fri,  1 Mar 2024 20:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D23A4193F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D23A4193F;
	Fri,  1 Mar 2024 20:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 907E81BF28F
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A270F4193F
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dj6rgCQCLZDu for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 20:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 850634018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 850634018E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 850634018E
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 20:05:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412cb60ade7so4914665e9.3
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 12:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709323526; x=1709928326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vLDYv16bvHq6idoyH0NrDJAoSCWm4AAkLC/52kOa/Qo=;
 b=m5G0Qa38b8YQ1rhPwgvwRB/1acGM8526x+sSJ59ZLh6122Gbn7NKP7R6w66QK6n7ff
 mNB9j5AZSHOEdTxTQAvAxxyrv247GUGpbAxPncE71bb4lOZd2rQ6Rv+HwrHEsXUE6njI
 ojqaWVh3OfZ9PzlEiS+xzN9whXJE9QtToJRYqZxi1AuaVnKJdqlotBMeGhPVjeQ+Tbq1
 9SgfkiaY3vBzdGme7riVtW+IZ0aVWh0R2tiSKUSCcjR61z2b5yI0gz/2Y58EPIHmF4ob
 c4ZSnx4bR51CwHWCkYv5f9kY0YE2Ah+Xj0NuPgtFxDOkSMpNMxD3icqg94WI6eodZP1j
 0j0Q==
X-Gm-Message-State: AOJu0YxX0tr/pWlO0haT5pM8RLoYQkeP9RfD6ZNwf7E3n7UwiNbNhTJn
 5TcnNSNT7mvIHubOZSQgWRJNzFhI4AatOWp/qubdGqRyQh0lLXlpH42zMtFc
X-Google-Smtp-Source: AGHT+IFzSZDgfWg+3gTjNvQAMkSQqeh7XDaQYUZnhmGPzT3waYiCdNyVcYJZpatqC6X5CUnfJR0nvw==
X-Received: by 2002:a05:600c:190a:b0:412:c9e3:c71c with SMTP id
 j10-20020a05600c190a00b00412c9e3c71cmr1572000wmq.17.1709323525549; 
 Fri, 01 Mar 2024 12:05:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p39-20020a05600c1da700b00412d149ec79sm189214wms.5.2024.03.01.12.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:05:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 21:05:22 +0100
Message-ID: <20240301200522.888120-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709323526; x=1709928326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vLDYv16bvHq6idoyH0NrDJAoSCWm4AAkLC/52kOa/Qo=;
 b=kjwZni10VTia0L1HJuhybCxY0M7Jcdo0PswaA1okIRXBtQ0japZpccdAihRP65D4yz
 Tgl7X7lUUwR1R2LrcJ3IdXMHfBq4dbN+H0EfwrmaDxjaGO3SWLu9dbDyZTitjGOhQmTQ
 jCIgORB0PHmZc+64b5934DN2VyuZDHneF4weMTCcQPGQGpjhnUk46XR4qfAzDExKWIe8
 HOAQVrUmlwT7ioMus9MNBIb0cFl9QWay5KtwLDzry1dxB6/wOZcLZqGEbcWVxCK1SPoY
 fqYw4WIft7kQbEq/FabgMOX3Jy2vp+ipED2LriFT4XfQsNmtzkPGPHiLtsW9VUQj9BLM
 /phw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kjwZni10
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.1.0145
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

Fix CVE-2024-22667: Vim before 9.0.2142 has a stack-based buffer
overflow because did_set_langmap in map.c calls sprintf to write to the
error buffer that is passed down to the option callback functions.

Update hash of README.txt (version number updated with
https://github.com/vim/vim/commit/b4ddc6c11e95cef4b372e239871fae1c8d4f72b6)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 4ff64bada2..194bcb4378 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d826682fb839c0b99f80b9189af549d46dc087ef2cfc617ce161609ba5da4dc7  vim-9.0.2136.tar.gz
+sha256  0056537cb57190aa41c12ba6c2ad04ce10e7f714cde4c1fe7193a37e1c44db46  vim-9.1.0145.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  b475d5d3f8c855dc1a84813bbe45c44054d7f7aee20c800950bf89d5958873de  README.txt
+sha256  7a2f621c8496396dae5eecdcc4dccff9d534dff4627193d3ebf7fa6d2cb27042  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index b0b4ffe344..fb8062e1fa 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.2136
+VIM_VERSION = 9.1.0145
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
