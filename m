Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23714C4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 17:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B5D81AF3;
	Fri, 30 Dec 2022 17:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B5D81AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtlUkczCHanu; Fri, 30 Dec 2022 17:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF39F81A23;
	Fri, 30 Dec 2022 17:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF39F81A23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAFE81BF3BC
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 17:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94E5A40990
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 17:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94E5A40990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OjjDOwjRsSyK for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 17:53:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5364D40981
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5364D40981
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 17:53:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j17so15077983wrr.7
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 09:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LL0Z8cw3rquIK086x1hS9WHSsjVxZeLKxChEJ9dyz9w=;
 b=Te+9vg3NXmLgtnoh4Vb66s/LWOrlZ1xwEQYQCLIbs/gjLOf0zt8ZF6cL/DBhZs2zWu
 JvXf9IGOeMPDT2dbQpDHnlaH8NFFR0/oZhWCdfzH8C1/j06Kf+34Sy8WdD6FPRJII6ZR
 lOnMUBD2mWilJYK63WfvBp6leblQmM/6FufBdi0gwu0tdt+z2lMR3KcXQWITtDoc6hta
 i/V5MkdphWz5my5IP4ZiNhs+lVnwe+KoztU88gG+x+BMvbiYUrAXzj/673O+3uBEKVgw
 tIDClUtbiM2V9xfU0f35jQK+uNcxrt61qFDiBlAUDjoihJoDl/fLeHcX4w+YVcO1FIJE
 TiCw==
X-Gm-Message-State: AFqh2krbU1hYpeYzINL8zVGY1MP99hjOWSwbK2fJ7Z2RlbT5iTKNNLHG
 DGal4r7fGFNB1/ERW1QsfFjQH6Ukzl0=
X-Google-Smtp-Source: AMrXdXvJV+1ZaI0pahva/U8agD+tDbbf5oAGNgsFS6YkRbX+BdUKoUQrDd2FYGacC1Q+IEeEu8umDg==
X-Received: by 2002:a5d:4008:0:b0:242:17d3:a9fc with SMTP id
 n8-20020a5d4008000000b0024217d3a9fcmr20107851wrp.30.1672422832293; 
 Fri, 30 Dec 2022 09:53:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t13-20020adfe44d000000b002365b759b65sm20886924wrm.86.2022.12.30.09.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 09:53:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 18:53:50 +0100
Message-Id: <20221230175350.412551-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LL0Z8cw3rquIK086x1hS9WHSsjVxZeLKxChEJ9dyz9w=;
 b=GjsCbsPZWH1uqYZJgbCQK+BnAccwq6lNC1uxSpVFbJL6HmbwBR7lgWBvrmF4zIbEFP
 e303+qllJ2fYo9XySWuJxhUXwh6sZpdtNOU0dH+IociC95FhqZBphZSh+h3EN0eCn64b
 TArlvjVqsL0WkREN3g5ptzXo98q3KkaH3YoDwpdFQQ8l2nZOhRDcYPhEFinhWYyxa5Nv
 T2rvzwCIiPHNRVzs9r/kzO1QyjRC1x7Mrv0sRmHAxj4mwpTvQh3ml8if8nGic4eMldee
 9V/YYNm/ONzD/LhgDR3MzNW7E40iqvNSm7yHIeeyCDJFtnZnD1XyD+LvaCj5hdfNp1P+
 CTHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GjsCbsPZ
Subject: [Buildroot] [PATCH 1/1] package/crun: needs fexecve
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

crun unconditionally uses fexecve since its addition in commit
530d6f661e506a4774b7236cb93d65f669adbc92 and
https://github.com/containers/crun/commit/ce4dfbb97a8a05bef125030eaa6c46c07a5f9344:
resulting in the following uclibc build failure:

/tmp/instance-11/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: src/libcrun/crun-cloned_binary.o: in function `ensure_cloned_binary':
cloned_binary.c:(.text+0x1006): undefined reference to `fexecve'

Fixes:
 - http://autobuild.buildroot.org/results/e1f4ef2b392c0e7161390ba0f97d6eef3bd12e9c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crun/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index 5def7001c1..fa0894e126 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_YAJL # libocispec
 	help
 	  crun is a fast and low-memory OCI Container Runtime in C.
 
 	  https://github.com/containers/crun
+
+comment "crun needs a glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
