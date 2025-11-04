Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AEBCCFA06
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 11:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03B4A811AF;
	Tue,  4 Nov 2025 11:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuittk3h4Q5m; Tue,  4 Nov 2025 11:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 366A0811C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 366A0811C4;
	Tue,  4 Nov 2025 11:20:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B399278
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68934811C4
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OubOw_OM58c1 for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 11:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A87C0811AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A87C0811AF
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A87C0811AF
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:19:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b70b0f3ce18so22183466b.0
 for <buildroot@buildroot.org>; Tue, 04 Nov 2025 03:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762255195; x=1762859995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwBgxdbb1TUawqtQDNFajsdHqfFrkDUbgmYOXV+EQfc=;
 b=dMRi9XxUmaunr/Mf/yQiV4TUWcRzbGMfld/FaxQX+/ill7guTN6VnV3tQaJjHzmfjv
 7Df913GSZjqss9/qAZE0KxtLPBQt3Ms5q+qSQSMG58smVPEe6TGmCwUfyZlO4/yDwyaG
 RrteFsWYDSFu7vgzbtrpVCxzroHV6JdP0ia3C5O/34kVjn9O3P2j7wuqmJJhSlVY7PJv
 WlmCx93cxfTFj/wTxYeV/fQnpcQz+gurMyVzLDNvaVcEuT2wKk4qqXd+CBspNVf4dC1u
 RhKpyvGLQQEzkoK1sz/s+naBN+a8wP4//B3XMV01oUV2F7Lj+LyzbWxcWo+udSJAmVk0
 P7uA==
X-Gm-Message-State: AOJu0YxHJJyOrrsdyAz78nSQOtdZo2dTwmFoaQtWNjrdMVJ0FUON9PBd
 6CDxizD2gEg45KwLaubFMei8LODjkrfa9ayPcypYvH7DebTFW3QhYonwUvzliuJjeBUeJvtL2dR
 a26GJ
X-Gm-Gg: ASbGnctsLwZAxruur+tVyF9Ge156IMhRSp0bs14+w50VePYTDpyQm9oTaFpVwWOpTN1
 pfbI2S5IJwuZsZch7+GHXwR0tc3FyrWmSXxGymkf+GbirnViKRSKV+fqTA28jcVajT/HHNBWjfw
 hFlhfWYjok6aOFgBORIazbm+3Gw79pe1lwJRwxKEzAvzxaOgR4pS66Q6jY+M5zZUsd2ouoJfvLR
 xR1GG8HwePkFM52XkRoIEfpFuMQ6rouDOA6DHhwKOIq5MukLo5nteWjxwDukjR7bkdDaJhegG7e
 l6Zn48jjC8dHs+qHVPugbpI/ZeNKA5FdHohM+6fxUDp8d1Zni/sj1kr89qijlUFQX3/UTHjTAp9
 bqLHzQKbcJCxFU5Z7gsRhTfyj3HV1rprGH6GuS3DqMkCRVSniS2keBHONjvcPh8ParOSOBsTRRI
 E7wncMaKUMm2UJ9O/3yH7ApjvkzcKab8ZIEKh8Kkw5BpEHm089iOIgD6I5bdKCu/GgF/0kEXZ8K
 uS3Tw988rugOAvx6bxqBp716Dfr41nz4DoVgF4lJw==
X-Google-Smtp-Source: AGHT+IHhlqp+YmmCLmB4n7e7/MlZPTyT1Z2Ssk499IrfZQtI+6ayNcdhKdfJxV6iGjTKYcG34GTIAg==
X-Received: by 2002:a17:906:26d0:b0:b70:ab64:434f with SMTP id
 a640c23a62f3a-b70ab64649dmr371759766b.6.1762255195356; 
 Tue, 04 Nov 2025 03:19:55 -0800 (PST)
Received: from adam.arnhem.chello.nl
 (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b723f6e26adsm185998566b.43.2025.11.04.03.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 03:19:54 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue,  4 Nov 2025 12:19:52 +0100
Message-ID: <20251104111952.246662-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104111952.246662-1-adam.duskett@amarulasolutions.com>
References: <20251104111952.246662-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762255195; x=1762859995;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwBgxdbb1TUawqtQDNFajsdHqfFrkDUbgmYOXV+EQfc=;
 b=Dz1rmysN37Jr0w51dFefpqj6e6WihkAC+tYyUpA3pVHNbgbGfU2rNUiyhQyOvTqKza
 HLe0k+NQUfXghDyQCJhPJpnx63hKQBK/g8TjXGc08e+c3Uck3GG/3B0BN/JVnHrwig2e
 q7WFXQDvCByIFXE7tJjbzRm+X7QrH2oX9HHvQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Dz1rmysN
Subject: [Buildroot] [PATCH] package/depot-tools: fix running gclient.py
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

As of commit 55a80f89d7321000591de349c7083a94c0349187 which updated
the python-httplib2 package from 0.22.0 to 0.31.0, gclient.py has
been broken due to the internal socks.py file being removed from
the httplib directory.

As the depot-tools package doesn't have a build step, and is only
used when generating a flutter-engine tarball, no autobuild failures
have occured.

Add a simple patch that changes `import httplib2.socks` to
`import socks` and depend on the host-python-pysocks package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...1-gerrit_util.py-fix-importing-socks.patch | 32 +++++++++++++++++++
 package/depot-tools/depot-tools.mk            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch

diff --git a/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch b/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch
new file mode 100644
index 0000000000..712f7c417e
--- /dev/null
+++ b/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch
@@ -0,0 +1,32 @@
+From e52f67026d7ce5b30887e1cfe486ed994169119d Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 4 Nov 2025 11:58:37 +0100
+Subject: [PATCH] gerrit_util.py: fix importing socks
+
+As of commit 1a6ff781792099e9e14d7beb610bd99112b17b07,
+httplib2 removed the internal copy of socksipy module.
+
+The commit message specifically states to install pysocks.
+
+[Upstream status: unsubmitted]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ gerrit_util.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gerrit_util.py b/gerrit_util.py
+index eef2f5749..d866bc47a 100644
+--- a/gerrit_util.py
++++ b/gerrit_util.py
+@@ -35,7 +35,7 @@ from typing import NamedTuple, List, Optional
+ from typing import Tuple, TypedDict, cast
+ 
+ import httplib2
+-import httplib2.socks
++import socks
+ 
+ import auth
+ import gclient_utils
+-- 
+2.51.1
+
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index b62f844b90..a6d57a6e3b 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -14,6 +14,7 @@ HOST_DEPOT_TOOLS_DEPENDENCIES = \
 	host-python3 \
 	host-python-httplib2 \
 	host-python-pyparsing \
+	host-python-pysocks \
 	host-python-six
 
 define HOST_DEPOT_TOOLS_INSTALL_CMDS
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
