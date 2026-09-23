Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E0DC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B52FB815D9;
	Thu, 24 Sep 2026 19:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfl8CkHJTMhv; Thu, 24 Sep 2026 19:00:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CB54F8169E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276418;
	b=jJEBNGQF3/CmsJPx9DpZTQq75Eii/Nkj9M/q6HrRujtgw3+boAxKJKF/Zej3RANM/2Us
	 HYv2gbRtbF+hHe6B1C2TWbmo7ej8YH808b/+MY/I/OpIBq2PXCpwFZD2NBCdwjDii6HsL
	 Z0cKj4X8nldAhBOD1ISOQzFtjc+RKW6YZFnOtrAqm5/WvLUZRKLDtNyJ/tUudOzJaW6pZ
	 3PMen+B30x2IHI/Fpb0xcp+WqbLSj2u95Hi227wsgTs52MLPs/Z/0oObFpS9rp+8+1YTH
	 Mwvhg20hlvANTIJGgjt6qeNbl2qh++y2rPnCwteHD+dPzYV+jrBw+iKElauFwHIfs8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rzZpDTRCmSfBIxQFK/h2xdiBg3oTNU4CPzd02XXDOrI=;
	b=kec17niNjKyy+N6rhym7cHEG5xskyuE6VCd6eUVr+eDcK0UiUkxFNoKhKWM+VcHREW1G
	 bCqKZvl2pPR9Gr4yn5BEMjCqGKkW7GyDRJsWBfIyEZZwocFX6Vr/l3I2MQtGWK5lrqKvI
	 yDzW21KbV2Wn5GV1OI31d6sNuN71phyEzCggAoWyYgocSb0jnvpnoH6zyxPYqPfQcuS/M
	 zAituMTT5ZJfs035j4uZKJ8qZepkuaxVuvFU0K005Wf0zF08czpsWGGn2cgI3awlaDJhG
	 T5pbjnrwRcbgXfEG6XlbvIgNNjfkp150vniCSGlLGoD6qTw7cbszgLMj1zdhTwdKD8g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276418;
	bh=rzZpDTRCmSfBIxQFK/h2xdiBg3oTNU4CPzd02XXDOrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=de42CqeXnjCVAorUPS9f91TzzO9elVrSBbWc8vXySWudKtZ10LENmlI2XZ6Wudo/M
	 P67m4aUhmzqWhGk+TokQF8lP3CqGrmC0qSVLOuhoCYWQ9YvxaR3AIttFUaJyWVdfFD
	 VPgseZ+KS7uEoA4zVpEdC52+MKbmlHFzlYDSAQF4Sq0U7GozpW795SG5rRjuiUyAr4
	 21izIn72Kz8tCMrOzXIEynv0ZbSVmTq4pHG2cPRQHIPcrz+H7ozxuK1jMTMTLlUloN
	 Thx/MHgOUnmAq1CKTIKnxw8bW+Cj/2QUbx4qmtsLizIxa/93w0dFvmEISniW3kH8zv
	 5W+h83ibgSPeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB54F8169E;
	Thu, 24 Sep 2026 19:00:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42269332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346D74017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oi4ZPaQr3GCN for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B9F0E404D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=j7qC3vH1ehHD8F8tz6H2C5csm7K3Of9lTQMbxdgPck7rq54rak2HHSKCJEmZJBtDMY66
 T/7PTLYSomCaviORmTwkcd66/tuj1vE08CoYEQ97NlJXdpW3b6fH2fa7u7iLPGxaXL+Le
 S+i8L2JxXXDj26Tyr6ZeJZjXC+mr3702PmTYi+JGw2cvG8AxUcOAn0fWIDKQMO7iR9UjV
 O2Xsr/y+6nfdE9p8tehOinaBq4Qp4krZTnSws6KzYGMiTqwJtoGeKkACs2bebZECQ3Wuy
 EONekzLoZ5OFCXlvdYHab0hpUJvyEw1XiP6u083CNFW41fOFyDUMCUVY/ZAwLJevC2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b99ef0q8E5lnwfEZ1PGRoKfSNNFVujjpbveLHQuRl3U=;
 b=LPNdfKiZ+mQoBURUOYi59FjOts82+47mkf3IpDQDaWBd0MUBU1HPXNwZKpe/5Vxn+f3D
 9qvFmyOosv/sJrV4/GxYBImm2Yo8UHLu32xY8PjQH1KyngEokk7N7Hob9sSjomTbga4uC
 t+Hj7rVVvneM2ptcTXM8IlvFIRGRFFgxTQf2n3EntBmnIfeN/L0UAmsVema7z3hpLLjC6
 REhwhJcrLoR/tnLvjJWBrY2WARinDlPPgHSHqL9FoFqT5eBeJV2ecbfNi37yjKJjEcCER
 nPuCl5zfr4iom5msjsokCiQqwbB+YX4QnsB1MNi4riM99ZABO2LcRu+viUFPaNWvZ0w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9F0E404D7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C828982D9; Thu, 24 Sep 2026 18:55:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:39:05 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7e523d398dbf4e828ee0ecf8ffcd84819cd84e1b
