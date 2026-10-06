Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA55CA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 14:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E7240635;
	Tue,  6 Oct 2026 14:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMPcM2XIRitu; Tue,  6 Oct 2026 14:30:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C880540613
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791297027;
	b=SnBDyEWFSJBlWi90SYXqpzFOZot4C/efrHlEvBlQ2uBz2khzI1KMaLWBv5leS9nlysmf
	 OV8RAxAJ75IARyr8gH0VDBxFfzl45GATDo5l5vV0PYGO1Ju2eSz+GjqqqHT9g2hYEZaMx
	 r76lx93fIElnxKtQLdABb10Mimstjddie8gqxvsd18i/QVjlx41GXLvaBY3Dyv+W0wuuR
	 /xHdZzENarPnD+PfFZTQhK7xf3trW9K1R8gF7UXayk4l8GV3ytGrJTD1r+yn/OrE/tcPO
	 qBR98hG/4A7xosCC8biTjRNVuKFoCAU2UbJfFRGVRZatHc6HFsSSIiisE3fJuc4m8XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791297027;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y152QvIcu6gFd1IQunZvspeinSdDuV7Mm4Y+bOnWXG8=;
	b=K48wLomQqoCFL1ZmuoTdLqVPpUbvj/mfiKcIBRtjjdjRV8jX8NJbgtdTjT/+7aM0aeSV
	 bbSgvmjh7Rgn1OtdSUXa8Yet8YwLI4VUx0LIHr003Ma42FcvcGuUVpsn1WilKoCwCSrG5
	 E6/BTFfb5NoOpU/aFRDgar/jHOvbiYvIub0bYoLgDDRZeiLrzCHmUndPxHafn/DLYjStx
	 ilUVlKntTSzKVK92kOYctdLLwqnqocRNQcUrlrKAXvqLi8/yL26gAmd43amXBPf96c1ns
	 QtLqykMK82dnR7f2E2yTg64Jdul2e3sGtNrNWlhW8rc+tmHBjlgcqFH1T5jIKY2E5/w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791297027;
	bh=y152QvIcu6gFd1IQunZvspeinSdDuV7Mm4Y+bOnWXG8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kWstn9drujit1ixrZwYyi/KRaPpttvrlHSt2ntFQrX8bukc6yXaXXftC/bpdUEInN
	 n2fpKWnw9sk3pOrcCB54UpVRYvF9xmQ130BoJen6MJvRMwKd0I/YE2C24QmqBko2Ug
	 7S8/jDsvnJx2e53sobn89hnyHfNuvpXaZPyVBNiS1iTNG5Cs7lZW1N2oW+huVjdPDx
	 ZlndX8Cj4E0pVJTk8439GEfPcN22FzyD+hM+yYF67tdGCcD1CTheaRLZXKXL+6Upqk
	 Jp9Eeulw8WB86UXYMheuk45IzauGp+ZgOhA42rtr1hkM6LFcVux1MV5UkwNeg7SsT4
	 ru6SJxhyLfrgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C880540613;
	Tue,  6 Oct 2026 14:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12B48341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 009A780D6E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CB-G3f0yFks9 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 14:19:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BD55980D60
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791296395;
 b=IJdL0rhRVgsyiJazNJ+aEX0+HkNbplF3pHOYjF+7EDJBIgGTJAtBnuLPwnnW+E3LLiej
 mYfC/xA3wzqZMZbNPh5KqRgAZ8TP7S2WVTq+LoLuLCV08Db05Y2EifPAIvkaGPk24+lXh
 OXjaXaFNNr76KKBHUfLcQFspndEzICjHo4jpfZMms2DV/zfKj50o2WadWF1+iZHFVVAZD
 ctzEYVFrVTBFLb44cwcuiN4RUna5hD9qZCxGilgX9jg/ZIQ6DyITheCD2ZYXfce2ARkUR
 cEW42RBBSy/HfgFO7RwzOb8CU4hyBFGurMnZ5H1HCNt9dNoHIFJw2r8N04Weh3fSfYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791296395;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DeuTMwqUAp7hRYyZ8DdoAFAosk5lQePzxu8b2Sfg6Hg=;
 b=mxuGYrF+SyEZ5NjQ8WKlnPCxdIlgtgABWhhaOF9qzfKH7C0s2F0xWEUqXQYjpsr+T37f
 A1zrTO/POPnWsepXB7RqSDcayFoPnDZcuoiCHIVlvCTHXo519ViTh9rtZmAUm4MgsMe9A
 NkAaZUJ8Zocty+2BunRklGObNbWwdUf6PPUliAN8cVpw4tPVSaRx/hVnOo/RB7lQHInIS
 RFfQPk1oRAOOfksED/xgv/8DUgQKR7rxae+dCjvKr6SOYFY0a0hfCAicoGskhjF1yOYS8
 VPszerAqXb0OTk0kPrMj+EHcOrwi/3c+2OxZJ83Z7PPS3Hb1sjdCIBLfXbLaVmyzbyQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD55980D60
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:19:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8806E8D562; Tue,  6 Oct 2026 14:18:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:07:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cfad4f0f4b9fcb616b99b0fc6ae01e460d909d5
X-Git-Newrev: 40c2d541c03a1dcce448b3a9d7a0ca2c4bbf9527
X-Patchwork-Hint: ignore
Message-Id: <20261006141839.8806E8D562@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: bump version to 3.3.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40c2d541c03a1dcce448b3a9d7a0ca2c4bbf9527
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/gerbera/gerbera/blob/v3.3.0/ReleaseNotes.md

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../gerbera/0001-Fix-the-following-errors.patch    | 148 ---------------------
 package/gerbera/0002-Fix-the-following-error.patch |  47 -------
 package/gerbera/gerbera.hash                       |   2 +-
 package/gerbera/gerbera.mk                         |   2 +-
 4 files changed, 2 insertions(+), 197 deletions(-)

