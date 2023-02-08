Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A15C636CD
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 00:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A52861052;
	Wed,  8 Feb 2023 00:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A52861052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9UTHrnGgBn7; Wed,  8 Feb 2023 00:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA70661019;
	Wed,  8 Feb 2023 00:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA70661019
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9270E1BF95C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 00:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72C1E61019
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 00:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72C1E61019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CFqLm5CEaoHf for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 00:53:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3466160E02
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3466160E02
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 00:53:49 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id o13so2976820ilt.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 16:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kPz4k9fDMSn0cCzxgRW4SXDTeLIF9yDrVpWLCQmwOFc=;
 b=opgX5ikk4A+1MfUwfeDJ1LJPEr7H1TK5LTXpPVGlW7HFfyBSihge53uHk4xImIRe3p
 EDHUDW6Yur0mPccpkICKlasNstfxtWExnaxcckZt8y7I/FftL8GSzseytrl5b4bsiLBC
 CRydWRcUtBxWflHtkhTlSaNHAT0pvTQAZUIVgkDAxHJAyziAQp2jcUpTdfTeNbf+RC1+
 xX1Q1SKmVhIdjqZT0LrSxfmhLA2dwOdW+8ZFBqvJ9G97ohyHdKfKw50bofEqizSlN9e8
 edeOmSpI41VCurfdOiKVLP6TbJ+ozd9SjaiIaGjbyKoi5mNSpdGYjoIY8a8utM4DWpUy
 v6cw==
X-Gm-Message-State: AO0yUKWEYvOwMAF2HvGJrnd0HX0r7Y9dQNkEUADQQejXloFeDwSkgr4P
 8IuHjzS8HN0RICFcqtphjkvyRV0SzkOXrw==
X-Google-Smtp-Source: AK7set9OfQKzHxGbp5hir9wHwEPdg4Uc0b75y3RTxWTdsQ6jBfhZIa4IWNlTPaGuFxzWDpAc78hpAA==
X-Received: by 2002:a92:9504:0:b0:302:a58f:38ab with SMTP id
 y4-20020a929504000000b00302a58f38abmr4438300ilh.0.1675817628046; 
 Tue, 07 Feb 2023 16:53:48 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056638388a00b003a7cadffda7sm4859331jav.2.2023.02.07.16.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 16:53:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 17:53:43 -0700
Message-Id: <20230208005343.2544457-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kPz4k9fDMSn0cCzxgRW4SXDTeLIF9yDrVpWLCQmwOFc=;
 b=GXluns/CzZOEhPVdkgv8eueyBUr456rvZBE6hOGAb8Bdc3QLh240RhQkpLzXHbu5+E
 rYsAdCTmZM/2eWhQxZPaM0GFWvazWGnCaR6R3cbPamqNFacVsINLVPxE5M370DO/+Etq
 5Hzxll/LZY41VidMO+kFBKsVUYLqjcmhjENmlQ1gO2G+8yu6ctVyTfic5e4bCfVCWdQb
 y4+qLxLSVQrutcn9oXDSBBW3TrLMgkvgWbKkvnZTDoJ05/STUTlaEmR/g/nX0g2FFyNB
 VDTjPwukWQhdX88+ldETjSc90hWv4mTiBzwtEp7/5v7QO0RUz/RD3r317A/Vut38o6b1
 EOoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GXluns/C
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: fix relative
 toolchain_csv paths
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The default toolchain_csv path is a relative path to the buildroot
directory.

If we run genrandconfig with a cwd that is not the buildroot directory
the default toolchain_csv path will be wrong.

To fix this prepend the buildroot directory path to the toolchain_csv
path whenever the toolchain_csv path is not absolute.

Fixes:
FileNotFoundError: [Errno 2] No such file or directory: 'support/config-fragments/autobuild/toolchain-configs.csv'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b3576f8a51..b96f2ee6de 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -115,6 +115,9 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
     toolchain configuration is itself an array of lines of the defconfig.
     """
 
+    if not os.path.isabs(toolchains_csv):
+        toolchains_csv = os.path.join(buildrootdir, toolchains_csv)
+
     with open(toolchains_csv) as r:
         # filter empty lines and comments
         lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
