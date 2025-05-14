Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C256C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 22:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1381830DE;
	Wed, 14 May 2025 22:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11QKmoT5S4aI; Wed, 14 May 2025 22:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CEEE8308D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CEEE8308D;
	Wed, 14 May 2025 22:08:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8547F13D
 for <buildroot@buildroot.org>; Wed, 14 May 2025 22:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81B344013D
 for <buildroot@buildroot.org>; Wed, 14 May 2025 22:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTj7REpxBKwG for <buildroot@buildroot.org>;
 Wed, 14 May 2025 22:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75D96400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75D96400C4
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75D96400C4
 for <buildroot@buildroot.org>; Wed, 14 May 2025 22:07:59 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-549b116321aso240642e87.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747260477; x=1747865277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PxTPveECWOAZ9T0SflBfp2KR6EMTpzh0/RJqVL2XmNU=;
 b=srUgvNCvhqzewM6vzEYi3Kxz5UbF9KZX8zVB7g/a2YNlHL5wg2PX3VTBboSu2Y2JIw
 9tI3hfhmZ8NkrPwKwaaTHt1/kfVz93WudAZNPGfnkfA4Y7TSt5r/Msq1uY00y0Mid6Da
 oULoNfJPAXWDCd6yoA8tMBxLVCmfcklQVxQFk4auVxmGuu0YRkZRXfkf/4Q3AgAgbm5j
 C6r2PBvJLDMDzC57JW8DRNBCYg2iWrQZX3jfr2RqLXWn5DgrljKlt68D9vCE2CJzIcYc
 yBsYQxdQ9QDui0dUsB8q7F2MDgYZ6Y+xFMag1/tIU6JySQ5oGt/EM7VIXVuk8VJgybpw
 ACQg==
X-Gm-Message-State: AOJu0YwWZsW/vY/fFibbMB541xxg0EponzEZLB4H4Np3uV9jd/iSl/zS
 h7RGqPdprGAIrsruVz7/bJRI127hAJTOKnFCWY0ZCP1CankvlCRBFF4fPg==
X-Gm-Gg: ASbGnctNAv4l5tZIR/EUKBD4N9uTHZIdtoH1e64yqzCj0voYttWLabifaY4M1eqVQQe
 t81M56PLV42WCaA/m0xiPaDZ3GEnPuSXV+JFwJLHCLjsqf7ncal2kOUOl3X6j5EbDeXiV7uQD4u
 fefmrVrlM++qd6hnF+hEEmSQ71h/D+qam820sjokyLFzdrg0mxkUsgdq2V39641Qc9QynI60mrI
 p/U0IwjJZgEXVcKZajafPBTCQfWrBENsCUVFexKFcrcnDsTXZjskxJUyCsvB/kSqMGRl/8MTZxd
 vz4TT9sSobeKmrmCTQU5Azk80lwfMA3Amy4P4P3eYvqU0waJzjeVlKCUvKl5Ts6+dPstaTI6xOf
 3lRVtcQ==
X-Google-Smtp-Source: AGHT+IH8UZe3AqOR8gMl2oOO4gaafPwZlQSvCC89q8I9rYU2ByEenz/bElX5Gi9dxdhx9FiYrGDfYQ==
X-Received: by 2002:a05:6512:a92:b0:54e:819a:8345 with SMTP id
 2adb3069b0e04-550dd13ab21mr74483e87.42.1747260476954; 
 Wed, 14 May 2025 15:07:56 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6eeesm2381172e87.124.2025.05.14.15.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 15:07:55 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 15 May 2025 00:07:35 +0200
