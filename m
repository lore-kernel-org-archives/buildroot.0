Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA0BCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 21:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A382780D91;
	Mon,  2 Sep 2024 21:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnwOYHDQZsjE; Mon,  2 Sep 2024 21:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6389380DC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6389380DC5;
	Mon,  2 Sep 2024 21:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4D2B1BF471
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 21:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF5BF4032E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 21:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70YXotOn6P6J for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 21:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECD4040328
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD4040328
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECD4040328
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 21:43:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso38675955e9.0
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 14:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725313432; x=1725918232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ek/Bz+chJaik8cNNK4IIopjLAcXAu9ulxxRg/Cs+vps=;
 b=vYcuePpBsXWDJtKyzuFlXKopDwu7AgIXaapaqdFxlrmH0iG7X9DwA3On0GVDXvSX7h
 FhYSSyGtAN4fUQ3GWCZ4OxqrV0Vm/9m6wMfL8K4njiqVW8SnOfSXbw/wt6+tCKk0/o9X
 f/xHJQcDndDshrWwZj42UY/JCVuOrlcVAgi7Nz9fUclwAxUMdd00HUU3y6v5g7FAdnSz
 HA9AG+HcGHHy4guidWhVGfG11kYUc4Yr8sjCjBIIrTKHRCOmh7bwXqBhF3HQoHFCPrP+
 GEaJ0MSs1MHO73teAloGHAuLUX/wSOZzb0qLswdI4Nrxbn+7eloQnq1UsUtHljbO6G+4
 vnLA==
X-Gm-Message-State: AOJu0YwZwesELcdnqHBz50IzCZZGSbSTxT7+NJOTzhwXrAVP/JSTDUal
 clZ7Ja6+YI8qbjBOCyKuVDVZR+6hw/l/plVMN+le03nUwPfRn2P22myQnMO79QyHow0MHn8rRjT
 lcnc=
X-Google-Smtp-Source: AGHT+IHsZIavXZrEA58007Jo1neca8uYz45R87reMvvbA/9wExiJXm9sT+enXt7p7PWS/vmSewL1aQ==
X-Received: by 2002:a05:600c:4e8d:b0:426:61af:e1d3 with SMTP id
 5b1f17b1804b1-42c82f6cb34mr30175825e9.31.1725313431327; 
 Mon, 02 Sep 2024 14:43:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbdda3958sm116771605e9.26.2024.09.02.14.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 14:43:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 23:43:43 +0200
Message-ID: <20240902214343.249108-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725313432; x=1725918232;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ek/Bz+chJaik8cNNK4IIopjLAcXAu9ulxxRg/Cs+vps=;
 b=bH0cLZZhjjhrDA2QZvh7kwL/xACTJ6fETAjrDJHXXPDOrNpJGVcHRxJyN6JbapYvFz
 H22o09su0lxx/JPeoRflGSYSk5466is8KN93znj6FtvxSIXS66ZXkHIxFhImEXcUqtDp
 CPLmj3j50MjE+7rBeEB3Efd457kS+QVlAlgJc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bH0cLZZh
Subject: [Buildroot] [PATCH 1/1] package/gerbera: fix build against fmt 11.
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit adds a backported upstream patch to fix the following build
failure:

build/gerbera-1.12.1/src/cds/cds_objects.cc: In static member function 'static std::string CdsObject::mapFlags(int)':
build/gerbera-1.12.1/src/cds/cds_objects.cc:174:35: error: 'join' is not a member of 'fmt'

Upstreaming the patch was added in version 2.2.0.

Fixes:
 - http://autobuild.buildroot.org/results/aaf054b0bb336d45203b0d869ec6f9e00528ec8e

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0002-Build-against-fmt-11.0.0.patch       | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 package/gerbera/0002-Build-against-fmt-11.0.0.patch

