Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7986BC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 18:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13128400D9;
	Sun, 26 Nov 2023 18:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13128400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKkOyofnDIIq; Sun, 26 Nov 2023 18:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F1BD4017B;
	Sun, 26 Nov 2023 18:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F1BD4017B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 520681BF40F
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29C2D4017B
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C2D4017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XdsXP_-kOWKy for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 18:29:28 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD7AF400D9
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 18:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7AF400D9
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32faea0fa1fso1918378f8f.1
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 10:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701023365; x=1701628165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZRqu2lIZ06RuA53EFwf9uUd/fOel0lSl7lL6iuSYiBA=;
 b=edtTHUvaEMLVxjEVM6dNlQ3p1PTN7rAa4aTtNgzQ31AllvmrH7kbUR47Pzx92wfvjw
 PYqAUg7Yzy1C6iTpa2LDqkm3eioa1qA9BJ/wspxFYWT2TLX8eE8O5K2IgC03kd2aguvK
 w8rr41AEhQxQnht5tSolgvIk5DVSOg0aAzrfA+E3VJfySkbinrwksjidMZ8dCOPiZ6dG
 eYYy9rLl3DjgQGxZs+Y2+/ET8fiX9M+TBsTEuXaFvwhEtgEFLvVNZClcuTCWRhWMdSKy
 h01IFdIKqlupelg7i2HXyKaoIHCbbRmWgx5U5hc9lSSPZzbOxMVz05GiGzvGFp7sJljw
 JHpg==
X-Gm-Message-State: AOJu0YzUSvXiItSu7Vo46JvkLdWunzcQyEt7TJyq5caqWLBLb1sPByOs
 B5p7wshpsMdhcyOyl3NJIVMce9RpYx8=
X-Google-Smtp-Source: AGHT+IGrbjoL+vykyAP0nvGdVgPDEB+XUWBY3TOeL3w+biPpxbvBFe1zkuljb3mdrD+Pu/prWohtzA==
X-Received: by 2002:a5d:4946:0:b0:332:e3ad:4273 with SMTP id
 r6-20020a5d4946000000b00332e3ad4273mr11338912wrs.2.1701023364885; 
 Sun, 26 Nov 2023 10:29:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b0040b34720206sm11063241wmq.12.2023.11.26.10.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 10:29:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 19:29:12 +0100
Message-ID: <20231126182912.400704-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701023365; x=1701628165; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRqu2lIZ06RuA53EFwf9uUd/fOel0lSl7lL6iuSYiBA=;
 b=RgxyGOVXm36Fx1cTJ6GGF77ZBobMSu2ZNu+cRzE7YTxLmgSJEAYnWuogoDOxqmOsE2
 RKUXkiFAS1bY0WL9YoAlnVs3jqh9Unj9UWLC2/2bKH/IH06kTDZIbdXkZ6zrQ3cUrFPV
 ckOnU4ZkzCZ8rg6JAA7Du1gklzfwxoLc87oQ+3rQPsAnTv12okM01pcQwRy2pUKYRRlD
 +UWcGxeYI8wsSvFHyItw7pZAxfn91DDJ9CCmD5Dciu/lApb/NGSNSA8PX38zNlS+XdXL
 VTK9vkUCyROQbiRyBtyw1xntVCFHR0hJyXm0wNOol6mZekG3OiodeFrcppbFx8Vm7bco
 u1gA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RgxyGOVX
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix build without
 SSP
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

Use --disable-am-ldcflags which is available since version 1.4.1 and
https://github.com/kravietz/pam_tacplus/commit/b1054ad8bb337ac30ec56434e03bfb976ca14213
to avoid the following build failure without stack-protector raised
since bump to version 1.7.0 in
commit 160f0e4b5f161d1966a70ad36679a9f5e9dfa9d3:

cc1: warning: '-fstack-protector' not supported for this target
In file included from libtac/lib/xstrncpy.c:36:
libtac/lib/xstrncpy.c: In function 'xstrncpy':
./libtac/include/libtac.h:71:15: error: called object is not a function or function pointer
   71 | #define abort exit(EXIT_FAILURE)
      |               ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/cc8a7c5cca65e002d40a775f09e3c4577fbab5b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpam-tacplus/libpam-tacplus.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index 044b7207f9..df4d62a0b8 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -17,8 +17,6 @@ LIBPAM_TACPLUS_DEPENDENCIES = \
 # We're patching Makefile.am
 LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
-LIBPAM_TACPLUS_CONF_ENV = \
-	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
-LIBPAM_TACPLUS_CONF_OPTS = --disable-werror
+LIBPAM_TACPLUS_CONF_OPTS = --disable-am-ldcflags --disable-werror
 
 $(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
