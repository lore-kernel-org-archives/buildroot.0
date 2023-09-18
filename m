Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BFBC46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0091940169;
	Mon, 18 Sep 2023 20:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0091940169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0SKW7dWlgQls; Mon, 18 Sep 2023 20:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ADCA415A2;
	Mon, 18 Sep 2023 20:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ADCA415A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C04671BF95F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A29C841989
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A29C841989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVxS8xKOWQLI for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:31:07 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3679F41977
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3679F41977
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40479f8325fso41361305e9.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695069065; x=1695673865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WDM0MVefqJoNDR45NzshSfyAF2Mr67jom8TQ1O7uX0I=;
 b=AVGv8tSIZE2S+Lf5P4tu4sG8+nMSeHRExfwVI9KVJIAEeQl96/wcGHR6jTLEd+Kg1k
 1REb9tf5dLOUrKgKX3L+P5AEJ7T0G4mbInE/UaVIn2XcZUE2VX9QhIcrVQ+ZZDdMwRrc
 nlfeIBVN+oal1Gvnp+uveMWZmiLOYF64DT+aK/SAQeXL5N4KFgfsUOYapMNuCiIyW2gf
 is4IJoxWfz3ShdmKhO6kQ5ctwD8b+Yfg5sqTKGXboqzcjaq9XuRgftyhSfIRMcbb5QTY
 uuMhJuc0aymO/2LzuXyAD04QtZQBTX4PcHFIHUM7g60xSaGU6tu/ggsjsPd6/DC03QTj
 TBdw==
X-Gm-Message-State: AOJu0YzfdYbNv/E9mNvL41CYO95FCwA/7K8hfNpih0EA/Lvcuy3LxYmZ
 zLmWCeJPBYj/EAknpG6gQMhOH51UEWU=
X-Google-Smtp-Source: AGHT+IF0NJaknbkcvDn1y/huKwopbTXdxpbjpcn6gS5Qt8qrbHxRbjK1ivZjMdegWJ0CVrwmrTwHzA==
X-Received: by 2002:a7b:c453:0:b0:401:73b2:f043 with SMTP id
 l19-20020a7bc453000000b0040173b2f043mr9340579wmi.1.1695069065036; 
 Mon, 18 Sep 2023 13:31:05 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:9624:48f1:9fd0:3d3c])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b00401d8181f8bsm16238956wml.25.2023.09.18.13.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:31:04 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:30:59 +0200
Message-Id: <145ac911a5b5a235f21136181711d53efa8e864e.1695069059.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695069059.git.yann.morin.1998@free.fr>
References: <cover.1695069059.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695069065; x=1695673865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDM0MVefqJoNDR45NzshSfyAF2Mr67jom8TQ1O7uX0I=;
 b=TKWI/qRxYQbP4sVBTopgfeWF1ZfiL74Clf63CGco6i08FGFu2w2xq67VRs6Bdd0F3v
 T7cqLriYDZOPq+n5WjyZ1Jn6oGSX8FcCARatSlggzJpWgH5fg8xuLG/niV/GOWsmCCkC
 QYQUIWil/vAsLxwa8na2W1z+g6tC1zQyt/3NSddjBhNBzTObnjByEyjamgLwDG/IyLI/
 rpzwn3TOcAe3ezSVDcAmtDwNN02pxXW5vv/WikEAJ8po1FnwRMNZtFtBdrZWbQC96U7i
 I8E+NVviIR1iAYy4kHc+x5FPPwRZ1s8fNvSuoHHHdhyborpxM2VeDacimeAPML2m+du7
 cElA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TKWI/qRx
Subject: [Buildroot] [PATCH 2/6 v2] package/*: update hashes for packages
 with export-subst git attibute
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those packages use the export-subst git attribute, so the content of
the generated archives change.

Update the hashes accordingly.

For pcm-tools, we no longer need the post-extract hook, as the git
attribute is properly handled in the git download backend.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pcm-tools/pcm-tools.hash         | 2 +-
 package/pcm-tools/pcm-tools.mk           | 8 --------
 package/qt5/qt5knx/qt5knx.hash           | 2 +-
 package/qt5/qt5location/qt5location.hash | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash         | 2 +-
 package/qt5/qt5opcua/qt5opcua.hash       | 2 +-
 6 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
index cfa3faeff7..5be5885d41 100644
--- a/package/pcm-tools/pcm-tools.hash
+++ b/package/pcm-tools/pcm-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  29416f83d1de95594d225f63af34f8f074ee4822010ce2e05b1fabc66933472a  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br1.tar.gz
+sha256  f3eae080e1bdc1f6264709534dff4881fb94d0d78c17ba4c8d0dbd816f6b17b9  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br2.tar.gz
 sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index c530492696..30a8fbf0b6 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -17,14 +17,6 @@ PCM_TOOLS_EXE_FILES = \
 	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
 	pcm-pcicfg pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
 
-# version.h contains git attributes; replace them with the previously-known
-# value.
-define PCM_TOOLS_FIXUP_VERSION_H
-	$(SED) 's/\$$Format:%ci ID=%h\$$/2021-10-25 16:07:54 +0200 ID=93fc9193/' \
-		$(@D)/version.h
-endef
-PCM_TOOLS_POST_EXTRACT_HOOKS += PCM_TOOLS_FIXUP_VERSION_H
-
 define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 031fad5e92..7c78b50615 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  932ea512aa8ceb514ac40ce1fcbebe86c306caff1a0b11320d9a36fd84bae10c  qt5knx-5.15.2-br1.tar.gz
+sha256  df517ec632aca8d95150c73f4c43d1d396452b40d434b5f1969f266f127e1d70  qt5knx-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index f73053f388..bdd3d6c49f 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  90b57a335d8c7311a86865a56b2b9cd944a8a1cafa6a7499de5b35a105c5b247  qt5location-ebdf5b38da6e3fe0a183702bcca395c589c459ed-br1.tar.gz
+sha256  6c4bb905d6e3e43ae4f8e46b0f2ea8dfe1fc27e97399fa69620a3e1cc7dd6555  qt5location-ebdf5b38da6e3fe0a183702bcca395c589c459ed-br2.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index f4ea6b7015..cd4272fb17 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  38f2bc1bcbdf76d30d78c86426c85f62a6c2091c997cad4b087039f795b2b406  qt5mqtt-5.15.2-br1.tar.gz
+sha256  eb7b75ab3f8fa6f512c3e2ba05e1356d15bc850977197ebbd3d360528b05281c  qt5mqtt-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
index e55fb17743..dbc749eaf6 100644
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ b/package/qt5/qt5opcua/qt5opcua.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  562171c6dfd6f4f072316ddb6d7c5bcc8907a68ba31005cb8c20ed75beff34fb  qt5opcua-5.15.2-br1.tar.gz
+sha256  61a39fe7336709a9b2068e250713c2eb66fd3460b2c6e5f7bfc569b15b9cacb9  qt5opcua-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
