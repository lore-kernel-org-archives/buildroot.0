Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A82C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 17:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 134AC80FB3;
	Sun,  5 Jul 2026 17:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTuFS9T4NVKU; Sun,  5 Jul 2026 17:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3DB080DD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783272384;
	bh=DAd6O/52oZJ2kE+DI7KCQ7CyZ2Y0Unqwbm0i1vq8Wqc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Es/spbpOhOd20ti6izZk2MYGbLFxSxwfCYG+LFPVliBEW/BpGY7HediGpaabtUhZU
	 a1xCSgK1ipf9PjYHnjzkYKmWeE5l8zYZuiQZb1OxQePpX3yxfvEMNhZ1F+zosukzEA
	 jpr3jbf/rTJLR5dqZO1kOYiRdMucyFRuV2v0d6lE0FmWw9t80NiDbngXRk/2Z75aR8
	 0bvbOmKG1csYxanRZgYOSce3l9rDW2BAoGKPBnyevpNhggM/LTzkwV4zAKnPEtnzKb
	 T/71OWI6/Vet4vz1c5LMZj7snlCXn7jFnyqIUZClzoSxcgIDk4cW7zw9oo5nHC0mTR
	 wopTcDCmn3tcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3DB080DD6;
	Sun,  5 Jul 2026 17:26:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3EACF2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE310400AB
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwFAfthG7uMa for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 17:26:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FDEF40061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FDEF40061
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FDEF40061
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:26:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6b5.dip0.t-ipconnect.de [79.214.198.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C0AEA4C0EB8;
 Sun,  5 Jul 2026 19:26:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgQbh-0000000070J-09nj;
 Sun, 05 Jul 2026 17:26:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  5 Jul 2026 19:26:16 +0200
Message-ID: <20260705172616.3104270-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783272377;
 bh=A7S+4frhgQczjjJfbtkvj/o7BMGyPNNsVgOZlFE5QaE=;
 h=From:To:Cc:Subject:Date:From;
 b=lhtp7/m3hJj9nk+7OYZNDSkZaX//YNnfYLk5RMN9UPmMfZ/ihcL8FB0sywIeFOaPz
 obUv13NEYR5TyGvHzFyIMY6SzW/ac8zqNIVijkX1upU2SVEujXMFpID3UWG3mVD4Uz
 CfGjrcbin6Tcvx7J7W2NsITAmGHbAkaoDtu5jePYDQT4i13VjZywnOyt4tZ8TAQ6om
 Q5N0eYf/aZfkR0c+gfQNyvXns2acrxtShFukreLenJdbZaR2TCpjD7kaD3WedZJVHA
 D+syC3nMI7OpZL/0UID0+lkmQxg1utJHFbrOePpBn9LlB4xdhT9mO73//r1UjNVxwD
 f2lF/uQAHODdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lhtp7/m3
Subject: [Buildroot] [PATCH 1/1] package/gerbera: add upstream patches to
 fix build with fmt 12.2.0
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

Buildroot commit cc5c36afffd71e6e01a9371f1a7316fc10a8e3f9 bumped fmt to
version 12.2.0 which breaks the gerbera build. To fix the problem we add
two upstream patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-the-following-errors.patch       | 148 ++++++++++++++++++
 .../0002-Fix-the-following-error.patch        |  47 ++++++
 2 files changed, 195 insertions(+)
 create mode 100644 package/gerbera/0001-Fix-the-following-errors.patch
 create mode 100644 package/gerbera/0002-Fix-the-following-error.patch

diff --git a/package/gerbera/0001-Fix-the-following-errors.patch b/package/gerbera/0001-Fix-the-following-errors.patch
new file mode 100644
index 0000000000..c474d32aab
--- /dev/null
+++ b/package/gerbera/0001-Fix-the-following-errors.patch
@@ -0,0 +1,148 @@
+From 7caa9ae9ebf5c4cded5a292701528ff1d5c4946e Mon Sep 17 00:00:00 2001
+From: Downtown Allday <downtownallday@gmail.com>
+Date: Fri, 3 Apr 2026 09:31:07 -0400
+Subject: [PATCH] Fix the following errors: error: no member named 'strerror'
+ in namespace 'std' error: no member named 'memcpy' in namespace 'std' error:
+ no member named 'strchr' in namespace 'std'
+
+all of these require <cstring>. see:
+https://en.cppreference.com/w/cpp/string/byte/strerror
+https://en.cppreference.com/w/cpp/string/byte/memcpy
+https://en.cppreference.com/w/cpp/string/byte/strchr
+
+Upstream: https://github.com/gerbera/gerbera/commit/7caa9ae9ebf5c4cded5a292701528ff1d5c4946e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/config/setup/config_setup_path.cc | 1 +
+ src/content/inotify/mt_inotify.cc     | 1 +
+ src/iohandler/mem_io_handler.cc       | 1 +
+ src/util/grb_fs.cc                    | 1 +
+ src/util/grb_net.cc                   | 1 +
+ src/util/string_converter.cc          | 1 +
+ src/util/thread_executor.cc           | 1 +
+ src/util/thread_runner.h              | 1 +
+ src/util/tools.cc                     | 1 +
+ src/util/url_utils.cc                 | 1 +
+ 10 files changed, 10 insertions(+)
+
+diff --git a/src/config/setup/config_setup_path.cc b/src/config/setup/config_setup_path.cc
+index cdb7244e4..a10e3c9f2 100644
+--- a/src/config/setup/config_setup_path.cc
++++ b/src/config/setup/config_setup_path.cc
+@@ -31,6 +31,7 @@
+ #include "util/logger.h"
+ 
+ #include <pugixml.hpp>
++#include <cstring>
+ 
+ bool ConfigPathSetup::checkPathValue(std::string& optValue, std::string& pathValue) const
+ {
+diff --git a/src/content/inotify/mt_inotify.cc b/src/content/inotify/mt_inotify.cc
+index e938e60a1..e140b5f4f 100644
+--- a/src/content/inotify/mt_inotify.cc
++++ b/src/content/inotify/mt_inotify.cc
+@@ -52,6 +52,7 @@
+ #include <sys/select.h>
+ #include <thread>
+ #include <unistd.h>
++#include <cstring>
+ #ifdef SOLARIS
+ #include <sys/filio.h> // FIONREAD
+ #endif
+diff --git a/src/iohandler/mem_io_handler.cc b/src/iohandler/mem_io_handler.cc
+index 21e4a1960..ba16a10d7 100644
+--- a/src/iohandler/mem_io_handler.cc
++++ b/src/iohandler/mem_io_handler.cc
+@@ -35,6 +35,7 @@
+ #include "mem_io_handler.h" // API
+ 
+ #include "exceptions.h"
++#include <cstring>
+ 
+ MemIOHandler::MemIOHandler(const void* buffer, int length)
+     : buffer(new char[length])
+diff --git a/src/util/grb_fs.cc b/src/util/grb_fs.cc
+index cd3e612a7..09c892f2e 100644
+--- a/src/util/grb_fs.cc
++++ b/src/util/grb_fs.cc
+@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
+ #include <fcntl.h>
+ #include <fstream>
+ #include <sstream>
++#include <cstring>
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+diff --git a/src/util/grb_net.cc b/src/util/grb_net.cc
+index 8986bfa4a..68395e001 100644
+--- a/src/util/grb_net.cc
++++ b/src/util/grb_net.cc
+@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
+ #include <ifaddrs.h>
+ #include <netdb.h>
+ #include <regex>
++#include <cstring>
+ 
+ #ifdef SOLARIS
+ #include <sys/sockio.h>
+diff --git a/src/util/string_converter.cc b/src/util/string_converter.cc
+index fa11e1de2..21e2760d9 100644
+--- a/src/util/string_converter.cc
++++ b/src/util/string_converter.cc
+@@ -42,6 +42,7 @@
+ 
+ #include <array>
+ #include <vector>
++#include <cstring>
+ #if FMT_VERSION >= 100202
+ #include <fmt/ranges.h>
+ #endif
+diff --git a/src/util/thread_executor.cc b/src/util/thread_executor.cc
+index 669856272..ca0a1755c 100644
+--- a/src/util/thread_executor.cc
++++ b/src/util/thread_executor.cc
+@@ -34,6 +34,7 @@
+ #include "thread_executor.h" // API
+ 
+ #include "util/logger.h"
++#include <cstring>
+ 
+ ThreadExecutor::~ThreadExecutor()
+ {
+diff --git a/src/util/thread_runner.h b/src/util/thread_runner.h
+index a2e55f8eb..08dbc8b9c 100644
+--- a/src/util/thread_runner.h
++++ b/src/util/thread_runner.h
+@@ -36,6 +36,7 @@
+ #include <mutex>
+ #include <pthread.h>
+ #include <thread>
++#include <cstring>
+ 
+ using ThreadProc = std::function<void(void* target)>;
+ 
+diff --git a/src/util/tools.cc b/src/util/tools.cc
+index 2174ff352..cc1877286 100644
+--- a/src/util/tools.cc
++++ b/src/util/tools.cc
+@@ -43,6 +43,7 @@
+ #include <queue>
+ #include <regex>
+ #include <sstream>
++#include <cstring>
+ 
+ #ifdef __HAIKU__
+ #define _DEFAULT_SOURCE
+diff --git a/src/util/url_utils.cc b/src/util/url_utils.cc
+index efb4099ec..3127d53fb 100644
+--- a/src/util/url_utils.cc
++++ b/src/util/url_utils.cc
+@@ -30,6 +30,7 @@ Gerbera - https://gerbera.io/
+ #include <fmt/ranges.h>
+ #endif
+ #include <sstream>
++#include <cstring>
+ 
+ // URL FORMATTING CONSTANTS
+ #define URL_UI_PARAM_SEPARATOR '?'
diff --git a/package/gerbera/0002-Fix-the-following-error.patch b/package/gerbera/0002-Fix-the-following-error.patch
new file mode 100644
index 0000000000..01f135bbed
--- /dev/null
+++ b/package/gerbera/0002-Fix-the-following-error.patch
@@ -0,0 +1,47 @@
+From 9507706136fde8c324d95d5c84c78bae1703bafc Mon Sep 17 00:00:00 2001
+From: Downtown Allday <downtownallday@gmail.com>
+Date: Fri, 3 Apr 2026 09:34:00 -0400
+Subject: [PATCH] fix the following error: error: no member named 'format' in
+ namespace 'fmt'
+
+the comment in fmt/core.h says including 'format' via core is deprectated:
+// Using fmt::format via fmt/core.h has been deprecated since version 11
+// and now requires an explicit opt in.
+#ifdef FMT_DEPRECATED_HEAVY_CORE
+#  include "format.h"
+#endif
+
+Upstream: https://github.com/gerbera/gerbera/commit/9507706136fde8c324d95d5c84c78bae1703bafc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/database/search_handler.h | 2 +-
+ src/exceptions.h              | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/database/search_handler.h b/src/database/search_handler.h
+index ac5afb1b7..c1c99d00d 100644
+--- a/src/database/search_handler.h
++++ b/src/database/search_handler.h
+@@ -32,7 +32,7 @@
+ #include "util/tools.h"
+ 
+ #include <algorithm>
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ #include <map>
+ #include <memory>
+ #include <tuple>
+diff --git a/src/exceptions.h b/src/exceptions.h
+index 180e63ad4..e5ed74f3d 100644
+--- a/src/exceptions.h
++++ b/src/exceptions.h
+@@ -34,7 +34,7 @@
+ #ifndef __EXCEPTIONS_H__
+ #define __EXCEPTIONS_H__
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ #include <stdexcept>
+ #include <string>
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
