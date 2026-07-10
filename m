Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BF3C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 07:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 606FC80DE3;
	Fri, 10 Jul 2026 07:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKhh0DntwUKq; Fri, 10 Jul 2026 07:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 470C080DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783669916;
	bh=Bnthdj8s+Ng14XHninoQ24oVa6q4fNLFWjBjZOQGnW0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NaqN9XBpYb2XtGSESUeSIN8wUEwjICZc+HvKsqWAI3NmFaX6H2z0coq6ZN5+2yMrw
	 KZOXaLmVuJk0GlGdD9fszJ05BeBqa+Xho0G+m4mPDP1mRXFL/XetNP4J+1uGRWd11D
	 eiOe92cYYBm2CygehmNFrACJjfTjChqDs58jTfXVmTM2b5Ad/GlD/r73o0A+bQlGG4
	 OU//JiP2GwXn2oWcA/djzUf3peYHSFB4Lx2k1kFUyZ6jDawfost7jFA3/2P+RmyyjU
	 xrMH065DIqV3HQndEFixQPnLD4/lFx1SqZ/Uxdshq8UeIHBY58NgkA77cIGlss3s//
	 Rc+G42GYfH3lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470C080DE5;
	Fri, 10 Jul 2026 07:51:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B753320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D15280DE5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLAi5JxVFunY for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 07:51:54 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23AE680DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23AE680DE3
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23AE680DE3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:51:52 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 08BAABDE6036;
 Fri, 10 Jul 2026 09:51:48 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: bernd@kuhls.net,
	Andreas Ziegler <br025@umbiko.net>
Date: Fri, 10 Jul 2026 09:51:23 +0200
Message-ID: <20260710075124.126624-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783669909; bh=uBz9BufzODVnDdyzdjJrCh3R3MmzHBs22HeXVuur4WU=;
 h=From:To:Cc:Subject:Date;
 b=HSYb1Kh6TOrvORV4UCJT1qMc0OSgdLAWxVNkgO/E/JcJMg1yj/2IHW9gYQeAt+eTQ
 QwtMlvFrmJY5GHxOWHhzaq5kNLPa4FSBjvF4fONQPlpitMChA7cb2NviAJsrUSN2vT
 cEpjJHCWxCM1UKGL7gBB9yq3Rf86BImwbtkpWBJ0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=HSYb1Kh6
Subject: [Buildroot] [PATCH v2 1/1] package/mpd: fix build failure w/ fmt
 12.2.0
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

Building mpd with fmt 12.2.0 fails with:

../src/net/ToString.cxx: In function 'std::string ToString(SocketAddress)':
../src/net/ToString.cxx:80:37: error: 'format' is not a member of 'fmt'
   80 |                         return fmt::format("[{}]:{}", host, serv);
      |                                     ^~~~~~
../src/net/ToString.cxx:84:29: error: 'format' is not a member of 'fmt'
   84 |                 return fmt::format("{}:{}", host, serv);
      |                             ^~~~~~

Root cause is an API change in fmt:

