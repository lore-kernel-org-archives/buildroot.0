Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6664DC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 20:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C65740520;
	Wed,  8 May 2024 20:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hUMsPJ7tuVq; Wed,  8 May 2024 20:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC94A40539
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC94A40539;
	Wed,  8 May 2024 20:37:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8F001BF2B8
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 20:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B61A641BC3
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 20:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGe8GLbJZv5F for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 20:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 897FC401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 897FC401B1
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 897FC401B1
 for <buildroot@buildroot.org>; Wed,  8 May 2024 20:37:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa83so1625165e9.0
 for <buildroot@buildroot.org>; Wed, 08 May 2024 13:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715200671; x=1715805471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0zFI1Gjmhat0kYB4aSTGGfVzeh+mtoyVSqV+6RI3gHA=;
 b=BgpQ3QHEal0F5D2LyhCp2SdLY4oOOp7eauH5wGuTEzYHZo+4gSzz2fRAKYyLhanmk9
 IJxnAx4CCGw90W+7nBeDFPTFsVhU3GP0bdgnAKgrrCxmJLQGJqgktz8eweBoVQApsNXL
 /jWXtOBR5ghTk6GEbspyTSlx8+oTge0hz4T8mSfEvwiQkaosZvhxT713E2KeY/Og06XR
 cEhU5S1DW5K0j7cqj9RzdZtyhlph1LyXtGefj+DMfkJLqsNb2QzkFQTACgXCIQVvHjLF
 9Bja2Amgg7waeyPOLg0ptjhe5g0a6DQqhKlV+kMQVh6uOCaNCRxCqcic5QWFEH57zZfO
 jVnw==
X-Gm-Message-State: AOJu0YyTXpQy/pWLUfDnteJAtX+JxGr6uL5d26sEMsppY8S9YA0eVogg
 Mjxov2Z6pm5J7j9c9U11nYl7YuOkIOOBWK24ihLqXpNNyl4sLfQLL8um6Q==
X-Google-Smtp-Source: AGHT+IEWjI7PmLkT8lUW3ApPdXY0xR2L2Fmvxug4VvanaFhsWS9bOMuuUH7R1gsCLDSUXaBMHLw4mg==
X-Received: by 2002:a05:600c:3b0d:b0:41c:5eb:4f8f with SMTP id
 5b1f17b1804b1-41f71309fa4mr33629735e9.15.1715200671001; 
 Wed, 08 May 2024 13:37:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 b15-20020a05600c4e0f00b0041aa79f27a0sm3431393wmq.38.2024.05.08.13.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 13:37:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 22:37:47 +0200
Message-ID: <20240508203747.736743-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715200671; x=1715805471; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0zFI1Gjmhat0kYB4aSTGGfVzeh+mtoyVSqV+6RI3gHA=;
 b=NUfb/J/owrPcz9N754WpZpzeGXwgkYEVdrNbUXhePJGLtuQfSr4ii0MyyKPDRLf9Pv
 1GKpvd7d3YiUv6i6A9KSnwU+548m6WM4C0x9IccmTeYQ5ENmyxiDRSNzQoCLxhMRdf39
 OBp7x7uTf7Mdd0sDhNwtbjdediTY5MjZsNcrCg6pF9Y842JMwgfZWlgXbwcIxq+U0v7z
 HfFoDCN8qA+5Re6riC1afZCWOHietp1jZgw6r4ma9V1RtolOxOq2ruB8Jcv+9gy0AkH2
 XyrzX802IhCX8FxtbWZAxF4TbsAyhJtWTomXRjYpYiLH+nhwmz/UgzKsTPtSt43Wi9CK
 aE4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NUfb/J/o
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: disable datafiles
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
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable installation of datafiles to avoid the following build failure
rasied since bump to version 5.75 in commit
b890206876588ed0d16187abf49d35a45177cc3d and
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=be0e796299b0e7a73bf06c5655b56180588550b0:

rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/input.conf': Permission denied
rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/network.conf': Permission denied
rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/main.conf': Permission denied

Fixes: b890206876588ed0d16187abf49d35a45177cc3d
 - http://autobuild.buildroot.org/results/cbd98588b3aced7c18467c2fec96e59c7d180881

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez5_utils/bluez5_utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index d386ad57f0..da10f95a05 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -25,6 +25,7 @@ BLUEZ5_UTILS_DEPENDENCIES = \
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-library \
 	--disable-cups \
+	--disable-datafiles \
 	--disable-manpages \
 	--disable-asan \
 	--disable-lsan \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