diff --git a/package/gerbera/0001-Fix-the-following-errors.patch b/package/gerbera/0001-Fix-the-following-errors.patch
deleted file mode 100644
index c474d32aab..0000000000
--- a/package/gerbera/0001-Fix-the-following-errors.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 7caa9ae9ebf5c4cded5a292701528ff1d5c4946e Mon Sep 17 00:00:00 2001
-From: Downtown Allday <downtownallday@gmail.com>
-Date: Fri, 3 Apr 2026 09:31:07 -0400
-Subject: [PATCH] Fix the following errors: error: no member named 'strerror'
- in namespace 'std' error: no member named 'memcpy' in namespace 'std' error:
- no member named 'strchr' in namespace 'std'
-
-all of these require <cstring>. see:
-https://en.cppreference.com/w/cpp/string/byte/strerror
-https://en.cppreference.com/w/cpp/string/byte/memcpy
-https://en.cppreference.com/w/cpp/string/byte/strchr
-
-Upstream: https://github.com/gerbera/gerbera/commit/7caa9ae9ebf5c4cded5a292701528ff1d5c4946e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/config/setup/config_setup_path.cc | 1 +
- src/content/inotify/mt_inotify.cc     | 1 +
- src/iohandler/mem_io_handler.cc       | 1 +
- src/util/grb_fs.cc                    | 1 +
- src/util/grb_net.cc                   | 1 +
- src/util/string_converter.cc          | 1 +
- src/util/thread_executor.cc           | 1 +
- src/util/thread_runner.h              | 1 +
- src/util/tools.cc                     | 1 +
- src/util/url_utils.cc                 | 1 +
- 10 files changed, 10 insertions(+)
-
-diff --git a/src/config/setup/config_setup_path.cc b/src/config/setup/config_setup_path.cc
-index cdb7244e4..a10e3c9f2 100644
---- a/src/config/setup/config_setup_path.cc
-+++ b/src/config/setup/config_setup_path.cc
-@@ -31,6 +31,7 @@
- #include "util/logger.h"
- 
- #include <pugixml.hpp>
-+#include <cstring>
- 
- bool ConfigPathSetup::checkPathValue(std::string& optValue, std::string& pathValue) const
- {
-diff --git a/src/content/inotify/mt_inotify.cc b/src/content/inotify/mt_inotify.cc
-index e938e60a1..e140b5f4f 100644
---- a/src/content/inotify/mt_inotify.cc
-+++ b/src/content/inotify/mt_inotify.cc
-@@ -52,6 +52,7 @@
- #include <sys/select.h>
- #include <thread>
- #include <unistd.h>
-+#include <cstring>
- #ifdef SOLARIS
- #include <sys/filio.h> // FIONREAD
- #endif
-diff --git a/src/iohandler/mem_io_handler.cc b/src/iohandler/mem_io_handler.cc
-index 21e4a1960..ba16a10d7 100644
---- a/src/iohandler/mem_io_handler.cc
-+++ b/src/iohandler/mem_io_handler.cc
-@@ -35,6 +35,7 @@
- #include "mem_io_handler.h" // API
- 
- #include "exceptions.h"
-+#include <cstring>
- 
- MemIOHandler::MemIOHandler(const void* buffer, int length)
-     : buffer(new char[length])
-diff --git a/src/util/grb_fs.cc b/src/util/grb_fs.cc
-index cd3e612a7..09c892f2e 100644
---- a/src/util/grb_fs.cc
-+++ b/src/util/grb_fs.cc
-@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
- #include <fcntl.h>
- #include <fstream>
- #include <sstream>
-+#include <cstring>
- #include <sys/stat.h>
- #include <unistd.h>
- 
-diff --git a/src/util/grb_net.cc b/src/util/grb_net.cc
-index 8986bfa4a..68395e001 100644
---- a/src/util/grb_net.cc
-+++ b/src/util/grb_net.cc
-@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
- #include <ifaddrs.h>
- #include <netdb.h>
- #include <regex>
-+#include <cstring>
- 
- #ifdef SOLARIS
- #include <sys/sockio.h>
-diff --git a/src/util/string_converter.cc b/src/util/string_converter.cc
-index fa11e1de2..21e2760d9 100644
---- a/src/util/string_converter.cc
-+++ b/src/util/string_converter.cc
-@@ -42,6 +42,7 @@
- 
- #include <array>
- #include <vector>
-+#include <cstring>
- #if FMT_VERSION >= 100202
- #include <fmt/ranges.h>
- #endif
-diff --git a/src/util/thread_executor.cc b/src/util/thread_executor.cc
-index 669856272..ca0a1755c 100644
---- a/src/util/thread_executor.cc
-+++ b/src/util/thread_executor.cc
-@@ -34,6 +34,7 @@
- #include "thread_executor.h" // API
- 
- #include "util/logger.h"
-+#include <cstring>
- 
- ThreadExecutor::~ThreadExecutor()
- {
-diff --git a/src/util/thread_runner.h b/src/util/thread_runner.h
-index a2e55f8eb..08dbc8b9c 100644
---- a/src/util/thread_runner.h
-+++ b/src/util/thread_runner.h
-@@ -36,6 +36,7 @@
- #include <mutex>
- #include <pthread.h>
- #include <thread>
-+#include <cstring>
- 
- using ThreadProc = std::function<void(void* target)>;
- 
-diff --git a/src/util/tools.cc b/src/util/tools.cc
-index 2174ff352..cc1877286 100644
---- a/src/util/tools.cc
-+++ b/src/util/tools.cc
-@@ -43,6 +43,7 @@
- #include <queue>
- #include <regex>
- #include <sstream>
-+#include <cstring>
- 
- #ifdef __HAIKU__
- #define _DEFAULT_SOURCE
-diff --git a/src/util/url_utils.cc b/src/util/url_utils.cc
-index efb4099ec..3127d53fb 100644
---- a/src/util/url_utils.cc
-+++ b/src/util/url_utils.cc
-@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
- #include <fmt/ranges.h>
- #endif
- #include <sstream>
-+#include <cstring>
- 
- // URL FORMATTING CONSTANTS
- #define URL_UI_PARAM_SEPARATOR '?'
diff --git a/package/gerbera/0002-Fix-the-following-error.patch b/package/gerbera/0002-Fix-the-following-error.patch
deleted file mode 100644
index 01f135bbed..0000000000
--- a/package/gerbera/0002-Fix-the-following-error.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9507706136fde8c324d95d5c84c78bae1703bafc Mon Sep 17 00:00:00 2001
-From: Downtown Allday <downtownallday@gmail.com>
-Date: Fri, 3 Apr 2026 09:34:00 -0400
-Subject: [PATCH] fix the following error: error: no member named 'format' in
- namespace 'fmt'
-
-the comment in fmt/core.h says including 'format' via core is deprectated:
-// Using fmt::format via fmt/core.h has been deprecated since version 11
-// and now requires an explicit opt in.
-#ifdef FMT_DEPRECATED_HEAVY_CORE
-#  include "format.h"
-#endif
-
-Upstream: https://github.com/gerbera/gerbera/commit/9507706136fde8c324d95d5c84c78bae1703bafc
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/database/search_handler.h | 2 +-
- src/exceptions.h              | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/database/search_handler.h b/src/database/search_handler.h
-index ac5afb1b7..c1c99d00d 100644
---- a/src/database/search_handler.h
-+++ b/src/database/search_handler.h
-@@ -32,7 +32,7 @@
- #include "util/tools.h"
- 
- #include <algorithm>
--#include <fmt/core.h>
-+#include <fmt/format.h>
- #include <map>
- #include <memory>
- #include <tuple>
-diff --git a/src/exceptions.h b/src/exceptions.h
-index 180e63ad4..e5ed74f3d 100644
---- a/src/exceptions.h
-+++ b/src/exceptions.h
-@@ -34,7 +34,7 @@
- #ifndef __EXCEPTIONS_H__
- #define __EXCEPTIONS_H__
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- #include <stdexcept>
- #include <string>
- 
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 42e2d13951..d292a5df5d 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6b89d0c416b6d98e34634e5b1121f340315d60b088e9e6b2fca423488760030f  gerbera-3.2.1.tar.gz
+sha256  79db1b4d9fcfafe5cb6a30eb29174f912f1b2c04a644bd5fe5075bccad10eb97  gerbera-3.3.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index bb00fc89e9..d50e59f591 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 3.2.1
+GERBERA_VERSION = 3.3.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