diff --git a/package/gerbera/0002-Build-against-fmt-11.0.0.patch b/package/gerbera/0002-Build-against-fmt-11.0.0.patch
new file mode 100644
index 000000000000..27dc05e5cb13
--- /dev/null
+++ b/package/gerbera/0002-Build-against-fmt-11.0.0.patch
@@ -0,0 +1,136 @@
+From bb9e80f4225d4ecb0d75d80c16b0ba3ddb12b1dc Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Mon, 2 Sep 2024 23:30:19 +0200
+Subject: [PATCH] Build against fmt 11.0.0
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: backport from upstream https://github.com/gerbera/gerbera/commit/f1f266efbb0a6adac160e428cd14c20f6ecd3e5d
+---
+ README.md                         | 2 +-
+ scripts/install-spdlog.sh         | 4 +++-
+ scripts/versions.sh               | 2 +-
+ src/database/sql_format.h         | 3 +++
+ src/util/logger.h                 | 5 ++++-
+ src/util/url_utils.cc             | 7 ++++++-
+ test/scripting/mock/duk_helper.cc | 4 +++-
+ 7 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/README.md b/README.md
+index a1992738f009..990a9af8855f 100644
+--- a/README.md
++++ b/README.md
+@@ -53,7 +53,7 @@ sudo make install
+ | libiconv            |             |             |               | Required      | Charset conversion         |          |
+ | sqlite3             | 3.7.0       | 3.35.5      | 3.36.0        | Required      | Database storage           |          |
+ | zlib                |             |             |               | Required      | Data compression           |          |
+-| [fmtlib]            | 7.1.3       | 7.1.3       | 9.1.0         | Required      | Fast string formatting     |          |
++| [fmtlib]            | 7.1.3       | 9.1.0       | 11.0.0        | Required      | Fast string formatting     |          |
+ | [spdlog]            | 1.8.1       | 1.8.5       | 1.11.0        | Required      | Runtime logging            |          |
+ | [duktape]           | 2.1.0       | 2.6.0       | 2.7.0         | Optional      | Scripting Support          | Enabled  |
+ | mysql               |             |             |               | Optional      | Alternate database storage | Disabled |
+diff --git a/scripts/install-spdlog.sh b/scripts/install-spdlog.sh
+index 8a758e35b579..5c1426e3d44f 100755
+--- a/scripts/install-spdlog.sh
++++ b/scripts/install-spdlog.sh
+@@ -39,7 +39,9 @@ fi
+ mkdir build
+ cd build
+ 
+-cmake .. -DSPDLOG_FMT_EXTERNAL=ON -DBUILD_SHARED_LIBS=${BUILD_SHARED}
++cmake .. -DSPDLOG_FMT_EXTERNAL=ON \
++         -DBUILD_SHARED_LIBS=${BUILD_SHARED} \
++         -DSPDLOG_BUILD_EXAMPLE=OFF
+ 
+ if command -v nproc >/dev/null 2>&1; then
+     make "-j$(nproc)"
+diff --git a/scripts/versions.sh b/scripts/versions.sh
+index 19a0f80f79ac..8c1ffe7d590d 100644
+--- a/scripts/versions.sh
++++ b/scripts/versions.sh
+@@ -36,7 +36,7 @@ else
+     EBML="1.4.4"
+     EXIV2="v0.27.5"
+     FFMPEGTHUMBNAILER="2.2.2"
+-    FMT="9.1.0"
++    FMT="11.0.0"
+     GOOGLETEST="1.12.1"
+     LASTFM="0.4.0"
+     MATROSKA="1.7.1"
+diff --git a/src/database/sql_format.h b/src/database/sql_format.h
+index 551122eb7cf7..d64edae69372 100644
+--- a/src/database/sql_format.h
++++ b/src/database/sql_format.h
+@@ -26,6 +26,9 @@
+ #define __SQL_FORMAT_H__
+ 
+ #include <fmt/format.h>
++#if FMT_VERSION >= 100202
++#include <fmt/ranges.h>
++#endif
+ 
+ struct SQLIdentifier {
+     constexpr SQLIdentifier(std::string_view name, char quote_begin, char quote_end)
+diff --git a/src/util/logger.h b/src/util/logger.h
+index a121ead31e95..d51e60430ed9 100644
+--- a/src/util/logger.h
++++ b/src/util/logger.h
+@@ -36,6 +36,9 @@
+ 
+ #include <array>
+ #include <fmt/format.h>
++#if FMT_VERSION >= 100202
++#include <fmt/ranges.h>
++#endif
+ #include <map>
+ #include <spdlog/spdlog.h>
+ #include <type_traits>
+@@ -135,7 +138,7 @@ template <typename T>
+ struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
+     : formatter<std::underlying_type_t<T>> {
+     template <typename FormatContext>
+-    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
++    auto format(const T& value, FormatContext& ctx) const -> decltype(ctx.out())
+     {
+         return fmt::formatter<std::underlying_type_t<T>>::format(
+             static_cast<std::underlying_type_t<T>>(value), ctx);
+diff --git a/src/util/url_utils.cc b/src/util/url_utils.cc
+index b1c9fecef863..84f6f3be43d4 100644
+--- a/src/util/url_utils.cc
++++ b/src/util/url_utils.cc
+@@ -23,11 +23,16 @@ Gerbera - https://gerbera.io/
+ 
+ #include "url_utils.h" // API
+ 
++#include "exceptions.h"
++
++
+ #include <fmt/format.h>
++#if FMT_VERSION >= 100202
++#include <fmt/ranges.h>
++#endif
+ #include <sstream>
+ 
+ #include "common.h"
+-#include "exceptions.h"
+ 
+ namespace URLUtils {
+ 
+diff --git a/test/scripting/mock/duk_helper.cc b/test/scripting/mock/duk_helper.cc
+index 71bdc5d025f7..f1ab1cfef8a7 100644
+--- a/test/scripting/mock/duk_helper.cc
++++ b/test/scripting/mock/duk_helper.cc
+@@ -24,8 +24,10 @@
+ #include "duk_helper.h"
+ #include <duk_config.h>
+ #include <duktape.h>
+-#include <fmt/core.h>
+ #include <fmt/format.h>
++#if FMT_VERSION >= 100202
++#include <fmt/ranges.h>
++#endif
+ #include <regex>
+ 
+ std::vector<std::string> DukTestHelper::arrayToVector(duk_context* ctx, duk_idx_t idx)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