Message-ID: <20250514220736.1380151-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747260477; x=1747865277; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PxTPveECWOAZ9T0SflBfp2KR6EMTpzh0/RJqVL2XmNU=;
 b=afT1SzsYYSnxdQfYJ0khSqaFOH1DyLHO2f6F333yecTQNL1re+Qj6oPGyA0rXu/Uk2
 9an9l3cpehOhsGWIyUHQqlZMuVQw+uaNPWWPK/TvBcpQEB9V2xu7TTKEGJRF8UhEFnl/
 /4EWsu8YKEoUHW9YFg5/KuazldaezHx2VEchg5hdjY89krks3RSCLlzWHl+alu8lfo5p
 XClGk93jhKS3tOdfYbiL5F0N8kBX0pgsmZhBRR8c+TsdbLporvL//BpVwJbt8UQr/z/K
 MVhnRTLru3yuRICwK3mNRmFSRrN6wPSbA8NVsMhlAi3aF5GT4dEFDXgJ/x0QULG++lsP
 APXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=afT1SzsY
Subject: [Buildroot] [PATCH 1/1] package/mariadb: bump version to 10.11.11
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

Fixes:
Bumping the version to 10.11.11 fixes builds with gcc-15:
"MDEV-35607 Compile error with gcc-15 (signal returns)" (1d6f857534eeadd1b6aaa37d8e27c081421d2ffa)

Remove "0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch", since the problem was fixed
upstream in 4375245d5d9f01cabb6e3fd6c637535e724eae38.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 ...le-failure-fmt-use-incompatible-with.patch | 35 -------------------
 package/mariadb/mariadb.hash                  |  4 +--
 package/mariadb/mariadb.mk                    |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch

diff --git a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch b/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
deleted file mode 100644
index b6c8807f44..0000000000
--- a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 69935c10b95fc7f7a2e1c3ed02831958e1a9b6a4 Mon Sep 17 00:00:00 2001
-From: Daniel Black <daniel@mariadb.org>
-Date: Wed, 22 May 2024 17:43:17 +1000
-Subject: [PATCH] MDEV-34206 compile failure: fmt use incompatible with
- libfmt-10.2.[2]+
-
-Upstream libfmt commit https://github.com/fmtlib/fmt/commit/d70729215fba1d54862e407b626abf86ddf409bf
-now requires the format function to be const.
-
-Adjust the function prototype so it is const and can compile.a
-
-Signed-off-by: Daniel Black <daniel@mariadb.org>
-[Julien: add SoB line with the original patch author name]
-Upstream: https://github.com/MariaDB/server/commit/4375245d5d9f01cabb6e3fd6c637535e724eae38
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- sql/item_strfunc.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sql/item_strfunc.cc b/sql/item_strfunc.cc
-index 4bbf36ec1cf..2ad8a9b3ce5 100644
---- a/sql/item_strfunc.cc
-+++ b/sql/item_strfunc.cc
-@@ -1392,7 +1392,7 @@ bool Item_func_sformat::fix_length_and_dec(THD *thd)
- namespace fmt {
-   template <> struct formatter<String>: formatter<string_view> {
-     template <typename FormatContext>
--    auto format(String c, FormatContext& ctx) -> decltype(ctx.out()) {
-+    auto format(String c, FormatContext& ctx) const -> decltype(ctx.out()) {
-       string_view name = { c.ptr(), c.length() };
-       return formatter<string_view>::format(name, ctx);
-     };
--- 
-2.46.0
-
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index fd73cca4f3..4d0a793096 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.11.6
-sha512  3d77f7be4a26d5a36af56150a5f8ed5e21adeed9bc8ea1bd694e47a25a571bd73468eada7c96e0dfe5a6c81bef625abf71a56d228cf43a738e555e3c0d824a6a  mariadb-10.11.6.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.11
+sha512  d9c154207a9f435ce08d5fbfe31814a739e577c656ef9996cf7e60c2cad8b4c07e2de8d94b6191fefa2b5cbde56437b586f85f144d3b4fcec8533449ed8411ac  mariadb-10.11.11.tar.gz
 
 # Hash for license files
 sha256  2b278a3a2f20696113a7c57c4f3e6a5cdb9a25f2a827e72e0c089a2f805ff91a  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 1dcf6568da..8156af8ee6 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.6
+MARIADB_VERSION = 10.11.11
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