X-Git-Newrev: b7a2b163f64e8f0747abf47e39898f1dbb0dc3ff
X-Patchwork-Hint: ignore
Message-Id: <20260924185544.5C828982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/qt6: security
 bump version to 6.11.2
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5709541033232326658=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5709541033232326658==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7a2b163f64e8f0747abf47e39898f1dbb0dc3ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.2/release-note.md

Security fixes:
CVE-2026-16762 in qtbase
CVE-2026-19248 in qtbase
CVE-2026-13326 in qtconnectivity
CVE-2026-8168 in qtsvg

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 43de288bd1e11149068fe52595f56f33523e0159)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qt6/qt6.mk                                 |  2 +-
 ...t_core.cpp-remove-is_always_lock_free-sta.patch | 41 ----------------------
 package/qt6/qt6base/qt6base.hash                   |  4 +--
 package/qt6/qt6charts/qt6charts.hash               |  4 +--
 package/qt6/qt6core5compat/qt6core5compat.hash     |  4 +--
 package/qt6/qt6declarative/qt6declarative.hash     |  4 +--
 package/qt6/qt6graphs/qt6graphs.hash               |  4 +--
 package/qt6/qt6grpc/qt6grpc.hash                   |  4 +--
 .../qt6/qt6languageserver/qt6languageserver.hash   |  4 +--
 package/qt6/qt6mqtt/qt6mqtt.hash                   |  2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash       |  4 +--
 package/qt6/qt6opcua/qt6opcua.hash                 |  2 +-
 package/qt6/qt6positioning/qt6positioning.hash     |  4 +--
 package/qt6/qt6quick3d/qt6quick3d.hash             |  4 +--
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash |  4 +--
 package/qt6/qt6scxml/qt6scxml.hash                 |  4 +--
 package/qt6/qt6serialbus/qt6serialbus.hash         |  4 +--
 package/qt6/qt6serialport/qt6serialport.hash       |  4 +--
 package/qt6/qt6shadertools/qt6shadertools.hash     |  4 +--
 package/qt6/qt6svg/qt6svg.hash                     |  4 +--
 package/qt6/qt6tools/qt6tools.hash                 |  4 +--
 .../qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash |  4 +--
 package/qt6/qt6wayland/qt6wayland.hash             |  4 +--
 package/qt6/qt6websockets/qt6websockets.hash       |  4 +--
 24 files changed, 43 insertions(+), 84 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index f56a9ff1fa..cff9f5fbc7 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.11
