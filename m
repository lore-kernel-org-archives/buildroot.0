Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30533C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB56F60AB0;
	Tue,  6 Feb 2024 20:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dteLnt7yMsLE; Tue,  6 Feb 2024 20:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9ED60B14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE9ED60B14;
	Tue,  6 Feb 2024 20:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 946F21BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AA9C40459
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3vk6rUARIKQ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:31:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C999E4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C999E4012F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C999E4012F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:31:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40ffd94a707so2706535e9.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 12:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707251491; x=1707856291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YLKMN2zGKymP8dc23lvBvUvSon9a7Bglo22/NKfdUuw=;
 b=tKprDIcV6tP2IzqHgThNe9PIefl4EPdKmI1FbMfTV8LVobfoJdIE96lVvRrrfy5HLK
 5C+l05HXv91T11efaY4MT273Bl3/Gi0SPO8wte6OikJBa5D0+LCedkFjJxrgmFkg3GYh
 qYTXvSX5RbfdCaf/8X2TfMQSyg54Wq+CbvQyozP7i/lzp3RtMIoJ+r13o04FKtAWrDCX
 72D68f5mIga5aG9f/EEi1ICKhhnEd9zxUXgcoMy6V2lRGJH/DxTNmuzileQxGZ+THnbS
 eoDCXetwaC5XeTrr8xG33K4Fejp3ZZvcPN+0FdnQ71y/dqEYEBI0+Sr+5sfmZQ2WYfRS
 t+0g==
X-Gm-Message-State: AOJu0YxofnU+Sa6pGFeYERpdTZDTDFlJntAXU/HMOR8KdOX2iyyw6RBW
 96yREXUzsfbpma2LniJGtcuYTG5wTsDH4Znt32Opdt1vnRoM7cJRfE4Rz4SQ1rI=
X-Google-Smtp-Source: AGHT+IG2OBhmqHn8WsD2gDpneaa5cGeAukAuMEAro3c3TbooXyQ7KfRAEOoy5MRc4HugTxz0kb8AQQ==
X-Received: by 2002:a05:600c:5491:b0:40e:5933:e2c2 with SMTP id
 iv17-20020a05600c549100b0040e5933e2c2mr2675831wmb.19.1707251490388; 
 Tue, 06 Feb 2024 12:31:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b16-20020a5d45d0000000b0033b11e91c0bsm2856474wrs.81.2024.02.06.12.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 12:31:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 21:30:31 +0100
Message-ID: <20240206203031.851666-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707251491; x=1707856291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YLKMN2zGKymP8dc23lvBvUvSon9a7Bglo22/NKfdUuw=;
 b=TesLU9PPuq0nl1/P0rGuVoO4j3grVigXPQ4ShHOhoo/rrJpPsPAeV0RtJjb1wgZFsZ
 KY/QBhR3evLdcrdL9H2uBfteRlIG2KECt2uh1j79JMFNR5HtCMTPQxQDS/+TNyHd/63w
 J4RGambGeSCiG0RO0kSsUDwbNJv/Y60P+aw8S7nr8cztOWiHWAowh6vyllvvdvBp8bO3
 oNiZJMEARnT9zH3EPbl8isVwE3Scd7kukbNAaiSgitBx8iUqtgbd5EdSokEX0tFj17rL
 v3DeHA0PLb6JuZMUgC7sJtzH8HsHmdIB1ZKS6CQFzWH+80SfkVc1z8G1Yj0kI4EUaGTH
 uElQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TesLU9PP
Subject: [Buildroot] [PATCH 1/1] package/netatalk: security bump to version
 3.1.18
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

Fix CVE-2022-22995: The combination of primitives offered by SMB and AFP
in their default configuration allows the arbitrary writing of files. By
exploiting these combination of primitives, an attacker can execute
arbitrary code.

https://netatalk.io/CVE-2022-22995
https://netatalk.io/3.1/ReleaseNotes3.1.18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netatalk/netatalk.hash | 8 ++++----
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index a35e6bc36c..9ab5d604a8 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.17/
-md5  a6429a28948f85b69c9012fb437dd9c2  netatalk-3.1.17.tar.xz
-sha1  bc6578d9fa874b3816fd4ddd60a30a8f3aadc71d  netatalk-3.1.17.tar.xz
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.18/
+md5  b1caff4e1da534d8ca57d688c7fa3ce1  netatalk-3.1.18.tar.xz
+sha1  cbd92c95d04cfd4a9f49977970501a623310c2d9  netatalk-3.1.18.tar.xz
 # Locally computed
-sha256  8c208e2c94bf3047db33cdbc3ce4325d2b80db61d6cc527f18f9dbd8e95b5cff  netatalk-3.1.17.tar.xz
+sha256  3941effcc2c4e0dceecabc763fbb8478a2f2fbe0af4a6314983cfea452df8d47  netatalk-3.1.18.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 40e64dabeb..53cd53876a 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.17
+NETATALK_VERSION = 3.1.18
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk-$(subst .,-,$(NETATALK_VERSION))
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.xz
 NETATALK_CONFIG_SCRIPTS = netatalk-config
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
