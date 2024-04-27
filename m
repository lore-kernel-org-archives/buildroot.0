Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97C4C19F53
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB33607F3;
	Sat, 27 Apr 2024 18:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRsK5EIVEwOT; Sat, 27 Apr 2024 18:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2C8B60840
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C8B60840;
	Sat, 27 Apr 2024 18:38:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5C0B1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBC48414C9
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRuO8k0RJYju for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6558540771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6558540771
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6558540771
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34a32ba1962so2523800f8f.2
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243084; x=1714847884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x4GRR3xkplz/IVq4Vn4D0D05UhlcYIz4MuwKy4Aosnc=;
 b=ZreqgOg7PDv/pQEpNfmwP535meOQLky2gCePVMC+f8fxhVBiSJq7L7R5qvGhQzZDIa
 q+eg429uIMdKATnsDQeB7fUP529kkCFW998jjfWkP3MjPQ2aYNNlMCVHD0jTFdF+SqKA
 k66tWcbaXYIaBEkHwHbFAG+OYq9f5t9nI7f00dN8Vr3Nrh5i51S1YUvCznNVJJ50UCb8
 loukY2+YP6Uvga4LQJfiV/BMo1b37IYcHKRM13ie6WjDJj06k62rP9cy4Ma7huvbePHR
 qogU6icmuzjb0hS2aCM+lnW87Q1sZWa2eWSwEfMHkgtmT2xErniLSY2D9vREcN3GFy+1
 tqyw==
X-Gm-Message-State: AOJu0YxuSWHGp2iTYu+DuO8EJAMUNk1BlsnXMM0myDRaGl9ri5Vu499j
 ydxXPqdqFqRQcSA2QLYSXrR9Qw2DTTWjo1boA2YlUXiT1c63jDxXoy77PQ==
X-Google-Smtp-Source: AGHT+IHPYPQf99ZORrvs6TxcvkN3RC673ywJNfU8OI7aNP2l9QH0V2CVe0P4TG2jvc6x1mD2Ns4lbQ==
X-Received: by 2002:adf:db4d:0:b0:34c:7372:13ad with SMTP id
 f13-20020adfdb4d000000b0034c737213admr2533147wrj.39.1714243084034; 
 Sat, 27 Apr 2024 11:38:04 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:03 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:50 +0200
Message-ID: <bde3c281e47f0bfb52aa1c623c3964bb5ad34610.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243084; x=1714847884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4GRR3xkplz/IVq4Vn4D0D05UhlcYIz4MuwKy4Aosnc=;
 b=KfLd2ku6rqsv4ldx31Zf8MNLqgd3zhc17cPhtSh4LEHvepmFXPCgAKHXaqwc0qpgww
 IyE0Cg5Vse7IrqWQZ8uTQ2xnaXDePKpfuwDm5IlANKVgeFCg/FSE3cI0REhP6JaprXym
 wY1tuWEvHPhb5ZRkV9x+jP2a/g4NOGax2nCwtP8+RQ8FErmkA/kfRDlGaNbtHu9EIDOa
 2eDhh1Yx2F1l5eZDuqALQ3ib4JsQl4yDb2Ec1waqwiWxX9i5uv1AyIWRVtjHdg6/fJkn
 47O+6KrqSeihCJa4ilg76g0imldPHYur5kpkG9is4gdrRcnWr/m6ErXMbV6Ywsf4ygt3
 9kzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KfLd2ku6
Subject: [Buildroot] [PATCH 03/15 v2] package/*: update hashes for packages
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
index 0188f51c83..3f80f19586 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  133d28fc0071e419682b7ed736c17b39240545c8e9d6ff7e9905f365bb1eb693  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-br1.tar.gz
+sha256  e94800d108e0f7a05df5586456fa812a0b6dd348623332b5cc8f837ccd206ebb  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-br2.tar.gz
 
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