Made the <fmt/core.h> header equivalent to <fmt/base.h> by default. Code
that relied on <fmt/core.h> pulling in <fmt/format.h> must now either
include <fmt/format.h> directly or define FMT_DEPRECATED_HEAVY_CORE to
opt back in. (https://github.com/fmtlib/fmt/releases#release-12.2.0)

Add a patch containing the corresponding upstream commit
(https://github.com/MusicPlayerDaemon/MPD/commit/88d5b52).

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 ...pport-use-fmt-format.h-not-fmt-core..patch | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)
 create mode 100644 package/mpd/0002-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core..patch

diff --git a/package/mpd/0002-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core..patch b/package/mpd/0002-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core..patch
new file mode 100644
index 0000000000..96ac522a9e
--- /dev/null
+++ b/package/mpd/0002-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core..patch
@@ -0,0 +1,220 @@
+Building mpd 0.24.12 with fmt 12.2.0 fails with:
+
+../src/net/ToString.cxx: In function 'std::string ToString(SocketAddress)':
+../src/net/ToString.cxx:80:37: error: 'format' is not a member of 'fmt'
+   80 |                         return fmt::format("[{}]:{}", host, serv);
+      |                                     ^~~~~~
+../src/net/ToString.cxx:84:29: error: 'format' is not a member of 'fmt'
+   84 |                 return fmt::format("{}:{}", host, serv);
+      |                             ^~~~~~
+
+Root cause is an API change in fmt:
+
+Made the <fmt/core.h> header equivalent to <fmt/base.h> by default. Code
+that relied on <fmt/core.h> pulling in <fmt/format.h> must now either
+include <fmt/format.h> directly or define FMT_DEPRECATED_HEAVY_CORE to
+opt back in. (https://github.com/fmtlib/fmt/releases#release-12.2.0)
+
+Add the corresponding upstream fix in this patch.
+
+Upstream: https://github.com/MusicPlayerDaemon/MPD/commit/88d5b52
+Signed-off-by: Andreas Ziegler <br025@umbiko.net>
+---
+From 88d5b5248d71862815da336cfd1c6f66626bb4d4 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 18 Jun 2026 13:32:33 +0000
+Subject: [PATCH] libfmt 12.2.0 support: use fmt/format.h not fmt/core.h
+
+Since libfmt 12.2.0, fmt/core.h is a shim that only includes
+fmt/base.h which does not provide fmt::format(). Include
+fmt/format.h directly in files that call fmt::format().
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+---
+ src/input/plugins/AlsaInputPlugin.cxx          | 2 +-
+ src/input/plugins/QobuzClient.cxx              | 2 +-
+ src/input/plugins/QobuzLoginRequest.cxx        | 2 +-
+ src/input/plugins/QobuzTrackRequest.cxx        | 2 +-
+ src/lib/avahi/Publisher.cxx                    | 2 +-
+ src/lib/nfs/FileReader.cxx                     | 2 +-
+ src/net/ToString.cxx                           | 2 +-
+ src/output/plugins/httpd/HttpdClient.cxx       | 2 +-
+ src/output/plugins/httpd/IcyMetaDataServer.cxx | 2 +-
+ src/song/AddedSinceSongFilter.cxx              | 2 +-
+ src/song/AudioFormatSongFilter.cxx             | 2 +-
+ src/song/ModifiedSinceSongFilter.cxx           | 2 +-
+ src/storage/plugins/NfsStorage.cxx             | 2 +-
+ 13 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/src/input/plugins/AlsaInputPlugin.cxx b/src/input/plugins/AlsaInputPlugin.cxx
+index 6bf8034dc..5fc8dd99a 100644
+--- a/src/input/plugins/AlsaInputPlugin.cxx
++++ b/src/input/plugins/AlsaInputPlugin.cxx
+@@ -27,7 +27,7 @@
+ 
+ #include <alsa/asoundlib.h>
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <cassert>
+ 
+diff --git a/src/input/plugins/QobuzClient.cxx b/src/input/plugins/QobuzClient.cxx
+index 233c1bbad..92de56695 100644
+--- a/src/input/plugins/QobuzClient.cxx
++++ b/src/input/plugins/QobuzClient.cxx
+@@ -5,7 +5,7 @@
+ #include "lib/crypto/MD5.hxx"
+ #include "thread/ScopeUnlock.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <cassert>
+ #include <stdexcept>
+diff --git a/src/input/plugins/QobuzLoginRequest.cxx b/src/input/plugins/QobuzLoginRequest.cxx
+index 41d4dcabf..7e2e6b64c 100644
+--- a/src/input/plugins/QobuzLoginRequest.cxx
++++ b/src/input/plugins/QobuzLoginRequest.cxx
+@@ -6,7 +6,7 @@
+ #include "QobuzSession.hxx"
+ #include "lib/curl/Form.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ #include <nlohmann/json.hpp>
+ 
+ #include <cassert>
+diff --git a/src/input/plugins/QobuzTrackRequest.cxx b/src/input/plugins/QobuzTrackRequest.cxx
+index 59b6cf480..3de5e7ea0 100644
+--- a/src/input/plugins/QobuzTrackRequest.cxx
++++ b/src/input/plugins/QobuzTrackRequest.cxx
+@@ -5,7 +5,7 @@
+ #include "QobuzErrorParser.hxx"
+ #include "QobuzClient.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ #include <nlohmann/json.hpp>
+ 
+ using std::string_view_literals::operator""sv;
+diff --git a/src/lib/avahi/Publisher.cxx b/src/lib/avahi/Publisher.cxx
+index 1ac4d61e6..174f57198 100644
+--- a/src/lib/avahi/Publisher.cxx
++++ b/src/lib/avahi/Publisher.cxx
+@@ -13,7 +13,7 @@
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/alternative.h>
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <cassert>
+ 
+diff --git a/src/lib/nfs/FileReader.cxx b/src/lib/nfs/FileReader.cxx
+index 20b79ce3c..2678039e2 100644
+--- a/src/lib/nfs/FileReader.cxx
++++ b/src/lib/nfs/FileReader.cxx
+@@ -10,7 +10,7 @@
+ 
+ #include <nfsc/libnfs.h> // for struct nfs_stat_64
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <cassert>
+ #include <cstring>
+diff --git a/src/net/ToString.cxx b/src/net/ToString.cxx
+index 41421d8e5..046257cb2 100644
+--- a/src/net/ToString.cxx
++++ b/src/net/ToString.cxx
+@@ -6,7 +6,7 @@
+ #include "SocketAddress.hxx"
+ #include "IPv4Address.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <algorithm>
+ #include <cassert>
+diff --git a/src/output/plugins/httpd/HttpdClient.cxx b/src/output/plugins/httpd/HttpdClient.cxx
+index 7192b6ae4..5b23a385c 100644
+--- a/src/output/plugins/httpd/HttpdClient.cxx
++++ b/src/output/plugins/httpd/HttpdClient.cxx
+@@ -13,7 +13,7 @@
+ #include "util/StringSplit.hxx"
+ #include "Log.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <cassert>
+ 
+diff --git a/src/output/plugins/httpd/IcyMetaDataServer.cxx b/src/output/plugins/httpd/IcyMetaDataServer.cxx
+index 0314089f1..0796bffcb 100644
+--- a/src/output/plugins/httpd/IcyMetaDataServer.cxx
++++ b/src/output/plugins/httpd/IcyMetaDataServer.cxx
+@@ -5,7 +5,7 @@
+ #include "tag/Tag.hxx"
+ #include "util/TruncateString.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <iterator>
+ 
+diff --git a/src/song/AddedSinceSongFilter.cxx b/src/song/AddedSinceSongFilter.cxx
+index efc394fd0..dfe397542 100644
+--- a/src/song/AddedSinceSongFilter.cxx
++++ b/src/song/AddedSinceSongFilter.cxx
+@@ -6,7 +6,7 @@
+ #include "time/ISO8601.hxx"
+ #include "util/StringBuffer.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ using std::string_view_literals::operator""sv;
+ 
+diff --git a/src/song/AudioFormatSongFilter.cxx b/src/song/AudioFormatSongFilter.cxx
+index 69bd2b1a8..c1f209730 100644
+--- a/src/song/AudioFormatSongFilter.cxx
++++ b/src/song/AudioFormatSongFilter.cxx
+@@ -5,7 +5,7 @@
+ #include "LightSong.hxx"
+ #include "util/StringBuffer.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ using std::string_view_literals::operator""sv;
+ 
+diff --git a/src/song/ModifiedSinceSongFilter.cxx b/src/song/ModifiedSinceSongFilter.cxx
+index 43879c789..715f65e15 100644
+--- a/src/song/ModifiedSinceSongFilter.cxx
++++ b/src/song/ModifiedSinceSongFilter.cxx
+@@ -6,7 +6,7 @@
+ #include "time/ISO8601.hxx"
+ #include "util/StringBuffer.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ using std::string_view_literals::operator""sv;
+ 
+diff --git a/src/storage/plugins/NfsStorage.cxx b/src/storage/plugins/NfsStorage.cxx
+index 106afe788..b69ee807c 100644
+--- a/src/storage/plugins/NfsStorage.cxx
++++ b/src/storage/plugins/NfsStorage.cxx
+@@ -29,7 +29,7 @@ extern "C" {
+ #include <nfsc/libnfs-raw-nfs.h>
+ }
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <cassert>
+ #include <string>
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
