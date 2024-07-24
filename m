Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE23C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 11:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8832F80B8F;
	Wed, 24 Jul 2024 11:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDSXyczzgRFb; Wed, 24 Jul 2024 11:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F7F580A73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F7F580A73;
	Wed, 24 Jul 2024 11:56:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08AD21BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 11:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0201380B8F
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 11:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqMzbj_xwXEK for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 11:56:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E98F680A73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E98F680A73
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E98F680A73
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 11:55:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso4636865e9.1
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 04:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721822158; x=1722426958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dw1Nds8RQTWwyItOF7UNFuefEqWtHc3c8ciWE22O4qo=;
 b=WnBk7Hlcpi0Kga/1a3vGk5xdmtDl8m4Oo1AqqqcX+LoM+dtW45RWOMqITW3dlgT32i
 MTWOK4+D3vFQs1zKd0I3pqnaXhxe+nN82jzqQyDMkXlQuEJtB0HHQvl7XJbhN/gXBKtD
 yBGsxGMPRGTJNjfWWAsCGFRkPrycRKBPd+hqh+d3IRfcD+Sbl1ee6/DmMlfaeInFlvC/
 UqlrABdAgc3iNx38Uf8RVFG3HchRQCk889zUvgDhXhQjAHVEb3rzn2rH3icCU26jWzFg
 ZXP0ByUu47ECvnFL1v2RnrtnRw0AZ2HBcAV/0F6nVMNlNEp8hSDc6Hh+l6cgUO2vpP+s
 N8ig==
X-Gm-Message-State: AOJu0YxJ8TS7pmSRqNv1LcjVQwPPueFo8qAMdFm+o4CavF2HMeHoEddH
 hnOtvnlog0bHdXmWAyeUNrhAPhHFCg62MX/s8bLxAx5d2XC4GsM0uMSVQQ==
X-Google-Smtp-Source: AGHT+IF6WnLB6CtTmnO4xpKZusH3kgpa60egqFxFfH+40CAbNcat/aadQ6OpO5cMSZyNxBr2ahWngQ==
X-Received: by 2002:a05:600c:46d1:b0:424:a7f1:ba2 with SMTP id
 5b1f17b1804b1-427f9a4d067mr12814515e9.17.1721822157417; 
 Wed, 24 Jul 2024 04:55:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f939aafdsm25375585e9.28.2024.07.24.04.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 04:55:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 13:55:54 +0200
Message-ID: <20240724115554.2270864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721822158; x=1722426958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dw1Nds8RQTWwyItOF7UNFuefEqWtHc3c8ciWE22O4qo=;
 b=G5k7zEXkzGw7x/KFOYx5UKsrpY1RnUjjDXo0Om/+JMjMQhuPAn2Y3QsRvoBmVAXsdh
 NpDzbN/djgCAfTO9JkAbKlXjb97EkmUIx4a81BiJJef7QhCfFP/4uR7ImAuUE3ddIsFl
 UxGYYT/rynzFeRb0h3BLuQPurY3jTi+QDrgNvzy413awIgNGH/qF9EUifYkHOj7xw+OR
 sBXYg0K9Rx2yVuhES6Hdvmb/HoO17o+U8xVI+ZBzeRgOL1yeY8ZFl6RzrcwiKp9uHVfd
 TMADYB0Qo70f9yzBi0BpURkvgUOWmB0ZSGJwaJgDFdDhkAjDVju1ZJ7jt3nAEQf3qrvA
 xleQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G5k7zEXk
Subject: [Buildroot] [PATCH 1/1] package/tipidee: fix uclibc build
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
Cc: =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set _GNU_SOURCE in CFLAGS to fix the following uclibc build failure
raised since the addition of the package in commit
17deaf60f66fc08a796233920a104e5233b501e0:

src/libtipidee/tipidee_response_header_lastmodified.c: In function 'tipidee_response_header_lastmodified':
src/libtipidee/tipidee_response_header_lastmodified.c:17:36: error: 'const struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?
   17 |   if (!tain_from_timespec(&t, &st->st_mtim)) return 0 ;
      |                                    ^~~~~~~
      |                                    st_mtime

Fixes: 17deaf60f66fc08a796233920a104e5233b501e0
 - http://autobuild.buildroot.org/results/f07d6d6ae2331f9972974093c0503b9d3c6b914a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tipidee/tipidee.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tipidee/tipidee.mk b/package/tipidee/tipidee.mk
index 915b4f84bd..cb33b153e6 100644
--- a/package/tipidee/tipidee.mk
+++ b/package/tipidee/tipidee.mk
@@ -11,6 +11,7 @@ TIPIDEE_LICENSE_FILES = COPYING
 TIPIDEE_DEPENDENCIES = skalibs
 
 TIPIDEE_CONF_OPTS = \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 	--prefix=/usr \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
