Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B273C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D74E183B77;
	Tue, 15 Apr 2025 19:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXzmdcWgyq9J; Tue, 15 Apr 2025 19:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09ACE83B55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09ACE83B55;
	Tue, 15 Apr 2025 19:29:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 228C8109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14315607DF
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dxhy_pV0ol5m for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15C86607F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C86607F6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15C86607F6
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:29:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so49519425e9.1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744745343; x=1745350143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJg5ZiX4AgcNYc6J1lpcKhR9u0jinZSCt4yfl5zzMJY=;
 b=BWYxtTOgUKMwFJPIlOw5/RlXmeJ6Fek8NJho95YqN+P6ZCaiLRbg/VpukkHTektyzm
 5KZAJxRAeZAP4VETwjh0s3ELuGgRHT1kXyshjjLQPdoXizOh/ZZiR9QgSVJqKRNCY8is
 AlYJGNhP676PEWQzS37MMiRpcsPhQnu+v9cK9S8c2Ep18nHzDQ3HmeVF4AGwa6Be1ZAF
 WspQHiLlcZ9gxf5EC2tOmtHidVzTV8qjt0NMRa/7FdO5C+SMRzboya+CYlueSW4eX2ZF
 HVn7G+qhaLJqAhCAGrtyb9OZYSu7YRS/Wnxkt4LOaHUXKT6c9vFQhHmsUYm8Cl7XQF+K
 sOEg==
X-Gm-Message-State: AOJu0YwryjbQeV9WeElMeT32jJQi1j7Sc1K4Ge3np0tIwFZC6julgTNW
 AG9tV8iUCl2a3ZvDpZ2BjxAA5iiuwocrYe5VKTMDT+5Nbo4H6LeXi2uBsg==
X-Gm-Gg: ASbGncsDoXfv1LZ2a76sluYwd7s2fo7vV21WNeDnb5iUlrv0ogjfZ/WB/Y03djGgYRS
 j5goeTIKLTd2p3N+fFhWnPwr2w5EZtE0bxrS5ljrKJFNaZm25+BUm7qcVH7V2w8ME9qUuIYZi8G
 PvXArN73P8m+7E3EI2dOwOTItX6G9rB2LEEnRyEbqT3vIsBKTqt5ZFoNvw4sQ4wv/95V+CdhF6e
 DJONq43npVkavVTRFI/YG3A1b3QxdXEhYckyLSuoT5Ud/cCdLKIKE7FZKG+AOUUbF4C9Tf9Il+Z
 wTY6kpgGYrlI2OOvGiOihg/Aiurv/rwqtHgDb665zBpLkq5b0fjE
X-Google-Smtp-Source: AGHT+IE7lPaZty9BBXA9dRJEYPdS67+h992Teu0qQhe06Ik5AqVHvVD4K/iJdWBzUglDeIF45fKCLg==
X-Received: by 2002:a05:600c:19d4:b0:43c:fc04:6d48 with SMTP id
 5b1f17b1804b1-44059f38de3mr3319915e9.0.1744745342535; 
 Tue, 15 Apr 2025 12:29:02 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445788sm15298635f8f.93.2025.04.15.12.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:29:02 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Tue, 15 Apr 2025 21:29:01 +0200
Message-ID: <20250415192901.3370859-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744745343; x=1745350143; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=EJg5ZiX4AgcNYc6J1lpcKhR9u0jinZSCt4yfl5zzMJY=;
 b=BU/Q64re/NvxD+whwf1DUI79nDrkZUVGDmPp64TtQW6rug4+izZ6eMVINHpXIVGxs+
 X6yDQQTR/l4ckDgyXLYTc3ZvyeWfzm3tMWav8mLJI0bEdc5WfSqwbyz3m8xO/f/pDOTU
 uynfy+OEPe4N/VUb66mfLHHUj501HFSJdMnR2SKQfgoVi0LCsakrmayvMt68k3gOO7MD
 qn7pRk5cqV3ksbEUIMKA0BEUO6u20g52D3xzz2q4IR9k5U3XbKHFE12Lqqm/zSKf5iks
 56dU62cMW6/bDBQwgwqVNH8vBWcm4yYjN9klZBynrc+PYY3H8DigFR47FLic6ZO0i9Pc
 wyAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BU/Q64re
Subject: [Buildroot] [PATCH] package/vim: extend comment about vi symlink
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current comment is not very helpful; extend it to be more explicit.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vim/vim.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index fb8062e1fa..7d51a6ddab 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -63,7 +63,8 @@ define VIM_REMOVE_DOCS
 	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
 endef
 
-# Avoid oopses with vipw/vigr, lack of $EDITOR and 'vi' command expectation
+# Avoid oopses with vipw/vigr (from package shadow), lack of $EDITOR,
+# or other packages expecting plain 'vi' command to exist.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define VIM_INSTALL_VI_SYMLINK
 	ln -sf vim $(TARGET_DIR)/usr/bin/vi
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
