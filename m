Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58E3CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE23560A43;
	Tue,  3 Sep 2024 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBmxAoQx7mgH; Tue,  3 Sep 2024 20:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9547160A4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9547160A4B;
	Tue,  3 Sep 2024 20:02:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09E141BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 015E940B8A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7D24dQO0aWTM for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3344040AAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3344040AAA
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7662886BF9; Tue,  3 Sep 2024 20:02:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:57:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d9628acba4b40d19dacaff7e7c5d302059dce03
X-Git-Newrev: ec12fde5d5da5d3f132a1a59fafd49bc522378c0
X-Patchwork-Hint: ignore
Message-Id: <20240903200227.7662886BF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: fix build against fmt 11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec12fde5d5da5d3f132a1a59fafd49bc522378c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit adds a backported upstream patch to fix the following build
failure:

build/gerbera-1.12.1/src/cds/cds_objects.cc: In static member function 'static std::string CdsObject::mapFlags(int)':
build/gerbera-1.12.1/src/cds/cds_objects.cc:174:35: error: 'join' is not a member of 'fmt'

Upstreaming the patch was added in version 2.2.0.

Fixes:
 - http://autobuild.buildroot.org/results/aaf054b0bb336d45203b0d869ec6f9e00528ec8e

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../gerbera/0002-Build-against-fmt-11.0.0.patch    | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/package/gerbera/0002-Build-against-fmt-11.0.0.patch b/package/gerbera/0002-Build-against-fmt-11.0.0.patch
new file mode 100644
index 0000000000..27dc05e5cb
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
