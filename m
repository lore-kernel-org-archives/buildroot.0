Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55068CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 11:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD7F160F58;
	Tue,  4 Nov 2025 11:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocgOh05FU1YT; Tue,  4 Nov 2025 11:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E8F60F76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E8F60F76;
	Tue,  4 Nov 2025 11:30:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FD26462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11C6B81F92
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_WiyLQKxIsa for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 11:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7BF781F67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7BF781F67
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7BF781F67
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:30:39 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63c2adf6e76so1118694a12.3
 for <buildroot@buildroot.org>; Tue, 04 Nov 2025 03:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762255837; x=1762860637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7XeDbZCWU2N8E1jhJw+f30JCHNL5ZJy1BgLZ2p6iB/k=;
 b=s3rDFTz1UkSlHuRZArMwptK+XC7UL7EeYxBYSp6OEZ8dDOijih2XtXYrdYUQAymGFP
 7jJw6Mhw34bTHXsugaJBXmsLErjpoapJbwYM6u/QxTWjfnRZal6GXDBgq+tJ7Nnfe/2k
 RWyWzX/UyMRGjh49QHasgmFdsTzGYVDhdz9ewNwwqMOSLMCHxt8M1kt32GwAnm1Njvw4
 efdaG2u7J5kHoPIgZdyBT7Q3s1XqOJsOifnzpf6ppiHHo3z0B00Js/UVhC6WFJa7v35D
 3LFWUrO4Zo1/BRW2C2b2/Lzc7cbyNyNR4VvXSqOOGll4m6urvgRGaEsddbDcslIpJkc2
 FQ5Q==
X-Gm-Message-State: AOJu0YwNCcz8NnkgTSmQKw3++d9GXNEDhQPwCzEKmw9LYaPQPoVxkFOj
 lMW+sfW+UhJs01rD7sy7801be98mXK+ALrBSxhJt+DkuAg/7gJzFo5v2PzkECfA/aOlvSPhdqwm
 NJVBi
X-Gm-Gg: ASbGncumeT/Zd1eU06YcbA8Vkau2tzQgCb4TeKkipYrxMClUdi4XShKxFi3OEgfaTbV
 QWrLXg/Xcxg7j88hQYj9oIKDm0/khKk/IBgIM2WpD1wZZQQgHb+TB8O3/9xWxOQRfqh5Xeks9+3
 BCPhmJfyuZgkJ6eKp+kpCmhv23ZOsb/+GbwqLICOP5NANX/zJl2Lca5yeV5O9s1iLB3P5Unu9WM
 YABSN4IXDyGXb+yEyKJrCC16z+o0Xq+Y8KXVnME+a1sE8BtToDDi2EqX7SiCXfTUo2Ueuy4Rusw
 YqstR6rBiVf99vSMkFF9njyxSyFXn0+iaw/VWWjhfoHuvNBl7YqTtXFsAt5QD0QtQo0Xzg5sEdM
 Zw+flo/t1YsSXr+WdlbJSQQlxV27cxTxDZ5a12WH0h7uJHT8C1zRIoVVxzAMKhBsYItU+fZ4+Al
 +sszjFIX9Tak56Lnn/1ir7JZ1icUUoaww4sV+tl37VBC3M2VPwdORU/Xh/xcjgivZuUpjdaUKcV
 4pYAc8lhxlPznV1gpvFZ8ahQ69zjBybtj3QwzmejFjX/Qch8bIb
X-Google-Smtp-Source: AGHT+IHfq8DkhsNI3EYr5SzWiXI7iVpcktC5WLasdScsdryq25AfBRpSP/zOxTcptNdfzhML1Ahz5w==
X-Received: by 2002:a05:6402:1471:b0:640:ca67:848c with SMTP id
 4fb4d7f45d1cf-640ca67893fmr2735159a12.2.1762255837133; 
 Tue, 04 Nov 2025 03:30:37 -0800 (PST)
Received: from adam.arnhem.chello.nl
 (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-640e680578esm1822655a12.10.2025.11.04.03.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 03:30:36 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue,  4 Nov 2025 12:30:32 +0100
Message-ID: <20251104113032.674980-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104113032.674980-1-adam.duskett@amarulasolutions.com>
References: <20251104113032.674980-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762255837; x=1762860637;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XeDbZCWU2N8E1jhJw+f30JCHNL5ZJy1BgLZ2p6iB/k=;
 b=lZsJglL+WsI4Y62qc9xhxCXgldPGwHLqHxzAzC4LPfaB0/gyitSLs91XKLbB0ZkvBX
 RsIeLvQy9KRqf/DiR95UyLSwe81hJhjc+vKb7Rxu5+02sIb1+dTr0Y5Q0NLPVHoGHs9Z
 efgReR2yxVXI7oHQ1lCBrQZ7ToRLp3GFv/AI4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lZsJglL+
Subject: [Buildroot] [PATCH v2] package/depot-tools: fix running gclient.py
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
v1 -> v2: Fixed upstream line

 ...1-gerrit_util.py-fix-importing-socks.patch | 32 +++++++++++++++++++
 package/depot-tools/depot-tools.mk            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch

diff --git a/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch b/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch
new file mode 100644
index 0000000000..d0ec6a535d
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
+Upstream: unsubmitted
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
