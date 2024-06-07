Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF57C27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF6A4283D;
	Fri,  7 Jun 2024 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cJsNLQPR5JL; Fri,  7 Jun 2024 17:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F0442824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F0442824;
	Fri,  7 Jun 2024 17:07:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5896E1BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9825884C2D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12r7UU9GtfiO for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C54A284C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C54A284C87
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C54A284C87
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52c4b92c09bso16225e87.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779970; x=1718384770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=enDG+4GCXmhDUoT11eOPCLvbVlOgrgKZhNyDwBnQ0sI=;
 b=HSdrUHni3GdVQQ2vjsiCgrBxaZ8L0ZGlZmpkROqvjEOtrd9C0XOr+yKpfmlQkbzbb0
 GE1IYD9nBPS7UiCRH8wp/FWMasy++ZOYfIf/hjZ9yI6YyL8RkQ+LAn4NP8Z0p85PQlwf
 TGChYSyb7COeLCAXHCyFXW4sWWYeZ/AaFRpsr/jEXj8ScSz4WJpDnM1Kb/7fMspgklhi
 Z0rAC2dvjr46ZmbezjSsz5yU/N8sHek/v3FwDH/41eoupfypFbLQuqD1NcGcAuYyE5ZQ
 UN5tIH5qdG+s0FENMV0FbdEuz3H+ApYJ9q65A0UVtwAO5BWR/e18di7S83stl3P8MddE
 u7OQ==
X-Gm-Message-State: AOJu0YyjPrAkOaLQ0ooZHYoA5SPVjb0pi1uN5wtbCoHEs2+bGfhVO8A2
 1LZGgxTM0HZNmCzaBXYMiCnQc5VgYNM5f2eZLElc5Qtfha+cEpei1g6y6Q==
X-Google-Smtp-Source: AGHT+IGSk9IwMA62x9u0JNt8QroVlgh46OU5i6IGHvzBTGFzMYqsLQe6Vc62sLH6jDnMI5xEfPgAeg==
X-Received: by 2002:a19:2d12:0:b0:52c:2b7a:e516 with SMTP id
 2adb3069b0e04-52c2b7ae54emr142677e87.46.1717779969559; 
 Fri, 07 Jun 2024 10:06:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:57 +0200
Message-ID: <f44efa3be0cd6da2f6f10bb30511dff59e48cca5.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779970; x=1718384770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enDG+4GCXmhDUoT11eOPCLvbVlOgrgKZhNyDwBnQ0sI=;
 b=VUmKPZjCK81R2YDtI9ZD2pREHdzpu6wziU32wfP6NHiacQUITCT+Wy/puSf388znxD
 DXfW8T47zafshgyR6rQaAPfB6irO3AdXSHY42tSWFjqBpgBAaN/3gntmdn0fbFH5CCB8
 Qr4ksgjO0m3D3PCs0v71Dqdm4sEcN0A+EdYeWrPiNs8OCMdKuWL2Tt9jRwLEJCL1im8e
 vuxCIQZ18ce3XnMA/Q8Mdz9vcWGop6G3OXf22bvk30wYWKkLzrNmEQkDs6eNuRm83hUI
 BHhUkjEGkp83ORcIHBVG5+ZYWp44owI+HUumzB3BNyhzkUa13KB+6pIIg+7/KCYqepHf
 p7yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VUmKPZjC
Subject: [Buildroot] [PATCH 16/20 v2] utils/checkpackagelib: add test for
 default _CARGO_LOCKED
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/checkpackagelib/lib_mk.py      |  8 ++++++++
 utils/checkpackagelib/test_lib_mk.py | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index ce2ab5157c..4e9264ba35 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -322,6 +322,8 @@ class UselessFlag(_CheckFunction):
     DEFAULT_AUTOTOOLS_FLAG = re.compile(r"^.*{}".format("|".join([
         r"_AUTORECONF\s*=\s*NO",
         r"_LIBTOOL_PATCH\s*=\s*YES"])))
+    DEFAULT_CARGO_FLAG = re.compile(r"^.*{}".format("|".join([
+        r"_CARGO_LOCKED\s*=\s*YES"])))
     DEFAULT_GENERIC_FLAG = re.compile(r"^.*{}".format("|".join([
         r"_INSTALL_IMAGES\s*=\s*NO",
         r"_INSTALL_REDISTRIBUTE\s*=\s*YES",
@@ -357,6 +359,12 @@ class UselessFlag(_CheckFunction):
                     .format(self.filename, lineno, self.url_to_manual),
                     text]
 
+        if self.DEFAULT_CARGO_FLAG.search(text):
+            return ["{}:{}: useless default value "
+                    "({}#_infrastructure_for_cargo_based_packages)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
 
 class VariableWithBraces(_CheckFunction):
     VARIABLE_WITH_BRACES = re.compile(r"^[^#].*[^$]\${\w+}")
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 2086237ebb..bc26e16f8c 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -599,6 +599,24 @@ UselessFlag = [
      'any.mk',
      'ANY_LIBTOOL_PATCH= \t NO\n',
      []),
+    ('cargo locked no',
+     'any.mk',
+     'ANY_CARGO_LOCKED=NO\n',
+     []),
+    ('host cargo locked no',
+     'any.mk',
+     'HOST_ANY_CARGO_LOCKED=NO\n',
+     []),
+    ('cargo locked yes',
+     'any.mk',
+     'HOST_ANY_CARGO_LOCKED=YES\n',
+     [['any.mk:1: useless default value (url#_infrastructure_for_cargo_based_packages)',
+       'HOST_ANY_CARGO_LOCKED=YES\n']]),
+    ('host cargo locked yes',
+     'any.mk',
+     'ANY_CARGO_LOCKED=YES\n',
+     [['any.mk:1: useless default value (url#_infrastructure_for_cargo_based_packages)',
+       'ANY_CARGO_LOCKED=YES\n']]),
     ('generic',
      'any.mk',
      'ANY_INSTALL_IMAGES = NO\n'
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