-QT6_VERSION = $(QT6_VERSION_MAJOR).1
+QT6_VERSION = $(QT6_VERSION_MAJOR).2
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch b/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
deleted file mode 100644
index 3347caa8da..0000000000
--- a/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2983318421d623c6c9feff95ff947ca489f4313d Mon Sep 17 00:00:00 2001
-From: Mitch Curtis <mitch.curtis@qt.io>
-Date: Mon, 11 May 2026 08:41:08 +0800
-Subject: [PATCH] qtestsupport_core.cpp: remove is_always_lock_free
- static_assert
-
-This causes a build failure when cross-compiling Qt for MIPS32 targets
-(e.g. `mips-unknown-linux-musl`, `mipsel-unknown-linux-musl`).
-
-Amends 9b938823776865837901f29082301f5624ac2b04.
-
-Fixes: QTBUG-146670
-Change-Id: I170bd9f93c1ef809f56e5b36835e457bbbe8e16c
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
-
-Upstream: https://github.com/qt/qtbase/commit/2983318421d623c6c9feff95ff947ca489f4313d
-[Romain: backport to 6.11.1]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/corelib/kernel/qtestsupport_core.cpp | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/src/corelib/kernel/qtestsupport_core.cpp b/src/corelib/kernel/qtestsupport_core.cpp
-index 9bbe1c18e84..5f28cedec68 100644
---- a/src/corelib/kernel/qtestsupport_core.cpp
-+++ b/src/corelib/kernel/qtestsupport_core.cpp
-@@ -8,10 +8,6 @@
- 
- using namespace std::chrono_literals;
- 
--// Assert that this instantiation of std::atomic is always lock-free so we
--// know that no code will execute on destruction.
--static_assert(std::atomic<std::chrono::milliseconds>::is_always_lock_free);
--
- QT_BEGIN_NAMESPACE
- 
- // ### Qt 7: reduce the default: QTBUG-138160
--- 
-2.55.0
-
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 40e42682e0..d7d0d536a3 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtbase-everywhere-src-6.11.1.tar.xz.sha256
-sha256  d9594a31228aa23ad6b531719a29b45f0f3989fe6c136d45767ea179f233c1ac  qtbase-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtbase-everywhere-src-6.11.2.tar.xz.sha256
+sha256  5b2e00eccaf5a4d8c14134ffa0ea8dfd0a35ae1ffc7f8d87fa4305a1ed23cf22  qtbase-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 0c816b1709..b5b9eac42d 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtcharts-everywhere-src-6.11.1.tar.xz.sha256
-sha256  3fe3ed318c2a86d1417c5c29cf7494275e8fd4b537cd37453f5599c57365515c  qtcharts-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtcharts-everywhere-src-6.11.2.tar.xz.sha256
+sha256  5069e53b81d125509e937c6379cba6d664c562d5a1e5ed28dd383690d4b6fb29  qtcharts-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 8be1c65e45..ae2c040d94 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qt5compat-everywhere-src-6.11.1.tar.xz.sha256
-sha256  cfcb9fdaa051aad54b0e61b24ac5693b4887a86e07609f665fea67328a6f161b  qt5compat-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qt5compat-everywhere-src-6.11.2.tar.xz.sha256
+sha256  68c320fe3391096a9f2d870170edf1b67dac8af1d0e51c0c9e5343807f114287  qt5compat-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 8245f357d2..0d4f8d3a78 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtdeclarative-everywhere-src-6.11.1.tar.xz.sha256
-sha256  52e670f670b0304f534b24f98c47ceb8a41bb710464414ebc9527ec71cc86aa4  qtdeclarative-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtdeclarative-everywhere-src-6.11.2.tar.xz.sha256
+sha256  215b7b70517e380123eabc6b92243f3c47b6f016a91d126057dbe53551c6b430  qtdeclarative-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index db80fb6dde..9cf6314aeb 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtgraphs-everywhere-src-6.11.1.tar.xz.sha256
-sha256  84b1138ab68a8e2956439895a4b85eb68dda48ac169da673f67191873b1e0462  qtgraphs-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtgraphs-everywhere-src-6.11.2.tar.xz.sha256
+sha256  9f2109854afa45dd144116c11461989c411a17065c63da5068441a1200fb8b21  qtgraphs-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
index 5ef08e8bb4..196e4b70ce 100644
--- a/package/qt6/qt6grpc/qt6grpc.hash
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtgrpc-everywhere-src-6.11.1.tar.xz.sha256
-sha256  437b04f0c550ccdb1739ca5f9119b73dfa0376564815e8bfc199890643e2a250  qtgrpc-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtgrpc-everywhere-src-6.11.2.tar.xz.sha256
+sha256  44414617f0058ff34965fa852027bfcc7e4f71eefca8cd4406c96af22c64ad93  qtgrpc-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSE.Apache-2.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index 2e7348b34f..1ac5820a51 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtlanguageserver-everywhere-src-6.11.1.tar.xz.sha256
-sha256  50008537f2ca54abb3b8dc3f26759864e9cad2b2ad39e92e42fa718de2dd8aef  qtlanguageserver-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtlanguageserver-everywhere-src-6.11.2.tar.xz.sha256
+sha256  38bc4272ecf4ca0eb1927227053e52be6b2e05733f46d03422306aace511fc5e  qtlanguageserver-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 178c69a6d3..521b4339d4 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  3714255cb7bd3481b762a9ffd860f43e3180e8a069beb528338bf42799e29ea4  qt6mqtt-6.11.1-git4.tar.gz
+sha256  39551cf7452bc8df60c6d0fd6f0101351c286b9754030f290b258077e7852d83  qt6mqtt-6.11.2-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 49e30de6c9..5aa64bbf6a 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtmultimedia-everywhere-src-6.11.1.tar.xz.sha256
-sha256  390f8e52ddee3aca5c4de7eead900c84c4fa61ff6d1f0ebea9c7543365c09b0a  qtmultimedia-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtmultimedia-everywhere-src-6.11.2.tar.xz.sha256
+sha256  967b5e02ec6b793cdb360622cd6e703132836af983208d678dae4b50f109cd9f  qtmultimedia-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 45675cc5d1..e05212eaa8 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  19f41f945910bd4bef03f7a57d9e5365d1f8b52e7fe8e226922aeec477322aa0  qt6opcua-6.11.1-git4.tar.gz
+sha256  41982d99b93bfde68f9ee5997376cd64f62d0e7cdca1a08e582a034840528ca1  qt6opcua-6.11.2-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/qt6positioning/qt6positioning.hash
index b9453d255b..84e727052c 100644
--- a/package/qt6/qt6positioning/qt6positioning.hash
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -1,5 +1,5 @@
-# From https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtpositioning-everywhere-src-6.11.1.tar.xz.sha256
-sha256  d5e6b91801ae286e7630016caea3bdc5e1978b4291d6741d0d64c125650f78f5  qtpositioning-everywhere-src-6.11.1.tar.xz
+# From https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtpositioning-everywhere-src-6.11.2.tar.xz.sha256
+sha256  d8cf15ad43a3b1520adac64cec5900028525cf75f01a4c82a0002e7ac1ae7499  qtpositioning-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index 008bda6a22..01f49f2458 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtquick3d-everywhere-src-6.11.1.tar.xz.sha256
-sha256  c76b85de3f8aa2a4bee64987acfef560675c1b378b92076c7c6264613e5b456f  qtquick3d-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtquick3d-everywhere-src-6.11.2.tar.xz.sha256
+sha256  3ab8e1f08edb26373a37cf9d42c23e7d092c1334566b953fbb51cb1b936737b4  qtquick3d-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index 233f80cbfa..d239f95eb8 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtquicktimeline-everywhere-src-6.11.1.tar.xz.sha256
-sha256  af53f643fd9e4045e1b9ba919998e5c048ca877452c08036c9c8c5ee07ea8c27  qtquicktimeline-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtquicktimeline-everywhere-src-6.11.2.tar.xz.sha256
+sha256  250af10500a0c4045dde74e107448a69a44d58af8b7e9a91704a808d5f881d17  qtquicktimeline-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index a38078377c..823f8d2618 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtscxml-everywhere-src-6.11.1.tar.xz.sha256
-sha256  8e495245e5d1fe75de612c8a07e4043635407a1979bb1dd588f1751d1390203f  qtscxml-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtscxml-everywhere-src-6.11.2.tar.xz.sha256
+sha256  f594c4bba7f8bffb20857973c72895669d6e54df08c8d897f50d15251cec35ff  qtscxml-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index ef4e96e1d6..0e2e9ea5ab 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtserialbus-everywhere-src-6.11.1.tar.xz.sha256
-sha256  c46c9c0c8d6815301a669cdbd5866c10bcfb9e56889f5d7da14e11d6ad24f20a  qtserialbus-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtserialbus-everywhere-src-6.11.2.tar.xz.sha256
+sha256  8f06c9ba95f6b045ec43f011094e35a4116047310aa24280966541b720df36c1  qtserialbus-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 63ed548400..2c90412cdf 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtserialport-everywhere-src-6.11.1.tar.xz.sha256
-sha256  9af31a898ffd9a7e4faf6fed845d29e783c716885789055cbe319f3e072d3974  qtserialport-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtserialport-everywhere-src-6.11.2.tar.xz.sha256
+sha256  df3a733616444f31b2ecb689218ea1444be91d8628aa3ab8e464c5eb1b17ad8e  qtserialport-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 9ff3f9c88f..29d5aa7756 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtshadertools-everywhere-src-6.11.1.tar.xz.sha256
-sha256  2075052f9b23bcf9de045bbd180037084942f82cce870aab14a1454902c982fc  qtshadertools-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtshadertools-everywhere-src-6.11.2.tar.xz.sha256
+sha256  805046b8b7757665586890b375940047e874ae3ab00adb6d3f2b38fc6b200b1c  qtshadertools-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index c5f9dabe2a..aefc24cc62 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtsvg-everywhere-src-6.11.1.tar.xz.sha256
-sha256  7f3cf02f4824bf03c2c5859ea6db173bf1482a1daf24e6cdf7bc78cfa26a8a94  qtsvg-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtsvg-everywhere-src-6.11.2.tar.xz.sha256
+sha256  d594337feca84c26fb67fe87b85e6a5c12fda404b611d905f9d138210c311876  qtsvg-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index f6db07deaf..fb4e655e59 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qttools-everywhere-src-6.11.1.tar.xz.sha256
-sha256  8e61835a679c93fa9c6065b142353c2071ba68e297898937c32a03777fcaf50d  qttools-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qttools-everywhere-src-6.11.2.tar.xz.sha256
+sha256  9ea75af35c512f7e09e61c8c3af3997f13b4d43bb099cf43fcec470126b4041e  qttools-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index c47d69fa99..af4477bab4 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtvirtualkeyboard-everywhere-src-6.11.1.tar.xz.sha256
-sha256  a1c6967b326243b2ca8d50bc7b7f7852c3975d9aa6ce4b186ebdf35bb1007e1c  qtvirtualkeyboard-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtvirtualkeyboard-everywhere-src-6.11.2.tar.xz.sha256
+sha256  4c6a26734a5c4e4acd5ff9ae5f192a5b883bc4514118f9df2fcf12064e647c2f  qtvirtualkeyboard-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index 62b7b2ee92..767e35c80f 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtwayland-everywhere-src-6.11.1.tar.xz.sha256
-sha256  95788aa502f75441d4edf65932b235f76523084e13dbbb7b9ee2d207b32bd9b3  qtwayland-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtwayland-everywhere-src-6.11.2.tar.xz.sha256
+sha256  8eb7615e39332a10f506e8dd70f02d5954bb5949ff54f6dcbf8bd6168222f9df  qtwayland-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 505fb2ca59..d20f18f8bd 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.1/submodules/qtwebsockets-everywhere-src-6.11.1.tar.xz.sha256
-sha256  243e3aa11924c8c5c1645e892f62d013caa3766c57512ca926d5b58146646fbf  qtwebsockets-everywhere-src-6.11.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.2/submodules/qtwebsockets-everywhere-src-6.11.2.tar.xz.sha256
+sha256  2bfe25c383c37f7690e3c59b02c9907d2744cf8527b1f3f1fc2c785b2ff3c9a3  qtwebsockets-everywhere-src-6.11.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt

--===============5709541033232326658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5709541033232326658==--
