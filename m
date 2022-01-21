Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151A6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 15:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB15812B8;
	Fri, 21 Jan 2022 15:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CQAC1kuN3yd; Fri, 21 Jan 2022 15:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115EA8134F;
	Fri, 21 Jan 2022 15:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEC311BF423
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8F334011C
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sWfBv1i9XLRu for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 15:42:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2A0940260
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1lxUNgqV5NlD0N1aI9hqAb+fdhrAEdHx32ddam1P9gE=; b=FE34FdSmA/Vgu0bVGP1aw1WPUn
 SnzgBu1Tkstk4cFuWNbqzlV5+mxmt2126mg66AXa6Y2lA+EW0f4kUdwgqvj0E+/7gKX9O7MRRs3/d
 8oSYZR+aRAeKf+l7DwjyF9BteW/Rz+ozbBDZiWgnXco9ggxDioeu57p7hemH+6WIxeQiR3eFNiuq6
 s4cHGdWWXvad14mAY9e8tGh68K96/4r9mwRQ7pGjOWfql35u6kVdOtohL99F7aEFW8JzduoTAyIPk
 4jngoT00kyvlId3+DhgkePOukl3llEQvr+H8bS6qgbjXO4LNgqBLcCjuSOGvT1XJt9X+0W9+dh7Ng
 sRJjkXlg==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nAw3w-000BCQ-U7; Fri, 21 Jan 2022 16:42:53 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id b06c3640;
 Fri, 21 Jan 2022 15:42:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 17:42:29 +0200
Message-Id: <20220121154235.798255-2-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154235.798255-1-aperez@igalia.com>
References: <20220112132618.2634250-2-aperez@igalia.com>
 <20220121154235.798255-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC v2 1/7] package/ninja: do not require cmake
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
 Pierre Ducroquet <pinaraf@pinaraf.info>, Samuel Martin <s.martin49@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
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
Changes v1 -> v2:
  - No changes.
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
