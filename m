Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A05C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 13:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D6BB40A43;
	Wed, 12 Jan 2022 13:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnHbX9h56RFq; Wed, 12 Jan 2022 13:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0198940BEE;
	Wed, 12 Jan 2022 13:26:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 662BE1BF3DC
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 13:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54DA181328
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 13:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16mbEOKINx5O for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 13:26:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A51D81325
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5/UYmWQaom/4EuoDr7tQ08bTeria7EBfcDplH/+33fA=; b=elNUtxCFPt6jwmFAQzHVwFkN0p
 BE86PZjguC8oHFSnyk2dxzJD03NivIpOaaRgysd6pz1+rjUjn0TLyU5msTvUKqXU7QR0pJErnGMqv
 17LiC4T0SpXPDFPls/0wcfUHDZEA/7FLdNrvm9kmSVNtJtoOk8iUL239Xsfy8m8KADhW4yvgROk0R
 NjGO2J4wq61k3zKlgmt6qmqWlnQzC2BbI+zwR9T8G6xV6LNpoS+9DJAwuZ8rLXbXGgOo8MIB9K9O8
 q9SXMNgqcAwu6+GgDIDMWHiC+H0jA8H1BQCHGQ+r4+qIHeTf6efmKViI8lZr57CpyJ+hL405z8QSw
 cTrgcRQg==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7de6-000ARv-7Z; Wed, 12 Jan 2022 14:26:34 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 42ceb521;
 Wed, 12 Jan 2022 13:26:19 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 15:26:17 +0200
Message-Id: <20220112132618.2634250-2-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112132618.2634250-1-aperez@igalia.com>
References: <20220112132618.2634250-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC 1/2] package/ninja: do not require cmake
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use host-generic-package to manually build ninja. This avoids the need
for host-cmake in preparation for the CMake build system machinery being
changed to use ninja instead of make.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/ninja/ninja.mk | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index ab1941023e..ae3be6a14f 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -9,8 +9,42 @@ NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
+# Ninja is used by CMake-based packages, avoid a circular dependency by
+# by using host-generic-package instead and using a single command to
+# compile the binary. This does in essence the same as the "bootstrap.py"
+# included in the distribution avoiding the need for host-python.
+define HOST_NINJA_BUILD_CMDS
+	cd $(@D) && $(HOSTCXX) $(HOST_CXXFLAGS) $(HOST_LDFLAGS) \
+		src/build_log.cc \
+		src/build.cc \
+		src/clean.cc \
+		src/clparser.cc \
+		src/dyndep.cc \
+		src/dyndep_parser.cc \
+		src/debug_flags.cc \
+		src/deps_log.cc \
+		src/disk_interface.cc \
+		src/edit_distance.cc \
+		src/eval_env.cc \
+		src/graph.cc \
+		src/graphviz.cc \
+		src/line_printer.cc \
+		src/manifest_parser.cc \
+		src/metrics.cc \
+		src/parser.cc \
+		src/state.cc \
+		src/string_piece_util.cc \
+		src/util.cc \
+		src/version.cc \
+		src/depfile_parser.cc \
+		src/lexer.cc \
+		src/subprocess-posix.cc \
+		src/ninja.cc \
+		-o ninja
+endef
+
 define HOST_NINJA_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
 endef
 
-$(eval $(host-cmake-package))
+$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
