Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3918EC4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 22:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6B1340018;
	Thu,  7 Dec 2023 22:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6B1340018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wQVYhVlvL2M; Thu,  7 Dec 2023 22:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B76B940520;
	Thu,  7 Dec 2023 22:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76B940520
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 703B81BF3E1
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 22:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 496CB60E6B
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 22:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 496CB60E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UF1zgajLwhAG for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 22:11:13 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3981C60E6A
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 22:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3981C60E6A
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso8720765e9.0
 for <buildroot@buildroot.org>; Thu, 07 Dec 2023 14:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701987070; x=1702591870;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tPD5GiNZfETuF76WXSpHotBTMZ4qw3pytsNVDOJ9UnM=;
 b=MmMo0F5l+zvqYPR419/IErp0wiVqj4I2xzVpsApYcp5Yk0bW6nPs8IlJNPY47JaE2o
 tlrr8lAhP5QZGCRFJlnzYv0MMlwPuE5j5jPyVhBCfXHh5h9/4bHC8w5PSaajd7S6fRxA
 idlBHcRBxzLykwBDKWJKXka/YI9nQ4kxGqmxQaRwtnySHHKAwnYY7fIyYasEmD14y/so
 iOW2FDMctPsMnlVYSn/EzTKg/VprnpAmu+qot3GQbCsXnoxzR+MUGff9jnsfWxqYiPuy
 s3lk4CleAlGmxndlfVVhWCadxfjC9ss0WMtX80dzav2hYLFb+x2MuXjAIKWyit4zEDcV
 xTBA==
X-Gm-Message-State: AOJu0YwiH2JlPUiCVKRDG4fgvnT/czxJP8of1LvqLTtWGiInjOcpDTkf
 X2EjhYVey/JCK43yxSPEhgkT06fEm9A=
X-Google-Smtp-Source: AGHT+IEKclsJLjrNdGUVOo+BbAs4sGg4ERv9G7I+haVxxDVw6eL41uGtLFYq5OCiRLmnqDCNTnEvyA==
X-Received: by 2002:a05:600c:4e92:b0:40b:5e26:2372 with SMTP id
 f18-20020a05600c4e9200b0040b5e262372mr3131926wmq.35.1701987070251; 
 Thu, 07 Dec 2023 14:11:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w13-20020a5d608d000000b00333357a77c4sm607080wrt.34.2023.12.07.14.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 14:11:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Dec 2023 23:09:30 +0100
Message-ID: <20231207220930.1356097-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701987070; x=1702591870; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tPD5GiNZfETuF76WXSpHotBTMZ4qw3pytsNVDOJ9UnM=;
 b=Z9ktI88E/2jGlJvJUqRCbDR9tXKG3QvbqXVP7M41Mjwl9uFIEBm3YmoONuS4lbQ/Wj
 OE8GQQT4IyHGbIRp8lq9Al3xzLyCXawGogjNCs+AfKAlO5R7KqOceKRz8lf1pGenJUlf
 /2BHzKTVDDRq8hepS9y/ppQF9aYK3orBoX0tadhD3HTPF2ZwxUfEPQoWa99FYBzOfbQL
 pWhxVdQbXA/xka/hdoRboaaNyFiqNRt5vfViB893Wr3vuMtgHdQ6/Z+gkLYKQcMS4P1b
 VIbhJxn385S7Z3cPshVlGDFD3PY0Fv3SykYgWdNosI+xxuqiCN9gtfqnG99qMIARQsQk
 A3Ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z9ktI88E
Subject: [Buildroot] [PATCH 1/1] package/memtest86: pass TARGET_CC
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
Cc: Steve Kenton <skenton@ou.edu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass CC=$(TARGET_CC) to make to avoid the following build failure raised
since bump to version 6.20 in commit
a743087593a5fd5b33e2650591cada09929c27a6:

gcc -m32 -x assembler-with-cpp -c -I../boot -o boot/startup.o ../boot/startup32.S
gcc: error: unrecognized command-line option '-m32'

Fixes:
 - http://autobuild.buildroot.org/results/15ece19703bb21c1326ff353aa79f3550a01f648

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memtest86/memtest86.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index c0f85755fe..51d5805e0a 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -20,7 +20,8 @@ endif
 endif
 
 define MEMTEST86_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86_BUILD_DIR)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) \
+		-C $(@D)/$(MEMTEST86_BUILD_DIR)
 endef
 
 define MEMTEST86_INSTALL_IMAGES_CMDS
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
